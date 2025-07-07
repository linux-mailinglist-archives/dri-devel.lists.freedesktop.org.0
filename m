Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC2AFB87F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9FC10E323;
	Mon,  7 Jul 2025 16:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NklOQ3ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA110E322;
 Mon,  7 Jul 2025 16:17:46 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2363616a1a6so30758205ad.3; 
 Mon, 07 Jul 2025 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751905066; x=1752509866; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=plhscmn8unqBogHCLfe3zzhmsxB9tOjf382Kqk10WmM=;
 b=NklOQ3exrcZCxdsGnIMrbcp6ETmXpK7XN2E3e3ymllqbvTZgtp2VzlhAv1pPZR9vRn
 g+mSyHIJKu1PUBjYwMK1zU+aLLuO33BOX5FMfSzm1gftIEhqZBl3XlWMx2+H/Oog4LP5
 CEES3I8QS6BWlf9bqGso3jEgwEyzzlKCYjOtxfB4+pZxFAr/d6f/0payZ3CIBJeoQUnJ
 /QuxCMIoLkgAUgJprzAjKcUPPdijR8kb+VCnBC5bATDZMGJCKHK2ZpR8HnjqNs0mSQmB
 VfIqWZG7xdpUmoT9USWo7oXHjJD2hdhQP2wTLkMv2mgaW2heWM4pN5lW95/GdLY5tP8Q
 HVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751905066; x=1752509866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plhscmn8unqBogHCLfe3zzhmsxB9tOjf382Kqk10WmM=;
 b=JDjSb3qClhe+3qVMBfLKw5UTxssGvXrlCVb4cDSC6Y3riqUJ0ZjWSCw92t/EdL7xlP
 IaHeEMDNvzHKwC+6SdEBe0zwH5O5E2S4Vre7Yn8aEN1CJ5WOYtq9K159tGbGWdb3ULCt
 qD8tA4sRz0eu8A5eaGInKGmyd6uOKY5SM6j16Y3bOziH36W8SzYB76jqyIh8Xj6KaM11
 j0xDmdnqVG83B3JOF/cPlqfP67xvGcUtUCMU/PoNoB71rxtw+H3BdDmTN2FJ3hW5YCKk
 ufHOLyLdLclHA9z6eqoXfa9v2SdXoUCeTyNA8lAIaIF7Hc77ZJagrt8KvxHTO+DvOoQv
 65Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/3LVR+juQ4Ua9VAYUBpXdzHtvmc3plDVXhMt6St6sneVAb14eTEPw22OuPMItKxOPo2+JBzew+yYy@lists.freedesktop.org,
 AJvYcCWvYDhGbGsoS4ayR+4DGduws/D3b6pZgmecju2nAA1SIFzu+ff7Qgd+7gX5T1fGorsONdKyKmh4k6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhTTOXMmEfMafNsEy+dOmxnW3liUwamwv95g7QMaSZfFLPD23J
 4sXXpduMbFBQoWpciYGgMkzmanQEmItArWKASYhcHUB1fAzVNp9ER9Si
X-Gm-Gg: ASbGnctbVa3vwAr3lkKiOTaio/CLYep3rgkN1vFufI/BYgF+INIr6tplt0o7rShSwpS
 LUYIAnu/4SDdbmCx9zWLbic302QpLX0lygKctHzZVQepMhy9RA6O0MuzjD17xLx2eUeE53sGPg8
 9JtmH4Hva7CthJyxtB7tyTnkwF40EiHwxcaFl5nT1O4KTMX8BX6Def3tr2PkmJiM56VjREMXrSL
 VCEjEMBkQadN0AVP5nqtJnMy9UdXZTcdfvGyg4vzM+/gPBM7Xm2jePF2hfUl9MTrOdCJHXEdNPl
 nfbQQxbNB+5WEKvJrCeGcmtmRU4FbiW2N6/msgerCqr8AV8wrn/Uo63aZEGDHQ==
X-Google-Smtp-Source: AGHT+IF1moARBkgm2lhQ9mBywi0r3o93XpJWFbU3tfKbOXZ3T+6OukiapWmLixUD8Kkr0uNvuebhpQ==
X-Received: by 2002:a17:903:b07:b0:234:948b:91c7 with SMTP id
 d9443c01a7336-23c875d2f93mr217129395ad.51.1751905065725; 
 Mon, 07 Jul 2025 09:17:45 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450a61sm9260195a12.8.2025.07.07.09.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 09:17:45 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:17:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <aGvzHdDACM1Cw97f@yury>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
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

On Mon, Jun 09, 2025 at 11:45:44AM +0900, Vincent Mailhol via B4 Relay wrote:
> This is a subset of below series:
> 
>   bits: Fixed-type GENMASK_U*() and BIT_U*()
>   Link: https://lore.kernel.org/r/20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr
> 
> Yury suggested to split the above series in two steps:
> 
>   #1 Introduce the new fixed type GENMASK_U*() (already merged upstream)
>   #2 Consolidate the existing GENMASK*()
> 
> This new series is the resulting step #2 following the split.
> 
> And thus, this series consolidate all the non-asm GENMASK*() so that
> they now all depend on GENMASK_TYPE() which was introduced in step #1.
> 
> To do so, I had to split the definition of the asm and non-asm
> GENMASK(). I think this is controversial. So I initially implemented a
> first draft in which both the asm and non-asm version would rely on
> the same helper macro, i.e. adding this:
> 
>   #define __GENMASK_TYPE(t, w, h, l)		\
>   	(((t)~_ULL(0) << (l)) &			\
>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
> 
> to uapi/bits.h. And then, the different GENMASK()s would look like
> this:
> 
>   #define __GENMASK(h, l) __GENMASK_TYPE(unsigned long, __BITS_PER_LONG, h, l)
> 
> and so on.
> 
> I implemented it, and the final result looked quite ugly. Not only do
> we need to manually provide the width each time, the biggest concern
> is that adding this to the uapi is asking for trouble. Who knows how
> people are going to use this? And once it is in the uapi, there is
> virtually no way back.
> 
> Adding to this, that macro can not even be generalised to u128
> integers, whereas after the split, it can.
> 
> And so, after implementing both, the asm seems way cleaner than the
> non-asm split and is, I think, the best compromise.
> 
> Aside from the split, the asm's GENMASK() and GENMASK_ULL() are left
> untouched. While there are some strong incentives to also simplify
> these as pointed by David Laight in this thread:
> 
>   https://lore.kernel.org/all/20250309102312.4ff08576@pumpkin/
> 
> this series deliberately limit its scope to the non-asm variants.
> 
> Here are the bloat-o-meter stats:
> 
>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o
>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-9 (-4)
>   Function                                     old     new   delta
>   intel_psr_invalidate                         352     354      +2
>   mst_stream_compute_config                   1589    1590      +1
>   intel_psr_flush                              707     708      +1
>   intel_dp_compute_link_config                1338    1339      +1
>   intel_drrs_activate                          398     395      -3
>   cfg80211_inform_bss_data                    5137    5131      -6
>   Total: Before=23333846, After=23333842, chg -0.00%
> 
> (done with GCC 12.4.1 on an x86_64 defconfig)

So, I'm still concerned about that split for C and asm implementations.
But seemingly nobody else does, and after all it's a nice consolidation.

I've moved this in bitmap-for-next for testing. Thank you Vincent for
your work.

Thanks,
Yury
