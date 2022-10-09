Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900F5F8931
	for <lists+dri-devel@lfdr.de>; Sun,  9 Oct 2022 05:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0C610E41C;
	Sun,  9 Oct 2022 03:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4521C10E415
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 03:41:17 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 129so7799111pgc.5
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Oct 2022 20:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jc9wqi9hH7sDAuXmZMPHByefEvgO0MbR3+ZEqDB7Wuk=;
 b=ZhbF7aukJSn3TNMRwCJkZSqm1r+X38mJ2RxvPJW6Z+9mn1TOlxypOyituNx8mz1HVC
 FGqxSiHSDomVzpOPFi9kka3+6Rdn9v0XaNwqyXLdtOhmQI0POv0z39c8Rsj4C7/d+KIP
 fJKzHg6Na0ETg2nVHR+d6vQT/rsL3lGZwlInw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jc9wqi9hH7sDAuXmZMPHByefEvgO0MbR3+ZEqDB7Wuk=;
 b=w6NEr+ZwsJ0u7o2t+mSHLysdEcEIkFjvvGMRsKV+9TLll3osl2dNuMJb7xUjzBcM+I
 s6G8rYHfqjSZcSFuqMimfs0etNBMeJeHXlE/vQ20eBl+uqKS+o0kay99Yk9LdMQqWY5G
 wCFpc2cKfDfa9dmTlTo2codd6XL8Yxpu1FQUbv9dji9Gpuwuk7hkA3WrCxP0QCOkiYYe
 qldCyADCxp4L4K7mdhH1yEH3rQ8DgVwctu/Lm8vL5PE+lpXfUTq96jjc1IV0LiF6YTbs
 SP04Le5Xnsx5yH3pVEcIyMb6YKdEcg/3hmjdxNAZTpSgDfCdMJLycB77J1DEpZ/pAyZC
 uQfA==
X-Gm-Message-State: ACrzQf1blm17x/L+hMrrC3YQ3BUm71wiasDOqTKqm0/+hqMXKDNJJiAY
 z1aW0sbfT6H7QhWaXiaxUDSdmQ==
X-Google-Smtp-Source: AMsMyM5FGTaJNFEGPbumoaD5MBb6Q7fQgfiKiCpnvelFpTCgpDJD/BqrIxkvX1O2Yt8qSiE6wtg/9Q==
X-Received: by 2002:a63:1a45:0:b0:439:49b4:9672 with SMTP id
 a5-20020a631a45000000b0043949b49672mr11177300pgm.551.1665286876512; 
 Sat, 08 Oct 2022 20:41:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 h129-20020a625387000000b00561ed54aa53sm4353776pfb.97.2022.10.08.20.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 20:41:15 -0700 (PDT)
Date: Sat, 8 Oct 2022 20:41:14 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v5 0/7] treewide cleanup of random integer usage
Message-ID: <202210082028.692DFA21@keescook>
References: <20221008055359.286426-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221008055359.286426-1-Jason@zx2c4.com>
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 x86@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Yury Norov <yury.norov@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 11:53:52PM -0600, Jason A. Donenfeld wrote:
> This is a five part treewide cleanup of random integer handling. The
> rules for random integers are:

Reviewing the delta between of my .cocci rules and your v5, everything
matches, except for get_random_int() conversions for files not in
your tree:

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 7a2b2d6bc3fe..62f69589a72d 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -729,7 +729,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 static int drm_buddy_init_test(struct kunit *test)
 {
 	while (!random_seed)
-		random_seed = get_random_int();
+		random_seed = get_random_u32();
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 659d1af4dca7..c4b66eeae203 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -2212,7 +2212,7 @@ static void drm_test_mm_color_evict_range(struct kunit *test)
 static int drm_mm_init_test(struct kunit *test)
 {
 	while (!random_seed)
-		random_seed = get_random_int();
+		random_seed = get_random_u32();
 
 	return 0;
 }

So, I guess I mean to say that "prandom: remove unused functions" is
going to cause some pain. :) Perhaps don't push that to -next, and do a
final pass next merge window to catch any new stuff, and then send those
updates and the removal before -rc1 closes?

-- 
Kees Cook
