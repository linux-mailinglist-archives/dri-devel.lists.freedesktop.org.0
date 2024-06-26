Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE8B917B1B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D478210E7B5;
	Wed, 26 Jun 2024 08:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="loL4Kt9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C8210E7B5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:38:35 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cdc4d221eso4843841e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719391113; x=1719995913; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NNBm+Nz7a8n6J3Q4M5qmRpJJ/Ld6niKmaKEemUgPy0o=;
 b=loL4Kt9saDM1xW8CM1KMPHvScJRwct11PZ8qjYzp31NSDINie2b+yQq7OqFotJJxkv
 fgRb5OpTE+v7REALVmlH64dmZhxGfKu8gRwQgO7o+M9IHIGqi1NMy5yGHGVU37X9W9NW
 oNr9ttzqG2p4GwpDmdi+xRDFQW7TOOttISbiNLRGO/eRt+BZ3HrFbJSSX+eBV0ei1DDS
 T03lcOBCTku1BOaG1H4UDXZG6rv1f2j8dTC/PYEMCs9UPzY05+Eh3qZ7DHnyAbjotF2N
 nzQxa1Cm9uGRfjfVsxsXGBY7rWfxirpaPR2oK+QFwRTEpSldHN3GOEA7oTW7MNnkXAaw
 SAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719391113; x=1719995913;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NNBm+Nz7a8n6J3Q4M5qmRpJJ/Ld6niKmaKEemUgPy0o=;
 b=jmKWGHJAix38XeOGVxVGY8B56idcqVL7IVQC2aI47EKb4HCT0wH6HbTxvPXPEAhBVM
 H3e8JcKeiyFE3cXDy5xhWrHVnKTpHTpvx8I/0hQsZGTSzgGeyx2Y1KJdasm6NbU4y6Oi
 S1sxPiIZlV6x0NkRmWJ9KT9KBlcP9P29ZSXFCHX2dmZiZ7J21LD12USBki6YB53fOlKu
 Xf7UANkkhfxM5rGN7X9ODZJMPkSLpoHzrAFq7xftz5DV7ZNM3Eyjcq0lC2an8OH96MwS
 LoPDPqIW+Z3dV9F41GDjNQ5J6197op0vKZW5NtpLfFE0npCCr203nSE5vMd/W/z1uZop
 QFIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtJU1cI253GltUHxAc78LxsZ0C1YgAvTMx6195L/144oMs7GYHIp2rZDxgIrRQ+4yTqPakE5sMJH0HfXFTTWWsum3pyVgBAzLKCZA2z5Kh
X-Gm-Message-State: AOJu0Yw3xk7F1oNChB/sfE4UUc5uvUag09UNo138xjf5lYq2p+q7rfWz
 0f60wqgCzvsd6Vl0jYqhkNyyM3E/zp8nTnViJqJMPsFzA+4xvGxeDciuvJoEej0=
X-Google-Smtp-Source: AGHT+IEASK+vGvbLRGrUQN2nOI7YDGCl45unKR9xZ5MIBWvgeALUvcjrtaSFNzwZub1cplWpmJZ5uQ==
X-Received: by 2002:a05:6512:ba1:b0:52c:88d7:ae31 with SMTP id
 2adb3069b0e04-52ce185f67emr7332190e87.48.1719391113141; 
 Wed, 26 Jun 2024 01:38:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdf82db31sm1120207e87.66.2024.06.26.01.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 01:38:32 -0700 (PDT)
Date: Wed, 26 Jun 2024 11:38:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Helen Koike <helen.koike@collabora.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, Rob Clark <robdclark@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: Time for drm-ci-next?
Message-ID: <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
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

On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > 
> > 
> > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > Hi,
> > > 
> > > On 15/03/24 22:50, Rob Clark wrote:
> > > > Basically, I often find myself needing to merge CI patches on top of
> > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > back before the merge and force-push.  Which isn't really how things
> > > > should work.
> 
> This sounds more like you want an integration tree like drm-tip. Get msm
> branches integrated there, done. Backmerges just for integration testing
> are not a good idea indeed.

Is it fine to get drm/msm{-fixes,-next} into drm-tip?

> What exactly is the issue in backmerging drm-misc-next (well through
> drm-next really)?

drm-misc-next is its own tree with separate cadence, its own bugs and
misfeatures. But probably just picking up drm-next for the tests should
be fine.

> Also if there is an issue, generally we do ad-hoc topic branches.
> 
> I'm very very skeptical of boutique trees with tiny focus, we've had that
> before drm-misc, it's a mess. Definitely no enthusiasm for getting back
> to that kind of world.
> -Sima

-- 
With best wishes
Dmitry
