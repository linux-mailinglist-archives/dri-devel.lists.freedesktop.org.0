Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282779D87D0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41910E66A;
	Mon, 25 Nov 2024 14:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="cNdY7SNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Mon, 25 Nov 2024 14:24:05 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9F810E66A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:24:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 21AA341DF4;
 Mon, 25 Nov 2024 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1732544094; bh=u2XUWhrR6ss2d9FlTj8Plfh2W/SE71nSefpQ0lgJHkQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=cNdY7SNXxqheP/0KddCcPuwen1NKykhMWb6bNamgVZXyM3ezVRM0HUdEY6L69M4CG
 /fJLMTvwVaUN//eLm2uXZJNQmIMbseOLk3Dk4P/EufLqPJdbZGnnniwrauJMV6Bb06
 SwXy0JLKwwnMfNSm3NowFr1Ywo/6TFks+sJ2VUREv3HnLhHI1EjN2p9/ab0hzDoUfx
 QghpKyWji6vfozrrnNHuM4gEZMSIFY4SAutMDXW3MB2W83onm+tslqNsgDLE1QCcyn
 ScCODCDPzEVRt0FZLpOx1dnsJ2D0KTT7YNlr9k1D9IHIYj7+Mw+W1Bc7j1+AHbY+4Y
 tWD9FLrZ82LBg==
Message-ID: <a9d1568e-6240-49a4-b6a0-dcc0d9229eb1@marcan.st>
Date: Mon, 25 Nov 2024 23:14:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindgins: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-1-3191d8e6e49a@gmail.com>
 <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <ksdp54qj55v7igvvcshl6y2cxpmqy7rlsh4xsixpptjn7s7wlu@76ejtq6ytvbp>
Content-Type: text/plain; charset=UTF-8
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

On 2024/11/25 16:45, Krzysztof Kozlowski wrote:
> On Sun, Nov 24, 2024 at 11:29:24PM +0100, Sasha Finkelstein wrote:
>> Add bindings for a secondary display controller present on certain
>> Apple laptops.
>>
>> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
>> ---
>>  .../bindings/display/apple,display-pipe.yaml       | 59 ++++++++++++++++++++++
>>  .../bindings/display/panel/apple,summit.yaml       | 24 +++++++++
>>  2 files changed, 83 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/apple,display-pipe.yaml b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bd25ddc6e09dd636c0221c854e594113f6011866
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/apple,display-pipe.yaml
> 
> No, use fallback compatible as filename.
> 
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/apple,display-pipe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple pre-DCP display controller.
>> +
>> +maintainers:
>> +  - asahi@lists.linux.dev
>> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
>> +
>> +description: |
> 
> Drop |
> 
>> +  A secondary display controller used to drive the "touchbar" on certain
>> +  Apple laptops.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - "apple,t8112-display-pipe"
>> +        - "apple,t8103-display-pipe"
>> +      - const: "apple,h7-display-pipe"
> 
> 
> This wasn't tested... Drop all quotes. Do you see any file with quotes?
> Why doing things entirely different than everyone else?
> 
>> +
>> +  reg:
>> +    minItems: 3
> 
> Drop
> 
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: be
>> +      - const: fe
>> +      - const: mipi
>> +
>> +  power-domains: true
> 
> List the items instead or maxItems: 1.
> 
>> +
>> +  interrupts:
>> +    minItems: 2
> 
> Drop
> 
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: be
>> +      - const: fe
>> +
>> +  iommus: true
> 
> 
> maxItems: 1
> 
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +additionalProperties: true
> 
> This cannot be true. Must be false.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
> 
> This goes before additionalProperties.
> 
> Missing example: that's a strong NAK and prove that this could not be
> even tested.
> 
> Do you see any device schema without example? No. Do not develop things
> differently, Apple is not unique, special or exceptional.

Krzysztof, it is entirely possible to express this same feedback without
being condescending and rude. I'm pretty sure you can do better than this.

> 
> 
>> diff --git a/Documentation/devicetree/bindings/display/panel/apple,summit.yaml b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..dc281c1f52c1ed07cc2f7f804dcfd2f3b4239d89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>> @@ -0,0 +1,24 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/apple,summit.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple "Summit" display panel.
>> +
>> +maintainers:
>> +  - asahi@lists.linux.dev
>> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: apple,summit
> 
> No, too generic. Panels need much more properties, this is heavily
> incomplete. See other panel bindings.
> 
> Best regards,
> Krzysztof
> 
> 
> 

- Hector

