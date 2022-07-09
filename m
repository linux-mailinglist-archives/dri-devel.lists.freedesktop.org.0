Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2DA56CB70
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 22:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582C11B839;
	Sat,  9 Jul 2022 20:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077C711B83A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 20:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sUNoqOKr3Tu/6aqk6b9hgMDsaxDWvMdhP4oY4f5l4lw=;
 b=rdfHxxh4Lo4znjQzElJHofxDTwWXE/d3oU8CmDWIF4YnmaVyge33Y2U2x1xCPVuSGAIt9TKqn2wDL
 pz0/3WbmNVqAxqh4c/eVdT3YbcK0oebcYMlJtsku7zisuhP936eFt3uCxk4PWgs2pz6YDk7pR9vd7f
 AMVp1DrpGBz2tNdGyF/tW6uayTEccFU9oabFaBQv5YQEMckusOvScCz29UKkQZQ9LMULtR9B7TsVQR
 0bYOGxaSxIMsxYD4yi0rP2OjY8dY9/QJR3xkRpB5QBk9vZK23DVkO+Fd8VkLtL4dSyQRf88DBOX+PG
 Kn7k2110suOcLLDjB1E/nhqhRCwXQPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sUNoqOKr3Tu/6aqk6b9hgMDsaxDWvMdhP4oY4f5l4lw=;
 b=id6bzscFnVGcmv4gdOzXpl+0kNM4KtuVsKgc8pCSEwZCHjv8gTkR8nPLVXmEPnZLODdz07lecbBkd
 VMo2icjBQ==
X-HalOne-Cookie: f2222cbad2f8d91fdb9fea67c5ad6a212aff1d89
X-HalOne-ID: 57456efd-ffc8-11ec-be7e-d0431ea8bb03
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 57456efd-ffc8-11ec-be7e-d0431ea8bb03;
 Sat, 09 Jul 2022 20:47:26 +0000 (UTC)
Date: Sat, 9 Jul 2022 22:47:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: MollySophia <mollysophia379@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Message-ID: <YsnpXU2w1wsXiGrs@ravnborg.org>
References: <20220709141136.58298-1-mollysophia379@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220709141136.58298-1-mollysophia379@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Molly,

thanks for the quick response to the review comments.

On Sat, Jul 09, 2022 at 10:11:35PM +0800, MollySophia wrote:
> Add documentation for "novatek,nt35596s" panel.
> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>
The s-o-b needs your real name - guess the above is a concatenation of
first name and surname.

The binding included in this patch fails the check:
$ make DT_CHECKER_FLAGS=-m dt_binding_check

You may need to run:
$ pip3 install dtschema --upgrade

Or you may have to install some dependencies first.
The problem is that the patch is missing a "reset-gpios: true"

On top of this I looked at the binding - and the description
this is copied from is almost identical.
So another approach would be to extend the existing binding like
in the following.

And this also gives a good hint that maybe this can be embedded in
the existing driver - and there is no need for a new driver.
Could you try to give this a spin and get back on this.

Sorry for not seeing this in the first place.

	Sam

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 41ee3157a1cd..913bb81ae93d 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -20,14 +20,20 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - tianma,fhd-video
-      - const: novatek,nt36672a
+    oneOf:
+      - items:
+          - enum:
+              - tianma,fhd-video
+          - const: novatek,nt36672a
+
+      - items:
+          - enum:
+              - jdi,fhd-nt35596s
+          - const: novatek,nt35596s
+
     description: This indicates the panel manufacturer of the panel that is
-      in turn using the NT36672A panel driver. This compatible string
-      determines how the NT36672A panel driver is configured for the indicated
-      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
+       in turn using the NT36672A or the NT35596S panel driver. This compatible string
+       determines how the panel driver is configured for the indicated panel.
 
   reset-gpios:
     maxItems: 1
@@ -85,4 +91,27 @@ examples:
         };
     };
 
+    dsi1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "jdi,fhd-nt35596s", "novatek,nt35596s";
+            reg = <0>;
+            vddi0-supply = <&vreg_l14a_1p88>;
+            vddpos-supply = <&lab>;
+            vddneg-supply = <&ibb>;
+
+            backlight = <&pmi8998_wled>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            port {
+                jdi_nt35596s_in_1: endpoint {
+                    remote-endpoint = <&dsi1_out>;
+                };
+            };
+        };
+    };
+
+
 ...

> ---
>  .../display/panel/novatek,nt35596s.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> new file mode 100644
> index 000000000000..f724f101a6fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Novatek NT35596S based DSI display Panels
> +
> +maintainers:
> +  - Molly Sophia <mollysophia379@gmail.com>
> +
> +description: |
> +  The nt35596s IC from Novatek is a generic DSI Panel IC used to drive dsi
> +  panels.
> +  Right now, support is added only for a JDI FHD+ LCD display panel with a
> +  resolution of 1080x2160. It is a video mode DSI panel.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - jdi,fhd-nt35596s
> +      - const: novatek,nt35596s
> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the NT35596S panel driver. This compatible string
> +      determines how the NT35596S panel driver is configured for the indicated
> +      panel. The novatek,nt35596s compatible shall always be provided as a fallback.
> +
> +  vddi0-supply:
> +    description: regulator that provides the supply voltage
> +      Power IC supply
> +
> +  vddpos-supply:
> +    description: positive boost supply regulator
> +
> +  vddneg-supply:
> +    description: negative boost supply regulator
> +
> +  reg: true
> +  port: true
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddi0-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "jdi,fhd-nt35596s", "novatek,nt35596s";
> +            reg = <0>;
> +            vddi0-supply = <&vreg_l14a_1p88>;
> +            vddpos-supply = <&lab>;
> +            vddneg-supply = <&ibb>;
> +
> +            backlight = <&pmi8998_wled>;
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                jdi_nt35596s_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.37.0
