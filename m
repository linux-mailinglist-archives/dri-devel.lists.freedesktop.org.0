Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB21BEAE00
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DE610ECA6;
	Fri, 17 Oct 2025 16:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KlzpCtN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED9110EC9E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:51:01 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cp9nF6NMLz9tRR;
 Fri, 17 Oct 2025 18:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTfWmnLQ6ukMdEbgfBMNWGOo7KjRgWEeSGa22YoD+80=;
 b=KlzpCtN7V0epBRmPwHiyo4tjl0KakccxsblOcYYkMP3qUvr3HC6kMRrRo8KK+aW7dqVhJH
 jmciNwC5gtkHsA3YxnTDDVtGrI2cGpAELXQDfXsXP7kArwVkEz5bncWkMg37XJMeQcMwVe
 ORLIIw4qn4FucHm440UjqPXe9PWmqhntt/beNEL2j9CfaHU8BVDuum3Ov3LiQxTP/Jdnd5
 WnryxYoyr8TCOeIlSWrFes9pDNy+cWxde7a0G/YHgbwrehOEuFAUeBXxt1Hd/YzM9pW8nC
 ShxQ5ahm4wcfyaTLT8wUKMMmga8Uohqtx4G16YbxD2nNrG3I7AW8zV2JZ2Kl0w==
Message-ID: <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
Date: Fri, 17 Oct 2025 17:15:35 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1e9bf3970d21c759542
X-MBO-RS-META: xtxht9rdhwbcun9qqmd7dk9na8uqmrzb
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

On 10/16/25 4:07 AM, Liu Ying wrote:

Hello Liu,

>>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Freescale i.MX95 Display Controller Domain Blend Unit
>>> +
>>> +description: Combines two input frames to a single output frame.
> 
> I'd like to comment on patches in split patch serieses(to be sent if needed).
> But, since I provide the below interrupt information, anyway I take the chance
> to comment more:
> 
> Add more description about the unit according to i.MX95 DC IP spec:
> The unit operates in four modes:
> - Primary mode: The primary input is used for output.
> - Secondary mode: The secondary input is used for output.
> - Blend mode: Primary and secondary inputs are blended, according to the
>                programmed blending functions.
> - SidebySide mode: Primary and secondary streams are projected side by side,
>                     i.e., primary video on the left side and secondary on the
> 		   right.
> 
> BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they don't
> exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
> modes, this would impact how an OS implements a display driver a lot, especially
> Blend mode and SidebySide mode.

There is one thing which specifically concerns me about the DB, it seems 
to be capable of blending two inputs from different security domains, is 
that correct ?

>>> +maintainers:
>>> +  - Marek Vasut <marek.vasut@mailbox.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: fsl,imx95-dc-domainblend
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>
>> No clocks or other resources?
> 
> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
It seems we currently do not use either clock or interrupts on either 
domainblend or layerblend IPs, but maybe DB and LB are different and LB 
really has no clock/interrupts ?
