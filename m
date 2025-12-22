Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757EECD5111
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A62810E5E2;
	Mon, 22 Dec 2025 08:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pNwgeSWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5E910E5E2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:33:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EEF6B4097D;
 Mon, 22 Dec 2025 08:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0327DC4CEF1;
 Mon, 22 Dec 2025 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766392388;
 bh=kUUnbAuGEjrmM//2x59uFgORJkzw0Ymx44NkugoSY00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNwgeSWnIM0d8102Pvyue1PQt9cIyxD54ZGU2UPczl4MJj7oY8aZx6apAqwNmd2kE
 rZhoKzVtafA3TRAOXTiZ0u9qGs9vF8Fp8yAKHiQe4N8qKssH4Rei2PuJhd3l08kJIo
 ZVZ00GYykkjVLHmgfPvqB3ZldmbSBsdSYtkhHwsvJALaphwUlRTytwP0jfhaH3KjRa
 0z7miXIsVn+PWLyHnrQazf61OJJckWSJo68jpPnHohbdHH2edspqkvTq/K2SLiCJBR
 WY4QORER8bSFjBQJMex5mNmhYGRIcN0UzsrZZVop7bkvDX4ZJyhFvNIALpGpPB6vUo
 5yJ9ouIQB3Gpg==
Date: Mon, 22 Dec 2025 09:33:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
Message-ID: <20251222-godlike-mongoose-of-valor-3eeee0@quoll>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
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

On Mon, Dec 22, 2025 at 12:32:12AM +0100, Marijn Suijten wrote:
> Document the Samsung SOFEF03-M Display-Driver-IC and 1080x2520@120Hz DSI
> command-mode panels found in the Sony Xperia 5 II and Sony Xperia 5 III.
> It requires Display Stream Compression 1.1 which allows the panels to be
> driven at 120Hz, even though a 60Hz mode is available too.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Your patchset has multiple white space warnings. Apply and see...

> ---
>  .../bindings/display/panel/samsung,sofef03-m.yaml  | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
> new file mode 100644
> index 000000000000..5712eca2773d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef03-m.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SOFEF03-M DDI for 1080x2520@120Hz 6.1" OLED DSI panels
> +
> +maintainers:
> +  - Marijn Suijten <marijn.suijten@somainline.org>
> +
> +description: |
> +  Samsung SOFEF03-M Display-Driver-IC found in the Sony Xperia 5 II (edo pdx206, amb609vp01
> +  panel) and
> +  Sony Xperia 5 III (sagami pdx214, amb609vp04
> +  panel) smartphones.  It is always programmed with Display Stream Compression 1.1 enabled.

Please wrap according to Linux coding style.

> +
> +  The assembly features a Samsung touchscreen compatible with
> +  samsung,s6sy761.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,sofef03-m-amb609vp01
> +      - samsung,sofef03-m-amb609vp04
> +
> +  port: true
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  vci-supply:
> +    description: DriverIC Operation supply (3.0V)
> +
> +  vddio-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
> +  - vci-supply
> +  - vddio-supply
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
> +        panel@0 {
> +            compatible = "samsung,sofef03-m-amb609vp01";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +            vci-supply = <&vreg_l11c_3p0>;
> +            vddio-supply = <&vreg_l14a_1p8>;
> +
> +            port {

Not tested :/


Best regards,
Krzysztof

