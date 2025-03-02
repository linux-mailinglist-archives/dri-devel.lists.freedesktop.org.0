Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB12A4B2B3
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 16:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E6B10E19F;
	Sun,  2 Mar 2025 15:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R7OZidjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5883B10E19F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 15:47:45 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6f754678c29so33301117b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740930464; x=1741535264; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CCT1sTVFptoP0GXpHD4z8aJ9CCOqcWh1+88rLPDB2Qo=;
 b=R7OZidjVqpIkGljfil50OjGKnV3lD1nN0WP0687kmbse/MNaVgwSryqO3OHEe0LZve
 EMgTdS3/QLpUZWjkG8qpeonvbNOn6TbUaWmpGQOrjI1huxyIr01MAunqPRHoHb5TWS49
 xOTIiAhzF1U20gLEpZBqQtzXGO2IfNqAsFnqRcM9hDbwQ3tETTvmYIyg82tZRB62tAi3
 i2LnXQ5rquaeT/xjIfZgWPKpRxL2f0HJBxwHZ/nChrk0XI54HmPBM3PYmWP054lAGkjT
 Evd4IbwgNe6yTUzPQtZ/xVwDT+aAuD8AXNHr2pzAgLgQ9lYD5xE5Hc8NP2u08i8bCUzK
 R4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740930464; x=1741535264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCT1sTVFptoP0GXpHD4z8aJ9CCOqcWh1+88rLPDB2Qo=;
 b=GzSLgII+tpfUwHAZh7t/zxnJDch15CSrei17cHlzuXlZIk1xXDfwwG+ZqEDHvDHqa2
 rp+r/s9P28s0/iVgHeVjLFgwxG+3pFg+2t0q2ZutzyXw992OMTHkhXk5eKZuvVa1hfNv
 XpDTxLGpziNdKGfM5rLCAmCO4Sb7I1igSk8Fb5MNSoNrTOdbpa39vOuA6jpdXMv2UxEF
 pJTBju9MiMsuf5AigQ//gKTH9p/HhGI9nvQSvQfqRERwBKwi1gwEFeUrpO+MvvK8LsET
 qkaE63mrjSyrOcCc55ekOKUsgnSCLNiQx40Df4y5I4uarQGvnzUg4ROB5YY48UbMclY5
 iwBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKtPAZbDY8gxZa/p3rvsg3sjeK2M0ozfOy5mgUmVjTfbAwAfiAmPqHfgTU1b9etXEilKzYzXBkoCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzShGbOj9dV3pnLd9h3YHLKW8kK+P1HL+lkb6Na631b2J549drY
 LGCyLcai7BYwdCpbjkay499eZNmswAOMH3bkdnL4rrs/1qnOL7mX
X-Gm-Gg: ASbGnctbPbHVffKR0m3GkHOR9XFf3WRoH2KeS3UP+hKUvF3ZcyaQZy+e6yzXYMhAsxY
 zOs5hETQpI1rzOTlcsjbgXBFBSAS0OtkuneWd5LRIln5jLtxN3n8wOcqk+0svFigChkiI2PNG9Q
 ZDAMDpcELlUB7xOl1VHBZPzT/cJKUifmhAvMORCsCfGebAbAGJLwbS07t+TriN/mZokUmulOIvE
 rV3K+mQs1aZlTtor1UX0NGByXyRsV5PUI4+9gYluySmN4tVlFuQCFKFt26kLett65ynkhKF2N7L
 7B7A08LXBlXbpCq0f4BqkoYH+YKCl2u+slKuIrpCFS6W/hPgnRUkbx4eMCExXvrap0p0JiInh+v
 32yxH
X-Google-Smtp-Source: AGHT+IEfQ39kTql5XsYDhHYJ6TV6j9haA6dlCxpju/Rqc4ygrtquBMosdzic0x4c9/qeMrvSjUoEBQ==
X-Received: by 2002:a05:690c:6301:b0:6fd:4485:9255 with SMTP id
 00721157ae682-6fd4a122c2amr115575717b3.24.1740930464153; 
 Sun, 02 Mar 2025 07:47:44 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fd3ca41e81sm16218887b3.29.2025.03.02.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 07:47:43 -0800 (PST)
Date: Sun, 2 Mar 2025 10:47:41 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
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
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z8R9nQmfeVvfDiOn@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad> <20250226222911.22cb0c18@pumpkin>
 <Z8CpaaHv0ahHFVuK@thinkpad> <20250227215741.1c2e382f@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227215741.1c2e382f@pumpkin>
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

On Thu, Feb 27, 2025 at 09:57:41PM +0000, David Laight wrote:
> > It's still unclear to me that this parity thing is used in hot paths.
> > If that holds, it's unclear that your hand-made version is better than
> > what's generated by GCC.
> 
> I wasn't seriously considering doing that optimisation.
> Perhaps just hoping is might make a compiler person think :-)

David, can you suggest only things you're seriously considered to do?
Random suggestions distract my contributors and make them doing unneeded
work and experiments.

In the other thread you asked I Hsin to try your approach to GENMASK()
macro, saying you're lazy. I don't think this is the right way to
communicate, not mentioning that if you're lazy to try your own
approach, it doesn't sound nice to ask someone else to try it.

Thanks for understanding,
Yury
