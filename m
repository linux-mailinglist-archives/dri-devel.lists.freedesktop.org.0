Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F90BEADE5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574310EC8F;
	Fri, 17 Oct 2025 16:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="eyYDDBza";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A64710EC8F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 16:50:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9mz25xwz9tJG;
 Fri, 17 Oct 2025 18:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760719843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKALYDlBuq3AApm7hJUER0vvZlNv/1hPEVn7ARgUxR4=;
 b=eyYDDBzaOLfNdca2I7KQdT7e1NK2NXZIZWRlguf6SJej6B3274WlX3ZqqSl9TQ9NfnXzZk
 Pb7rR3iY1xOHKd1YsBZPleTaH7i5VwHRX/hwXHoygO2Uw13PIaOmiWcP3NzaZZqFsCoJNR
 7CzPI/jIEEBOM6EJW3QfRZb+x4pWNlqXpzzZNVPlrmRBGAdr8NZJ7KLL3hAcoBFbcu+cZC
 zcTMsaRupUE4lrEZwZPSfG6id4vATlg/djF3w76VmcjMCA7efgt5IfGwOF0V8rjF/zyVfV
 YBpveuObA970laZ4iSSs7vCrqQHj93OZNBsIRS1wsm0BquPOrUCiX8tf6oLZJQ==
Message-ID: <96850d24-8b38-4437-bbde-2b4aede3fdae@mailbox.org>
Date: Fri, 17 Oct 2025 16:55:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 25/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel interleaver support
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
 <20251011170213.128907-26-marek.vasut@mailbox.org>
 <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 63emeuje8d1fpppi7rferinsd6qqt4yc
X-MBO-RS-ID: 7c53f1497155dd64e06
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

On 10/13/25 8:57 PM, Frank Li wrote:

Hello Frank,

>> +  fsl,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      A phandle which points to Control and Status Registers (CSR) module.
> 
> Need justify why not standard interface such as clock, phy, reset ...

Because this is neither clock, nor reset nor anything else. This is 
really only a remote register which controls the pixel interleaving. 
Therefore, syscon.

>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
> 
> video-interfaces.yaml?
No, because none of the properties in video-interfaces.yaml are 
applicable to this port as far as I can tell.

The rest is fixed, thanks !
