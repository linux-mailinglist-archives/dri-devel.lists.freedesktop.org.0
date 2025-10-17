Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7EBBEADF7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7199810ECB2;
	Fri, 17 Oct 2025 16:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nvNb7JM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092BB10EC9B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:50:58 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nC0Bw8z9t4X;
 Fri, 17 Oct 2025 18:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0PCGcbcebxEbmKkqUra8r/5kC8oKG3WtMDn0TPnQmM=;
 b=nvNb7JM/ergf992QdOb+HWiqFnAQbgApIg++mtkKrysn/7LHTAktGAsbNUyt9o1peDmwx9
 JbCJKkknxuVQp9LvVMuoxoNrYgtSoMJ0kwmIoDvS6eMUmOGAhxVO2cPEC/mGjmW7snTufB
 FK9jiVPosKPpk2TBBDDCI35epqEBQEQyhL14gYwOcm/rKqwTOn6ODv9fcwKBdTvMhKsqZC
 IoLrIMK6TdX5VKzFx9wo4uc0MHpaqg8XG98Em3cGn53kVXKBTvHne46ETfHr3N3pMSTL6n
 q3vzrqLJGarAL+HmI9iTRWNjjgS9526TTlwyrLEZ/U/VfREgBHrFnWqYLuLDaw==
Message-ID: <91a59c49-db23-425a-a728-b81c30802bd8@mailbox.org>
Date: Fri, 17 Oct 2025 17:08:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 38/39] dt-bindings: clock: support i.MX95 Display Stream
 CSR module
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-39-marek.vasut@mailbox.org>
 <20251015133315.GA3263713-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251015133315.GA3263713-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 9b13f95dc50aafe5c94
X-MBO-RS-META: wbuyjodo48czus9sqe6m5ubysagbd8jp
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

On 10/15/25 3:33 PM, Rob Herring wrote:

Hello Rob,

>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-display-stream-csr
>> +          - nxp,imx95-master-stream-csr
>> +          - nxp,imx95-mipi-tx-phy-csr
> 
> '-csr' seems redundant.
It follows the existing naming scheme on iMX95:

Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-camera-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-display-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-lvds-csr
Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml: 
- nxp,imx95-vpu-csr
Documentation/devicetree/bindings/clock/nxp,imx95-display-master-csr.yaml: 
      compatible = "nxp,imx95-display-master-csr", "syscon";

Shall I adjust that ?
