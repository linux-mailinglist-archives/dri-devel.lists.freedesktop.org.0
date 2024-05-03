Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C68BB50F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 22:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F245010E622;
	Fri,  3 May 2024 20:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rqCUmS7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CB810E622
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 20:53:13 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51fcb7dc722so78010e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714769591; x=1715374391; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ViSqQc1pJpTWq8m4LEOBpWrjRIPxSIVvto5Qje5dvoE=;
 b=rqCUmS7uuuT/OUeJF1cnrxT7LBE9hkSO/HiHYp4uf7g/i0o5XqlfXuYOwuA2/lgiB5
 wTVnqR7cRN0rrEQXa/7soqO2h9+6RdO6MtH4PssCEZD9/cVdmfVkM+wXoaT/ct7SbGFy
 T1tnva6zN8XsD2eT4LBz0pwbxpAGBYlMWslJ/rE4iZnSzKCfZ9azTd12bUOJnSAWp1TW
 /hbe00FJHJVMontIte83HEKOjG/cpVDU3/frQgkoaeYVackkO4NpCJEeD+RSrLz57aYW
 TksUvB9Sok3fjtDHoAAYDRXyHLJcJ3jHQRmqiWh/8BqISDlfI3bAuzQIUl0iaDvbxAnv
 h5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714769591; x=1715374391;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ViSqQc1pJpTWq8m4LEOBpWrjRIPxSIVvto5Qje5dvoE=;
 b=TV8XBEHPlEv9Xdm1HqKt762JV35wlqrhPhiitR8BpDOmw1S8wHBSAh8IEJlmf5uMfR
 npmr8o+WvkSuEADDkqdw1ZsKDDMWZx1hOVK1tq+x9SdAbnGmmy63Qi49BuAHzIyDVkFO
 SvypdQpINdyWoa9PwzHD5K5t8WhniA+TaXCoKga7x1z66uatOG9YcpJ/dTA9TAo35NPi
 p+RcuMspLx6xhLCQ9hVC0MBSjHHYujsJVRtK1Cs7JHdBDcTRH5oCY6Ch40za2jE6BFOv
 mio/iVclyJ9LYT4t1Y/zYTudAWAwKkUnDDNDhhCvm9NWI+TY1MPkTtGvaeAp+Gdbel31
 n7KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWykV3mrQYJP1dHwotAlUG97VWfPZ53UQ6xtawfJvgyLTY1G7yd0IQ0KD9QMTRhGcBWTpploSyqHLxcpctynCMFXbrOZj+TEvhBn5v/j/B
X-Gm-Message-State: AOJu0Yya4zHG9ZYoH1K9TRT7rz9ObNyPXSOqTHvDdFMBiGfxY+f6hlcv
 st+NlrwO3LCL7jPWcMlTuP3qNwZxalTd+qk6MDEMMsl7ZneGAStD4zdPs6C932c=
X-Google-Smtp-Source: AGHT+IFbXxJ5Nlrd7neA19lVKIxQ7CRYnbRhRvTCMNDl9wEEYU9wVAlvQZvZU5PMLmUOyWOiyHgovA==
X-Received: by 2002:ac2:547c:0:b0:51d:8ff3:f835 with SMTP id
 e28-20020ac2547c000000b0051d8ff3f835mr1221328lfn.26.1714769590915; 
 Fri, 03 May 2024 13:53:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a193847000000b0051deb442ab2sm660691lfj.294.2024.05.03.13.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 13:53:10 -0700 (PDT)
Date: Fri, 3 May 2024 23:53:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Kaehlcke <mka@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/panel: novatek-nt36672a: stop calling
 regulator_set_load manually
Message-ID: <yoaaisqdjjbx2qfnqdjrifzox3p3p7yeeeeduxlyormmjbgy3c@hmlc5ijwfg7n>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-5-9f56953c5fb9@linaro.org>
 <CAD=FV=WVyRGevshhkhzuXht+ePm3BXVyMhDOPOkFs72wZS_s_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WVyRGevshhkhzuXht+ePm3BXVyMhDOPOkFs72wZS_s_A@mail.gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 03, 2024 at 10:03:35AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 4, 2024 at 3:08 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Use .init_load_uA part of the bulk regulator API instead of calling
> > register_set_load() manually.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> > index 33fb3d715e54..3886372415c2 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> > @@ -605,21 +605,16 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
> >         struct device *dev = &pinfo->link->dev;
> >         int i, ret;
> >
> > -       for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
> > +       for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> >                 pinfo->supplies[i].supply = nt36672a_regulator_names[i];
> > +               pinfo->supplies[i].init_load_uA = nt36672a_regulator_enable_loads[i];
> > +       }
> >
> >         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
> >                                       pinfo->supplies);
> >         if (ret < 0)
> >                 return dev_err_probe(dev, ret, "failed to get regulators\n");
> >
> > -       for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> > -               ret = regulator_set_load(pinfo->supplies[i].consumer,
> > -                                        nt36672a_regulator_enable_loads[i]);
> > -               if (ret)
> > -                       return dev_err_probe(dev, ret, "failed to set regulator enable loads\n");
> > -       }
> 
> Thanks for the cleanup! I happened to notice this commit and I'm
> curious why you didn't take the next step and move to
> devm_regulator_bulk_get_const(). That would have allowed you to avoid
> the "for" loop above that copies the data ;-)

I haven't noticed this function beforehand. Thanks for the pointer!

> 
> -Doug

-- 
With best wishes
Dmitry
