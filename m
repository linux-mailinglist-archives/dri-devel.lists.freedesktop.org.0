Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99DDA4AEFF
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 04:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6D10E0AE;
	Sun,  2 Mar 2025 03:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jjmxG0QG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2CA10E0AE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 03:10:25 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6fd5a24a8d8so10823727b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 19:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740885024; x=1741489824; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4LbN5fYyUHQt3Ti89i5IrvWdlm9UYzm7rEomie5t+cc=;
 b=jjmxG0QGbxSKVGcnn9RrtM6lIRpQcCi0s0MetVD9IGKl2D1tsjik2NdT7AFCW5/Ni+
 +poG7L41NtBLewtdTWW/30CIgpGXRc7FIaJDe0WgD2xS/teaBHrzSbvdAzYsvgDfPuT/
 vFeRn9BaEYCKaOb3m6hCYgd0UVyGNEg3Nsopb1KW/4qLhsTtQWMPWUoma/yQfWMTOOnY
 nNlC2SX+arbBa6rPhI7E8ORZWxwvRn1DdD1sYSI38lgv0zT8bVg0NxhZGLKnaeG0+ivK
 WbQPkjjOXqqXmWudh6kKhEP/pP3IEc7G4V2gzDR2ixv8JWw9EZAJ2mpr2aari9G/uI5I
 hysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740885024; x=1741489824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LbN5fYyUHQt3Ti89i5IrvWdlm9UYzm7rEomie5t+cc=;
 b=eyUjaMkvmBePdXo4QZmUUGSYwnNSEAoFJ9tT4awF8J0QgW7JgL3jr82DygkzJn2BXO
 AzaZNCr2eEekRFEy9O4LcKVAMhrNNZ7XUKxweKRBuGJBbRfndnFlE7ibudYapRJOGaRb
 8KO1ela7h1G4YhsJcSZL79G7bapgvOkI/9Ye/UTdVAjkdo30Idgmrfr9YZ4EI39GE1I7
 umXLKwU+FxTXXQSUFbAfOmE3U4odgvEYTEcyp+PJz2NADYmMfUulcEzksBpgY1NA0d3s
 /69WrlgmW8ZsqpV0pSm8bT0L+piUYK9NDL48o2Msxddj6OaShF/giqt84SBe2pKi7LAV
 VnaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiZ2/UmJgwMpXlGBSCy7uv8/WW22FIJVhEPGUDFfSp+Xuf2NJ2bhYLWOZ3Js6Z8t6y7NUXh0TmG5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0KSpeoNlmYL1EHlNgTMAabMZQJim/26tafRnEMz7eZtluPlCK
 2JKaC6wkQd0FEP2R8gsf+x7XhN4vsgkdS3fcIHT38oA9s7p9Pa/c
X-Gm-Gg: ASbGnctMUzsRXCLMKDqs+r/2xK4odT8sCFc0cJFb6X0N/CnWmRdXFKYqm2BimY3bMu9
 hVGfoAahkcygNdyd7YaK2ETisMHDpPtgjsAyYIl9GfMfNuYxAxRku8SrwarULGutZAPMZOJlxnL
 Y3wo0CntN+lsx2ySchLpYjI2fWQhNzjF09ansePyytRCcjhjzazUSTmgn0YHAmwEELq/TJiEuuu
 4KH0Sxn2BdOiem63HV6IlbOWgr08jwU/wQBlFuvzk1eI6ICADXNnvayptiJ/aZdBouekEow99jt
 f7NC9QgvvtNCK8y3Fcf0dq1kT6bF3hHMNVaGgJjMQKANOtIHnmBFshhYzOXy1WaZt4HpKlaNGcm
 KPO8p
X-Google-Smtp-Source: AGHT+IEy03FjYEvkbsUi6/ttRTlOKe4T1PD9HCNrsgjQ3AH1f8i6gR4SnirQZ7DNyXo/QUPkw2L8/g==
X-Received: by 2002:a05:690c:4b12:b0:6fb:9450:b0c3 with SMTP id
 00721157ae682-6fd4a02b0d8mr124121857b3.19.1740885024067; 
 Sat, 01 Mar 2025 19:10:24 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fd3cb9dac4sm13986657b3.102.2025.03.01.19.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 19:10:22 -0800 (PST)
Date: Sat, 1 Mar 2025 22:10:20 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8PMHLYHOkCZJpOh@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301142409.2513835-2-visitorckw@gmail.com>
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

On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:
> Add generic C implementations of __paritysi2(), __paritydi2(), and
> __parityti2() as fallback functions in lib/parity.c. These functions
> compute the parity of a given integer using a bitwise approach and are
> marked with __weak, allowing architecture-specific implementations to
> override them.
> 
> This patch serves as preparation for using __builtin_parity() by
> ensuring a fallback mechanism is available when the compiler does not
> inline the __builtin_parity().
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  lib/Makefile |  2 +-
>  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 lib/parity.c
> 
> diff --git a/lib/Makefile b/lib/Makefile
> index 7bab71e59019..45affad85ee4 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
>  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
>  	 percpu-refcount.o rhashtable.o base64.o \
>  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> -	 generic-radix-tree.o bitmap-str.o
> +	 generic-radix-tree.o bitmap-str.o parity.o
>  obj-y += string_helpers.o
>  obj-y += hexdump.o
>  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> diff --git a/lib/parity.c b/lib/parity.c
> new file mode 100644
> index 000000000000..a83ff8d96778
> --- /dev/null
> +++ b/lib/parity.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * lib/parity.c
> + *
> + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> + *
> + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +
> +/*
> + * One explanation of this algorithm:
> + * https://funloop.org/codex/problem/parity/README.html

I already asked you not to spread this link. Is there any reason to
ignore it?

> + */
> +int __weak __paritysi2(u32 val);
> +int __weak __paritysi2(u32 val)
> +{
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +EXPORT_SYMBOL(__paritysi2);
> +
> +int __weak __paritydi2(u64 val);
> +int __weak __paritydi2(u64 val)
> +{
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +EXPORT_SYMBOL(__paritydi2);
> +
> +int __weak __parityti2(u64 val);
> +int __weak __parityti2(u64 val)
> +{
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +EXPORT_SYMBOL(__parityti2);

OK, it seems I wasn't clear enough on the previous round, so I'll try
to be very straightforward now.

To begin with, the difference between __parityti2 and __paritydi2 
doesn't exist. I'm seriously. I put them side by side, and there's
no difference at all.

Next, this all is clearly an overengineering. You bake all those weak,
const and (ironically, missing) high-efficient arch implementations.
But you show no evidence that:
 - it improves on code generation,
 - the drivers care about parity()'s performance, and
 - show no perf tests at all.

So you end up with +185/-155 LOCs.

Those +30 lines add no new functionality. You copy-paste the same
algorithm again and again in very core kernel files. This is a no-go
for a nice consolidation series.

In the previous round reviewers gave you quite a few nice suggestions.
H. Peter Anvin suggested to switch the function to return a boolean, I
suggested to make it a macro and even sent you a patch, Jiri and David
also spent their time trying to help you, and became ignored.

Nevertheless. NAK for the series. Whatever you end up, if it comes to
v3, please make it simple, avoid code duplication and run checkpatch.

Thanks,
Yury
