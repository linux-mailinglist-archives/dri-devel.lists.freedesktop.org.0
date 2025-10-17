Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55024BEADFD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD7A10ECB1;
	Fri, 17 Oct 2025 16:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="c9qIF1x4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B16E10EC99
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:50:55 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cp9n82JH2z9srJ;
 Fri, 17 Oct 2025 18:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XooRrV+35GMQDIPae+kH4PQdJPSO7z6la9Gjhfk5mw4=;
 b=c9qIF1x4Hhov0glv1MzFHn4lKsmQsK/AUXn28bTHfPtfrwrOht6y2EPOh+zieNKveBpmUC
 wxo3u3IauhAE+ftz+pcOOjMdpyjKXkznAkX+ESdwIXZqtzv1ye7EV4XG6OiC6sltyvNwUM
 Z0kx8hEamvvfbrVI/Xz29wE4Tm4ocekwqAA/kJygEuUJKuntkKJTsXl7mXPi/+50G0Zmi4
 jM/UpHtiXFneBvD3Z4KkqLHEq64MgxPaFnbaZxWtg+GG1FSxmfZswFpS/vGlqzgFbP+ftw
 8N3vT0dWLjmqaeaqwu+e/Wgz6nUQzgGZVjtIoGpxf62pmiBN69rIkI4wKorWqg==
Message-ID: <fc291eb5-c352-426c-9064-78bad2d9d742@mailbox.org>
Date: Fri, 17 Oct 2025 17:05:50 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
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
 <20251011170213.128907-39-marek.vasut@mailbox.org>
 <aO1SaKbfPnMEl8SI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1SaKbfPnMEl8SI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pn6fyroioe5ds3breihbhnzb35t5xbqe
X-MBO-RS-ID: 2d4ad38cabace14face
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

On 10/13/25 9:26 PM, Frank Li wrote:

Hello Frank,

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-display-stream-csr
>> +          - nxp,imx95-master-stream-csr
>> +          - nxp,imx95-mipi-tx-phy-csr
>> +      - const: syscon
> 
> why need syscon here? why not use standard phy interface.
Those registers are not PHYs, they are aux control registers for this block.
