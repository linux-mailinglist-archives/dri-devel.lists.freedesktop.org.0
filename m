Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595BBA82EBB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB24410E28E;
	Wed,  9 Apr 2025 18:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BCa5be8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EC810E28E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:31:02 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-af9925bbeb7so25369a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744223462; x=1744828262; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yWp8HcqQEiUK9VmrP5Fyuyk5glVIpEEzW3GEoFZN0j0=;
 b=BCa5be8eDkcO/GE8cvljcrXKhuIbzi6O5KhXNmgXxlhV8jxKabwzNJM6WEs0gIfz7C
 gxbJhhr3JGRUBzD5Ydnf5rPjiy6tDmnpWBge3iBjMh85crfaXN+qOcTlHmyOz4VpaQ6K
 Xyxje8AhQ9faLDkwpu4a+z9yk749abTALKJPP7Ozx0MQqiisojk5flcNkNcPPvQHPrle
 XokgkiV0aP4JZhnSUWL7vFPsVcKk11ewL9ULs/nohVbaWeOfhpoM+kit3IuQGAUtcvJz
 TI7ABhZUvBzkAI7+0InhxOBbCLajke+iuPEiwCS+hTN16nolS6N2Gm3xRM6dOZBeHNWW
 ro8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744223462; x=1744828262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWp8HcqQEiUK9VmrP5Fyuyk5glVIpEEzW3GEoFZN0j0=;
 b=prCGUFeNVFjL4IiHnsyHkzt2l1cP4VMAMoZuejsV72SHqepd3Vhm6qD5KV8W6J5Lo8
 kKcJfigsKZdiOzqGewgoLDSEAMjZoklexblHh0hBPZ1rUSKefWZ0V8JkfW/irT+wChb5
 s224rcC1e4/BAv23/KNcsPMOPPyg0eyCiYgmjNNXrAKUkHWJaQfXb8QBOn/XZvspujhd
 p00nxJIielbqUX80aUcYP5KAr6KbszojL/zS2FSwVTOjwld8WW70gmrqkbz6UxNITBZ6
 JcpYYLJG1WRMroGE3fZ7ErvZjma30Fy7uM9YSpRsZRISF+vEoR5891qlzoT/oKw1kaEU
 CCAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5+BPNA22GUQhTy2F+dJz9fceJV1btldVwGNMrMcCxjUDIiTZkUqqdfitlIo4diL4cPLnlgfZEJXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz8VUMrUaP7oTjfawglMWtzu0OVOXk3zM4mQ3VJh/H/d0h4P6P
 7/0TtLeBibIxdqMKchJUJMDHFgojnxGKDIgfmLyU2JqrXh0wIl7V
X-Gm-Gg: ASbGncucNfQaEvKNpSPVljvlONGuo8+U09ij0bf/wG0K2ZuZKvEpeuSLiMHd8Vo6ulE
 CCnhS3IXmKkUMRl/L1Dz2TDUPAK7wKtfSz312yjmOGPyBI1fg57IaGpFIIuUr9cH5anqNaj/ot/
 uw6INqfZ5rQpSVPMZ+MCcCaMg7afUqV9u30xeWL/wtzuLpnh/e+QlPOrU8tMllvdG5iCH9oeTTl
 jDOWWHuKmxLirWZ5Bcpifo9+fosl2NEof+d5PxjyWZQo1l5AnykMu84U6mzFUfbR1fiNGqA3lc/
 73bKcOTJAJW4ctLvQjB4K4UhxSzPpx3ypX02LDV13YGJZ/a04MDbGJGEgRY27rhSHfny
X-Google-Smtp-Source: AGHT+IEojffDEHS0j3whbiNP8KyNCEs3sfRNMc8qkUsRgVj5cXjPuj6Pe0BT8ErsKVVmpVlb9KZMXw==
X-Received: by 2002:a17:90b:548b:b0:2fe:a742:51b0 with SMTP id
 98e67ed59e1d1-306dd5789bbmr4467876a91.31.1744223461782; 
 Wed, 09 Apr 2025 11:31:01 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306eaec023asm436047a91.33.2025.04.09.11.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:31:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:30:50 +0800
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
Subject: Re: [PATCH v4 05/13] serial: max3100: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <Z/a82sdjEDaqE9v0@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-6-visitorckw@gmail.com>
 <Z_atODqZDkff5sjj@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_atODqZDkff5sjj@yury>
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

On Wed, Apr 09, 2025 at 01:24:08PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:48PM +0800, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  drivers/tty/serial/max3100.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> > index f2dd83692b2c..36ed41eef7b1 100644
> > --- a/drivers/tty/serial/max3100.c
> > +++ b/drivers/tty/serial/max3100.c
> > @@ -16,6 +16,7 @@
> >  /* 4 MAX3100s should be enough for everyone */
> >  #define MAX_MAX3100 4
> >  
> > +#include <linux/bitops.h>
> >  #include <linux/container_of.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > @@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
> >  	else
> >  		c &= 0xff;
> >  
> > -	parity = parity ^ (hweight8(c) & 1);
> > +	parity = parity ^ parity_odd(c);
> 
> This can be simplified for more unless I misunderstand something...
> 
I usually don't change the existing coding style since each subsystem
may have its own preferred style.  

But yeah, if this is the preferred way, I can make this change in the
next version.

Regards,
Kuan-Wei

> From: Yury Norov <yury.norov@gmail.com>
> Date:   Wed Apr 9 13:22:04 2025 -0400
> 
> serial: max3100: Replace open-coded parity
> 
> diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> index f2dd83692b2c..07d332b8e87d 100644
> --- a/drivers/tty/serial/max3100.c
> +++ b/drivers/tty/serial/max3100.c
> @@ -121,20 +121,12 @@ static DEFINE_MUTEX(max3100s_lock);		   /* race on probe */
>  
>  static int max3100_do_parity(struct max3100_port *s, u16 c)
>  {
> -	int parity;
> -
> -	if (s->parity & MAX3100_PARITY_ODD)
> -		parity = 1;
> -	else
> -		parity = 0;
> -
>  	if (s->parity & MAX3100_7BIT)
>  		c &= 0x7f;
>  	else
>  		c &= 0xff;
>  
> -	parity = parity ^ (hweight8(c) & 1);
> -	return parity;
> +	return s->parity & MAX3100_PARITY_ODD ? !parity(c) : parity(c);
>  }
>  
>  static int max3100_check_parity(struct max3100_port *s, u16 c)
