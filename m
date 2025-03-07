Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD03A563A2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97EB10EB19;
	Fri,  7 Mar 2025 09:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YNfXf49f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C64110EB19
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:22:19 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2ff04f36fd2so2941218a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741339339; x=1741944139; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XztObitingC3692I+pBVpdt55S8NywKGMFDoLFkCI1M=;
 b=YNfXf49fdSAQCsU1jlRrLveWWUHPhUhzV8ZlCA6mRS1yvzOI7uqQmGv1a8+ysNbzso
 aIPIDQJgbnkCVYe8rX0RBg2t1BDY0jmFd8374zRioY5ZKVsHEO+oiIpj5wPjo0rv5A3l
 ncaCkNGLshFqQHOTFCx3tGAtZKay0iga9mB4fuNS+GuisiYNMBPVSqJKgrRgLQOzuKSi
 1TZQq2dKGV9z/M0jztjUQ+aSJsJFuWWSqWvRQpBRq86I3cLN+EOyqATQhInSeUWrR06f
 WS4saCS+pPZvoABIiSiTipdQD++fVyKKrq09D+qXyCITQuQVtd0lipmwpI55OJ9lt36O
 1ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339339; x=1741944139;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XztObitingC3692I+pBVpdt55S8NywKGMFDoLFkCI1M=;
 b=aD/9L25z5a+lr+Fr1Sf+3ZHmAXmik0jSau+rn1mepnWlO+fUSO0mO9RdH4kjPEmPcJ
 eLdP+Zveqn2ed9vkQ9T/ITmCfo31Kba7Szj0i02EqXd3xqruud1Zzer6nOh6arD3r4LP
 hbVfeVTH7M62F2Z6uKYjPRQ0Kp5+IgoWfsa1++swLxx23h8lW72mSC/2k7X08yPWgntj
 ivLZs3g2pGw5TyrozgPikNGNmOYobYLgFQFmgRfcd3/EBvelYGeL0FV5TAKnJUh5i6Om
 5lmkrr5Ucwq+oa3k2e/DbIBqtpnyZt0HzF/fhJ0BcCVHqJmOgI0v5dIR5C6Jy/HntXDy
 6JGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWXj0QXUw7O5ZIVDCSZK1b62tmBJ3J1BKThgQsDcsN97wpvgWR36rqCNmWkKPayA2Kl3gIPlnr9V4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbDTAEuBl6BB+ORRRotDmG4MMPo8m13nJVzTkiDtEnTPbjGaR7
 fptIm4sXU28AqSsgD5RlvBLKyuqIeRpb1ajVtYY+aWKtaDMXMjK3
X-Gm-Gg: ASbGncvO63JmGtkVQwN8h9r8UyYgw9YzlSzX1YxY6vS1885sNH3cSqExedklCgcOmZ3
 PZikZYPOZw46IUINC/d14Gqfgd/XYfmCq9AhI6Ld5Ni4P536r/Nj9z5q5xqGqXDpRLO6Wmfbujx
 gH99ZsRINSujii0v+OCFltvnfkAYKDylnyKhGUdc4LRWpA9xA7U10deY51IleYJ0lCCU7j4sTIY
 lirK22tvMZ6XMPFrzaCKj4EA1nngCBskklIU81KLqJa7Fmd87oSV6+NfA9PETTXsjyfoXRe9f+A
 EkRCtm8VUoxdoxPtosWS3mhYcXo+vfiepqZbvKxMmzugYXQizwBzoUeq2sjngdbRZudpEqBS
X-Google-Smtp-Source: AGHT+IGO3Fg5mznURfAXFZCPAiOd6NJZ8MzxOEXeMR65d6OVc42NCiVYA5M/yoTVlsiOwEwCHpbcoQ==
X-Received: by 2002:a17:90b:3911:b0:2fa:1a23:c01d with SMTP id
 98e67ed59e1d1-2ff7ce8b5ffmr4029616a91.21.1741339339019; 
 Fri, 07 Mar 2025 01:22:19 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693e7fb5sm2876725a91.37.2025.03.07.01.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 01:22:18 -0800 (PST)
Date: Fri, 7 Mar 2025 17:22:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
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
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
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
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8q6wPWXImCeGI8P@visitorckw-System-Product-Name>
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

Hi Jiri,

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
> 
In the previous thread, David and Yury had different opinions regarding
the implementation details of the parity() macro. I am trying to find a
solution that satisfies most people while keeping it as simple as
possible.

I cannot point to any specific users who are particularly concerned
about efficiency, so personally, I am not really concerned about the
generated code either. However, I am not a fan of the #if gcc #else
approach, and Yury also mentioned that he does not like the >> 16 >> 16
hack. At the same time, David pointed out that GCC might generate
double-register math. Given these concerns, I leaned toward reverting
to the parityXX() approach.

If you still prefer using the parity() macro, we can revisit and
discuss its implementation details further.

> > Additionally, I changed parityXX() << y users to !!parityXX() << y
> > because, unlike C++, C does not guarantee that true casts to int as 1.
> 
> How comes? ANSI C99 exactly states:
> ===
> true
> which expands to the integer constant 1,
> ===
> 
I gave a more detailed response in my reply to Peter. If we can confirm
that casting bool to int will only result in 1 or 0, I will remove the
!! hack in the next version.

Regards,
Kuan-Wei

