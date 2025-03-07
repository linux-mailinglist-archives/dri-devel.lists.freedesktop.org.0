Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB6EA56CA7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB22B89C0D;
	Fri,  7 Mar 2025 15:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xrcl5q5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2A889C0D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 15:55:15 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e53ef7462b6so1744078276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 07:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741362914; x=1741967714; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=;
 b=Xrcl5q5IKkJ8iP3l6N2uOtUNgYHWoe8+SiQEjqUmYopCjJjIykMiCzHTNbl7Db8RMn
 EZGeHSWaX+kzW19/pXZcMl2/pT2HjtfmXoQH7Z+KYX59gwufKSB4ZXWWG0tSCgg7zZMX
 0UugZ/LbZ2TdJyCotlY+anYpacsJ+X2d945DGuFLr1W1NycCgM09JPKomYTrmdi1RjAR
 T91fFo0gWzB7Fta0AmxtGkLm1UqdG0dG5bk72hz1EzJlu5aUqrGU9rXbMLr8Rv6pcyXn
 6BeXxTDnIP84kiYZmdU60BHLOOXcqwKerPjJbGJsOCXBG9b7L3vpDkNbS8TaUKh7r0IU
 +s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741362914; x=1741967714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IySwQu8sBAq2SiiOusmnVT2gVfPlf25OMd3Kg55m+0M=;
 b=rMqV0lBxxij+e/UlLjyjd/nrcQbDd01IsDwqJXXXLKeZvSgvM8edv9HapNfu79aahC
 Wl8Hv5dMZI4hzO7l6PlcTh0u153qK5oTgNVEfx2avAsukIlFnSul5qfkW9o9oxwLaQnk
 pYYSJQqtWdyT5wNVIGYlF7WgM0YipbHNkqj+xIhtCqrjKA+GBNJTMwoM+8cqq/5SJm4S
 RG8qrL4f2vBDpOSSLAdz4Q7Af/nxAHxN12jGH42ko6IPhgluqIgaAO5FJ5BdZCYbLZCy
 ZnXbEMWm8aw7ARKdhHiDaijfLyEKmkKVpvikzkiSptdeQ753HEntCd7xQSjUf/jp6FUb
 155w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTpBfS16uEdf6anUvYtIqkBFWEikrXMD424EzmjPBIb24hksLf/mAhSqUEgx1Oiy3+Ctz+SZ7goQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsAJ4gtQzsa1cAsiKrdkhxUVL+WDFEr1QB91D2XCzb+vaHYDvu
 kgff/jNGovAiTNW4OvvbraYi6iQaY1VcT4xpsZjN0w4zms7H2jmW
X-Gm-Gg: ASbGnct6l9aN0I0xp3ekOwu8gKQa5lB5UmUY7mIFlTbvPnW6W2B77L4cThUyDDSEGiJ
 WAsO57FVD6ntFuCzhtmpYSK8cepocKfrwIdQhVHNFVjDL197TG2f7WKw4CotMFLwfY88UzcwHSd
 eIXYZq9R9+M7T0Bu6z/UlRMT0KtSS56RHBqweQDJ6iX0Kdsjf9Zx+R/O8uQuQiMOllPV5T04jUq
 3+j6Oa9cepvF23+XiSFNP7wZVM2orOwJNPsSM1OljModF0S8+zQAzsr1wdoV6wcxey5wYZF1dH/
 OUHCrZRX+MRuOcQAOMOm69SYK1jF1CMayjVgTYNYaN+p75gb1m+53cM7kwQfMbZDX8QFXb425rP
 PFbhV
X-Google-Smtp-Source: AGHT+IGXsVm03RpeRs7naE92Mk1v2+BdYsqkQh0ckjckzDu/bnevFLrinU7kQnO5Z9/M1SdGBh4guA==
X-Received: by 2002:a05:6902:2292:b0:e60:c79f:6f6c with SMTP id
 3f1490d57ef6-e635c0f80admr4791285276.8.1741362914172; 
 Fri, 07 Mar 2025 07:55:14 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e635e4c8f69sm386658276.42.2025.03.07.07.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 07:55:13 -0800 (PST)
Date: Fri, 7 Mar 2025 10:55:13 -0500
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
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8sW4c5LxV-ITdCi@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
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

On Fri, Mar 07, 2025 at 07:57:48AM +0100, Jiri Slaby wrote:
> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > Several parts of the kernel contain redundant implementations of parity
> > calculations for 16/32/64-bit values. Introduces generic
> > parity16/32/64() helpers in bitops.h, providing a standardized
> > and optimized implementation.
> > 
> > Subsequent patches refactor various kernel components to replace
> > open-coded parity calculations with the new helpers, reducing code
> > duplication and improving maintainability.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > In v3, I use parityXX() instead of the parity() macro since the
> > parity() macro may generate suboptimal code and requires special hacks
> > to make GCC happy. If anyone still prefers a single parity() macro,
> > please let me know.
> 
> What is suboptimal and where exactly it matters? Have you actually measured
> it?

I asked exactly this question at least 3 times, and have never
received perf tests or asm listings - nothing. I've never received
any comments from driver maintainers about how performance of the
parity() is important for them, as well.

With the absence of _any_ feedback, I'm not going to take this series,
of course, for the reason: overengineering.

With that said, the simplest way would be replacing parity8(u8) with
parity(u64) 'one size fits all' thing. I even made a one extra step,
suggesting a macro that would generate a better code for smaller types
with almost no extra maintenance burden. This is another acceptable
option to me.

Thanks,
Yury
