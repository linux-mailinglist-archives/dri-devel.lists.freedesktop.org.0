Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB23BA476
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0456E1F2;
	Fri,  2 Jul 2021 19:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E056E1F2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:51:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o13-20020a1c4d0d0000b02901fc90de999bso3102115wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TsL00DEsB6v/OaS0vVJdW7kzpulNFywgz1CMGvnsGAw=;
 b=TZboz5TQNzAuCvMp4YUr4FFEltz3s6PVe8y81VPmchg1+qDoFT0W1MeghyQZ2tBkeQ
 Yx5O7DzI2Uad1uZCOJ2sjGsOJwEevzsBuN4dszREFeUVT0vPzeEIuJHjRNwSgB7fDdw7
 3cJH7TRAFZVfr7ZofywIyHPsKu8oHy3JcWtuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TsL00DEsB6v/OaS0vVJdW7kzpulNFywgz1CMGvnsGAw=;
 b=CFWms1vMH5dRVxnbHS0lnoMd6srS4iMmaUy7i8ZhR7gA4S3D0SLT5rdyLG35gKeFRr
 2qTSFa4RgVVNqHg/HFQXwTAsS0NLkr9M+IrKD2wt1Gb385k35YW+YYc+xlncJrhVrPKk
 WRB4ciQOVilk0JOuQFeZIS3/6ME4luAsItnxT6COT3tTP2x8SoUoj+wXuZ24F8MEHLfT
 ORAp7pqsel44+tsCs6S7GDfhKfWTN5C0MsXO4CjdHsJMEIt69RZI3LQFvjqIcZSk76qa
 +dwLIGkuYgotwXvMn7Iw2dqi/jCfj6vM7chOp+bwonMLWqu0czONR9KAH52gFgXsqiEj
 q0ug==
X-Gm-Message-State: AOAM530ltI1kE/tmNTtxbxaErxFbmSW3OF23XVdfhxPsOqmxRUwALQWl
 O2HPHSxllS8u2rfNKJmFxZv5+Q==
X-Google-Smtp-Source: ABdhPJy/IHitZ3ijHyZtaH+n3pP03HnJRwMKx0g2wKPLGpMFFHgFfqF3RtSewxYDEeNRtpXkgyGXzw==
X-Received: by 2002:a7b:cc08:: with SMTP id f8mr1198245wmh.58.1625255487828;
 Fri, 02 Jul 2021 12:51:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q6sm13551741wma.16.2021.07.02.12.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:51:27 -0700 (PDT)
Date: Fri, 2 Jul 2021 21:51:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 0/2] drm/i915: IRQ fixes
Message-ID: <YN9uPeqktqiqfXc6@phenom.ffwll.local>
References: <20210701173618.10718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701173618.10718-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: matthew.brost@intel.com, airlied@linux.ie, mika.kuoppala@linux.intel.com,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 07:36:16PM +0200, Thomas Zimmermann wrote:
> Fix a bug in the usage of IRQs and cleanup references to the DRM
> IRQ midlayer.
> 
> Preferably this patchset would be merged through drm-misc-next.
> 
> v5:
> 	* go back to _hardirq() after CI tests reported atomic
> 	  context in PCI probe; add rsp comment
> v4:
> 	* switch IRQ code to intel_synchronize_irq() (Daniel)
> v3:
> 	* also use intel_synchronize_hardirq() from other callsite
> v2:
> 	* split patch
> 	* also fix comment
> 	* add intel_synchronize_hardirq() (Ville)
> 	* update Fixes tag (Daniel)

Ok now I actually pushed the right patch set.
-Daniel

> 
> Thomas Zimmermann (2):
>   drm/i915: Use the correct IRQ during resume
>   drm/i915: Drop all references to DRM IRQ midlayer
> 
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c       |  2 +-
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c |  7 +++++--
>  drivers/gpu/drm/i915/i915_drv.c                 |  1 -
>  drivers/gpu/drm/i915/i915_irq.c                 | 10 +++++-----
>  drivers/gpu/drm/i915/i915_irq.h                 |  1 +
>  5 files changed, 12 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 0cca17365e65370fa95d193ed2f1c88917ee1aef
> prerequisite-patch-id: 12b9894350a0b56579d29542943465ef5134751c
> prerequisite-patch-id: 3e1c37d3425f4820fe36ea3da57c65e166fe0ee5
> prerequisite-patch-id: 1017c860a0bf95ce370d82b8db1745f5548fb321
> prerequisite-patch-id: dcc022baab7c172978de9809702c2f4f54323047
> prerequisite-patch-id: 0d05ee247042b43d5ab8f3af216e708a8e09bee8
> prerequisite-patch-id: 110c411161bed6072c32185940fcd052d0bdb09a
> prerequisite-patch-id: d2d1aeccffdfadf2b951487b8605f59c795d84cf
> prerequisite-patch-id: 85fe31e27ca13adc0d1bcc7c19b1ce238a77ee6a
> prerequisite-patch-id: c61fdacbe035ba5c17f1ff393bc9087f16aaea7b
> prerequisite-patch-id: c4821af5dbba4d121769f1da85d91fbb53020ec0
> prerequisite-patch-id: 0b20ef3302abfe6dc123dbc54b9dd087865f935b
> prerequisite-patch-id: d34eb96cbbdeb91870ace4250ea75920b1653dc2
> prerequisite-patch-id: 7f64fce347d15232134d7636ca7a8d9f5bf1a3a0
> prerequisite-patch-id: c83be7a285eb6682cdae0df401ab5d4c208f036b
> prerequisite-patch-id: eb1a44d2eb2685cea154dd3f17f5f463dfafd39a
> prerequisite-patch-id: 92a8c37dae4b8394fd6702f4af58ac7815ac3069
> prerequisite-patch-id: f0237988fe4ae6eba143432d1ace8beb52d935f8
> prerequisite-patch-id: bcf4d29437ed7cb78225dec4c99249eb40c18302
> prerequisite-patch-id: 6407b4c7f1b80af8d329d5f796b30da11959e936
> prerequisite-patch-id: 4a69e6e49d691b555f0e0874d638cd204dcb0c48
> prerequisite-patch-id: be09cfa8a67dd435a25103b85bd4b1649c5190a3
> prerequisite-patch-id: 813ecc9f94251c3d669155faf64c0c9e6a458393
> prerequisite-patch-id: beb2b5000a1682cbd74a7e2ab1566fcae5bccbf0
> prerequisite-patch-id: 754c8878611864475a0b75fd49ff38e71a21c795
> prerequisite-patch-id: d7d4bac3c19f94ba9593143b3c147d83d82cb71f
> prerequisite-patch-id: 983d1efbe060743f5951e474961fa431d886d757
> prerequisite-patch-id: 3c78b20c3b9315cd39e0ae9ea1510c6121bf9ca9
> --
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
