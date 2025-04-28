Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1373A9F343
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 16:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261A410E3AD;
	Mon, 28 Apr 2025 14:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SEHvFxYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F362F10E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 14:17:25 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso7468059a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745849844; x=1746454644; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MAB7MM/5KcPgVIvsQ7jcOLB1Q0JL1wGvVRTO+fCZY6E=;
 b=SEHvFxYtiR5RTJp73QNMuZ0R/UhuPw7l8nCup//q8xL/9ksvTOv09uk075r/JzqIO0
 rKM2SkMwcD+vbrUDPdJN42gXpeVc1Fzv28kyp1GshCOBc/pn/lbInhb0GvYugCUM3IFa
 bgRIaJAR3yqx35LGcaR6jpG6IsUcQnK0R5d33i45AuP1f47MDMhO/vCGsU8Hz25wLwbC
 658dBDlw5JUvAKpsXaDQ7TWZXitQJVSjhykQbWgxUGzUbJB/456c5I+t5VNSO/3jLsXB
 7jMxS7z0Fl1EYYuPBaeH3wIojYLUiJoWJLF4FoGpVsJRHmg8T9lc79aHDW44Qh9hJEcr
 sxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745849844; x=1746454644;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAB7MM/5KcPgVIvsQ7jcOLB1Q0JL1wGvVRTO+fCZY6E=;
 b=VSxnIn88CKGVvW7gB42r3sKtkljGqYnAV6kzY/cXv1fR9dSb8AVlOaHKyfTWOB2V2E
 sVzc/IHsts4ggc3iLZF1M+2Xp5VH8Jzufi8K1iXdvD+in3Mg2QEjWgrktl3ZYSMat53H
 7iQ1qT3qRtUCZkx6Ep9jUekXJl00wtEumcCPKQKCpr5JcDRbPHTKsMoSq2sJaHZDfgjj
 srnM1rJKQ8g0ZYpFqGw6CZNyyyw9gBJvHIOSxBXKDSapO89m2wDUh2KRFFHV9cJ/6/KE
 tyhPn1lpJcL/AHeCaAJVDsilB9SZhn9O19nhubKsCO7I+b3MOJT2Zj58jAD2g9H9lqp1
 hjwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9+4ILmUuEV/kEtsG6DILB7dkEitydJUJN3Q1jYwWv9sheOnztp+a7El5NWxO2WWpRkiyABTYmDy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFjoxLXYU02NUsDtS7qciBeidHzxqB71w9Alwnw4D9LBEtMFhU
 ZYiYceyKDur74qBWOXueIBMUeuBuSNXGSrY8qTHxVLGz3QJrM7Cg9JX5M1sFlPM=
X-Gm-Gg: ASbGncuaGjcBmkDTIalphUnQRQk7RtZicuFuCt8phyrasEHVlBVesA9JDqXCV5bsdnn
 8ZSnQrOhhmQrJ41DYV2oX/CfpesKe5LEDAG6Am3ARMZ0rOYw2fGf3UhigGeHblR1euyWenmQo95
 giCXWZc+mky4tv1R6NzQQ9R+C07Pz2vjiYdEKJXcSj65wdFlgOlyTtmL/ucCR2EwXNDBZthp3hB
 mTv8dTbl25t1C+DEaKfZIYYFuyLqLnUTTEqqsa2S3laXdkUnCJvLmFOteYAA6MAqT1rw3qq9xss
 QWhY1cPxvL9kBbfxshy7gd+B0C8k4BjabIM/MQ==
X-Google-Smtp-Source: AGHT+IEbdwFeeDsBIl2er2pHFgP5t9WIvItB5t8KO8vYPa4TRLVU01MHNtVHzK/JvZ2FwrGG5uN74g==
X-Received: by 2002:a17:907:9816:b0:aca:cac6:3ca9 with SMTP id
 a640c23a62f3a-ace71107381mr1124921366b.27.1745849844383; 
 Mon, 28 Apr 2025 07:17:24 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e69d9sm642199166b.50.2025.04.28.07.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 07:17:23 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:17:21 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aA+N8YHX0DZ6h9Uj@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA94yOjsayZHNDpx@hovoldconsulting.com>
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

On 25-04-28 14:47:04, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > to non-transparent mode to enable video output on X1E-based devices
> > > > that come with LTTPR on the motherboards. However, video would not work
> > > > if additional LTTPR(s) are present between sink and source, which is
> > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > >
> > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > adapters or docks with retimers in transparent mode?
> > 
> > I am actually not 100% sure.
> > - If without LTTPR initialization, they default to transparent mode,
> > then yes, incomplete LTTPR support sets them to non-transparent
> > without per-segment training and breaks docks with retimers, while it
> > would've worked if LTTPR(s) would've been left in default transparent
> > mode. Note that in this case, X1E devices with ps883x are somehow an
> > exception, because without LTTPR initialization at all the training
> > always fails.
> 
> Right, I'm concerned about breaking working setups for users of machines
> like the X13s.
> 
> > - If LTTPR has to be initialized either way, and explicitly set to
> > transparent mode if we do not want non-transparent, then no,
> > incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> > with retimers, as those never worked in the first place. As per my
> > understanding, this is the case, unless something (firmware?) has
> > already placed LTTPR to transparent mode before the driver takes over
> > - then 1st case would be applicable.
> > 
> > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > if it did work before, as I do not have a Qualcomm based device
> > without LTTPR on the baseboard.
> 
> Abel (or anyone else), do you have one of these docks that you could
> test with the X13s to confirm whether this series fixes a regression or
> not?

Before the support for LTTPRs has been merged, if you would have one of
those docks (I do not own one) with LTTPRs, link training would've just
failed if the LTTPRs were not by default in transparent mode, which IIRC
is what the standard dictates.

X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
would return 0 and none of the of the transparent/non-transparent setup
would happen. Now, as already mentioned, DP would be considered already
broken (or rather not supported) if you would connect a dock with LTTPRs in it.

With the support in, if one such dock is used, the training should be
successful as all LTTPRs are set in transparent mode. This I was not
able to test myself as I do not own such a dock.

> 
> > > You describe at least one of this patches as a fix but I'm not seeing
> > > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > > a regression.
> > 
> > You are right, I will add Fixes tag to the 1st patch to make it clear:
> > Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> > 
> > Or should I mark the entire series with Fixes, so that the docking
> > stations with retimers can be fixed in 6.15 already? Landing only the
> > 1st patch will fix inconsistency with DP spec, but will not fix
> > docking stations with retimers. I guess this comes down to whether
> > existing LTTPR (but not multiple LTTPRs) support is considered a bug
> > (and patches 2,3,4 are a fix) or lack of functionality (and patches
> > 2,3,4 are a new feature).
> 
> Indeed. If LTTPR support broke existing setups, then I think all should
> be marked with a Fixes tag and merged for 6.15. If we can't get it into
> 6.15 we may consider just disabling LTTPR support in 6.15 to address the
> regression and then enable it again once fixed in 6.16.

The LTTPR support did not break existing (working) setups because on these
setups, LTTPR count would read 0 and would be basically a no-op.

> 
> But if this series is just enabling support for docks (and USB-C ports)
> that did not used to work, then I guess this can all wait for 6.16.

I'm not sure about what this actually fixes. It might be that is
specific to a dock or something. But as far as X Elite boards go, even
without this "fix" display has been working fine.

The change itself makes sense though and I think makes sense to be marked as a fix.

> 
> Johan

Abel
