Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C985FB8F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 15:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28B410E9FF;
	Thu, 22 Feb 2024 14:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MGHhTJol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1175E10E9BA;
 Thu, 22 Feb 2024 14:50:02 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-607d8506099so78965137b3.0; 
 Thu, 22 Feb 2024 06:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708613401; x=1709218201; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pgWoF222TKWG8FSH+S0e/ePZpOcnafKA937HK7RyQT4=;
 b=MGHhTJolp4HaXdB5CZ8HICNaYINjmvHwVGPVp56Pa72mzMFGXTbRsIRbulGMleye01
 Dbv6TJF/7OWcSTkq112yFnLSjqbGFA/P3W9Kdz/oX1/zeWegnxvQ/swvyCrhJ9lLmL5r
 EzZ/R+PjR0wUk0tlGx3LCeWtJBf2fyUN8q5bIgrUH9XlSsb7g1QMqYmmqrBZ8gltR3Ms
 7BI1o1rmASqPbN+CPDCUFRZvNzamNRJcJleSMe8iPEAHiXO8IF2ypdvkUoOuDT6+5EXH
 SHtB4lymSKx1orlYIC3IHvHY7vc5lyUTcoi6dxh11TNqKR7//Rj9wm8gjn7IOrCIIfUc
 Ilvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708613401; x=1709218201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgWoF222TKWG8FSH+S0e/ePZpOcnafKA937HK7RyQT4=;
 b=uQY8tYBtDltoIxY5bd61yUIYEJ8rdYuC5Cn2Zme2kAU6O7J6GyMVghbNyYTOd5x0HD
 vneVSCDBoQdHEShdJOOPgOw/Oz7V1gVvI2QItHrFTxNCDhKb4KXmE8PxrnWz74+aC5mN
 583eQX4J9TtiR2y+/9qw2rTyioIv8EL0HzcohseSuNcKCX2fMDNtEYnNyjqWlf7UOysy
 dJdzCEHqTa/+0hiusNNT2btMRAy2i1wiUl65DdmtpqMJTFKEqcJ1UMwm3RiFH4UOSyNo
 Q6GdOMci1vTdxjg1BJvLFA8tSoi5nJK97y2Hnl+TykZ8o5nG6MXkPnSZAYQkZS7NkVam
 U/Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURCjvYI/HNne7boRcXkDRNXFYkOrDjLSl2eVaaHKcABvEcCnGC+rQ+UuuwAzWKHPsCMu5fF90UewOQUOATETZYO9d9dDLxlerW1pfhnz+Bn4EY9psDPkZIcWJr28emMO8mQkhJyWtFgGeYrS0GD3prf4YtJ1sxR8NGtsgAd3U39Pc0TBHjh2VN8k7cuGwgSdw=
X-Gm-Message-State: AOJu0YwMQF50B38bzOC87ZFwm4oIqttkpxmTmcSAKxn9pJGwa/+9yHkJ
 Dcvf+vyOOgsJm/FE2oJ18Nq7IgA6Nzgl0UcqEfHMLdvdmarS0mB3
X-Google-Smtp-Source: AGHT+IFn9ijuGBvKfA4N0TDWpVowpbL3wa738Q5przztktNcGMrygmID3rBW9zPOiks16Knlsv7TNQ==
X-Received: by 2002:a81:7994:0:b0:5ff:a9bc:b7f with SMTP id
 u142-20020a817994000000b005ffa9bc0b7fmr20495646ywc.21.1708613400832; 
 Thu, 22 Feb 2024 06:50:00 -0800 (PST)
Received: from localhost ([2601:586:d030:4ea3:8dfa:1e5f:80e2:c7c])
 by smtp.gmail.com with ESMTPSA id
 d85-20020a814f58000000b006088c7c1e2asm618733ywb.59.2024.02.22.06.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 06:50:00 -0800 (PST)
Date: Thu, 22 Feb 2024 06:49:59 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: Re: [PATCH v3 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZddfF7kb54o2c/QR@yury-ThinkPad>
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
 <20240208074521.577076-2-lucas.demarchi@intel.com>
 <CAA8EJpprfrtOjNzT6TFhV1n6MXzLdTahanfxcRW4uVjeHaBduA@mail.gmail.com>
 <ZdZlVn9BI-0q1Xdn@smile.fi.intel.com>
 <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <btssirjumey2kcp5dyhe6m3embdwd5bswjz3c6swrhxfijfhld@lztxaptkegw6>
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

On Wed, Feb 21, 2024 at 03:59:06PM -0600, Lucas De Marchi wrote:
> On Wed, Feb 21, 2024 at 11:04:22PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 21, 2024 at 10:30:02PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, 8 Feb 2024 at 09:45, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > 
> > ...
> > 
> > > > +#define BITS_PER_TYPE(type)    (sizeof(type) * BITS_PER_BYTE)
> > 
> > Can sizeof() be used in assembly?
> > 
> > ...
> > 
> > > > -#define __GENMASK(h, l) \
> > > > -       (((~UL(0)) - (UL(1) << (l)) + 1) & \
> > > > -        (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
> > > > -#define GENMASK(h, l) \
> > > > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> > 
> > > > +#define __GENMASK(t, h, l) \
> > > > +       (GENMASK_INPUT_CHECK(h, l) + \
> > > > +        (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> > > > +        ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
> > 
> > Nevertheless, the use ~0ULL is not proper assembly, this broke initial
> > implementation using UL() / ULL().
> 
> indeed.
> 
> > 
> > 
> > > > -#define __GENMASK_ULL(h, l) \
> > > > -       (((~ULL(0)) - (ULL(1) << (l)) + 1) & \
> > > > -        (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> > > > -#define GENMASK_ULL(h, l) \
> > > > -       (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
> > 
> > Ditto.
> 
> problem here seems actually because of the cast to the final type. My
> previous impl was avoiding that, but was too verbose compared to this.
> 
> I will look at reverting this.
> 
> Lucas De Marchi

The fix is quite straightforward. Can you consider the following
patch? I tested it for C and x86_64 asm parts, and it compiles well.

Thanks,
Yury

From 78b2887eea26f208aac50ae283ba9a4d062bb997 Mon Sep 17 00:00:00 2001
From: Yury Norov <yury.norov@gmail.com>
Date: Wed, 7 Feb 2024 23:45:19 -0800
Subject: [PATCH v2] bits: introduce fixed-type GENMASKs

Generalize __GENMASK() to support different types, and implement
fixed-types versions of GENMASK() based on it. The fixed-type version
allows more strict checks to the min/max values accepted, which is
useful for defining registers like implemented by i915 and xe drivers
with their REG_GENMASK*() macros.

The strict checks rely on shift-count-overflow compiler check to
fail the build if a number outside of the range allowed is passed.
Example:

	#define FOO_MASK GENMASK_U32(33, 4)

will generate a warning like:

	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
	      |                               ^~

CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>	      
Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

---
 include/linux/bitops.h |  1 -
 include/linux/bits.h   | 41 ++++++++++++++++++++++++++++-------------
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 2ba557e067fe..1db50c69cfdb 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -15,7 +15,6 @@
 #  define aligned_byte_mask(n) (~0xffUL << (BITS_PER_LONG - 8 - 8*(n)))
 #endif
 
-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
 #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
 #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
diff --git a/include/linux/bits.h b/include/linux/bits.h
index 7c0cf5031abe..f3cf8d5f2b55 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -6,6 +6,8 @@
 #include <vdso/bits.h>
 #include <asm/bitsperlong.h>
 
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
+
 #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
@@ -22,24 +24,37 @@
 #define GENMASK_INPUT_CHECK(h, l) \
 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
 		__is_constexpr((l) > (h)), (l) > (h), 0)))
+#define __GENMASK(t, h, l) \
+	(GENMASK_INPUT_CHECK(h, l) + \
+	 (((t)~0ULL - ((t)(1) << (l)) + 1) & \
+	 ((t)~0ULL >> (BITS_PER_TYPE(t) - 1 - (h)))))
 #else
 /*
- * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
- * disable the input check if that is the case.
+ * BUILD_BUG_ON_ZERO is not available in h files included from asm files.
+ * Similarly, assembler lacks for C types. So no parameters check in asm.
+ * It's users' responsibility to provide bitranges within a machine word
+ * boundaries.
  */
 #define GENMASK_INPUT_CHECK(h, l) 0
+#define __GENMASK(t, h, l) \
+	((~0 - (1 << (l)) + 1) & (~0 >> (BITS_PER_LONG - 1 - (h))))
 #endif
 
-#define __GENMASK(h, l) \
-	(((~UL(0)) - (UL(1) << (l)) + 1) & \
-	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
-#define GENMASK(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
-
-#define __GENMASK_ULL(h, l) \
-	(((~ULL(0)) - (ULL(1) << (l)) + 1) & \
-	 (~ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
-#define GENMASK_ULL(h, l) \
-	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
+/*
+ * Generate a mask for the specified type @t. Additional checks are made to
+ * guarantee the value returned fits in that type, relying on
+ * shift-count-overflow compiler check to detect incompatible arguments.
+ * For example, all these create build errors or warnings:
+ *
+ * - GENMASK(15, 20): wrong argument order
+ * - GENMASK(72, 15): doesn't fit unsigned long
+ * - GENMASK_U32(33, 15): doesn't fit in a u32
+ */
+#define GENMASK(h, l)		__GENMASK(unsigned long,  h, l)
+#define GENMASK_ULL(h, l)	__GENMASK(unsigned long long, h, l)
+#define GENMASK_U8(h, l)	__GENMASK(u8,  h, l)
+#define GENMASK_U16(h, l)	__GENMASK(u16, h, l)
+#define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
+#define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
 
 #endif	/* __LINUX_BITS_H */
-- 
2.40.1

