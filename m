Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2C376929
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 18:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B626E198;
	Fri,  7 May 2021 16:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBAA6E198;
 Fri,  7 May 2021 16:59:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso7549756wmj.2; 
 Fri, 07 May 2021 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4WDLsvKJMxDGO3+bzmGSecNUJim8tE2LEMA4fIetY8=;
 b=CL8xvpvAHG70auywB/Spvy3ss+5QkCld2KRv1eqOt1maC6iB8xp0ExToQWHwYN56Nu
 JaB4JwO8a6v2h3mA/7iNyQSy6NLIvmuiKB7pDd+tA46COmLc5s4t7H5AJGNPgcUBbsP+
 ZneMWoLXa/bsisGUCnVPTbFpuYcndZED/Kpz8vxBk8zqNJkDZA1PAEWah0is5/MF05hv
 +jmN9gGsj6H8YMJ5GYty8V0SWpc291OGZYVcxgF/+yHfkhwn+Qy+Bdtmo9uUkEtlnFNl
 wQNBU5DB80M22GuLYUmfPuOavL+njr6kebiGsJ4RXuD7Oxu2dMVoqW1akJyu85rJ8eS9
 B5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4WDLsvKJMxDGO3+bzmGSecNUJim8tE2LEMA4fIetY8=;
 b=dijw/rkgCQy5dwsbb81JrvNTEFU8+4wJISjjfiaaaOpHpuYQ9zQrj2MBYmXcpOi92k
 9xRmejz75lNwqvaxjA9HSOkOGJiEu4+btP+UbVWh9TlNhOtC5j15t7kpAF6HGOHMV3Ap
 G2OTA+ncgz2IF1x9U5TzefOXjlqxbg77xGhEX74AHCHSrlRy8OjXRRaJT3uDVK5GIvRv
 q25A3X2Q5jrDPmdJ89GvszZyXLAtjwLpgxmKpxz3D5//jXqWBdt9Y77GzdJtI51IkJxD
 3vJ/qzZdBNpCRPwKyM3tEbmKstcybD2mE2Fqxnr1bUZZ8k52N+AqzVPHpVs1xRCYYCns
 NmlA==
X-Gm-Message-State: AOAM5338Vj1CNHcU3HPDew9AT51Fqox89tMFnFnDFhUUTQx2sZnjYAEG
 h/EH/r/7kkwDlYo0pnYraEttw2hg11PoiWdM20E=
X-Google-Smtp-Source: ABdhPJwHz0UOTtSriaYhPLieL9JH2FIXzvpsM22+FD0bA2bQxAo21M2u2vcZgRZf0DcF6KRujyOP7mZtKl87ZCNv7I4=
X-Received: by 2002:a1c:4954:: with SMTP id w81mr22641820wma.49.1620406748836; 
 Fri, 07 May 2021 09:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210507141651.2887-1-sean@poorly.run>
 <CAF6AEGutiv+0QMNo6QQ8jSDYwxhJ5+62_TZ5zsiT_WxgDm+JiA@mail.gmail.com>
In-Reply-To: <CAF6AEGutiv+0QMNo6QQ8jSDYwxhJ5+62_TZ5zsiT_WxgDm+JiA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 May 2021 10:02:49 -0700
Message-ID: <CAF6AEGud9xdEwDpADN3SpA+JMUCYtRL6UEaGLiq49vy5sqwa7A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix uninitialized var usage in
 dsi_phy_28nm_8960.c
To: Sean Paul <sean@poorly.run>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 7, 2021 at 9:43 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, May 7, 2021 at 7:16 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch fixes the following error:
> >
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
> > [-Werror,-Wuninitialized]
> >         snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
> >                  ^~~~~~~~~~~
> > drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
> > note: initialize the variable 'parent_name' to silence this warning
> >         char *clk_name, *parent_name, *vco_name;
> >                                     ^
> >                                      = NULL
> > 1 error generated.
> > make[5]: ***
> > [scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1
> >
> > It looks like the allocation was inadvertently deleted.
> >
> > Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
> >
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> Thanks, I'll pick this up for next -fixes pr

Oh, sorry, I lied, I already had the same fix from Dmitry

BR,
-R

>
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> > index 582b1428f971..86e40a0d41a3 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> > @@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
> >         if (!vco_name)
> >                 return -ENOMEM;
> >
> > +       parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> > +       if (!parent_name)
> > +               return -ENOMEM;
> > +
> >         clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> >         if (!clk_name)
> >                 return -ENOMEM;
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
