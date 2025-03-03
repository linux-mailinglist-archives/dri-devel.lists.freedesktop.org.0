Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD2A4C846
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCFB10E2A4;
	Mon,  3 Mar 2025 16:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Me655Nxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BC710E2A4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:54:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2239c066347so30745105ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 08:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741020880; x=1741625680; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=snQ/FfGFpVYJtbb054yayRa/GPJB9+XLRVNWjcRf72o=;
 b=Me655Nxlnf6gqlMQ7MPjpDoZb7ChjqaNXUQMVtopALyoMBLLHyDZt+nE4EpN+ygiB8
 6rD+rVbiLfavLgsrgfYAS9itpdDNbOFvpNcANMBp+YVI2TWtbXHoeG8Q82c+arsHrpKS
 yw+PYzLSqlmqRIDULk+fFJGb6oX2jPfIc4RNCAtty/PzzthoYu8SH/HE/T6v4EaH3sR9
 ZgxGy1AOjF0qYCaGsfKZwttPNKeubyAxUa8w43BaZbX9ADISofBEYZS502fn67hTBgG6
 Z3o9t5mzLZDOor21A3TbRpT4sOtA54di3+YL/n65CJRia4QolfS7LAC0WRoZ0Lme0+8E
 rpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741020880; x=1741625680;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=snQ/FfGFpVYJtbb054yayRa/GPJB9+XLRVNWjcRf72o=;
 b=lEm6VxKYQ3SLC7JMiqUuAK8qRSk87rpA35mU/hyTUjCQoN/d1zJ1xm4WRtML7Jzs/G
 iME63OQ7rJmTwfb1yOSgsTt4blLFKGrQLPag0KiWvHXNT91BYXx2bKHRVIeFLS+Tc+Qs
 /L361nuP+54xJFOeoDx+hKVfoP6PhH8iKbFVqBnV0wxtbBCbh01vMZxl/5t7QpQnRLR2
 IcPKdzR+hRSmN+fVPG1lz5L3JINebYk5LI3iD8xZkt5G5s0nkNw1VOy0WsGH5Po5AXI6
 aafXMgJNo2HnJZtcdg7xSpOTLmnCE6BbEXkqxu2ogifWS1wUsZ3uZ16aDivbh0RDOjhK
 0ojw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+VsrWPHJTekczkQfXXutYSYavHKnCNQpVpNC7bex+ddXKi65ZV7Q4bfF787eExoRp5WcCIMT2TB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCA9pZtH3v24AqSZColKKv+xIyjboTwizV05ym0MpaHA7Nsu34
 ZECiUu/QfrMBcMc99NgjoqzduvBkLWF/P099bCSvS5MFX+0X0XBj
X-Gm-Gg: ASbGncsL1wjoUrWNOhYmI8+ZHtqM0FukLYjBJNl87jTVDRGXsjWAQXFOquM2U30UyKW
 /5tZKFzxhU3BxrJvg2ZruS8DeN6YtJ6O+5ADlu/AFJPtRLMeX7Jn2Swz7iFkaVPLls/K/HCmkFC
 MS0B4/SU6JFygoMFdYkI2pazrNal8iPCcCVLe3mMp6gi7Fwgn5wlw7f/SmuYvE4uHimaR6MUTlr
 dkGoX+Bieafzbp7rUURClicEYeE7kwhu37Rd3vRhDsDesuegIyvrZvLMcQogjAriYycWacOAKN1
 cDqTTD1XztKh/vi5gLBmwTY68yzAx5mcH6T5hPlJTo78z1cSMTH02HRxFIXS/3KVbfCLZOlo
X-Google-Smtp-Source: AGHT+IERzXXFV1wY4JOTqL7FEPHOnAzKcBtkbh1MW/f1V7zUkt/V5lVcottzvfcf37UkL0y23/7mVg==
X-Received: by 2002:a17:902:fc8d:b0:223:44dc:3f36 with SMTP id
 d9443c01a7336-2236925eef4mr232091065ad.43.1741020880198; 
 Mon, 03 Mar 2025 08:54:40 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223504c59ecsm80088085ad.123.2025.03.03.08.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:54:39 -0800 (PST)
Date: Tue, 4 Mar 2025 00:54:30 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
 andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8XexgomsveMWK2U@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
 <Z8XOF2DMMRKqam6R@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XOF2DMMRKqam6R@thinkpad>
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

On Mon, Mar 03, 2025 at 10:43:28AM -0500, Yury Norov wrote:
> On Mon, Mar 03, 2025 at 10:47:20AM +0800, Kuan-Wei Chiu wrote:
> > > > #define parity(val)					\
> > > > ({							\
> > > > 	__auto_type __v = (val);			\
> > > > 	bool __ret;					\
> > > > 	switch (BITS_PER_TYPE(val)) {			\
> > > > 	case 64:					\
> > > > 		__v ^= __v >> 16 >> 16;			\
> > > > 		fallthrough;				\
> > > > 	case 32:					\
> > > > 		__v ^= __v >> 16;			\
> > > > 		fallthrough;				\
> > > > 	case 16:					\
> > > > 		__v ^= __v >> 8;			\
> > > > 		fallthrough;				\
> > > > 	case 8:						\
> > > > 		__v ^= __v >> 4;			\
> > > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > > 		break;					\
> > > > 	default:					\
> > > > 		BUILD_BUG();				\
> > > > 	}						\
> > > > 	__ret;						\
> > > > })
> > > 
> > > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > > And gcc is doing 64bit double-register maths all the way down.
> > > 
> > > That is fixed by changing the top of the define to
> > > #define parity(val)					\
> > > ({							\
> > > 	unsigned int __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= val >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 
> > > But it's need changing to only expand 'val' once.
> > > Perhaps:
> > > 	auto_type _val = (val);
> > > 	u32 __ret = val;
> > > and (mostly) s/__v/__ret/g
> > >
> > I'm happy to make this change, though I'm a bit confused about how much
> > we care about the code generated by gcc. So this is the macro expected
> > in v3:
> 
> We do care about code generated by any compiler. But we don't spread
> hacks here and there just to make GCC happy. This is entirely broken
> strategy. Things should work the other way: compiler people should
> collect real-life examples and learn from them.
> 
> I'm not happy even with this 'v >> 16 >> 16' hack, I just think that
> disabling Wshift-count-overflow is the worse option. Hacking the macro
> to optimize parity64() on 32-bit arch case doesn't worth it entirely.
> 
> In your patchset, you have only 3 drivers using parity64(). For each
> of them, please in the commit message refer that calling generic
> parity() with 64-bit argument may lead to sub-optimal code generation
> with a certain compiler against 32-bit arches. If you'll get a
> feedback that it's a real problem for somebody, we'll think about
> mitigating it. 
>
How about reconsidering using parity8/16/32/64() instead of adding a
parity() macro? They allow compiler to generate correct code without
any hacks, and each implementation is simple and just one line. Jiri
also agreed in the previous thread that we need parity8() in cases like
the i3c driver. I think this might be the easiest solution to satisfy
most people?

Regards,
Kuan-Wei
