Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95400A486CA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E326110E040;
	Thu, 27 Feb 2025 17:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d9wNSUmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E6610E040
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:37:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2234e4b079cso23684245ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740677826; x=1741282626; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VUAFuA6WyxlqIwMao9P+DyP+C2TxjteBYJ1MyyDLQfw=;
 b=d9wNSUmURZ/zNEISyefDYi9+Uz3rjXHPepvnwmaEGYMbz56oMk5X2aSlblUvrCgi8i
 3+itDKBjsWGSFDcLoSZXSDb8MhFo8Wk7H5H8UAd3OZPl8CA85ZwMJKi7brpLriPlZ7xj
 cP5sjkxG4xVRyQz8QU+MmZDLEzd5zo0NobFdIagD4TSaNtF3wfkqD9uLbajV3qiCwUy9
 6row8zIc40/2nW4c1XDJj2TuBdgXjhBuUrTMfw8HggmgKOkomORPDdiA5izMa3wUNjl2
 /nN+O++GndEdIT/rndRex2wPx16sj37FuSZVZdlNIw6EqRugFcezYDP7aNGRO2RGuOxT
 I8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740677826; x=1741282626;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUAFuA6WyxlqIwMao9P+DyP+C2TxjteBYJ1MyyDLQfw=;
 b=C2v/YwnEM0Bm7rIw1gd+Rpd0sg8ohbcS8ZTKHpzHJLFkOgps4CdqPml7dA0sNkhA06
 G3GXISCXAsgTtND3wjqDupfIquY2LqRidxA/z2B+cWV0mCPwCvoyGLmX5NHShf5DrLKC
 QFnISuFujF2B7hGk3WlfJQOET0OlovhtAhjxLAtmWEZbfoAxB89fnrBhWKwduaHxJ6yc
 SNl5vII6o5rWlmxaWxcz3hLjryfaQUcWMGY4vqHbIncFfI9jTzJ4zSS5dcQ60n5sGfoD
 rvpVEPHSnQwVwlEky2vANfhjjpxInkUA02S88MtI0XJMUMAOGP8s0tbLagdNdYcpGBH4
 UqsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2PUSWjHdiWuyYdNPKCPhgniiPJT2SFlMmA3lCX+kF7Yv7x7CdUEGuDhC2xWKT/qRPBhLUQlQowQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5XamApp3XSGpLnE4sihiWG6xArXQOBbMqlDxRa8BkgY/R/nwe
 1neCz2cScVbz/gFiCuzmFpePYnji4fzboZsZaESs1ph2aSHmyR0O
X-Gm-Gg: ASbGncusGuZK/PIqcpB4CyvkzQEJjq2NZvWSJ52S1D3ZeqByhzjJHkAgETE9eQasyPX
 QvYp/IpDL/C5bnsomMxJkvkrpkXK1jjJlwaz99LGIavvwFQcp4sSI1B0bxyeXu/MpPjuWuOu46O
 gUfXLopzcTGRgUuhSF+/AWh7ZI40YJJyo9Fs1pxzQBpYunLn02mvQxhzBp7J752XfhKA/6jqVnG
 p+RRnifmQI9LDe4jdF1tRpmH77Pbs2XfikVqwWT3v1fgfLeg+wTKXA3Itx6elA6+kTwwHUp/xGQ
 8kAnXsY8gvKJAxpEehXgqIvR7Z/XaQ2aGayd0v5/wq/Z0wkZLQ==
X-Google-Smtp-Source: AGHT+IGK2yvXxMwGzFuS4qAPXT9dc4oLUeTze+y8wAtciDVfBiItiQouqHwlR4imml9fxjD4qYJfDg==
X-Received: by 2002:a05:6a20:9146:b0:1ee:d6da:b651 with SMTP id
 adf61e73a8af0-1f0fc993ffdmr22305716637.35.1740677825727; 
 Thu, 27 Feb 2025 09:37:05 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7de19d3fsm1745501a12.18.2025.02.27.09.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 09:37:05 -0800 (PST)
Date: Thu, 27 Feb 2025 12:37:02 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
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
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z8Civv0QaBzmFPTq@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
 <Z79ebv630yuNOJKV@thinkpad>
 <a8c29dec-6178-4f8f-80f5-aece636c410b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c29dec-6178-4f8f-80f5-aece636c410b@kernel.org>
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

On Thu, Feb 27, 2025 at 07:38:58AM +0100, Jiri Slaby wrote:
> On 26. 02. 25, 19:33, Yury Norov wrote:
> > > Not in cases where macros are inevitable. I mean, do we need parityXX() for
> > > XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?
> > 
> > The existing codebase has something like:
> > 
> >          int ret;
> > 
> >          ret = i3c_master_get_free_addr(m, last_addr + 1);
> >          ret |= parity8(ret) ? 0 : BIT(7)
> > 
> > So if we'll switch it to a macro like one above, it will become a
> > 32-bit parity. It wouldn't be an error because i3c_master_get_free_addr()
> > returns an u8 or -ENOMEM, and the error code is checked explicitly.
> > 
> > But if we decide to go with parity() only, some users will have to
> > call it like parity((u8)val) explicitly. Which is not bad actually.
> 
> That cast looks ugly -- we apparently need parityXX(). (In this particular
> case we could do parity8(last_addr), but I assume there are more cases like
> this.) Thanks for looking up the case for this.

This parity8() is used in just 2 drivers - i3c and hwmon/spd5118. The hwmon
driver looks good. I3C, yeah, makes this implied typecast, which is nasty
regardless.

This is the new code, and I think if we all agree that generic parity()
would be a better API, it's a good time to convert existing users now.

Thanks,
Yury
