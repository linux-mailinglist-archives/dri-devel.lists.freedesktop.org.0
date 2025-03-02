Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6BA4B074
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 09:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5AD10E101;
	Sun,  2 Mar 2025 08:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ToqgfmkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2510E031
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 08:20:14 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fe848040b1so7273797a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 00:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740903613; x=1741508413; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hvRvdsHloY5BTybtl092nj/Kn8Sd866ni5GmAJ3o96M=;
 b=ToqgfmkJbE3JmWCN2CluCrSKkw4znlYgHe71lnJBECp6aG0X4ab7t3utVxHpO0OKQ2
 +0skeo9Vci3YthX+qY0WkelyAE9v6JScPrkSc4M+q6HdcIIygyxnYuwoiDU/BJ++G3hB
 sS+JK6sXlQqk6BwL5/SsidrGSpqDT2RX4BoML14Jh+JLr9ZTcjziLBZ6Jkn9htivkQBl
 +iAEhQCja+nA9owTcbim3ZraaLesYMU/qVRwOGn33ojSg6I+0wAf2T+2yc/DDmvrPxp8
 appgwzfUhQtfKd5IkFIO/vX9hkcxqOsKBji9DA7TpvQfH/bdnIVRFmR4boOgj23B/UR2
 wnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740903613; x=1741508413;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hvRvdsHloY5BTybtl092nj/Kn8Sd866ni5GmAJ3o96M=;
 b=nGgfzH7Vp4KATBVXH4NRTVSKMv9WDsyD1RwEpXZAedA9JJEm1Y0s40EB9yhmUJX57n
 5Rc6gLLzGQxR+PDuFjnDP0luWIVD+ce7lRonZ88cx/K05u7V4CJYhI2Wm1hoEBKli+Ej
 MZHIIeB4XDYiWHtRPDSaiVw0qiN3Wsf5g1+6fJhRaqyI7q2eQePhFXvN/8XmZPowKxvA
 +ojLKIfx3eJFcNLInimQtxQ8td6CPqsDfwGRDbscCLBiuVVK9m2LH2N7j36trTtj3ndz
 vA5g24wSotxIDJDsSlJYnh1PUeFH2kI5BH6t+OGvSCVYhmQqzd1uGcmap5d3E97+ikdJ
 nZCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsHC51JkFyXtY4RgGKR2+v5TsoRGu3rXDB95b3tfXUZMcereb+Z1FKE5ejh5zpsGoeU8A7ZaVLEIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPc6BKdy9quGNSJr3r6WgLpH0LhXmChcESp1orNBvzyJHvJOmn
 Tr8OAheQXx5vxVchlbi894z+Xawv6JyCqEMT265p1Cx1qej78cry
X-Gm-Gg: ASbGncsgQIWMcv4GZdI7l5FLgXw3x1ktmc3l6ZBeGSB4mbLBxX2tSAmFeT1XvAaXTMj
 LJ8yTP9PvRSza2gHorxY7/GXqXJdUR0vL+B3Q+9fJPd4gQ5sfuXirSM8lG0vRsqLEmclUAmM0I1
 3041eww77RJUsx8D0snkKhZqH9QR1u/huoKc32gl7b5t6RVkZAgTBiZuF23wBSnlazPA5cXx7Qd
 WAIkqiY5FVrgVsGJ31oQdksKz/T2abzBJUcCOstAWY/ndJn0ZCrwy0yw3tMHdmxA4BkbSg4G64x
 ylixtRP+Hx3FFJa29cBB6cTzTT9aSahyiUt3vKSXurLUhXuqtfKm4OQYLJEV5kihHRvsN9sx
X-Google-Smtp-Source: AGHT+IEhxHA+kpP3f6IyyP7qeoU3p0FUjq/2+GkVz3d5MRAoSIvjaHiRGY0TomgRz3SF6T/LAIMe2Q==
X-Received: by 2002:a17:90b:17d2:b0:2ee:aef4:2c5d with SMTP id
 98e67ed59e1d1-2febabdede3mr12777219a91.26.1740903613420; 
 Sun, 02 Mar 2025 00:20:13 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2235052a622sm58034965ad.231.2025.03.02.00.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 00:20:12 -0800 (PST)
Date: Sun, 2 Mar 2025 16:20:02 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8PMHLYHOkCZJpOh@thinkpad>
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

Hi Yury,

On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:
> On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:
> > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > __parityti2() as fallback functions in lib/parity.c. These functions
> > compute the parity of a given integer using a bitwise approach and are
> > marked with __weak, allowing architecture-specific implementations to
> > override them.
> > 
> > This patch serves as preparation for using __builtin_parity() by
> > ensuring a fallback mechanism is available when the compiler does not
> > inline the __builtin_parity().
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  lib/Makefile |  2 +-
> >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 49 insertions(+), 1 deletion(-)
> >  create mode 100644 lib/parity.c
> > 
> > diff --git a/lib/Makefile b/lib/Makefile
> > index 7bab71e59019..45affad85ee4 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> >  	 percpu-refcount.o rhashtable.o base64.o \
> >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > -	 generic-radix-tree.o bitmap-str.o
> > +	 generic-radix-tree.o bitmap-str.o parity.o
> >  obj-y += string_helpers.o
> >  obj-y += hexdump.o
> >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > diff --git a/lib/parity.c b/lib/parity.c
> > new file mode 100644
> > index 000000000000..a83ff8d96778
> > --- /dev/null
> > +++ b/lib/parity.c
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * lib/parity.c
> > + *
> > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > + *
> > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > + */
> > +
> > +#include <linux/export.h>
> > +#include <linux/kernel.h>
> > +
> > +/*
> > + * One explanation of this algorithm:
> > + * https://funloop.org/codex/problem/parity/README.html
> 
> I already asked you not to spread this link. Is there any reason to
> ignore it?
> 
In v2, this algorithm was removed from bitops.h, so I moved the link
here instead. I'm sorry if it seemed like I ignored your comment.

> > + */
> > +int __weak __paritysi2(u32 val);
> > +int __weak __paritysi2(u32 val)
> > +{
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> > +}
> > +EXPORT_SYMBOL(__paritysi2);
> > +
> > +int __weak __paritydi2(u64 val);
> > +int __weak __paritydi2(u64 val)
> > +{
> > +	val ^= val >> 32;
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> > +}
> > +EXPORT_SYMBOL(__paritydi2);
> > +
> > +int __weak __parityti2(u64 val);
> > +int __weak __parityti2(u64 val)
> > +{
> > +	val ^= val >> 32;
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> > +}
> > +EXPORT_SYMBOL(__parityti2);
> 
> OK, it seems I wasn't clear enough on the previous round, so I'll try
> to be very straightforward now.
> 
> To begin with, the difference between __parityti2 and __paritydi2 
> doesn't exist. I'm seriously. I put them side by side, and there's
> no difference at all.
> 
> Next, this all is clearly an overengineering. You bake all those weak,
> const and (ironically, missing) high-efficient arch implementations.
> But you show no evidence that:
>  - it improves on code generation,
>  - the drivers care about parity()'s performance, and
>  - show no perf tests at all.
> 
> So you end up with +185/-155 LOCs.
> 
> Those +30 lines add no new functionality. You copy-paste the same
> algorithm again and again in very core kernel files. This is a no-go
> for a nice consolidation series.
> 
> In the previous round reviewers gave you quite a few nice suggestions.
> H. Peter Anvin suggested to switch the function to return a boolean, I
> suggested to make it a macro and even sent you a patch, Jiri and David
> also spent their time trying to help you, and became ignored.
> 
> Nevertheless. NAK for the series. Whatever you end up, if it comes to
> v3, please make it simple, avoid code duplication and run checkpatch.
> 
In v1, I used the same approach as parity8() because I couldn't justify
the performance impact in a specific driver or subsystem. However,
multiple people commented on using __builtin_parity or an x86 assembly
implementation. I'm not ignoring their feedback-I want to address these
comments. Before submitting, I sent an email explaining my current
approach: using David's suggested method along with __builtin_parity,
but no one responded. So, I decided to submit v2 for discussion
instead.

To avoid mistakes in v3, I want to confirm the following changes before
sending it:

(a) Change the return type from int to bool.
(b) Avoid __builtin_parity and use the same approach as parity8().
(c) Implement parity16/32/64() as single-line inline functions that
    call the next smaller variant after xor.
(d) Add a parity() macro that selects the appropriate parityXX() based
    on type size.
(e) Update users to use this parity() macro.

However, (d) may require a patch affecting multiple subsystems at once
since some places that already include bitops.h have functions named
parity(), causing conflicts. Unless we decide not to add this macro in
the end.

As for checkpatch.pl warnings, they are mostly pre-existing coding
style issues in this series. I've kept them as-is, but if preferred,
I'm fine with fixing them.

If anything is incorrect or if there are concerns, please let me know.

Regards,
Kuan-Wei

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..47b7eca8d3b7 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,43 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }

+static inline bool parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+static inline bool parity32(u32 val)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+static inline bool parity64(u64 val)
+{
+	return parity32(val ^ (val >> 32));
+}
+
+#define parity(val)			\
+({					\
+	bool __ret;			\
+	switch (BITS_PER_TYPE(val)) {	\
+	case 64:			\
+		__ret = parity64(val);	\
+		break;			\
+	case 32:			\
+		__ret = parity32(val);	\
+		break;			\
+	case 16:			\
+		__ret = parity16(val);	\
+		break;			\
+	case 8:				\
+		__ret = parity8(val);	\
+		break;			\
+	default:			\
+		BUILD_BUG();		\
+	}				\
+	__ret;				\
+})
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word

