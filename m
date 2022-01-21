Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7940495CB6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 10:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F310E98E;
	Fri, 21 Jan 2022 09:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7C10E98E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 09:19:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so20880151wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 01:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GYdREzPPehBfIAVKcYM846GIJdP7RKGamqemruCZcS8=;
 b=YHlPtVnKvW1tZAk5y/iTR0nITKiyB3iCFvLzRlfP41zV6VrKL0c0N7KJsPOXp+5rdL
 32FO6WUkOaOXRi/uBMfATqJ0n21gw/c2z9y7IQ53FIHJXaliEkqH2+50UVCstmNLCcwW
 sGWIqVvk2N8r52eK6/xDqs52pGF0lCEkw7/7aKNPdgQBSuuIZQDO8LcmKWsBA49qQxpk
 xdcqc76bxg8MVzwh7Vz+RwMvN6QaBM3CeaHBbwEEdyeuQqd/Wu7bC2nkpzRBu2AzAHst
 mM0FlaB89t1y/4BXLKpby+rtp7+zK+n7paMshOao6GrdDPU66WTzNOkgiteYUDyKy4a2
 jnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GYdREzPPehBfIAVKcYM846GIJdP7RKGamqemruCZcS8=;
 b=ulCO+Vhu2KKrOvOpXTqasBNOaMT5TuZjxZXH/SzTedg9GjySFz2l6pXVWGHiWJKtuF
 ylalqjOqKzQUcUnPTMG2qb5JUxVqr6W0yRq04UvKDpwsAwr2iwkKXuxkNqFB9IggOj7j
 m5Vc3Duvq6QKwR3+T702lAt1/kpgHWnh6m9sSNEvlY8ouZM8Lq7/Zd57OD9NQdWRmUgE
 NnI649KFTHvOeyf3xoKyBCLu/jQhX1NDqAr9rhJjIpxbG5CCc74R+wHxqirAREBFGJet
 F6IXzuT0QRZbuy+ghlKYZ5YURKHjHW2YRHC8ROq6+dPshv5QBXGowJ66VyfH753GmOu6
 CAWg==
X-Gm-Message-State: AOAM5303lncMafzI07G5HsKDag1HVRY+oxxA98X4kmq5830gqMyN+8N0
 N9lWu+YKv5O/qxIIReGIV0CD0w==
X-Google-Smtp-Source: ABdhPJzlxVLbKAQa65mfmbQ6ypNKFfoSvb0OzD41M5HKQ50KGmx7X1+TN0mlVpv4dIJ7DS1bjvlrHw==
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr2958493wry.349.1642756792164; 
 Fri, 21 Jan 2022 01:19:52 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id k8sm4604422wms.15.2022.01.21.01.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 01:19:51 -0800 (PST)
Date: Fri, 21 Jan 2022 09:19:49 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.17-rc1
Message-ID: <Yep6te0wrK0ZQ8SB@google.com>
References: <Yeg11pHSqx29yg/T@ls3530>
 <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
 <87fsph4fr2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsph4fr2.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jan 2022, Jani Nikula wrote:

> On Fri, 21 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Jan 19, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
> >> A first bunch of updates and fixes for the following fbdev & backlight drivers:
> >> ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
> >> lm3630a_bl, omap2, controlfb, matroxfb
> >>
> >> Nothing really important, mostly cleanups, const conversions, added null
> >> pointer/boundary checks and build fixes.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >
> > Not sure whether Linus missed this or just wanted to let the
> > discussion settle first. But since this is all random patches for
> > drivers that many distros don't even enable anymore there's no issues
> > here, and I very much welcome someone volunteering to pick these up.
> > I'd expect there's a pile more since it's been 1-2 years since Bart
> > took care of these and merged them consistently.
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> ...
> 
> >>  drivers/video/backlight/lm3630a_bl.c                     |  1 -
> >>  drivers/video/backlight/qcom-wled.c                      |  1 +
> 
> Backlight changes usually go through the backlight tree.

Yes, they do.  How were these applied to the DRM tree?

I don't see any mails about them being applied:

  Luca Weiss (2):
        backlight: qcom-wled: Add PM6150L compatible

  https://lore.kernel.org/all/20211229170358.2457006-2-luca.weiss@fairphone.com/

  Xu Wang (2):
        backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls

  https://lore.kernel.org/all/20220113084806.13822-1-vulab@iscas.ac.cn/

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
