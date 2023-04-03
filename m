Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469C6D4D3F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E081010E17B;
	Mon,  3 Apr 2023 16:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEBD10E17B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:10:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C75A83AA4;
 Mon,  3 Apr 2023 18:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680538203;
 bh=aBf97ckumjH5jBbLPp9dOgA518h2j350IgoEW6C5W9A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QApSisOJyBMVEUGxd+P6/xzKw+nTdwwAqlSLsuu3fRKEhtwCOnEISA3jDDwX/n+t4
 9B+fjaE+fNkl1tKqGS1HMUpMoZlSJzpr8uKssdQQvmK8DDqWbqNQA3BNG36uFuDwWP
 Pz3J5cYDKb1OA4YHWqbpG8EBHAnn/qMZhf+/evDeXpDiDSwcEGiIhucGqrEEypAuZI
 /MNrboF/n2mLeSp6tDZoLSb/n+hivaiDxJiF0DkMh7huet9ydyNtbuyENjzFtvgM8a
 JSexpRpGZ0VF/Tni6FiuuP2Y/3SCnM7mg08qJkuFtO126ojZIqOTwFdI0RNBGWcPVZ
 gEFAyaUF4ietw==
Message-ID: <254e965e-3ef5-7628-d40b-eedf4cb25a0c@denx.de>
Date: Mon, 3 Apr 2023 18:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to
 yaml
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230331195746.114840-1-festevam@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230331195746.114840-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/31/23 21:57, Fabio Estevam wrote:

[...]

> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos3250-mipi-dsi
> +      - samsung,exynos4210-mipi-dsi
> +      - samsung,exynos5410-mipi-dsi
> +      - samsung,exynos5422-mipi-dsi
> +      - samsung,exynos5433-mipi-dsi
> +      - fsl,imx8mm-mipi-dsim
> +      - fsl,imx8mp-mipi-dsim

Can you handle "fsl,imx8mn-mipi-dsim", "fsl,imx8mm-mipi-dsim" here too ?
The MX8MN DSIM bridge is compatible with MX8MM DSIM bridge. The change 
should be something like:

diff --git 
a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml 
b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 2698752dc6edf..6a30194d3347e 100644
--- 
a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ 
b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -16,14 +16,18 @@ description: |

  properties:
    compatible:
-    enum:
-      - samsung,exynos3250-mipi-dsi
-      - samsung,exynos4210-mipi-dsi
-      - samsung,exynos5410-mipi-dsi
-      - samsung,exynos5422-mipi-dsi
-      - samsung,exynos5433-mipi-dsi
-      - fsl,imx8mm-mipi-dsim
-      - fsl,imx8mp-mipi-dsim
+    oneOf:
+      - enum:
+          - samsung,exynos3250-mipi-dsi
+          - samsung,exynos4210-mipi-dsi
+          - samsung,exynos5410-mipi-dsi
+          - samsung,exynos5422-mipi-dsi
+          - samsung,exynos5433-mipi-dsi
+          - fsl,imx8mm-mipi-dsim
+          - fsl,imx8mp-mipi-dsim
+      - items:
+          - const: fsl,imx8mn-mipi-dsim
+          - const: fsl,imx8mm-mipi-dsim

    reg:
      maxItems: 1
