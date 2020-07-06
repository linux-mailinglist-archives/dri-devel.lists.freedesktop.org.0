Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34E215637
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 13:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A2789FDB;
	Mon,  6 Jul 2020 11:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8CF89FDB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 11:19:02 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id f6so23322757ioj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XBDJ3ik72+EzeQWMf1/QKd8Y/Fn6LaIHmILJwiRh6+E=;
 b=or4M9vcmro+UyndI3XdO3lSEq6xru9qniC1Z1GWXS7Q+0Ked8iZluQF/uSdBfOCqtp
 A1oZrC/ihcc7MNhryl5ByVACqnqf30yr/+xJRaxztj/q+qZjDFtmPqcjdPU04fiZUWV6
 dtTqVPHvwtKZ4YtCp8zEPxTqBFmP45cWAE80Chhox6At9U2eM3UV3RfBM545XkBpULoz
 89lWPX9BB9sK2/dimVvi4M298Z4S74DPdEKjNtVJNb28i6sNqnPFKFn7EHMk3lphpyFu
 D1JRHoFzWoBZ/R4QAPmIYlsjGpQ55pKbFQgYOJMOXaMENzzGMdnWSJTNR26NgFxCe2I5
 fAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XBDJ3ik72+EzeQWMf1/QKd8Y/Fn6LaIHmILJwiRh6+E=;
 b=GDhkTTCrn7lkKdkZTlqGBoUIWOZvf7uUsmByPNK9+1PuFbYHihZ2dDEwEx45voO38w
 VkwPwZu1gt2U0YG85ZQPZRzeF6Phsf0y6fnt+qD7+OSgrqA/2lSbJd1TbA/yKWTBXBp8
 ZxnB39eJIa8HzFBemaDISuyroGgCoo8PavHspYuRZC/a1Q7XQ/QvZlGrOOcB14nRRaSy
 SnSrV668+bSVC3ABua3wYWcj7qE1CZxht/fme+ckuPXrZYkGQrzOpuKQZDbFx2CJQoRP
 YXr9+GYFgi+Og6wtZEEXbie1GTuEcurLlErKVL3jHUg1JXYKkOrWfOO92RhZwf77lTO0
 qU7w==
X-Gm-Message-State: AOAM532FY9MELDCqx7h8s+Z5o1fgpaOsqoWbb+O11BabQeRq/xvVO/v9
 ATPMqbnukedxjD/bazNJxL1HmoX0/cl1bJEU13I=
X-Google-Smtp-Source: ABdhPJyZMPISBjocSxAG9s4s40K4agAeJVqFKWBW1Ffd6KJnfjpCmMiFDvX1rSUqnu8cpiS/Kfad/9DfFzd5lPO+fQ0=
X-Received: by 2002:a6b:9242:: with SMTP id u63mr1166991iod.92.1594034342051; 
 Mon, 06 Jul 2020 04:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200630182636.439015-1-aford173@gmail.com>
 <b9052a12-af5a-c1b9-5b86-907eac470cf8@ti.com>
 <20200703193648.GA373653@ravnborg.org>
 <bda1606f-b12c-3356-15ce-489fc2441737@ti.com>
In-Reply-To: <bda1606f-b12c-3356-15ce-489fc2441737@ti.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 6 Jul 2020 06:18:53 -0500
Message-ID: <CAHCN7xJdg8uUDaghFftze2K6t2pnyZg_JYpdmA=UU-shmk0Xgw@mail.gmail.com>
Subject: Re: [PATCH] omapfb: dss: Fix max fclk divider for omap36xx
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 6, 2020 at 1:02 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi,
>
> On 03/07/2020 22:36, Sam Ravnborg wrote:
> > Hi Tomi.
> >
> > On Fri, Jul 03, 2020 at 10:17:29AM +0300, Tomi Valkeinen wrote:
> >> On 30/06/2020 21:26, Adam Ford wrote:
> >>> The drm/omap driver was fixed to correct an issue where using a
> >>> divider of 32 breaks the DSS despite the TRM stating 32 is a valid
> >>> number.  Through experimentation, it appears that 31 works, and
> >>> it is consistent with the value used by the drm/omap driver.
> >>>
> >>> This patch fixes the divider for fbdev driver instead of the drm.
> >>>
> >>> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> >>>
> >>> Cc: <stable@vger.kernel.org> #4.9+
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>> ---
> >>> Linux 4.4 will need a similar patch, but it doesn't apply cleanly.
> >>>
> >>> The DRM version of this same fix is:
> >>> e2c4ed148cf3 ("drm/omap: fix max fclk divider for omap36xx")
> >>>
> >>>
> >>> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> >>> index 7252d22dd117..bfc5c4c5a26a 100644
> >>> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> >>> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> >>> @@ -833,7 +833,7 @@ static const struct dss_features omap34xx_dss_feats = {
> >>>    };
> >>>    static const struct dss_features omap3630_dss_feats = {
> >>> -   .fck_div_max            =       32,
> >>> +   .fck_div_max            =       31,
> >>>     .dss_fck_multiplier     =       1,
> >>>     .parent_clk_name        =       "dpll4_ck",
> >>>     .dpi_select_source      =       &dss_dpi_select_source_omap2_omap3,
> >>>
> >>
> >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Will you apply to drm-misc?
>
> This is for fbdev, so I presume Bartlomiej will pick this one.
>
> > Note  following output from "dim fixes":
> > $ dim fixes f76ee892a99e
> > Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: Jason Yan <yanaijie@huawei.com>
> > Cc: "Andrew F. Davis" <afd@ti.com>
> > Cc: YueHaibing <yuehaibing@huawei.com>
> > Cc: <stable@vger.kernel.org> # v4.5+
> >
> > Here it says the fix is valid from v4.5 onwards.
>
> Hmm... Adam, you marked the fix to apply to v4.9+, and then you said
> v4.4 needs a new patch (that's before the big copy/rename). Did you
> check the versions between 4.4 and 4.9? I would guess this one applies
> to v4.5+.

I only tried 4.9 because it's listed as an LTS kernel.  The stuff
between 4.4 and 4.9 were EOL, so I didn't go back further.    The 4.5+
is probably more accurate.  I would like to do the same thing for the
4.4 kernel, but I am not sure the proper way to do that.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
