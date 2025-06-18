Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53613ADEF46
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBE510E87C;
	Wed, 18 Jun 2025 14:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="RYxBhjev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0E910E86C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:27:19 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CDC8925F7A;
 Wed, 18 Jun 2025 16:27:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXPabypd1lfz; Wed, 18 Jun 2025 16:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750256837; bh=UN4+r4XZNFrvRooGsjjEHC4utAW+tfGxUnWe7E/kEZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RYxBhjevfThdOLUFRzhLqaoSxQrAAJJX10YFzY/7DTzTuSQuDgSDAGeL5MqVoDyop
 yZKq3Z+ZQoZWeKSOTFlvOindsxL74TAJWqexbnZF7H5/f23C2c9dNCU3D3i1O1ueFQ
 AadAn1wP5JOAYtODFq4KaqZrsI4ykYywXaAgQnT+VOJLZONOh/jfxygQ1nKb6ZL7kO
 XzASPMLAxr+hlektYmjrN6iy0iXhKgUlpqEvOqhiOvpnA4bNCoy59iizB5WhKomoJ4
 VwtwaiqCqkR2rMWNJzxXZNHsu12JRz3WNalpMi3Ny/GZO5RUYt+y3DRnKYxQ+3w4gr
 92vQACA6z9Eng==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:27:17 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 10/12] dt-bindings: samsung, mipi-dsim: document exynos7870
 DSIM compatible
In-Reply-To: <5672e2ee-a828-4555-bf78-9d75c58840bd@kernel.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
 <20250612-exynos7870-dsim-v1-10-1a330bca89df@disroot.org>
 <5672e2ee-a828-4555-bf78-9d75c58840bd@kernel.org>
Message-ID: <9e2f29d3763ea50b30e5a493551627cd@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
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

On 2025-06-18 10:00, Krzysztof Kozlowski wrote:
> On 12/06/2025 17:18, Kaustabh Chakraborty wrote:
>> Add compatible string for Exynos7870 DSIM bridge controller. The
>> devicetree node requires four clock sources, named:
>> - bus_clk
>> - phyclk_mipidphy0_bitclkdiv8
>> - phyclk_mipidphy0_rxclkesc0
>> - sclk_mipi
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 26 ++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>> index 1acad99f396527192b6853f0096cfb8ae5669e6b..887f3ba1edd24a177a766b1b523d0c197ff1123a 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
>> @@ -24,6 +24,7 @@ properties:
>>            - samsung,exynos5410-mipi-dsi
>>            - samsung,exynos5422-mipi-dsi
>>            - samsung,exynos5433-mipi-dsi
>> +          - samsung,exynos7870-mipi-dsi
>>            - fsl,imx8mm-mipi-dsim
>>            - fsl,imx8mp-mipi-dsim
>>        - items:
>> @@ -144,6 +145,31 @@ required:
>>  
>>  allOf:
>>    - $ref: ../dsi-controller.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos7870-mipi-dsi
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
> 
> maxItems: 4

Will replace. maxItems == minItems implicit if maxItems present and
minItems absent.

> 
>> +
>> +        clock-names:
>> +          items:
>> +            - const: bus_clk
>> +            - const: phyclk_mipidphy0_bitclkdiv8
>> +            - const: phyclk_mipidphy0_rxclkesc0
>> +            - const: sclk_mipi
> 
> Does any existing driver code actually depends on the names? If not, we
> switched in Samsung in general to names matching the input or the
> function, not the name of provider. bus, bit (or bitdiv?), rx or esc0, sclk 

Yeah, Exynos5433 uses it. Code is here [1].

Though, I could get around this if you would like to. Would need to add
a few more patches.

PS: bitdiv8 should actually be byte. bit clock frequency used in data
transmission divided by 8 covers a byte.

[1] https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/gpu/drm/bridge/samsung-dsim.c#L227

> 
> 
> Best regards,
> Krzysztof
