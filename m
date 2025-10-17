Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C5CBEAE0C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A2410EC99;
	Fri, 17 Oct 2025 16:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Jw3J8SIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647810EC99
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:10 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nR3rnfz9sSq;
 Fri, 17 Oct 2025 18:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83oU0Nq5xnzMAjUkw90tTt3G6GepsINo4gg9dQdexT0=;
 b=Jw3J8SISIni0bCg4/v9AwVeE1UpeeKVWJcpg85mRTFP1MGZQ5MYCcOT/+h5iaSVGnZDmwm
 h6jXiQV7dC7DBtlGmfwNEHe1PGe+AabvPVH+5zszpTlv+h71y/B5AaG3ChalIBP7EtFyxK
 j0RsFTEFjuQKA060wQ5h0TiBcmIYFmn+1SrQyX59JXaN/iCWrVGeV0dNdv0+lQqT6E5PvH
 1MVoMdr5lEK59FFCpm1QmdUvYOIr+J9faQ78jkmF8Ozuc4FkFOujo+aN1st4eh0ErRTMtC
 QoSA11k2vcxsVeB4+ZPtTLWI4kfIyHYM08CpXgmz/cRSsYqW5uaandpJpQuOHg==
Message-ID: <94e3984d-9bda-4fd5-aad6-61157c23657d@mailbox.org>
Date: Fri, 17 Oct 2025 17:37:15 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 29/39] dt-bindings: display: bridge: Document Freescale
 i.MX95 MIPI DSI
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
 <20251011170213.128907-30-marek.vasut@mailbox.org>
 <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a5560825f52d16d9234
X-MBO-RS-META: pu6rccg5i194n7adfs18zjzuqp64mx16
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

On 10/13/25 9:13 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:44PM +0200, Marek Vasut wrote:
>> Freescale i.MX95 SoC embeds a Synopsys Designware MIPI DSI host
>> controller and a Synopsys Designware MIPI DPHY. Unlike the i.MX93
>> PHY, the i.MX95 PHY uses more syscon interfaces to configure the
>> PHY.
> 
> Any common driver for Synopsys Designware MIPI DSI, suppose many vendor
> use this IP?

Sure, the IP is common, the "glue logic" is SoC-specific.

>>   properties:
>>     compatible:
>> -    const: fsl,imx93-mipi-dsi
>> +    enum:
>> +      - fsl,imx93-mipi-dsi
>> +      - fsl,imx95-mipi-dsi
>>
>>     clocks:
>>       items:
>> @@ -46,13 +45,52 @@ properties:
>>         controller and MIPI DPHY PLL related configurations through PLL SoC
>>         interface.
>>
>> +  fsl,disp-master-csr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      i.MX95 Display Master CSR is a syscon which includes registers to
>> +      control DSI clock settings, clock gating, and pixel link select.
> 
> why not go through standard phy interface?
> 
>> +
>> +  fsl,disp-stream-csr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      i.MX95 Display Stream CSR is a syscon which includes configuration
>> +      and status registers for the DSI host.
> 
> why not go through standard phy interface?
These are aux control signals , these registers are not PHY .
