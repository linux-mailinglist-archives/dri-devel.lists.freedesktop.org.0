Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A3DBDB77C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 23:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FE310E244;
	Tue, 14 Oct 2025 21:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="grqoShQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BFE10E244
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 21:55:07 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmSgX0LS2z9scN;
 Tue, 14 Oct 2025 23:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760478904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qsCHmQm23GPn/cG59MJ4JfonH9UflykkMpsA/9h5+U=;
 b=grqoShQbarkUu+JNCjKd1ngaaduN1W8QkyWxCFT21XmmD0en2MOwzWmQOlZJgMa/tOnsE2
 CQRTMCBcMnrOWlKjn6Syi00F/DGLRTvYex0Jl8ajknpA13RMSY215A1L8dti8YHy0l8f1M
 HaHPHcpbhfU+XhQFIoVKKgnjl/NNoEKk0Yyg9SEfKz6NnLZkR8oVEnrtiDpC85h+A1qEdM
 5ybQyhqL03hRsAwR/xfCHo0SpgXgwebhe7RcYwKxHzrcgPPu5HFWhaD6OhYRxU1B4an47p
 fIGjqUQ2bBAwRetsNh+/bv0jkfI/AMbDmCLzyD27tytEt31e4jW1iRUg9cZZIQ==
Message-ID: <2c4a42eb-8c49-4ba3-baa3-921ec52f730d@mailbox.org>
Date: Tue, 14 Oct 2025 23:55:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <174ec43e-4cac-4452-a77b-e2e3b8413d05@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 5nog4wp8xydqygcq8su1oi7hrnzmbrpa
X-MBO-RS-ID: fa85b4e7819b77388bb
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

On 10/14/25 10:51 AM, Liu Ying wrote:
> Hi Marek,

Hi,

> On 10/11/2025, Marek Vasut wrote:
>> This large series adds support for the i.MX95 display pipeline, including
>> DPU, DSI and LVDS support. Most of the components extend existin drivers,
>> DPU is added into DC driver, DSI into iMX93 DSI driver, LVDS into iMX8MP
>> LDB. Pixel link and pixel interleaver drivers are reworked to work as two
>> independent channels, since there seems to be no dependency between their
>> two channels. The i.MX95 DTSI changes are also included.
>>
>> Since the DPU chapter is missing from the i.MX95 RM, this is based on the
>> NXP downstream kernel fork code and there might be issues.
>>
>> Majority of this series are DPU patches on top of the DC driver, I tried
>> to keep them separate and easy to review. Later part adds LVDS and DSI
>> support, this can be split into separate series.
> 
> Like you said that this patch series is large, please split it.
> Also, make sure proper maintainers are in TO or CC lists for each patch(b4
> tool should do that automatically for you), e.g., patch 37 should be sent
> to Thomas Gleixner <tglx@linutronix.de> according to MAINTAINERS.

I had to trim down the CC list for this series, it was enormous.

I wanted to put this whole thing on the list first, before I start 
splitting it up.

For starters, I think I can send these separately:

- drm/imx: dc: Use bulk clock
- drm/imx: dc: Rework dc_subdev_get_id() to drop ARRAY_SIZE() use
- drm/imx: dc: Rename i.MX8QXP specific Link IDs
- drm/imx: Add more RGB swizzling options
- dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX95 support

Then in second round, probably all these clean ups:

- drm/imx: dc: *: Pass struct dc_*_subdev_match_data via OF match data

And then rest afterward.

What do you think ?

-- 
Best regards,
Marek Vasut
