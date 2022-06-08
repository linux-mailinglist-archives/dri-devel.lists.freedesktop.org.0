Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C5542A1D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5FA10E29C;
	Wed,  8 Jun 2022 08:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1DA10E341
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:58:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id n28so26141818edb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g7EDx6yfItJbVg5cj1lG0NG4Vh/0+UySR9KbGJCBupI=;
 b=aJitfWBdCyZcAhHJLyLR6ZWrm2Chi4tcHEuX4dmBsp1M379npbrzkI/E6Ti7Yafjie
 prlF9eV4KlPunRFxwx/cybNon9ro1O2rt+rlZUWHqOXj55tJAhEaiwDo5xBF7Fa0q9QA
 EbX/53uw0l45FnhmZFNb6SmPQkckCBVrTtNQBz07xhHh4ohSkWtBPnaoH0BtaNEKBcHI
 Qj9NtJJ7xV6ObYEg6VH/GY/MiTcCl27JJrPjU2GA5bvxGMKWdqVZXqnrkYwoBT6N9WG6
 N5FS8ErvQ4UgTnivLBhCIRbT9onjjO+qveBtJT3S0NlUXOjXU1DOqyuOBW1l7cAx7rze
 l5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g7EDx6yfItJbVg5cj1lG0NG4Vh/0+UySR9KbGJCBupI=;
 b=ge0zTbYMz5UX5wKHJ20b4Sg5QYK2UzxSgGgFtXXQ6a/Luyhhcl5tsHcfwh4KPq2NSv
 AC1tctuy81ls3Uc4ZTxIlGSwFc0XJDVrTdB7CiulczJz7RsGqETOh65Wqj3Niw90x3LL
 AL1LfDIaRLS+U/NUnXQPxvBw6nZ5YKIb8nI025B6nhieXEj901dX7YZH9GK39ez7qM52
 nTHgafbrL2xyEEaM9/Nx6gmBejJDMLTloJLqpehyEZlS5uB2ItGvI9aHHLzdemGQQoJU
 5acwRX5Lz4xM8By1i4Cjy5Y+dI0VxjxK60iEKQSCjCLFtd6qq+SM73vAsfxQX5bmxxRd
 w8oQ==
X-Gm-Message-State: AOAM531iEv4XXV8TiIDXX2dG4lFS83VNmrz/ti4APKmFMT0j5VjwffQR
 4RaJzy7G7FixwdssP+etj/QCrw==
X-Google-Smtp-Source: ABdhPJzJFu1zw8n5rynWOH+RE9PkoRj3fiMq8xWs2oavStcKLb5iTvwFiOpgl0RRoQCXZqRpk2rv/A==
X-Received: by 2002:a05:6402:28a5:b0:42d:df55:5b91 with SMTP id
 eg37-20020a05640228a500b0042ddf555b91mr38277315edb.353.1654678713485; 
 Wed, 08 Jun 2022 01:58:33 -0700 (PDT)
Received: from [192.168.0.189] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x11-20020a056402414b00b0043158c608e4sm5140708eda.27.2022.06.08.01.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 01:58:32 -0700 (PDT)
Message-ID: <fcaa5759-9b26-fb70-d7a8-fa8300553929@linaro.org>
Date: Wed, 8 Jun 2022 10:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/7] dt-bindings: display/msm: hdmi: split and convert
 to yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
 <20220607185806.2771739-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607185806.2771739-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2022 20:58, Dmitry Baryshkov wrote:
> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
> 
> Changes to schema:
> HDMI:
>  - fixed reg-names numbering to match 0..3 instead 0,1,3,4
> 
> PHY:
>  - moved into phy/ directory
>  - split into QMP and non-QMP PHY schemas
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
>  .../bindings/display/msm/qcom,hdmi.yaml       | 237 ++++++++++++++++++
>  .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
>  .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  84 +++++++
>  4 files changed, 424 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.txt b/Documentation/devicetree/bindings/display/msm/hdmi.txt
> deleted file mode 100644
> index 5f90a40da51b..000000000000
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.txt
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -Qualcomm adreno/snapdragon hdmi output
> -
> -Required properties:
> -- compatible: one of the following
> -   * "qcom,hdmi-tx-8996"
> -   * "qcom,hdmi-tx-8994"
> -   * "qcom,hdmi-tx-8084"
> -   * "qcom,hdmi-tx-8974"
> -   * "qcom,hdmi-tx-8660"
> -   * "qcom,hdmi-tx-8960"
> -- reg: Physical base address and length of the controller's registers
> -- reg-names: "core_physical"
> -- interrupts: The interrupt signal from the hdmi block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: device clocks
> -  See ../clocks/clock-bindings.txt for details.
> -- core-vdda-supply: phandle to supply regulator
> -- hdmi-mux-supply: phandle to mux regulator
> -- phys: the phandle for the HDMI PHY device
> -- phy-names: the name of the corresponding PHY device
> -
> -Optional properties:
> -- hpd-gpios: hpd pin
> -- qcom,hdmi-tx-mux-en-gpios: hdmi mux enable pin
> -- qcom,hdmi-tx-mux-sel-gpios: hdmi mux select pin
> -- qcom,hdmi-tx-mux-lpm-gpios: hdmi mux lpm pin
> -- power-domains: reference to the power domain(s), if available.
> -- pinctrl-names: the pin control state names; should contain "default"
> -- pinctrl-0: the default pinctrl state (active)
> -- pinctrl-1: the "sleep" pinctrl state
> -
> -HDMI PHY:
> -Required properties:
> -- compatible: Could be the following
> -  * "qcom,hdmi-phy-8660"
> -  * "qcom,hdmi-phy-8960"
> -  * "qcom,hdmi-phy-8974"
> -  * "qcom,hdmi-phy-8084"
> -  * "qcom,hdmi-phy-8996"
> -- #phy-cells: Number of cells in a PHY specifier; Should be 0.
> -- reg: Physical base address and length of the registers of the PHY sub blocks.
> -- reg-names: The names of register regions. The following regions are required:
> -  * "hdmi_phy"
> -  * "hdmi_pll"
> -  For HDMI PHY on msm8996, these additional register regions are required:
> -    * "hdmi_tx_l0"
> -    * "hdmi_tx_l1"
> -    * "hdmi_tx_l3"
> -    * "hdmi_tx_l4"
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
> -- clocks: device clocks
> -  See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- core-vdda-supply: phandle to vdda regulator device node
> -
> -Example:
> -
> -/ {
> -	...
> -
> -	hdmi: hdmi@4a00000 {
> -		compatible = "qcom,hdmi-tx-8960";
> -		reg-names = "core_physical";
> -		reg = <0x04a00000 0x2f0>;
> -		interrupts = <GIC_SPI 79 0>;
> -		power-domains = <&mmcc MDSS_GDSC>;
> -		clock-names =
> -		    "core",
> -		    "master_iface",
> -		    "slave_iface";
> -		clocks =
> -		    <&mmcc HDMI_APP_CLK>,
> -		    <&mmcc HDMI_M_AHB_CLK>,
> -		    <&mmcc HDMI_S_AHB_CLK>;
> -		qcom,hdmi-tx-ddc-clk = <&msmgpio 70 GPIO_ACTIVE_HIGH>;
> -		qcom,hdmi-tx-ddc-data = <&msmgpio 71 GPIO_ACTIVE_HIGH>;
> -		qcom,hdmi-tx-hpd = <&msmgpio 72 GPIO_ACTIVE_HIGH>;
> -		core-vdda-supply = <&pm8921_hdmi_mvs>;
> -		hdmi-mux-supply = <&ext_3p3v>;
> -		pinctrl-names = "default", "sleep";
> -		pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
> -		pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
> -
> -		phys = <&hdmi_phy>;
> -		phy-names = "hdmi_phy";
> -	};
> -
> -	hdmi_phy: phy@4a00400 {
> -		compatible = "qcom,hdmi-phy-8960";
> -		reg-names = "hdmi_phy",
> -			    "hdmi_pll";
> -		reg = <0x4a00400 0x60>,
> -		      <0x4a00500 0x100>;
> -		#phy-cells = <0>;
> -		power-domains = <&mmcc MDSS_GDSC>;
> -		clock-names = "slave_iface";
> -		clocks = <&mmcc HDMI_S_AHB_CLK>;
> -		core-vdda-supply = <&pm8921_hdmi_mvs>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> new file mode 100644
> index 000000000000..2f485b5d1c5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> @@ -0,0 +1,237 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/display/msm/qcom,hdmi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Both go without quotes.

> +
> +title: Qualcomm Adreno/Snapdragon HDMI output
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hdmi-tx-8660
> +      - qcom,hdmi-tx-8960
> +      - qcom,hdmi-tx-8974
> +      - qcom,hdmi-tx-8084
> +      - qcom,hdmi-tx-8994
> +      - qcom,hdmi-tx-8996

Could you order them alphabetically? Helps to avoid conflicts, if ever
extended.

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 3
> +    description: Physical base address and length of the controller's registers

Skip description, it's obvious.

> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: core_physical
> +      - const: qfprom_physical
> +      - const: hdcp_physical
> +
> +  interrupts:
> +    maxItems: 1
> +    description: The interrupt signal from the hdmi block.

Skip description, it's obvious.

> +
> +  phys:
> +    description: the phandle for the HDMI PHY device

You can skip description, it's quite obvious... Also in some places
description is first in the property, in some last. Just keep one choice. :)

> +    maxItems: 1
> +
> +  phy-names:
> +    enum:
> +      - hdmi_phy
> +      - hdmi-phy

Fix the DTS and use only one. Do the drivers actually use it?

> +
> +  hpd-gpios:
> +    maxItems: 1
> +    description: hpd pin
> +
> +  qcom,hdmi-tx-ddc-clk-gpios:
> +    maxItems: 1
> +    description: HDMI DDC clock
> +
> +  qcom,hdmi-tx-ddc-data-gpios:
> +    maxItems: 1
> +    description: HDMI DDC data
> +
> +  qcom,hdmi-tx-mux-en-gpios:
> +    maxItems: 1
> +    description: HDMI mux enable pin

These were not documented before, so mention that in the commit msg, please.

> +
> +  qcom,hdmi-tx-mux-sel-gpios:
> +    maxItems: 1
> +    description: HDMI mux select pin
> +
> +  qcom,hdmi-tx-mux-lpm-gpios:
> +    maxItems: 1
> +    description: HDMI mux lpm pin
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  ports:
> +    type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: |
> +          Input endpoints of the controller.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: |
> +          Output endpoints of the controller.
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - phys
> +  - phy-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-tx-8960
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: master_iface
> +            - const: slave_iface
> +        core-vdda-supply:
> +          description: phandle to VDDA supply regulator
> +        hdmi-mux-supply:
> +          description: phandle to mux regulator
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-tx-8974
> +              - qcom,hdmi-tx-8084
> +              - qcom,hdmi-tx-8994
> +              - qcom,hdmi-tx-8996
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: core
> +            - const: alt_iface
> +            - const: extp
> +        core-vdda-supply:
> +          description: phandle to VDDA supply regulator
> +        core-vcc-supply:
> +          description: phandle to VCC supply regulator
> +
> +unevaluatedProperties: false

This should be additionalProperties:false, because you do not reference
any schema. If it fails on supplies, please define the supplies in the
properties list (not in the allOf:if:then) and disallow it on chosen
variant (only one I guess)... if the supplies are really not possible on
that variant.

> +
> +examples:
> +  - |
> +    hdmi: hdmi@4a00000 {
> +      compatible = "qcom,hdmi-tx-8960";
> +      reg-names = "core_physical";
> +      reg = <0x04a00000 0x2f0>;
> +      interrupts = <0 79 0>;

Use proper defines for GIC and flags. IRQ TYPE none is not correct usually.

> +      clock-names =
> +          "core",
> +          "master_iface",
> +          "slave_iface";

      clock-names = "core",
(and align continued lines)


> +      clocks =
> +          <&clk 61>,
> +          <&clk 72>,
> +          <&clk 98>;
> +      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
> +      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
> +      hpd-gpios = <&msmgpio 72 0>;

Proper GPIO flags.

> +      core-vdda-supply = <&pm8921_hdmi_mvs>;
> +      hdmi-mux-supply = <&ext_3p3v>;
> +      pinctrl-names = "default", "sleep";
> +      pinctrl-0 = <&hpd_active  &ddc_active  &cec_active>;
> +      pinctrl-1 = <&hpd_suspend &ddc_suspend &cec_suspend>;
> +
> +      phys = <&hdmi_phy>;
> +      phy-names = "hdmi_phy";
> +    };
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8996.h>
> +    #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    hdmi-tx@9a0000 {

Node name just "hdmi"

> +      compatible = "qcom,hdmi-tx-8996";
> +      reg = <0x009a0000 0x50c>,
> +            <0x00070000 0x6158>,
> +            <0x009e0000 0xfff>;
> +      reg-names = "core_physical",
> +                  "qfprom_physical",
> +                  "hdcp_physical";
> +
> +      interrupt-parent = <&mdss>;
> +      interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      clocks = <&mmcc MDSS_MDP_CLK>,
> +               <&mmcc MDSS_AHB_CLK>,
> +               <&mmcc MDSS_HDMI_CLK>,
> +               <&mmcc MDSS_HDMI_AHB_CLK>,
> +               <&mmcc MDSS_EXTPCLK_CLK>;
> +      clock-names = "mdp_core",
> +                    "iface",
> +                    "core",
> +                    "alt_iface",
> +                    "extp";
> +
> +      phys = <&hdmi_phy>;
> +      phy-names = "hdmi_phy";
> +      #sound-dai-cells = <1>;
> +
> +      pinctrl-names = "default", "sleep";
> +      pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
> +      pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
> +
> +      core-vdda-supply = <&vreg_l12a_1p8>;
> +      core-vcc-supply = <&vreg_s4a_1p8>;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          endpoint {
> +            remote-endpoint = <&mdp5_intf3_out>;
> +          };
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
> new file mode 100644
> index 000000000000..79193cf71828
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/phy/qcom,hdmi-phy-other.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Same comment

> +
> +title: Qualcomm Adreno/Snapdragon HDMI phy
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    contains:

Remove contains

> +      enum:
> +        - qcom,hdmi-phy-8660
> +        - qcom,hdmi-phy-8960
> +        - qcom,hdmi-phy-8974
> +        - qcom,hdmi-phy-8084
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2

maxItems is enough in such case

> +
> +  reg-names:
> +    items:
> +      - const: hdmi_phy
> +      - const: hdmi_pll
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#phy-cells':
> +    const: 0
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-phy-8960
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: slave_iface
> +        core-vdda-supply:
> +          description: phandle to VDDA supply regulator
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-phy-8974
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: alt_iface
> +        core-vdda-supply:
> +          description: phandle to VDDA supply regulator
> +        vddio-supply:
> +          description: phandle to VDD I/O supply regulator
> +

What are the clocks for other variants? Also between 1-2 with any name?

> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - reg-names
> +  - '#phy-cells'
> +
> +unevaluatedProperties: false

additionalProperties:false

> +
> +examples:
> +  - |
> +    hdmi_phy: phy@4a00400 {
> +      compatible = "qcom,hdmi-phy-8960";
> +      reg-names = "hdmi_phy",
> +                  "hdmi_pll";
> +      reg = <0x4a00400 0x60>,
> +            <0x4a00500 0x100>;
> +      #phy-cells = <0>;
> +      power-domains = <&mmcc 1>;
> +      clock-names = "slave_iface";
> +      clocks = <&clk 21>;
> +      core-vdda-supply = <&pm8921_hdmi_mvs>;
> +    };
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> new file mode 100644
> index 000000000000..2b36a4c3d4c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Same comment

> +
> +title: Qualcomm Adreno/Snapdragon QMP HDMI phy
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    contains:

Remove contains
> +      enum:
> +        - qcom,hdmi-phy-8996
> +
> +  reg:
> +    maxItems: 6
> +
> +  reg-names:
> +    items:
> +      - const: hdmi_pll
> +      - const: hdmi_tx_l0
> +      - const: hdmi_tx_l1
> +      - const: hdmi_tx_l2
> +      - const: hdmi_tx_l3
> +      - const: hdmi_phy
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: ref
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  vcca-supply: true
> +
> +  vddio-supply: true
> +
> +  '#phy-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - reg-names
> +  - '#phy-cells'
> +
> +unevaluatedProperties: false

additionalProperties:false

> +
> +examples:
> +  - |
> +    hdmi-phy@9a0600 {


Best regards,
Krzysztof
