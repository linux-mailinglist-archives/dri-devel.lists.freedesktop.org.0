Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1696A4F4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 19:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB9210E20C;
	Tue,  3 Sep 2024 17:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="LwByXBiT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Tue, 03 Sep 2024 17:01:47 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D860710E096
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 17:01:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D6C9C88365;
 Tue,  3 Sep 2024 18:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725382318;
 bh=L9PW0zu06SOQABEZQUU7xjnR+wwFb76VQHJCYIBdo4Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LwByXBiTMrrIp23FhEn6q7M6ODzrObDSuS4by3GU3EZ4BoddIQyu2G6TmENBb6lW6
 jbroXoqYW5whbOaF3pnXE0c/5yrBTUoiFqSLz1NhZNpD8Qrw9GXXDN2cT2I1H04Q0r
 Jm4bONfkWGb2a3w/dZwmmi2KYmt3CfAcgFksIdqAiVimGNMWIBeHBjE3fa2rRU710m
 He0fho571zsw3Vf7lrpdipAM74Stg6XEpNhTXZyLxtZ1Uv+SdcTlEEoowWxPzFfdVN
 ZTYbV4YP0YEnq5tkxkwZszK8EEIr+AXVhtQi5Tm7go8gnQlDwifcKnEmbWKDhst2Iz
 4gGeC9YptWyBw==
Message-ID: <0b97acc0-2720-4962-b3c3-bb444cf81e66@denx.de>
Date: Tue, 3 Sep 2024 18:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: lcdif: Document the dmas/dma-names properties
To: Fabio Estevam <festevam@gmail.com>, mripard@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20240903162729.1151134-1-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240903162729.1151134-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 9/3/24 6:27 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> i.MX28 has an RX DMA channel associated with the LCDIF controller.
> 
> Document the 'dmas' and 'dma-names' properties to fix the following
> dt-schema warnings:
> 
> lcdif@80030000: 'dma-names', 'dmas' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   .../bindings/display/fsl,lcdif.yaml           | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 0681fc49aa1b..dd462abd61f8 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -50,6 +50,14 @@ properties:
>         - const: disp_axi
>       minItems: 1
>   
> +  dmas:
> +    items:
> +      - description: DMA specifier for the RX DMA channel.
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
>     interrupts:
>       items:
>         - description: LCDIF DMA interrupt
> @@ -156,6 +164,17 @@ allOf:
>           interrupts:
>             maxItems: 1
>   
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - fsl,imx28-lcdif

This also applies to MX23 , that one also has the support for 
command-mode LCDs which are then driven by pumping commands via DMA. I 
don't think Linux actually supports this mode of operation, but I do 
recall using it some long time ago on MX23.
