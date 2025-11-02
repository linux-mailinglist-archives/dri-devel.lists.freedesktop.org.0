Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF37C29357
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 18:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B3B10E1CC;
	Sun,  2 Nov 2025 17:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="kiczCTwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7A10E1CC
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 17:15:32 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d01Z91lrSz9tKX;
 Sun,  2 Nov 2025 18:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762103729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVIWxvbG6hS59cIjcOfk1tNz+O1dirw/jStQigJNNw8=;
 b=kiczCTwovFK3kcxFGIgvfX7t7jHPp/LysnFqW8CukOZyAt9lddGQ3LZjsRc5kBbNyeJQkE
 35C0ueF8JCz0yG3IyQpmCn0bFCzpCDOKrClYy+nRQlL/NOMItmREuCjsRRHaNFJJSm6UBW
 yyRGaOsuByxhyHLPHbPURhYEbLg9Y/Vtpx7ea27bu1uJ43EUn62mWBPFiTjIMSqzhTsXz9
 /PjwErrRPgda7/G2Dx93s5x9DRwJZkIM1aMbr6fn1xPpcKkZv7kE4/HcZGG/U/7BcCT/dB
 eQPnaZ5pkUV7XVbP4EL2CidnZ4JR0FZht6OIObCeXliM0b1y9wG0gZFoosE5ZA==
Message-ID: <30dc382c-6b26-4b2a-81ab-67ac5bbf7150@mailbox.org>
Date: Sun, 2 Nov 2025 17:41:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Ying Liu <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
 <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
 <AM7PR04MB7046685E946417FD795C810198F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <AM7PR04MB7046685E946417FD795C810198F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: b47hecses99gtkdixbqohop36pxjecdy
X-MBO-RS-ID: df5e035099bd363f9aa
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

On 10/18/25 8:09 AM, Ying Liu wrote:

Hello Liu,

>>> BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they
>> don't
>>> exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
>>> modes, this would impact how an OS implements a display driver a lot,
>> especially
>>> Blend mode and SidebySide mode.
>>
>> There is one thing which specifically concerns me about the DB, it seems
>> to be capable of blending two inputs from different security domains, is
>> that correct ?
> 
> For now, I know nothing more than the DT binding description here, i.e.,
> two inputs are combined to one output in four modes. And, DB cannot be
> bypassed IIUC.

I see.

>>> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
>>> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
>> It seems we currently do not use either clock or interrupts on either
>> domainblend or layerblend IPs, but maybe DB and LB are different and LB
>> really has no clock/interrupts ?
> 
> If you take a look at NXP downstream kernel, it uses
> domainblend{0,1}_shdload IRQs in CRTC driver and I believe that upstream
> driver should use them too.

Can you please tell me what exactly is this IRQ signalling ?

> DB and LB are different. DB is in Display Engine, while LB is in Pixel Engine.
> This pipeline sort of tells how LD and DB are connected: LB -> ED -> DB.
> 
> LB has no interrupts.  And since it processes pixels in Pixel Engine with AXI
> CLK and it can be configured via the AHB interface of DC with CFG CLK, I'd
> say it kind of inherits AXI CLK and CFG CLK from Pixel Engine and DC
> respectively.  See the diagram in fsl,imx8qxp-dc.yaml, you'll find those
> clocks.

Thank you for the clarification. And sorry for my late reply.

-- 
Best regards,
Marek Vasut
