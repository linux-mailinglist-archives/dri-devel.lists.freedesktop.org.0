Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0DBA82D80
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98E510E093;
	Wed,  9 Apr 2025 17:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cckDfSKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0F10E093
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 17:24:12 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-af5085f7861so4526807a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744219452; x=1744824252; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xd6xaUI5nv9NKBM15KV37XOGcT5rm8Sii0IDXetnYDU=;
 b=cckDfSKLu2x3n5fLzcndfrLNKjYOD/n4PkGxSWWR8xm/ntPGMZBIWIm2bx6S2C5m3F
 ADdJwcnomwcP1FGIhsO0O0qhRHiZfaLH93X/Y/6T0nfLol0ZRGPBVghbg2hai2UvDJLk
 ChNlxM1UxBdoSWhQsCErQOUqARo7136IBtMh3RV6j8r1ghV3jQ9Fr8e9e+S9MnqUtAtW
 HsOMq1/maH+7JPJ7nclRVprxA4PoEsbyokra6ah0jO276hV6lfntalLvg8K3rLaQbXIe
 AkLz+gKrvaO+0uSi1blbP4wNjE7wGTVWZtmIBIIZabO7nHuL6YGWwk1nlVq/bfjY90SE
 zapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744219452; x=1744824252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xd6xaUI5nv9NKBM15KV37XOGcT5rm8Sii0IDXetnYDU=;
 b=mEJAOvFO4h+XDMxAKrKGmx7zQYbfJ0n6lIbPJTZ1DRNncXPTDBgsypP526Ws1lPLG6
 YlpRCvBcSTukZbNfj5naKcZnlh0J48xwFfK/6IPhXq9EFpSVwuq2rJa1T7rzbY5fEUrk
 ndmxZ1/Yo9OT5AoXnwMzvUynoD0dkvyqJrm/5hEnwww734Xz9VIDDGGachMoszCtregU
 ZsnxuOaDb1mv+0BLNov8Tq36YN8caDPF3jMVpBhTBa5hOOtF65L9VggUjL4ha3YoC/+H
 5rB0Mbx3A5Q2L6d+GKjEqESGkm3YiC/D9MUJRFqrXtvFFh2WHJxkxU3Azk+knphxhdxn
 9KJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ01L1265WprK0N55u3exDcJ6VukF2uTYEDv/iDmkNoUimsiKOdT9iBOP+c+KY4bTIdgXhOl5G5Zs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkmmsOPkdIMRoMD5CS6JREtL4/yx9Gwh3tW6W82ay46G6DUUBT
 Zf9LMWk7JP41vOOHsyx+Jwtejc+l+89328t1dnVP6AuExYyVQCgb
X-Gm-Gg: ASbGncvITT3toeJBDAxZwdqMKO6IKdYKhhGhdWDNxodFBV1vbN96xce8SuCYnUVKh8+
 pRFPFBgaQwNwFKvVMVzHu+uV09ql6SpcS2qEE6qyMU4gms50RYpgCfzOsriVunZxO1/42whAdCp
 sTFHXAXaejAr9CceJTZy6PiDgh+SIUwa2GGrLb6LxElEKQ2PVrw6FfCttj5pSWPpHXBwunyfao/
 yGVYeN6jSNb8nhnyQh+3tYdLNYv9tcPXDAQGS08Ub9OMztQm+h+Jo7PJ/9D09NdOIM9NB7kQPCN
 2ZkG9Bbxxq3pW3EWZYYIpPWZWFa8bNc9Ve8YCvUu
X-Google-Smtp-Source: AGHT+IELcovaPBJxMo6VlfeeTod3PlQVQYXafQRyaLUWNqmSnypRNDEVNTbdlgjgS5FV2ZA5ueCy6w==
X-Received: by 2002:a17:90b:6ce:b0:301:1d03:93cd with SMTP id
 98e67ed59e1d1-306dd556630mr5093919a91.24.1744219451960; 
 Wed, 09 Apr 2025 10:24:11 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd12b4d5sm2098089a91.25.2025.04.09.10.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 10:24:11 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:24:08 -0400
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
Subject: Re: [PATCH v4 05/13] serial: max3100: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <Z_atODqZDkff5sjj@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-6-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-6-visitorckw@gmail.com>
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

On Wed, Apr 09, 2025 at 11:43:48PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  drivers/tty/serial/max3100.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> index f2dd83692b2c..36ed41eef7b1 100644
> --- a/drivers/tty/serial/max3100.c
> +++ b/drivers/tty/serial/max3100.c
> @@ -16,6 +16,7 @@
>  /* 4 MAX3100s should be enough for everyone */
>  #define MAX_MAX3100 4
>  
> +#include <linux/bitops.h>
>  #include <linux/container_of.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
>  	else
>  		c &= 0xff;
>  
> -	parity = parity ^ (hweight8(c) & 1);
> +	parity = parity ^ parity_odd(c);

This can be simplified for more unless I misunderstand something...

From: Yury Norov <yury.norov@gmail.com>
Date:   Wed Apr 9 13:22:04 2025 -0400

serial: max3100: Replace open-coded parity

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..07d332b8e87d 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -121,20 +121,12 @@ static DEFINE_MUTEX(max3100s_lock);		   /* race on probe */
 
 static int max3100_do_parity(struct max3100_port *s, u16 c)
 {
-	int parity;
-
-	if (s->parity & MAX3100_PARITY_ODD)
-		parity = 1;
-	else
-		parity = 0;
-
 	if (s->parity & MAX3100_7BIT)
 		c &= 0x7f;
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
-	return parity;
+	return s->parity & MAX3100_PARITY_ODD ? !parity(c) : parity(c);
 }
 
 static int max3100_check_parity(struct max3100_port *s, u16 c)
