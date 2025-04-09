Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308EA82EA1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802AD10E725;
	Wed,  9 Apr 2025 18:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TzXHPknv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2C810E725
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:26:10 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2295d78b45cso97198745ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744223170; x=1744827970; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R1ALuPxklMKuCrsJA1BlLBcVNfra0g2589L/7At2Du0=;
 b=TzXHPknvtNNgFyRyCe7TutMde9V762Rw63jzJnXCgXfy38bGo9G8EF/FJehzCl4jMv
 Hhi5n7Z4q4ayocefiif3PEnELTHVOu21jg/FRhj3dUnHgY+ewyP0gOzOljsXCtsA2cmA
 CZWAR/TB4k444C6xZRZSnEfhoKkCSTtm5B7xrD1dR9YOUdBElNWdX3iTlnhs0Ai4rjki
 uCMErcqZKS25ZFmTF1DONpjc8NR5tKsdPprr1/+2YuWMaflaB7/ghmY10VlzKidde9iE
 KrsRFXA8yRjA9PcH4xeHWOZPfuEzcam5jqIho18oiuE3SHKButDbVj3h3frCH6p6JwZt
 Silw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744223170; x=1744827970;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1ALuPxklMKuCrsJA1BlLBcVNfra0g2589L/7At2Du0=;
 b=byubm1Esczjm2SG/PJN63jvCcIm2kYtvO6I4RJv9ihcVERJO+a5kjRjbNVpMbulM+5
 yJxujJYs8XYZe12Voq3hJRaVZgA9k1NuyuflXECyRuWKn0Fm1pPdNKL+NwDIvNQnHt/p
 XMBgNoSbscCt1FqpDriB8B1caeP4zmZslZGlr6ky0hPlEvaOrt7AE7hsh1TSwmc0RhES
 xhs/V97BKlFwUh8w06JL3o4IAVjUmmq0e10DYPUQxAf0kDC0nMgO9qrEzDMR1L7dCIy6
 MnTpyBJwfuDKoR8cPr7ORvCCPp6LL0mnG3Wy9XadN+EWMgGhWlM4AxCKo2tVv9mUtTnx
 WwKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrv7qAxXFvSa4T6FhIr96AyYdtGgUxd7BikZnjF4BNFKMkdwRx31S2KJWRzaEeSCBKP552el3aOV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGX8FEtuVgUlVfD4kXfQlios/SZkNrsMdP2CwWEVTtKRx9L8rU
 cSZvpD4qeu6s7x51iHOvULzmO36x2UOhod7A53VoYxVLvZRXhRRd
X-Gm-Gg: ASbGncvrGsZhR+BJHWVfw8g+AmiNVdyjjCHbVY9ZODjhzydKO7OeDoBoygn5LOcqWZJ
 ZhzTrN13ACv12jglAOWaZdKqKi/LApUwkFHvhyevcbut17u88O9T4e0gJuKkYgGCc4gCc3yWDVT
 W3BbYOqm84Mb8OzJitNgJRgHM7rVM1oaKc2z3typMrczgw8qd/bRWXnqJVC1NX3kICQc7lHXf59
 RpClZEVmaup9GfRXk+tUlVVBt6GyWzBmmkXlwaDMV871ayDBdj/jC2uJKKZq1TG7KqOjuShkFw4
 c5y0Atcl9bf4Yntp6yDHWbb2v9k8jvJLA/0UXXsiHoAScVzJjHRDlhkmEAiFf2+hHxZG
X-Google-Smtp-Source: AGHT+IHxr1Oj9fnHqk53IrCpefkxN1EZlxBB9xX9PT7N6JSO9pAzGlE3xPUsehJPiW2WyRgXiugOJQ==
X-Received: by 2002:a17:90b:2dca:b0:2ff:53a4:74f0 with SMTP id
 98e67ed59e1d1-306dd56a24cmr4495494a91.29.1744223170249; 
 Wed, 09 Apr 2025 11:26:10 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306df08f71dsm1819399a91.23.2025.04.09.11.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:26:09 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:25:59 +0800
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
 jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
Message-ID: <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com>
 <Z_anYpZw_E8ehN21@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_anYpZw_E8ehN21@yury>
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

On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
> > Redesign the parity8() helper as parity_odd(), changing its input type
> > from u8 to u64 to support broader use cases and its return type from
> > int to bool to clearly reflect the function's binary output. The
> > function now returns true for odd parity and false for even parity,
> > making its behavior more intuitive based on the name.
> > 
> > Also mark the function with __attribute_const__ to enable better
> > compiler optimization, as the result depends solely on its input and
> > has no side effects.
> > 
> > While more efficient implementations may exist, further optimization is
> > postponed until a use case in performance-critical paths arises.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  arch/x86/kernel/bootflag.c               |  4 ++--
> >  drivers/hwmon/spd5118.c                  |  2 +-
> >  drivers/i3c/master/dw-i3c-master.c       |  2 +-
> >  drivers/i3c/master/i3c-master-cdns.c     |  2 +-
> >  drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
> >  include/linux/bitops.h                   | 19 ++++++++++++-------
> >  6 files changed, 18 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> > index 73274d76ce16..86aae4b2bfd5 100644
> > --- a/arch/x86/kernel/bootflag.c
> > +++ b/arch/x86/kernel/bootflag.c
> > @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
> >  	unsigned long flags;
> >  
> >  	if (sbf_port != -1) {
> > -		if (!parity8(v))
> > +		if (!parity_odd(v))
> >  			v ^= SBF_PARITY;
> >  
> >  		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
> > @@ -57,7 +57,7 @@ static bool __init sbf_value_valid(u8 v)
> >  {
> >  	if (v & SBF_RESERVED)		/* Reserved bits */
> >  		return false;
> > -	if (!parity8(v))
> > +	if (!parity_odd(v))
> >  		return false;
> >  
> >  	return true;
> > diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> > index 358152868d96..15761f2ca4e9 100644
> > --- a/drivers/hwmon/spd5118.c
> > +++ b/drivers/hwmon/spd5118.c
> > @@ -298,7 +298,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
> >   */
> >  static bool spd5118_vendor_valid(u8 bank, u8 id)
> >  {
> > -	if (parity8(bank) == 0 || parity8(id) == 0)
> > +	if (!parity_odd(bank) || !parity_odd(id))
> >  		return false;
> >  
> >  	id &= 0x7f;
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index 611c22b72c15..dc61d87fcd94 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
> > @@ -867,7 +867,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
> >  		master->devs[pos].addr = ret;
> >  		last_addr = ret;
> >  
> > -		ret |= parity8(ret) ? 0 : BIT(7);
> > +		ret |= parity_odd(ret) ? 0 : BIT(7);
> >  
> >  		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
> >  		       master->regs +
> > diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> > index fd3752cea654..df14f978a388 100644
> > --- a/drivers/i3c/master/i3c-master-cdns.c
> > +++ b/drivers/i3c/master/i3c-master-cdns.c
> > @@ -889,7 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
> >  	ret |= (addr & GENMASK(9, 7)) << 6;
> >  
> >  	/* RR0[0] = ~XOR(addr[6:0]) */
> > -	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
> > +	ret |= parity_odd(addr & 0x7f) ? 0 : BIT(0);
> >  
> >  	return ret;
> >  }
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> > index 85c4916972e4..d692a299607d 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> > @@ -114,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
> >  	dat_w0 = dat_w0_read(dat_idx);
> >  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
> >  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> > -		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
> > +		  (parity_odd(address) ? 0 : DAT_0_DYNADDR_PARITY);
> >  	dat_w0_write(dat_idx, dat_w0);
> >  }
> >  
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f..7c4c8afccef1 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -230,35 +230,40 @@ static inline int get_count_order_long(unsigned long l)
> >  }
> >  
> >  /**
> > - * parity8 - get the parity of an u8 value
> > - * @value: the value to be examined
> > + * parity_odd - get the parity of an u64 value
> > + * @val: the value to be examined
> >   *
> > - * Determine the parity of the u8 argument.
> > + * Determine the parity of the u64 argument.
> >   *
> >   * Returns:
> > - * 0 for even parity, 1 for odd parity
> > + * false for even parity, true for odd parity
> >   *
> >   * Note: This function informs you about the current parity. Example to bail
> >   * out when parity is odd:
> >   *
> > - *	if (parity8(val) == 1)
> > + *	if (parity_odd(val))
> >   *		return -EBADMSG;
> >   *
> >   * If you need to calculate a parity bit, you need to draw the conclusion from
> >   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> >   *
> > - *	if (parity8(val) == 0)
> > + *	if (!parity_odd(val))
> >   *		val ^= BIT(7);
> >   */
> > -static inline int parity8(u8 val)
> > +#ifndef parity_odd
> 
> Please don't add this guard. We've got no any arch implementations
> so far, and this is a dead code. Those adding arch code will also
> add the ifdefery.
>
Ack.
Will do in next version.

Regards,
Kuan-Wei

> > +static inline __attribute_const__ bool parity_odd(u64 val)
> >  {
> >  	/*
> >  	 * One explanation of this algorithm:
> >  	 * https://funloop.org/codex/problem/parity/README.html
> >  	 */
> > +	val ^= val >> 32;
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> >  	val ^= val >> 4;
> >  	return (0x6996 >> (val & 0xf)) & 1;
> >  }
> > +#endif
> >  
> >  /**
> >   * __ffs64 - find first set bit in a 64 bit word
> > -- 
> > 2.34.1
