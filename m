Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE4219464
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 01:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891856E971;
	Wed,  8 Jul 2020 23:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D216E971
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 23:38:03 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d18so453778ion.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 16:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f47scpZOxXSsY6W8L1L6Au8DwYsSbegHA1p5rzFY5es=;
 b=IC9IIO6b9s4jTGz6cJvwph0OOL71V+85KCI4BlHzOmA0GHrC/bzIQAc3lUl9myLgH0
 t59XZeW20Fsm9OR/sD5Pu1fo0yXoqxYOyF6FevUwwJjxYW9p8oxZDu4UJuEusgcgEufv
 sAqvsvs37LtebjkQm3YNCA1gulO2SvDOARUJpc9EHu85jP1VwMZuxBN/IHj+6K90lNZf
 png/ccGLJ0IYEJMeCXL9pBgj2Ssgrf1ehPFa3FvROy38XPMEttMIycaD6yOjNbYuUNby
 ZiLHHXeehCwF2Sflaj8LG+kfYlcj8o/2C8Fw9xwIYCs9LHxPT0ut+ClzzP/Uf7Rr+JWE
 ERmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f47scpZOxXSsY6W8L1L6Au8DwYsSbegHA1p5rzFY5es=;
 b=TknM7xy+rtHgbBYG6CBTIJCcrbNSNoJC8mrfKKWiSVCuhpgRSIYol3eSayV8VM0PdL
 Euqt8mKChcS4YLng8gIZiHW6CONGlHCa/oEuOTa8IbScZd7qGYwWvTENoHXN7bmLl+Ku
 AZQRMVFGj9eAty+nORJVqUhkzMPTu2oWFLfD+9g5xX3qDdLoWzJ3Ih6aw1aCy23Ac9U/
 Ue33SroLWw8T88k5zOFdNfTtQ/V2rrWIq4cTwMwL89Vk/Krmm8p8SGhsCBgpPr2rAuyE
 BHRySLCMZ5aur2hKTvrZG0wbZ+N9ItkBXvnyYw+SKN8pkaiRP+ogeopKX/5vIRL8s2gn
 Sqzg==
X-Gm-Message-State: AOAM532CSHz44Ujo25H4OtPrSRQ72kqkC3v3Y9E0ZP17Ft3Z4V7lhLPw
 3sA0h1hTl3A5H1QVZd4UmmThv12+E9hvyDngfcQ=
X-Google-Smtp-Source: ABdhPJw1145gDWa1GO1furMPD1GHeDogxFjouwIcAVYJAllovviWaduyt1BA8w7sLVgNcF+nTP7j6IvLTJe0gKa2Rqc=
X-Received: by 2002:a6b:f618:: with SMTP id n24mr14872406ioh.35.1594251483074; 
 Wed, 08 Jul 2020 16:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200630182636.439015-1-aford173@gmail.com>
 <b9052a12-af5a-c1b9-5b86-907eac470cf8@ti.com>
 <20200703193648.GA373653@ravnborg.org>
 <bda1606f-b12c-3356-15ce-489fc2441737@ti.com>
 <CAHCN7xJdg8uUDaghFftze2K6t2pnyZg_JYpdmA=UU-shmk0Xgw@mail.gmail.com>
In-Reply-To: <CAHCN7xJdg8uUDaghFftze2K6t2pnyZg_JYpdmA=UU-shmk0Xgw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 8 Jul 2020 18:37:51 -0500
Message-ID: <CAHCN7xLGAWEO5CPDOsHoy4B0FjD+1GHhHYgihmVg=mhjUFjSTQ@mail.gmail.com>
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

On Mon, Jul 6, 2020 at 6:18 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Jul 6, 2020 at 1:02 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> >
> > Hi,
> >
> > On 03/07/2020 22:36, Sam Ravnborg wrote:
> > > Hi Tomi.
> > >
> > > On Fri, Jul 03, 2020 at 10:17:29AM +0300, Tomi Valkeinen wrote:
> > >> On 30/06/2020 21:26, Adam Ford wrote:
> > >>> The drm/omap driver was fixed to correct an issue where using a
> > >>> divider of 32 breaks the DSS despite the TRM stating 32 is a valid
> > >>> number.  Through experimentation, it appears that 31 works, and
> > >>> it is consistent with the value used by the drm/omap driver.
> > >>>
> > >>> This patch fixes the divider for fbdev driver instead of the drm.
> > >>>
> > >>> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> > >>>
> > >>> Cc: <stable@vger.kernel.org> #4.9+
> > >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> > >>> ---
> > >>> Linux 4.4 will need a similar patch, but it doesn't apply cleanly.
> > >>>
> > >>> The DRM version of this same fix is:
> > >>> e2c4ed148cf3 ("drm/omap: fix max fclk divider for omap36xx")
> > >>>
> > >>>
> > >>> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> > >>> index 7252d22dd117..bfc5c4c5a26a 100644
> > >>> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> > >>> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> > >>> @@ -833,7 +833,7 @@ static const struct dss_features omap34xx_dss_feats = {
> > >>>    };
> > >>>    static const struct dss_features omap3630_dss_feats = {
> > >>> -   .fck_div_max            =       32,
> > >>> +   .fck_div_max            =       31,
> > >>>     .dss_fck_multiplier     =       1,
> > >>>     .parent_clk_name        =       "dpll4_ck",
> > >>>     .dpi_select_source      =       &dss_dpi_select_source_omap2_omap3,
> > >>>
> > >>
> > >> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Will you apply to drm-misc?
> >
> > This is for fbdev, so I presume Bartlomiej will pick this one.
> >
> > > Note  following output from "dim fixes":
> > > $ dim fixes f76ee892a99e
> > > Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Cc: Dave Airlie <airlied@gmail.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Cc: Jason Yan <yanaijie@huawei.com>
> > > Cc: "Andrew F. Davis" <afd@ti.com>
> > > Cc: YueHaibing <yuehaibing@huawei.com>
> > > Cc: <stable@vger.kernel.org> # v4.5+
> > >
> > > Here it says the fix is valid from v4.5 onwards.
> >
> > Hmm... Adam, you marked the fix to apply to v4.9+, and then you said
> > v4.4 needs a new patch (that's before the big copy/rename). Did you
> > check the versions between 4.4 and 4.9? I would guess this one applies
> > to v4.5+.
>
> I only tried 4.9 because it's listed as an LTS kernel.  The stuff
> between 4.4 and 4.9 were EOL, so I didn't go back further.    The 4.5+
> is probably more accurate.  I would like to do the same thing for the
> 4.4 kernel, but I am not sure the proper way to do that.

What is the correct protocol for patching 4.4?  I'd like to do that,
but the patch would be unique to the 4.4.  Should I just submit the
patch directly to stable and cc Tomi?

adam
>
> adam
> >
> >   Tomi
> >
> > --
> > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> > Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
