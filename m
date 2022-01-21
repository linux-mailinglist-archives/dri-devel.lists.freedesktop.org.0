Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FD0495D88
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 11:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C573710E9C8;
	Fri, 21 Jan 2022 10:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F110E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:16:21 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso21240131wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 02:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CLYJz2R+mFRqKL06xxzdwISpHcTd92SLYyoRfz6Al/k=;
 b=ImlCVd8TOUysf7M9Mfv1MzTv3rmqrgTlic/bC1gbxOJw/rZ5BQCqGg2CmfpR5Q5lcq
 k1jErxG3rifuktK2RinNxjLDxT0VsvPbki1Ge9sP/dyzSc8Y5M870vm7xymaqjqVZ27D
 gtcGfGqJ4o6c4YJepG0hUT1oQLR5U8YfpFg6ZDIz+DcZ12ztoK1tY1noAAH1+YOBdR9b
 WezQngRAvPXEvwk0ZBykKwlkQ3qo3yo3Lic3rQrp2heaERoZVQ5ZmxiZrOxei3igXxQl
 n8yLOIwZHekLh6jKCk7XVrZAj8uA7NCkLRhWBKmSZTACwumpeiBJR69bAK1m350kyBKj
 KOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CLYJz2R+mFRqKL06xxzdwISpHcTd92SLYyoRfz6Al/k=;
 b=3qoyoKe6Ww2Aiv2S+7b96nTHp1xnOlJ2swiHil69UEU883BYQ564Sa6u6S29DgO14h
 FhWcfE5NAU+/KQu8LOPXd5aaw7PIjJJqrfTJRlHXCluT1AMn8guFNDnt2B7hay2x/oDc
 BdyOp6BYC6xa297+wMUWfi4dRF/yg/U9TY/Lnsl0o3FXIKbdaTmqg1VEWrzPis9wPLij
 eDTcInephHCOWRbsTASaqrqWf6earQoXOGP8Ini3rfbBinrf0p8uTASKLH5tOtPV1Ser
 2w9upQ5sfMNhgafqGEU+OJ49ExpulwoesDFCbX9K1hjAiYgxlGdKR5CQYuC0tJkIRW1f
 NeNA==
X-Gm-Message-State: AOAM53250Pax1YTfN5rd2vRMuSzEDO7sEsnFawmsL1+G76iBeQChSvt0
 z0LHe5XsIP8FG2QM4p19pOILTQ==
X-Google-Smtp-Source: ABdhPJxiH8szE7URldCF7knvg8nx9Plh7JPmXtM2hJR79Fpi7soLXMfkEG5o/1HFNKOVFP8qEZ+DTQ==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr40421wmq.41.1642760180152; 
 Fri, 21 Jan 2022 02:16:20 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net.
 [86.15.223.86])
 by smtp.gmail.com with ESMTPSA id y15sm2219968wry.36.2022.01.21.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:16:19 -0800 (PST)
Date: Fri, 21 Jan 2022 10:16:17 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.17-rc1
Message-ID: <YeqH8Y6+gElerxZm@google.com>
References: <Yeg11pHSqx29yg/T@ls3530>
 <CAKMK7uGeGBBvTGFyBxLwvTAxEWwXMS8U1rrYUb_7gbui-jV+KA@mail.gmail.com>
 <87fsph4fr2.fsf@intel.com> <Yep6te0wrK0ZQ8SB@google.com>
 <CAKMK7uG9FaBM6e_kXFZUgBCk4JFcPCbzG5D_9XcypwVeXqDq6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uG9FaBM6e_kXFZUgBCk4JFcPCbzG5D_9XcypwVeXqDq6A@mail.gmail.com>
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

On Fri, 21 Jan 2022, Daniel Vetter wrote:

> On Fri, Jan 21, 2022 at 10:19 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Fri, 21 Jan 2022, Jani Nikula wrote:
> >
> > > On Fri, 21 Jan 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Wed, Jan 19, 2022 at 5:02 PM Helge Deller <deller@gmx.de> wrote:
> > > >> A first bunch of updates and fixes for the following fbdev & backlight drivers:
> > > >> ocfb, aty128fb, mb862xx, omapfb, qcom-wled, dt-bindings, hyperv_fb,
> > > >> lm3630a_bl, omap2, controlfb, matroxfb
> > > >>
> > > >> Nothing really important, mostly cleanups, const conversions, added null
> > > >> pointer/boundary checks and build fixes.
> > > >>
> > > >> Signed-off-by: Helge Deller <deller@gmx.de>
> > > >
> > > > Not sure whether Linus missed this or just wanted to let the
> > > > discussion settle first. But since this is all random patches for
> > > > drivers that many distros don't even enable anymore there's no issues
> > > > here, and I very much welcome someone volunteering to pick these up.
> > > > I'd expect there's a pile more since it's been 1-2 years since Bart
> > > > took care of these and merged them consistently.
> > > >
> > > > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > ...
> > >
> > > >>  drivers/video/backlight/lm3630a_bl.c                     |  1 -
> > > >>  drivers/video/backlight/qcom-wled.c                      |  1 +
> > >
> > > Backlight changes usually go through the backlight tree.
> >
> > Yes, they do.  How were these applied to the DRM tree?
> 
> They are not applied to any drm trees, Helge jumped in last week to
> take over drivers/video maintainership.
> -Daniel

Sorry s/DRM/fbdev/

> > I don't see any mails about them being applied:
> >
> >   Luca Weiss (2):
> >         backlight: qcom-wled: Add PM6150L compatible
> >
> >   https://lore.kernel.org/all/20211229170358.2457006-2-luca.weiss@fairphone.com/
> >
> >   Xu Wang (2):
> >         backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls
> >
> >   https://lore.kernel.org/all/20220113084806.13822-1-vulab@iscas.ac.cn/
> >
> 
> 
> 

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
