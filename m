Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CEC73A417
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42D10E57A;
	Thu, 22 Jun 2023 15:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E210E577;
 Thu, 22 Jun 2023 15:01:19 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b4fef08cfdso39459355ad.1; 
 Thu, 22 Jun 2023 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687446079; x=1690038079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rRdkBzWvxfxb0w3VbAj/JjLYqdb5vKvNBOzrMjbvnZ4=;
 b=R/z8invRF3TFjDD5ZndbOtRxmhsqjYybp/CiyK7JWC4Fet52AywMb/9DklgK+EzcFM
 GZX1r2D35pYTtFshs5Iiyad4K8tZmvsRjkesTz5gOb01qU+7scWRXEqyr+TjsoSisMh7
 O0UQodu1lH5F2Xx3h1NZmd+n/SPriz5HOn/uZvsN+DYNVYn/YDEoteOSNilo5hmywMfA
 qwxhVDNrVNbI3se6guRRXDutEmkLoup1n4+VD7fuEjfP28esDW4VEfUKuYD3KzEyKips
 kMG+ezU3TY98nzCb8uKqe9QLp0CiWU2VFncTAKzFvJUna7k6H37qj2DKpFkq5R8zZ2Ml
 YNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687446079; x=1690038079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRdkBzWvxfxb0w3VbAj/JjLYqdb5vKvNBOzrMjbvnZ4=;
 b=HVD/5VRyhW7Gn0tqcXZV0e10vnhUJWBEOVgOXjySEaUrMnclCMIfxzHBoc2QePRLBv
 QoR9i62rQOxNilXAhgDDj8Ca9kHtqs1hCukmSv+QZPhfXU8WwwKqC0dbzYU4KcuP+sbg
 j3CF1kyXjK2viF9hcOXdPsa9ZY7wXbP5q31H9FcC1yrNS2obrUAGY33Uhsa6INzGu9Kg
 i0HmCPsTptgaw7Un5rcdzAqe99jWud/xtV4yFKopL9z2aKxZmwE0hWIZMM9FZU7Lu5L5
 4H5ZlLSIj/CQ9VtajlJvAF3D5eyU8FtLJDpT2HS2NSjmhVJrYECJf4mFdq5+n/D7rRWG
 bABA==
X-Gm-Message-State: AC+VfDwaF3YpSKr3Kk52K5wNfAZ9RTsbm5RNMgwTSK9LAbgGiIVlLy1L
 qXkpt9ls5LLqcb9hWt5uyqE=
X-Google-Smtp-Source: ACHHUZ7N8KQZGqYQF1FWIcaXUvTIe8GPbWvAVGZGWeKR6BMLl6zU9OMZ/+A2hwmX75wR2qeBRE7w/A==
X-Received: by 2002:a17:902:d905:b0:1b5:4859:ef36 with SMTP id
 c5-20020a170902d90500b001b54859ef36mr8976230plz.57.1687446078566; 
 Thu, 22 Jun 2023 08:01:18 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170902b41100b001b3ec39f40asm5475739plr.270.2023.06.22.08.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 08:01:18 -0700 (PDT)
Date: Thu, 22 Jun 2023 07:59:05 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/3] linux/bits.h: Add fixed-width GENMASK and BIT macros
Message-ID: <ZJRhuaebZC+y7B37@yury-ThinkPad>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
 <alzfewo3jado7ezyaibq52ep3vuxbyfism4ablchmvmioio3jb@3gyx6vaoscbf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alzfewo3jado7ezyaibq52ep3vuxbyfism4ablchmvmioio3jb@3gyx6vaoscbf>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Rasmus Villemoes <linux@rasmusvillemoes.dk>

> > -#define __GENMASK(h, l) \
> > -	(((~UL(0)) - (UL(1) << (l)) + 1) & \
> > -	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
> > -#define GENMASK(h, l) \
> > -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> > +#define __GENMASK(t, h, l) \
> > +	(GENMASK_INPUT_CHECK(h, l) + \
> > +	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> > +	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
> 
> yeah... forcing the use of ull and then casting to the type is simpler
> and does the job. Checked that it does not break the build if h is
> greater than the type and it works
> 
> ../include/linux/bits.h:40:20: error: right shift count >= width of type [-Werror=shift-count-overflow]
>    40 |          ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
>       |                    ^~
> 
> However this new version does increase the size. Using i915 module
> to test:
> 
> $ size build64/drivers/gpu/drm/i915/i915.ko*
>    text    data     bss     dec     hex filename
> 4355676  213473    7048 4576197  45d3c5 build64/drivers/gpu/drm/i915/i915.ko
> 4361052  213505    7048 4581605  45e8e5 build64/drivers/gpu/drm/i915/i915.ko.new

It sounds weird because all that should anyways boil down at compile
time...

I enabled DRM_I915 in config and ran bloat-o-meter against today's
master, and I don't see that much difference.

  $ size vmlinux vmlinux.new
     text	   data	    bss	    dec	    hex	filename
  44978613	23962202	3026948	71967763	44a2413	vmlinux
  44978653	23966298	3026948	71971899	44a343b	vmlinux.new
  $ scripts/bloat-o-meter vmlinux vmlinux.new 
  add/remove: 0/0 grow/shrink: 3/2 up/down: 28/-5 (23)
  Function                                     old     new   delta
  kvm_mmu_reset_all_pte_masks                  623     639     +16
  intel_psr_invalidate                        1112    1119      +7
  intel_drrs_activate                          624     629      +5
  intel_psr_flush                             1410    1409      -1
  clk_fractional_divider_general_approximation     207     203      -4
  Total: Before=35398799, After=35398822, chg +0.00%

Can you please check your numbers?

Interestingly, the kvm_mmu_reset_all_pte_masks() uses GENMASK_ULL(),
which should generate the same code across versions. Maybe it's just
a noise? Rasmus, can you please take a look?

Thanks,
Yury

