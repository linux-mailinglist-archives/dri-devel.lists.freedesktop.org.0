Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C4BEAE27
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A995D10EC9F;
	Fri, 17 Oct 2025 16:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="VzJzrDRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8804410EC9E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:16 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9nY4kYTz9t0n;
 Fri, 17 Oct 2025 18:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k+vA4VA3wcmg6yTImrxLCggMqdpiPLMzpNBuNEaeZ7I=;
 b=VzJzrDRZkioCyWM9BTCDR/H+WlVp/vuSwErX3QlP53vW+pcPv1ngnvKDufQRqOrCS+bGKP
 dcOxAWGAcpEeb7twE8JxHQTpeJne8uX0Snb3jtzoTO9FngTUjgIpxZJ56Uj6HRL04QWMFP
 TPhIj2CWfzeJdoPHO1yjpphm41zMf2BFTUds9NZDCkaDTAgz2AAZ/ATdKpfiDEEPKsAZr/
 xYfLuuBy9bB18Oyvd4EDXc+S7rd+DT5S1McuAXHJdMgnyp5nGuddSR9stu7/6tsacRHfvX
 MA1nBX6svQ13G0q/TGeJkt9tArCx2jmSRMqg/o6CoNcIreyc7BxRWFW7NWV7Iw==
Message-ID: <14e7e6e2-c4d8-4d8f-bfdf-81d78c4a4a9f@mailbox.org>
Date: Fri, 17 Oct 2025 17:49:40 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 31/39] dt-bindings: clock: Split support for i.MX95 LVDS
 CSR
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-32-marek.vasut@mailbox.org>
 <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b1cbc6cd40a0cc186ef
X-MBO-RS-META: fxhqboiagin4cddoh4t8gtmp8shoygpn
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

On 10/13/25 9:17 PM, Frank Li wrote:

Hello Frank,

[...]

>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
> 
> Is it standard phy interface? need phy-cells

It is drivers/gpu/drm/bridge/fsl-ldb.c .

It is LVDS PHY, but modeled as a bridge driver.

The rest is fixed, thanks !
