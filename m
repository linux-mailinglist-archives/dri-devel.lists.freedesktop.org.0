Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBA3C28E3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488EC6E9C2;
	Fri,  9 Jul 2021 18:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A396E9C2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:14:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t3so15087429edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2W72u91t/gOHTIhrhyvg2LOLCXCndVPac0V2gbKNoEU=;
 b=nSKgGdauo1TReviAdCxOFT5jBwm98es/d/rsn6sw7dVmAg6DTtFu88JZc0+EGQWLoQ
 NJNMQsSLdZTJm7fd4w4fnduhrIRpfVyOadao4kZrZceImDTlRdJxhXuHNYfwXTqPO5Ya
 TdByYxb1DuCR4XPHriswR96/OvAATEtq+qOsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2W72u91t/gOHTIhrhyvg2LOLCXCndVPac0V2gbKNoEU=;
 b=IiWQIARhyTsDfowj2eRiZhPzWE35o+V3ccPPdLZ2lQqbcXx6IbCN7oAAZs3a8escsy
 aFEU1RV/fC9DMnukVdO5kmCHy1FbNZR4n4XZuyKiChJ9Sq0iSn4WB/3JJINlWV+LXATZ
 upbu1dVFX3g/rd3Gs5JU19SWcth5Z8VRdGnoVXxV4wd1pSD5AzV6UIdoIWsAkoU/B0fa
 dCECEezP0xBznAA73nZ7kUbHWty/Sqkvx/+AbkRpTQxXc7Wf2zuiCklhh+V7oP+iOWZe
 Nc1hoWM+WLIJ3Ic7ivZWSw551m4tFV9mmwGfkAU9vs2MQjCna75ubI/4257wacQCvVGy
 zWBQ==
X-Gm-Message-State: AOAM531/goyo0nzq+say8pAzAT0F/JNUny+Mm1lthMGiGJO6wd8DPd8d
 jWblw3PWehGRhLzopN1PJr2lImVRfDtYVTKBeGYXRg==
X-Google-Smtp-Source: ABdhPJxSjqPSO+u8ZSmuCvyTztoIUAplxlphSZUQ0oIv57NlT+Rf0RQCX/5vpgr5w8x7SL37yAR0Ff5/uDeu36I6Wp8=
X-Received: by 2002:a05:6402:4408:: with SMTP id
 y8mr49155151eda.55.1625854444453; 
 Fri, 09 Jul 2021 11:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210524184226.3064621-1-jagan@amarulasolutions.com>
 <CAMty3ZDt8L70xHH5pMy0M-3ATt9jAXAy3VVeRV_iMkcoebn99w@mail.gmail.com>
In-Reply-To: <CAMty3ZDt8L70xHH5pMy0M-3ATt9jAXAy3VVeRV_iMkcoebn99w@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 9 Jul 2021 23:43:53 +0530
Message-ID: <CAMty3ZCm4rguiEba69EyZ6xaBROkTfWvsc6vvrJL7X7KusCGBA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Fix proper bpc for
 ytc700tlag_05_201c
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 2, 2021 at 10:58 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Sam and Thierry,
>
> On Tue, May 25, 2021 at 12:12 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > ytc700tlag_05_201c panel support 8 bpc not 6 bpc as per
> > recent testing in i.MX8MM platform.
> >
> > Fix it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 9be050ab372f..6f4151729fb7 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -4164,7 +4164,7 @@ static const struct drm_display_mode yes_optoelectronics_ytc700tlag_05_201c_mode
> >  static const struct panel_desc yes_optoelectronics_ytc700tlag_05_201c = {
> >         .modes = &yes_optoelectronics_ytc700tlag_05_201c_mode,
> >         .num_modes = 1,
> > -       .bpc = 6,
> > +       .bpc = 8,
>
> Can you pick this, if all okay.

Gentle Ping!
