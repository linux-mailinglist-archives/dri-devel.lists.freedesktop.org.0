Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C28A9F86D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D1A10E67B;
	Mon, 28 Apr 2025 18:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h/lkl/cN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328E910E67B;
 Mon, 28 Apr 2025 18:23:58 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39ee651e419so2695578f8f.3; 
 Mon, 28 Apr 2025 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745864637; x=1746469437; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bfkSNuW9ZLA+zt1E4XJ6Y4jl13nx7BJaRR54OIX8urI=;
 b=h/lkl/cNF2E/K7yn021n2jfJJPCHfzAWvo7T9zQe21KklgmXdno/PPWToTkQRnuC6x
 Oi35e7XdLkwMjdj53yC5PrZ2K8rlNWvuUVcerCbFIhgwSJY0fgQgcBxMkDwYNqQUwaE9
 grSHwl8nbiATzB31AhYi7VVM5L05iM2h9/EpQRQ0+Fc5nwD5CA6pUj5ft3RmvJBhlHAr
 g3VVJ3pAUuXMQpNC30nC0BzSYSbhUNsQdp1vfansb12dUCx8papY1ROPAg/6WUHw2h0e
 umMRTYkT3S6ymn8E0T2Yov6k5nGO5zZ/ue2udURiMpHW7Zn3yR187I/QXoW+AQbkvtLz
 /MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745864637; x=1746469437;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfkSNuW9ZLA+zt1E4XJ6Y4jl13nx7BJaRR54OIX8urI=;
 b=o0rtptD159ZnSaJ9Bi29VaEr+1qlbXwM5Ah548uP1ZBD389NIrJEVG5nGtJZyN1BBi
 FHC0RefcYGDwJ7lArXb3pN/8Qn9fmekTOlmgOGUp4q+5W0h8Hruns8a6+Dx0oopPQuFH
 WsPfV/tFsfBVYnEh3uMjikBW9j7DTDTJavEcsrvBAoKPwZhJB0eT+eYYtz3XljLcv7M+
 btT3diiKvH7kRnxhObKk/pea/cmSa2bb3bWkuIjuWpSMKOb6JRlqt9sJ5OTnQak7SHQZ
 McbI+VcoJcZrfNVfMWcJA7Z+Ggh2F2Jlzw5WutqgEnPAAqvBGyo7rnyxKJGVJ7THs4oD
 uOXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRocNQVgB4BG7NAGX0F2r9tUvDKH23VI4/isvrUUoKTy/txu++ZZyGFgTqNTD4BZwlNFVwGl7ouvk=@lists.freedesktop.org,
 AJvYcCX+Ohwwu+ZDzJ3zbEjB1YTl0zaVkPQfoCXGPi0bRNLwIReFTXYTeK6ieHE4cTX3aDBdOgmSHR1/SlPl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGauwT9etN5YNwOM+7Khmll0c3bJFAr0HYm2jL+w+dUcMtqFqH
 c6F5KaiDpwSPprtnOEGxdQmgtfhOx0SR9/Ub9NVM8PPAah2AHtH86Xc9ct+bvaiUuhmC7nu9rsv
 4AAyx7aCaFAzQduIBDVq5alxnBw==
X-Gm-Gg: ASbGnct8wVirI+L3FaqkU2jX0e0//P82Ii5HqIVP75erLMTvf+niWe3UGptUu78lac2
 nbVE7SNp5HNYdHBfsyxWHE4Jw7S6DZbxVA0pMNBWBPMzgdIIYnHBVJroVg09VTmkDzogTfsHgas
 kAi747DbGnCgTAVTCZjF4pmQ==
X-Google-Smtp-Source: AGHT+IFwDSjFDsXFqDEajGlCEG2JWphdEKba/Sl0xJc1WhGDflX1dA0OlyRMRIVd6p09uVXAOpHTVyL0aAWfZUYjs78=
X-Received: by 2002:a05:6000:4310:b0:3a0:8549:302 with SMTP id
 ffacd0b85a97d-3a08a371450mr255248f8f.35.1745864636424; Mon, 28 Apr 2025
 11:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com> <aA+N8YHX0DZ6h9Uj@linaro.org>
In-Reply-To: <aA+N8YHX0DZ6h9Uj@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 28 Apr 2025 20:23:45 +0200
X-Gm-Features: ATxdqUFJV2eKUF6Ib5_rQijD8ZDNXLbxDy4yxnBcyxEjzsLTAojaiverpqjEJgQ
Message-ID: <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-04-28 14:47:04, Johan Hovold wrote:
> > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > >
> > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > adapters or docks with retimers in transparent mode?
> > >
> > > I am actually not 100% sure.
> > > - If without LTTPR initialization, they default to transparent mode,
> > > then yes, incomplete LTTPR support sets them to non-transparent
> > > without per-segment training and breaks docks with retimers, while it
> > > would've worked if LTTPR(s) would've been left in default transparent
> > > mode. Note that in this case, X1E devices with ps883x are somehow an
> > > exception, because without LTTPR initialization at all the training
> > > always fails.
> >
> > Right, I'm concerned about breaking working setups for users of machines
> > like the X13s.
> >
> > > - If LTTPR has to be initialized either way, and explicitly set to
> > > transparent mode if we do not want non-transparent, then no,
> > > incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> > > with retimers, as those never worked in the first place. As per my
> > > understanding, this is the case, unless something (firmware?) has
> > > already placed LTTPR to transparent mode before the driver takes over
> > > - then 1st case would be applicable.
> > >
> > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > if it did work before, as I do not have a Qualcomm based device
> > > without LTTPR on the baseboard.
> >
> > Abel (or anyone else), do you have one of these docks that you could
> > test with the X13s to confirm whether this series fixes a regression or
> > not?
>
> Before the support for LTTPRs has been merged, if you would have one of
> those docks (I do not own one) with LTTPRs, link training would've just
> failed if the LTTPRs were not by default in transparent mode, which IIRC
> is what the standard dictates.
>
> X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> would return 0 and none of the of the transparent/non-transparent setup
> would happen. Now, as already mentioned, DP would be considered already
> broken (or rather not supported) if you would connect a dock with LTTPRs in it.
>
> With the support in, if one such dock is used, the training should be
> successful as all LTTPRs are set in transparent mode. This I was not
> able to test myself as I do not own such a dock.
>
> >
> > > > You describe at least one of this patches as a fix but I'm not seeing
> > > > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > > > a regression.
> > >
> > > You are right, I will add Fixes tag to the 1st patch to make it clear:
> > > Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> > >
> > > Or should I mark the entire series with Fixes, so that the docking
> > > stations with retimers can be fixed in 6.15 already? Landing only the
> > > 1st patch will fix inconsistency with DP spec, but will not fix
> > > docking stations with retimers. I guess this comes down to whether
> > > existing LTTPR (but not multiple LTTPRs) support is considered a bug
> > > (and patches 2,3,4 are a fix) or lack of functionality (and patches
> > > 2,3,4 are a new feature).
> >
> > Indeed. If LTTPR support broke existing setups, then I think all should
> > be marked with a Fixes tag and merged for 6.15. If we can't get it into
> > 6.15 we may consider just disabling LTTPR support in 6.15 to address the
> > regression and then enable it again once fixed in 6.16.
>
> The LTTPR support did not break existing (working) setups because on these
> setups, LTTPR count would read 0 and would be basically a no-op.
>
> >
> > But if this series is just enabling support for docks (and USB-C ports)
> > that did not used to work, then I guess this can all wait for 6.16.
>
> I'm not sure about what this actually fixes. It might be that is
> specific to a dock or something. But as far as X Elite boards go, even
> without this "fix" display has been working fine.
>
> The change itself makes sense though and I think makes sense to be marked as a fix.

Just to confirm, you mean to mark as fix only the 1st patch, correct?
Since it's obvious now that the currently present partial LTTPR
support did not break anything that used to work.

Thanks,
Alex

>
> >
> > Johan
>
> Abel
