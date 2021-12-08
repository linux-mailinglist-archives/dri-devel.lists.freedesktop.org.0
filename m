Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9A846D8F4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 17:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE83173F0D;
	Wed,  8 Dec 2021 16:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3407273F0D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 16:53:52 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id y16so3467321ioc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 08:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=onSEYhphyrw5ksP9+mtXuqQI4y1ahf7sSwREYeqo+Vk=;
 b=U8ES09t94uicogVku+ptvUrOCG/mRsH6grOV+JzFSsbgAVaN/uwhgCyghkePkEVXLa
 zfzUfGDhzHAR4iRYrxBURVKWAIt6+iK/jSxeNoU5IEY5B5fgGugasWeUljP0oNPW0xlP
 rdnTKVEVJD86L2C9awUtXBciXklKczO86CEMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=onSEYhphyrw5ksP9+mtXuqQI4y1ahf7sSwREYeqo+Vk=;
 b=0Nq+jdjbSmH6Fwg+ILPfIrGIyxPdB30zHmLBd2owwFHX5+IsO8HKMLSAr2NuMKBYOH
 rZM+DZdob3WM0eBQOivyjKLfEhAU0dWcYRqwmskw5AQ5lQQElY02Nib3nPG46ijFczsm
 pjeUKZjJV3IbOCvJylieL8lixFISe+GduBsIVhRkI+8e+c/WJUoBhx2Z59E/JMm/UbCP
 CPSnvvN8UqxlEUr0/4BUF89Xua6p8p9oPXOP0NPnsARhDc4h8gQK6CqWagHaNA/JJOoH
 IT7aP/n/3Jh+NEn+ck9Zlzs8hap7OkVIVo1xj/PpW1KttoNtmsL1vyZZ6/X4YXr2qm7k
 eBow==
X-Gm-Message-State: AOAM532iFaRImfQY3np512oOEkRxvB2JrSOp+vjbvdu+4Cveuci8e4vc
 g4hNUyo9hrgrhv1QRLS06xUPuar7rv7L4Q==
X-Google-Smtp-Source: ABdhPJw5+CTv0a5Fqa4QAlc5Zqdwxjgnj7iUrC4Ie1ZIEFKQFt+ZAMhw9FVTY4Twl5eqLxaeRyw8hQ==
X-Received: by 2002:a02:6064:: with SMTP id d36mr910636jaf.80.1638982430780;
 Wed, 08 Dec 2021 08:53:50 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id x18sm2357792iow.53.2021.12.08.08.53.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 08:53:49 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id b187so3437297iof.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 08:53:49 -0800 (PST)
X-Received: by 2002:a05:6638:2585:: with SMTP id
 s5mr958081jat.68.1638982429052; 
 Wed, 08 Dec 2021 08:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20211207215753.635841-1-robdclark@gmail.com>
 <CAE-0n52gbwsJXG7=hdQhcttTbucjBv9SBq+kng2Ansc=TyqCKg@mail.gmail.com>
In-Reply-To: <CAE-0n52gbwsJXG7=hdQhcttTbucjBv9SBq+kng2Ansc=TyqCKg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Dec 2021 08:53:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xg+C4U0NHC6D4HMDZ1uVVstHWdV7onHwxtTvB6yh=Ciw@mail.gmail.com>
Message-ID: <CAD=FV=Xg+C4U0NHC6D4HMDZ1uVVstHWdV7onHwxtTvB6yh=Ciw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: sn65dsi86: defer if there is no dsi host
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 7, 2021 at 8:44 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-12-07 13:57:52)
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Otherwise we don't get another shot at it if the bridge probes before
> > the dsi host is registered.  It seems like this is what *most* (but not
> > all) of the other bridges do.
> >
> > It looks like this was missed in the conversion to attach dsi host at
> > probe time.
> >
> > Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Doug Anderson <dianders@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
> One more nit below
>
> > v2: Drop DRM_ERROR() in favor of drm_err_probe() and shift around the
> >     spot where we report the error
> > v3: Add \n and cull error msgs a bit further
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 +++++++-----------
> >  1 file changed, 7 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 02b490671f8f..c2928a6409b1 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -740,10 +736,8 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
> >         pdata->dsi = dsi;
> >
> >         ret = devm_mipi_dsi_attach(dev, dsi);
> > -       if (ret < 0) {
> > -               DRM_ERROR("failed to attach dsi to host\n");
> > +       if (ret < 0)
> >                 return ret;
> > -       }
> >
> >         return 0;
>
> This can be simplified further to
>
>         return devm_mipi_dsi_attach(dev, dsi);

Squahsed in Stephen's fix and pushed. Had to also remove "ret" which
was no longer used in this function after Stephen's change.

03848335b5b1 drm/bridge: sn65dsi86: defer if there is no dsi host

-Doug
