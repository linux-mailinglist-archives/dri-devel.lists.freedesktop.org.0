Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC991B207
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 00:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640FE10EB7D;
	Thu, 27 Jun 2024 22:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qJcrqOw3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49E10E50A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 22:12:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0316361ED8;
 Thu, 27 Jun 2024 22:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8E0C2BBFC;
 Thu, 27 Jun 2024 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719526376;
 bh=zEU06ccxlSi4KJtjT+ATfMzZpKaukNTo70MyRTgbSaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJcrqOw3YtE/m++3cwXqHzHUknq9Flppdx6qaBv3/VpprcSaoeOE15oQoY4dhpKmu
 ZM9mGAIZ6X8qGNYI/dYu3l6VxCQBRRX0CeUuN3lmMGGwQe76iE9J37+maLg2hFRCsB
 L60iOfQ4rKQ/AACDLkQqpS0Z4k8g1zeSIVrHB9oSyZGj4pJz4aycVqRJVcnSD7kpWP
 0CSTO5yXNX81IG6DVV20pCz929470AQ65HqXMKHSRDlr6DPIjP7ZVF7mHF+i43pllK
 8HTTWJdjdMooADpIPNLu/piuVVS3LhDqkGdgKDcIYY8qISRFCDAVfM5eOrhTxXVFqc
 mNk+NPbtQQWiQ==
Date: Thu, 27 Jun 2024 16:12:55 -0600
From: Rob Herring <robh@kernel.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
Message-ID: <20240627221255.GA649980-robh@kernel.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
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

On Mon, Jun 24, 2024 at 03:30:25AM +0200, Caleb Connolly wrote:
> Describe the Samsung AMB655X panel. It has three supplies.
> 
> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> new file mode 100644
> index 000000000000..eb987d022a0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung AMB655X 1080x2400 120hz AMOLED panel
> +
> +maintainers:
> +  - Caleb Connolly <caleb@postmarketos.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,amb655x

'x' is not a wildcard is it? Those are generally not allowed.

> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: reset gpio, must be GPIO_ACTIVE_LOW

blank line

> +  vddio-supply: true
> +  vdd-supply: true
> +  avdd-supply: true
> +  enable-gpios: true
> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - vddio-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "samsung,ams495qa01";
> +            reg = <0>;
> +            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
> +            vdd-supply = <&vcc_3v3>;
> +
> +            port {
> +                mipi_in_panel: endpoint {
> +                  remote-endpoint = <&mipi_out_panel>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.45.0
> 
