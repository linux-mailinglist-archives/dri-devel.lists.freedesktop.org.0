Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF209542227
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 08:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771E210E18B;
	Wed,  8 Jun 2022 06:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 538 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jun 2022 06:46:24 UTC
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481F010E295;
 Wed,  8 Jun 2022 06:46:24 +0000 (UTC)
Received: from [10.0.0.209] (_gateway [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 133132007F;
 Wed,  8 Jun 2022 08:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1654670242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQWAM2+Oy2QQku1a4j0zeYTKANEXZbLJmb5QlDhuAok=;
 b=GzoMy8imyUp0RGEdV2StlNqhYZE2wXuH+OB+wi2F5ch9PSgsGQyAvM8LphsMGG4myh5R7g
 GmmSuKkJOmvAHpCLeUgQUSz0aTDAUianJMbFHJpe4QFTWzTU5n3kpQSAyIQzP7tQd01N/u
 2HkGhP1yqNPmPNhG4hbSbIGBG3VQbac=
Message-ID: <7222b152-9cb8-f406-53a4-e3c5b800521a@ixit.cz>
Date: Wed, 8 Jun 2022 08:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
 <20220607185806.2771739-2-dmitry.baryshkov@linaro.org>
From: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v1 1/7] dt-bindings: display/msm: hdmi: split and convert
 to yaml
In-Reply-To: <20220607185806.2771739-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you for bringing it back to life!

Reviewed-by: David Heidelberg <david@ixit.cz>

On 07/06/2022 20:58, Dmitry Baryshkov wrote:
> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
>
> Changes to schema:
> HDMI:
>   - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>
> PHY:
>   - moved into phy/ directory
>   - split into QMP and non-QMP PHY schemas
>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
>   .../bindings/display/msm/qcom,hdmi.yaml       | 237 ++++++++++++++++++
>   .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
>   .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  84 +++++++
>   4 files changed, 424 insertions(+), 99 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
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
> +
> +  phys:
> +    description: the phandle for the HDMI PHY device
> +    maxItems: 1
> +
> +  phy-names:
> +    enum:
> +      - hdmi_phy
> +      - hdmi-phy
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
> +
> +examples:
> +  - |
> +    hdmi: hdmi@4a00000 {
> +      compatible = "qcom,hdmi-tx-8960";
> +      reg-names = "core_physical";
> +      reg = <0x04a00000 0x2f0>;
> +      interrupts = <0 79 0>;
> +      clock-names =
> +          "core",
> +          "master_iface",
> +          "slave_iface";
> +      clocks =
> +          <&clk 61>,
> +          <&clk 72>,
> +          <&clk 98>;
> +      qcom,hdmi-tx-ddc-clk-gpios = <&msmgpio 70 0>;
> +      qcom,hdmi-tx-ddc-data-gpios = <&msmgpio 71 0>;
> +      hpd-gpios = <&msmgpio 72 0>;
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
> +
> +title: Qualcomm Adreno/Snapdragon HDMI phy
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - qcom,hdmi-phy-8660
> +        - qcom,hdmi-phy-8960
> +        - qcom,hdmi-phy-8974
> +        - qcom,hdmi-phy-8084
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
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
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - reg-names
> +  - '#phy-cells'
> +
> +unevaluatedProperties: false
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
> +
> +title: Qualcomm Adreno/Snapdragon QMP HDMI phy
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +properties:
> +  compatible:
> +    contains:
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
> +
> +examples:
> +  - |
> +    hdmi-phy@9a0600 {
> +      compatible = "qcom,hdmi-phy-8996";
> +      reg = <0x009a0600 0x1c4>,
> +            <0x009a0a00 0x124>,
> +            <0x009a0c00 0x124>,
> +            <0x009a0e00 0x124>,
> +            <0x009a1000 0x124>,
> +            <0x009a1200 0x0c8>;
> +      reg-names = "hdmi_pll",
> +                  "hdmi_tx_l0",
> +                  "hdmi_tx_l1",
> +                  "hdmi_tx_l2",
> +                  "hdmi_tx_l3",
> +                  "hdmi_phy";
> +
> +      clocks = <&mmcc 116>,
> +               <&gcc 214>;
> +      clock-names = "iface",
> +                    "ref";
> +      #phy-cells = <0>;
> +
> +      vddio-supply = <&vreg_l12a_1p8>;
> +      vcca-supply = <&vreg_l28a_0p925>;
> +    };

-- 
David Heidelberg
Consultant Software Engineer

Matrix: @okias:matrix.org

