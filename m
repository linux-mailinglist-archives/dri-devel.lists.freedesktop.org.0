Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69996BDF150
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D3110E805;
	Wed, 15 Oct 2025 14:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="wN7lqxX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9712010E805
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:33:20 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmtqJ5ghsz9v66;
 Wed, 15 Oct 2025 16:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760538796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+0AAq5p9n3CYb0eN2KQBzPDtI3LpH6hBvgSrfcGzKs=;
 b=wN7lqxX9ujyaZAtI3oFJQBPbEbCEMBGULGgOFLBCY8XqGfDEy4VEj5OTv3D4U7tGelWb9+
 StMm8aoZZcvrm9F7FXK+h/dd87S4E6C0WFcCWzepB33sy+b1zj6nhGPnXO82dXsPTsYosY
 Ud7bD3DHde2xmx+/bZrhYtSKMC8zU9dnKaiJDxWRPUPpBILy98OUUUa5ep2h2dF9VVcwkk
 wAX+kTD0D090Sy7/0bIEJZArrFjR9fB9m6/3c5fgSzAghzEkE9EzMcKYN34SBzaZnjFI6N
 WUAq+FAHm7mc4pGvhu15vOKy85e1gZt88Aer8pMJnVjgGGNfjhXIup6L4LHINw==
Message-ID: <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
Date: Wed, 15 Oct 2025 12:19:33 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3bfifor4uba8rjg7sfrfhsxrmksew5w3
X-MBO-RS-ID: f82c0904535502d82ca
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

On 10/15/25 10:59 AM, Liu Ying wrote:

Hello Liu,

>>>> @@ -90,13 +102,15 @@ patternProperties:
>>>>          compatible:
>>>>            const: fsl,imx8qxp-dc-signature
>>>>
>>>> -  "^tcon@[0-9a-f]+$":
>>>> +  "^tcon(@[0-9a-f]+)?$":
>>>
>>> why here allow no address unit tcon?
>> This might be something Liu can clarify too.
>>
>> TCON on iMX95 DPU does not seem to exist at all, or at least has no control registers. Hence no address.
> 
> i.MX95 DC hasn't got TCON so it should not be documented for i.MX95 DC.

What DT node do I attach the pixel-mapper/pixel-interleaver to then ?

-- 
Best regards,
Marek Vasut
