Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC2CAEBAF6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 17:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFF110EA6C;
	Fri, 27 Jun 2025 15:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="UoRytafx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E200010EA52
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 15:03:16 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 8D5D425B9B;
 Fri, 27 Jun 2025 17:03:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKBRcaReXqhH; Fri, 27 Jun 2025 17:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751036594; bh=vHgbqqxav7PLXVzwShebkckuGfsjD85hkjxnlgD60cs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=UoRytafxH9QzkSuEhGQ2HepLO3UAu131e4BI//9c+8132UHkDbOtLQKy22yrR3Eu+
 wm6rc9/QwYtwaGKRMf+5wUb0VpG8Bd73pNEuw6KB53JRdiTiNT3nrdu/ocqSBQ/tdG
 z3XTI9zd5bfUhbHVlIA5qZi/k8I5pYTVMNTcEvyipk1EaMxDglwSEhw+Z8RMdXSsd9
 qnCfb7/xxNzFYjH6QYZZEqli6Ue6/NLlWgMPN6NPbM63P/9eE0rgh9ucZMJZYLBqnR
 UrmYwITZxYabuYlJfhV9Twg+Ya3D8l5T8Rk1xedsz4xyRS7Rw2j61VvjNruw+On4XG
 fuUX2QVvFmKzA==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 15:03:14 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Ajay Kumar
 <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
In-Reply-To: <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
 <85c3658fdfa90636caac3b3fce295915@disroot.org>
 <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
Message-ID: <ab1a39df178b68e2f1d61a537e0d567c@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

On 2025-06-27 14:44, Krzysztof Kozlowski wrote:
> On 27/06/2025 15:44, Kaustabh Chakraborty wrote:
>>>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>> @@ -80,6 +80,14 @@ properties:
>>>>        - const: vsync
>>>>        - const: lcd_sys
>>>> 
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +    description:
>>>> +      Contains a port which is connected to mic or dsim node.
>>> 
>>> You need to list and describe the ports.
>> 
>> -    description:
>> -      Contains a port which is connected to mic or dsim node.
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Input port which is connected to either a Mobile Image
>> +          Compressor (MIC) or a DSI Master device.
> 
> 
> If this is only one port, then just 'port' property, but I have doubts
> it should be one, because even you mentioned two - MIC could be the
> input and MIPI DSIM would be the output.

DECON is the first device in the pipeline. So it should only have
output.

It's either:
DECON -> DSIM -> panel
or
DECON -> MIC -> DSIM -> panel

Exynos7870 doesn't have MIC, but other SoCs may have one.

> 
> Maybe if the MIC is integral part, it would not have been an input, but
> then only 'port'.
> 
>> 
>> I assume you want something like this?
>> Is the formatting correct? Should there be a space between
>> ports:$ref and ports:properties?
> 
> Look at toshiba,tc358768.yaml or the simple-bridge (except you should
> name the input and output ports).

Okay, thanks!

Therefore this:

-    description:
-      Contains a port which is connected to mic or dsim node.
+
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port which is connected to either a Mobile Image
+          Compressor (MIC) or a DSI Master device.

> 
> 
> 
> Best regards,
> Krzysztof
