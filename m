Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E67189F8
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 21:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E5210E507;
	Wed, 31 May 2023 19:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 328 seconds by postgrey-1.36 at gabe;
 Wed, 31 May 2023 19:17:42 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714A10E507
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:17:42 +0000 (UTC)
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D0346861EC;
 Wed, 31 May 2023 21:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685560328;
 bh=Os7O+0HlwWKBxy88eq0jsfyPP+OTJb900Ym/2naD7kA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mEsvhqZsGX3UMU3ePXJ+vN987aGJy3qMJyrdX814Xr/g+nkxPiz5vHg9esFSBBViP
 vcKYVbBDkvdUfCfStX81lvVPl5rwvNZVXVxd/k/BpycMxLhSD+r0iN6bc3MtygDkdq
 rnTXmeNNxtjMpOfmYDN4D7UsbGsgQXFTV9udEJvVrt+xQxJLCuYFKQFC9/5A3k4VuY
 +6R5Z3es1Bs6C6bC5tkbKZaSJvNKcOSddRSTZdGvWqARb4+KjRJQwkvzZu8rv5niDa
 166qATZfWncKjape00BxKzcIvp5qftm57SVEuUVD17LKNgBJxmqSwidj+2DWBU3jEz
 EizTitAGGdy6g==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 31 May 2023 16:12:07 -0300
From: Fabio Estevam <festevam@denx.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: samsung,mipi-dsim: Use port-base reference
In-Reply-To: <eb2b71df-6767-40f3-afc1-ef1552aeaee6@linaro.org>
References: <20230531014315.1198880-1-festevam@gmail.com>
 <eb2b71df-6767-40f3-afc1-ef1552aeaee6@linaro.org>
Message-ID: <095bb5c25f120536bf38bf87df5900cb@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
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
Cc: marex@denx.de, neil.armstrong@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 15:56, Krzysztof Kozlowski wrote:

> This would have sense if you kept original intention, so
> additionalProperties: false
> 
> Without it - you just break bindings to hide warning.

I am not sure I understood your suggestion.

Is this what you mean?

diff --git 
a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml 
b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 06b6c44d4641..033404669b11 100644
--- 
a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ 
b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -96,14 +96,14 @@ properties:

      properties:
        port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
          description:
            Input port node to receive pixel data from the
            display controller. Exactly one endpoint must be
            specified.

        port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
          description:
            DSI output port node to the panel or the next bridge
            in the chain.
@@ -230,8 +230,7 @@ allOf:
          - vddio-supply
          - samsung,phy-type

-additionalProperties:
-  type: object
+additionalProperties: false

  examples:
    - |
-- 
