Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFCAEB926
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B1D10EA29;
	Fri, 27 Jun 2025 13:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="YhQHA0mI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2219910EA29
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:44:20 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 06D1620F6D;
 Fri, 27 Jun 2025 15:44:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToE2WMaHRbaz; Fri, 27 Jun 2025 15:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751031858; bh=cAEs2spaxPueJxKHXKyopePEl3MqlVBkN3UFzTPU8Sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YhQHA0mIm10roynyZHJhCDRT7tmozYKY85f/YD9X9oNofLc0mGiDLwqbKW82kVMoh
 w5iRZqBBZvckSbtJoKcb3DvAZ3wPtUw4J5N3d26C9Q8aRMARha+7wlfa6XofQV96de
 zNLP2OqqBDOhqi4KZN8CSZjwkeEiOXwxVMyOmtQ6PQeK0xlYEM4Zc4NIDew8n2xNe3
 Lg6CM3dmImHbDZn5gJ1hkJkjfoSxxjzJORpoLkqybzhVPenPktfkcqXa0OwQ7c3e17
 JGFgVVGpynhtbga0NcRNbsWvi9m/EWA1gp2YqTYx3F+ua9gG7CHv8waeTpg6JY0Jxt
 G0l4klyZK8V7w==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 13:44:17 +0000
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
In-Reply-To: <20250627-literate-talented-panda-cbac89@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
Message-ID: <85c3658fdfa90636caac3b3fce295915@disroot.org>
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

On 2025-06-27 07:50, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 12:50:28AM +0530, Kaustabh Chakraborty wrote:
>> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
>> - May optionally require an IOMMU to initialize a display region.
>> - May require a port connection to another block, say an MIC or a DSI
>>   master.
>> 
>> Document these bindings in the devicetree schema.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 
>> ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml 
>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> index 
>> 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 
>> 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> @@ -80,6 +80,14 @@ properties:
>>        - const: vsync
>>        - const: lcd_sys
>> 
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Contains a port which is connected to mic or dsim node.
> 
> You need to list and describe the ports.

-    description:
-      Contains a port which is connected to mic or dsim node.
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port which is connected to either a Mobile Image
+          Compressor (MIC) or a DSI Master device.

I assume you want something like this?
Is the formatting correct? Should there be a space between
ports:$ref and ports:properties?

> 
> Best regards,
> Krzysztof
