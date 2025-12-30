Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12240CE881D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 02:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D621F10E7B0;
	Tue, 30 Dec 2025 01:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VJz+Ym6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09F110E7B0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 01:51:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 663596000A;
 Tue, 30 Dec 2025 01:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8D6C4CEF7;
 Tue, 30 Dec 2025 01:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767059496;
 bh=OBturc9gnq7p1Z8WM2OtT8pLKo5/2hWGC55/0eg7aSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJz+Ym6glTYLUQoy5ymhQ18MC/d/L5HltQ+boUi2Jtx1jwuGkU25XLFwpu8AtabSM
 4zBEs3l/rvABl1BVY+9DeTXfRj6TaYTGjYliH27VBcfS7N4xY9egB0Vnm2wuXQbYH8
 kMdkGa9C52YyZ87g6XzUI64KGIChqPjbGV1I1zZ1N5wiYXxO9rZIYVURNKaay0nu4X
 PmclJwuLxUAJv9NVPIW+q+8AuX6ScQgCKpVvxOrkW7YF1fAGBr1AYJnjwkvhgG1l4m
 XHvXCI7KQQi3/M/5CT8dxZETzE08F6BzgLa3mOIuIGvmvBOV+sxQKdGQLvtMszXMEc
 gbiNA/ZNK5AVQ==
Date: Mon, 29 Dec 2025 19:51:35 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Casey Connolly <casey.connolly@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
Message-ID: <20251230015135.GA3066456-robh@kernel.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
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

On Mon, Dec 22, 2025 at 12:32:10AM +0100, Marijn Suijten wrote:
> Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
> command-mode DSI panels found in many Sony phones:
> - Sony Xperia 5 (kumano bahamut): amb609tc01
> - Sony Xperia 10 II (seine pdx201): ams597ut01
> - Sony Xperia 10 III (lena pdx213): ams597ut04
> - Sony Xperia 10 IV (murray pdx225): ams597ut05
> - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,sofef01-m.yaml  | 120 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
> new file mode 100644
> index 000000000000..a8ff5223677c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SOFEF01-M DDI for 1080x2520@60Hz 6.0"/6.1" OLED DSI panels
> +
> +maintainers:
> +  - Marijn Suijten <marijn.suijten@somainline.org>
> +
> +description: |
> +  Samsung SOFEF01-M Display-Driver-IC found in multiple Sony smartphones, paired with
> +  the following panel:
> +   - Sony Xperia 5 (kumano bahamut): amb609tc01
> +   - Sony Xperia 10 II (seine pdx201): ams597ut01
> +   - Sony Xperia 10 III (lena pdx213): ams597ut04
> +   - Sony Xperia 10 IV (murray pdx225): ams597ut05
> +   - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> +   - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> +
> +  The assembly features a Samsung touchscreen compatible with
> +  samsung,s6sy761.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: samsung,sofef01-m-amb609tc01
> +    then:
> +      properties:
> +        vci-supply:
> +          description: DisplayIC Operation supply (3.0V)

The error reported is on the wrong patch. Not sure why, but the problem 
is here. With 'additionalProperties: false', this property is not 
factored in and is considered unknown. That can be fixed using 
'unevaluatedProperties', but instead, move this to the top level 
'properties'.

> +
> +      required:
> +        - vci-supply
> +
> +    else:
> +      properties:
> +        vci-supply: false
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,sofef01-m-amb609tc01 # 6.1"
> +      - samsung,sofef01-m-ams597ut01 # 6.0"
> +      - samsung,sofef01-m-ams597ut04 # 6.0"
> +      - samsung,sofef01-m-ams597ut05 # 6.0"
> +      - samsung,sofef01-m-ams605dk01 # 6.1"
> +
> +  port: true
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  vddio-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
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
> +            compatible = "samsung,sofef01-m-amb609tc01";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +            vci-supply = <&vreg_l17a_3p0>;
> +            vddio-supply = <&vreg_l14a_1p8>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "samsung,sofef01-m-ams597ut01";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
> +
> +            vddio-supply = <&pm6125_l12>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };

The first example is enough.
