Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F66A82CFD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 18:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A281110E1A5;
	Wed,  9 Apr 2025 16:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hsw6SyKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2110010E1A5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 16:59:18 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-af50f56b862so4949280a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744217957; x=1744822757; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UF0piylxy01Y9o78lp9CSclPliCcrf/Gy/Xprs9X0Fc=;
 b=hsw6SyKtHBrTsPZLGp/oE1XtXMQLdpp4FsXVrNjQJe1cE8hjgTz8BKVwC/GQZhP7mK
 oXUPeRUhzjz75e6N5E2Suyt0vH6njEBeDDtTxuv1sSAMLBnan3bycEYxx8lIUUQlfq52
 EmXft9AU7PjkaD3koGxcSSUrlcYApafIq3vxvvnhW/bqN0QAP5xw/Nq1dHUVL+252zzV
 +H29qUo/lZPTkgmPFb0DfWUl7+UHKw5bpsiH8V+EUb84ttHH3/1To7CeS/lL5ffB3Ago
 bXAPgkKotzTiA91Q7zirhzqUqmvJXvxVTqh8KEbdwvS+tABMjGXTzb9NxcCZ34ColH/7
 1JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744217957; x=1744822757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UF0piylxy01Y9o78lp9CSclPliCcrf/Gy/Xprs9X0Fc=;
 b=hc74b0LzoH2w0VYxbsVUAH6tZBwFfgYy2TPnpDwPDSzLGI0bm76QFDQOk1MYvBzlbw
 HbhaWBxmZFFF3nl6k5E1f001gbIYITb+H0WSFOEDDx5yj4lC4oqKTTXTPgRBr+fi5t+3
 9rvjvJFyrK/3lRYNCkgW+p7rg1QcbIF2fXzRGP1X8CFW675i+4gAugf1nxmMOcTQ2AFW
 aMCKi3yLhg0XKxirlB46uIkpueKJmsYwBQVhBQwqn7Uw2on08jRT1qqrDUsKtCpJKIU6
 MKBkTnr6Xo1glw6Nve7h/5dFZ1rXZh7arJ0XWVHL0f8CyNkkxAgHoMjYrZal33gmFyND
 e7Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTIL0TNuKjztauYiFgeBjh8yNeimaeYkZqEdq+SNURQzvostR4eJharuMSIPKQx5I2lRShBsP8izY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+YpQiiMygkeq6U5ktbZyTS3RPe8DPoCuYQ6wKEoaOOCpd3skh
 7FJD9Sh1iQdrKp7R/xOABcnIYoQjKLVlCLz5U4T/aVHS8WlkOhD0
X-Gm-Gg: ASbGncvE5yK/BFNVqNSQd3QefTJ79Wf9rZ3c3JsJ6H++NA5g5ePBUnJagPkJ76s5Wyu
 I5enT9UUOdnlG/krbJVQmsfB3zGyBUNTxOaLP55ZnUHrAQnp/Pgb3xVdsvXcDT6M7cLSftYfzoV
 Kwsn0BlaGhwfHImslT6WX2nI7CxFEqsvpwyuMvMoK6pJj9nBaAarBUJ8lBiOapFC5LudmHvx8+o
 5YlQA0jmzHxmPRrKRInmQ3AfHvy7K8iAraxModyu7Aa0GXPju1FHeRXYbo+se9yLV3cruDEHWik
 ljsyHTqrgZnod2Tu8JIef0fWTSdXtUxZDyygEELR
X-Google-Smtp-Source: AGHT+IE+ebVDkjWM2U+vTuxOaEi2gePK7lA6ZcliczZ6QreHuVJL0X/7gkTIx9gAEQ4c3jyrVxUT+Q==
X-Received: by 2002:a05:6a21:9211:b0:1f5:7710:fd18 with SMTP id
 adf61e73a8af0-2015aeca12bmr4752416637.17.1744217957454; 
 Wed, 09 Apr 2025 09:59:17 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a11d298esm1284868a12.34.2025.04.09.09.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:59:16 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:59:14 -0400
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
Message-ID: <Z_anYpZw_E8ehN21@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-2-visitorckw@gmail.com>
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

On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
> Redesign the parity8() helper as parity_odd(), changing its input type
> from u8 to u64 to support broader use cases and its return type from
> int to bool to clearly reflect the function's binary output. The
> function now returns true for odd parity and false for even parity,
> making its behavior more intuitive based on the name.
> 
> Also mark the function with __attribute_const__ to enable better
> compiler optimization, as the result depends solely on its input and
> has no side effects.
> 
> While more efficient implementations may exist, further optimization is
> postponed until a use case in performance-critical paths arises.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  arch/x86/kernel/bootflag.c               |  4 ++--
>  drivers/hwmon/spd5118.c                  |  2 +-
>  drivers/i3c/master/dw-i3c-master.c       |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c     |  2 +-
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
>  include/linux/bitops.h                   | 19 ++++++++++++-------
>  6 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> index 73274d76ce16..86aae4b2bfd5 100644
> --- a/arch/x86/kernel/bootflag.c
> +++ b/arch/x86/kernel/bootflag.c
> @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
>  	unsigned long flags;
>  
>  	if (sbf_port != -1) {
> -		if (!parity8(v))
> +		if (!parity_odd(v))
>  			v ^= SBF_PARITY;
>  
>  		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
> @@ -57,7 +57,7 @@ static bool __init sbf_value_valid(u8 v)
>  {
>  	if (v & SBF_RESERVED)		/* Reserved bits */
>  		return false;
> -	if (!parity8(v))
> +	if (!parity_odd(v))
>  		return false;
>  
>  	return true;
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 358152868d96..15761f2ca4e9 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -298,7 +298,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
>   */
>  static bool spd5118_vendor_valid(u8 bank, u8 id)
>  {
> -	if (parity8(bank) == 0 || parity8(id) == 0)
> +	if (!parity_odd(bank) || !parity_odd(id))
>  		return false;
>  
>  	id &= 0x7f;
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c15..dc61d87fcd94 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -867,7 +867,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		master->devs[pos].addr = ret;
>  		last_addr = ret;
>  
> -		ret |= parity8(ret) ? 0 : BIT(7);
> +		ret |= parity_odd(ret) ? 0 : BIT(7);
>  
>  		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
>  		       master->regs +
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index fd3752cea654..df14f978a388 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -889,7 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
>  	ret |= (addr & GENMASK(9, 7)) << 6;
>  
>  	/* RR0[0] = ~XOR(addr[6:0]) */
> -	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
> +	ret |= parity_odd(addr & 0x7f) ? 0 : BIT(0);
>  
>  	return ret;
>  }
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 85c4916972e4..d692a299607d 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -114,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
>  	dat_w0 = dat_w0_read(dat_idx);
>  	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
>  	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> -		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
> +		  (parity_odd(address) ? 0 : DAT_0_DYNADDR_PARITY);
>  	dat_w0_write(dat_idx, dat_w0);
>  }
>  
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..7c4c8afccef1 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -230,35 +230,40 @@ static inline int get_count_order_long(unsigned long l)
>  }
>  
>  /**
> - * parity8 - get the parity of an u8 value
> - * @value: the value to be examined
> + * parity_odd - get the parity of an u64 value
> + * @val: the value to be examined
>   *
> - * Determine the parity of the u8 argument.
> + * Determine the parity of the u64 argument.
>   *
>   * Returns:
> - * 0 for even parity, 1 for odd parity
> + * false for even parity, true for odd parity
>   *
>   * Note: This function informs you about the current parity. Example to bail
>   * out when parity is odd:
>   *
> - *	if (parity8(val) == 1)
> + *	if (parity_odd(val))
>   *		return -EBADMSG;
>   *
>   * If you need to calculate a parity bit, you need to draw the conclusion from
>   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
>   *
> - *	if (parity8(val) == 0)
> + *	if (!parity_odd(val))
>   *		val ^= BIT(7);
>   */
> -static inline int parity8(u8 val)
> +#ifndef parity_odd

Please don't add this guard. We've got no any arch implementations
so far, and this is a dead code. Those adding arch code will also
add the ifdefery.

> +static inline __attribute_const__ bool parity_odd(u64 val)
>  {
>  	/*
>  	 * One explanation of this algorithm:
>  	 * https://funloop.org/codex/problem/parity/README.html
>  	 */
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
>  	val ^= val >> 4;
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
> +#endif
>  
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
> -- 
> 2.34.1
