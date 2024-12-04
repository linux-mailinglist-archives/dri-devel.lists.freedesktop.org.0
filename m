Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F89E4F28
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C8E10EDEA;
	Thu,  5 Dec 2024 08:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YZcBeG/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10710E143;
 Wed,  4 Dec 2024 08:28:58 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-215810fff52so35913945ad.1; 
 Wed, 04 Dec 2024 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733300938; x=1733905738; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUWkO09ScmfYLGTWW9HNvL8CRZ3OvigAhD+dzpuCh8U=;
 b=YZcBeG/3JXTgEgO/3j1iVxH3XheYOJCf0mj4yGOLWcv38e97JIsFQOIz+bVCEa2Y7Q
 x1UNYizPhinAbSCNLURHwZXKy2tfbeqDf9rEp6YPZvjdmC1r7gnpDUjn+usYPjxDAkIA
 fvwjYxnsANG1yzj9Fx/X6hzPqxk9kd4gFRPYm9yGHS9rz9ypjZY0nfu44tUoJN7tqC4O
 ib5o464lY073VNzEE0mJKGVHxCFj992GM7lbXqmAefaJxMtpaOd8o1Nnfbp4mnglCFvK
 HrW/cAb+ovuH0Lx9yeYOksetvhaJ+EVPmEzZICFxBDv03o+F/HRLhA+4xzGtM613j0e5
 7bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733300938; x=1733905738;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUWkO09ScmfYLGTWW9HNvL8CRZ3OvigAhD+dzpuCh8U=;
 b=qfk0aI2+KqEzpQw2WpuzKTk6nz92dkw7GAIQDe8WQ+GEGMc9K8R8QUMazedxweoBLE
 Rx4Y8AkMs/WKrDllCIBjr+MYZWV68ac0+HzJD6bTIMR5iALKX4HC6UcYKZFps+YT+try
 h9iUfFXrSxGmutl72I+GdDgSfuPdjNI08+sTOzlq5SXv+OIplbh00Z5cXhSWmkpleNui
 Z2ydXLhhd7xWjuKHCi3p0uQXj+Rt02DT/SQlkOA52sMwvSZLZvav8R39ipXZehlBni1q
 HIMTxfjP6vLC4RDXyp/8GXWnViOLV55qWeH9Ms1C6l1UYZy9xH76NOUjQ/73riwwVSuc
 shvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzWcbnWAcefW6p/Tt5K7/fzCQiVxee5zB1LoE6fJPMcfx8PPn6a30GzwbkKpKX84eMwrH9JlvUjiQM@lists.freedesktop.org,
 AJvYcCXUMhHFcW+C2P7yzCgkSk1WZKyJ3NQbE9rVJQX58y9A2o3fg4o6I6mpl6Rb6yrjZNK2ExpBCG3zeWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs8840mQXJFXEUy2n8sk2ldzacdYT24r8E4IVvPc0Wis3b8AkJ
 LgLeOqlBfgLoEku65BCrGLCUXQEUUsaY91cHYKWq9gpeAfeN47NV
X-Gm-Gg: ASbGncuuD2bRU2xLg9Gfq4GTDaeeTgRkLMWM9FnLarUtFJgrTNcjzniaanI7bnlTVvH
 nZU+zTUG+em/CxH7p1nZ+90lQcd8j4dZPvvX30qqn6s0/8ZiLzu/9zeZWg2tsbbE8BWi1jbHMXt
 OPm3Tv8j7NBzZCsvX8LAZPdr+Z/UUetFd5ye5aGRGfBXAKk52YDLnFfRCuZSzw8IAMUHvg3ybX4
 /MCCIMe9k3YXT3EUNFuDwKFoQJlwQeD7bczh/aFSSE4kGLwyABgZ1HnIwY=
X-Google-Smtp-Source: AGHT+IHBB8zm57kTineu1HQVncxbz7lNJJvZp2gDMacf/P23sMkeqR8Um6ILeNeARtCklWIsKTJOgg==
X-Received: by 2002:a17:903:183:b0:215:acb3:375d with SMTP id
 d9443c01a7336-215bd1ce3a6mr68186245ad.18.1733300937791; 
 Wed, 04 Dec 2024 00:28:57 -0800 (PST)
Received: from gmail.com ([113.240.217.127]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2155f195b2asm71157375ad.273.2024.12.04.00.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 00:28:57 -0800 (PST)
From: Dmitry Baryshkov <lee.lockhey@gmail.com>
X-Google-Original-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Dec 2024 16:28:49 +0800
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
Message-ID: <Z1ASwcMuxEWmudzP@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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

On Wed, Nov 20, 2024 at 01:37:48PM +0100, Neil Armstrong wrote:
> On 20/11/2024 12:19, Dmitry Baryshkov wrote:
> > On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
> > > The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
> > > along the Frequency and Power Domain level, but by default we leave the
> > > OPP core vote for the interconnect ddr path.
> > > 
> > > While scaling via the interconnect path was sufficient, newer GPUs
> > > like the A750 requires specific vote paremeters and bandwidth to
> > > achieve full functionality.
> > > 
> > > While the feature will require some data in a6xx_info, it's safer
> > > to only enable tested platforms with this flag first.
> > > 
> > > Add a new feature enabling DDR Bandwidth vote via GMU.
> > 
> > Squash into the implementation patch.
> 
> Which one ? the flag is use in the next 3 patches

First one which uses it

> 
> > 
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -58,6 +58,7 @@ enum adreno_family {
> > >   #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
> > >   #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
> > >   #define ADRENO_FEAT_PREEMPTION			BIT(2)
> > > +#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
> > >   /* Helper for formating the chip_id in the way that userspace tools like
> > >    * crashdec expect.
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry


----- End forwarded message -----
