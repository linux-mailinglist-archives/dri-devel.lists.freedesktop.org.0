Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F28D560E
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F46F10E06C;
	Thu, 30 May 2024 23:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bgG3ZZcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1410E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:11:13 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52b86cfcbcaso488632e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717110672; x=1717715472; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5rtVeYQ5u84CD0AA2JcRrrPlaJCkNb/Fj7mnCC/lgjg=;
 b=bgG3ZZcIdFhpYLH4sm2YQqdxZoCytEjOmAduwf2UYAOqDVoJh6ENICkAphI7cUfIs1
 xOoaMNWiuEJ0jaCVZSVR6PDl9OnAIrU5tzjlc8llpccrx1fLe8iij5veGvrWN7w0SpvW
 XXU10YwKA/WEWlQ1IpjUQ5in0s2q7n8IiKgK8YM2DMjeaieilDjka/DwUTD2+gfZScMl
 Je0ieJiH1aQvYu2a1LkuQutxwiWnuYdYBbMz59o7TrTk2RsIEh9h/C32n5B2Eirs3oGN
 DzQo+SBde1X2p3CgmH728J6hRtF36QC/f3lIZRdJgd8LncSnNKOWi4H+DB3XWWjgfiIg
 sZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717110672; x=1717715472;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5rtVeYQ5u84CD0AA2JcRrrPlaJCkNb/Fj7mnCC/lgjg=;
 b=ehA/UlV7NejnLA1ZpGdv2AQOpZ5eqvnkhnV30T07/NRuNmdEWHHsA5vY0l8Uz6Dt7j
 t0TFSRaZ+EnL+sCYbQ3lToDWNF88N4OVmH4fHiT/yOOoJnbdt0sBOVEPaZ37qgqU94+9
 s6j1pymqpDEXKZ47qu3ZmxCjXBs7rmj+8L4abw2zgKegLHKTytFrXR2UUn3AL9D7WQPE
 u6dhG0VqH5/Rw/qpZi4lYKzB8qmiTuhnmTy7qmksq+tHxMoutimowep4bSk/XjJEA5TS
 AlG6eTPoWAZs6gjFkmRB12UwQgpfZ4Usnhb1nZdfNOsTULv4snT8nL5QCoEnBqw6zL6j
 9SfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa9CU5YbwHqG36Nhaq/fVdI+nfrM+bawCiG++rhBsQXpxl836tt4/4dw3UaDxKKBiy/f+N5LUZ3sbf/RsrNbwbNyXF8G2/cZJpM1mADEdY
X-Gm-Message-State: AOJu0YxBiRhk8GW8A32WeaZs4bL0bIq+jf39uJewzziYrIp9UYI139Dj
 pmqAyvIs7fjwmRBRmK/mHYhLr9HuTOQ28Fx9hmyQMPJqse2bAL7BNEqEaVdFrNg=
X-Google-Smtp-Source: AGHT+IG0t3rZTPhtJybKaUF15LVmYhDBWgz6POuiQcknG9wUsiCJYYjByHxxMrF/IH17dhoIvEgTyA==
X-Received: by 2002:ac2:51b0:0:b0:51f:9549:9c0d with SMTP id
 2adb3069b0e04-52b895a4043mr42465e87.48.1717110671620; 
 Thu, 30 May 2024 16:11:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d34d76sm120623e87.10.2024.05.30.16.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:11:11 -0700 (PDT)
Date: Fri, 31 May 2024 02:11:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 1/3] drm/panel-edp: add fat warning against adding new
 panel compatibles
Message-ID: <kxfuvsmi6eblpavtevwllqmkdnzdih7kfc73wlos7yozikerjv@si6jshczffjy>
References: <20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org>
 <20240529-edp-panel-drop-v2-1-fcfc457fc8dd@linaro.org>
 <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Uw+KYQQ2xFLhNdWSW0sNX9uV_zSAVO2uBWY4JEcaO2bA@mail.gmail.com>
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

On Thu, May 30, 2024 at 07:33:59AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, May 28, 2024 at 4:52 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add a fat warning against adding new panel compatibles to the panel-edp
> > driver. All new users of the eDP panels are supposed to use the generic
> > "edp-panel" compatible device on the AUX bus. The remaining compatibles
> > are either used by the existing DT or were used previously and are
> > retained for backwards compatibility.
> >
> > Suggested-by: Doug Anderson <dianders@chromium.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 6db277efcbb7..95b25ec67168 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match[] = {
> >         {
> >                 /* Must be first */
> >                 .compatible = "edp-panel",
> > -       }, {
> > +       },
> > +       /*
> > +        * Do not add panels to the list below unless they cannot be handled by
> > +        * the generic edp-panel compatible.
> > +        *
> > +        * The only two valid reasons are:
> > +        * - because of the panel issues (e.g. broken EDID or broken
> > +        *   identification),
> > +        * - because the platform which uses the panel didn't wire up the AUX
> > +        *   bus properly.
> > +        *
> > +        * In all other cases the platform should use the aux-bus and declare
> > +        * the panel using the 'edp-panel' compatible as a device on the AUX
> > +        * bus. The lack of the aux-bus support is not a valid case. Platforms
> > +        * are urged to be converted to declaring panels in a proper way.
> 
> I'm still at least slightly confused by the wording. What is "the lack
> of the aux-bus support". I guess this is different from the valid
> reason of "the platform which uses the panel didn't wire up the AUX
> bus properly" but I'm not sure how. Maybe you can explain?
> 
> I guess I'd write it like this:
> 
>     /*
>      * Do not add panels to the list below unless they cannot be handled by
>      * the generic edp-panel compatible.
>      *
>      * The only two valid reasons are:
>      * - because of the panel issues (e.g. broken EDID or broken
>      *   identification).
>      * - because the platform which uses the panel didn't wire up the AUX
>      *   bus properly. NOTE that, though this is a marginally valid reason,
>      *   some justification needs to be made for why the platform can't
>      *   wire up the AUX bus properly.
>      *
>      * In all other cases the platform should use the aux-bus and declare
>      * the panel using the 'edp-panel' compatible as a device on the AUX
>      * bus.
>      */
> 
> What do you think? In any case, it probably doesn't matter much. The
> important thing is some sort of warning here telling people not to add
> to the table. In that sense:

Ack, I'l update the wording in a similar way.

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

-- 
With best wishes
Dmitry
