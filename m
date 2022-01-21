Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733CE49678C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1A310E487;
	Fri, 21 Jan 2022 21:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A3D10E330;
 Fri, 21 Jan 2022 21:49:59 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so13385872otc.13; 
 Fri, 21 Jan 2022 13:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cla5utnnAhuJDM3Ba4UrEnsvug9bFUpvvhmFQHx+5f8=;
 b=cnkebmJLGxSuA0PbnjyD8Z0eCte5poLidlOzyh7owVTQR4/wRXKj0KZlUvYnB5y2ft
 kGzvSAZjnfUjhH/nfcl/K5Yl8dHz17DwskHi02isLcATfM9VEh152TweI+GrtrO8TMgo
 9upHllk8p+pkD2+up7tevuQbWZxD9xGxyfuaksDxJBCQ3ceGvOORIEhoD/ZOj+nP84/0
 DO+jt6KdSrorGxaxDeQw9GUYywu2K1icux1xo8EKJlnqtM6TPwztuGmB7/xGOu8mzueg
 vpPob3nbqMh4FwfjkyFUBGUTwLEtAxNsGUw+lArBRdR0YHsy/AvkVwgaSsI2nnmACa6T
 OW7g==
X-Gm-Message-State: AOAM531zM0/4d1SBd+2R+RER+epZttX8fFAILTyoa2+/NN7ipjpQezrj
 BCishj3XcSm7i6RwzK+/ZA==
X-Google-Smtp-Source: ABdhPJyTKkVc2kl9eHDW3eQTgJJGixn3USMXDCNqg81kmMUUD4wndrMFVmhrJlZQM3VZ3En169cI6A==
X-Received: by 2002:a05:6830:418a:: with SMTP id
 r10mr4148535otu.361.1642801798704; 
 Fri, 21 Jan 2022 13:49:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u65sm30739oie.18.2022.01.21.13.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:49:57 -0800 (PST)
Received: (nullmailer pid 1651978 invoked by uid 1000);
 Fri, 21 Jan 2022 21:49:56 -0000
Date: Fri, 21 Jan 2022 15:49:56 -0600
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v3] dt-bindings: display/msm: hdmi: split and convert to
 yaml
Message-ID: <YesqhI8LwrnBF3Oj@robh.at.kernel.org>
References: <20220109000348.106534-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109000348.106534-1-david@ixit.cz>
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
Cc: Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Sean Paul <sean@poorly.run>,
 ~okias/devicetree@lists.sr.ht, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 09, 2022 at 01:03:47AM +0100, David Heidelberg wrote:
> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
> 
> Other changes:
>  - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>  - phy part moved into phy/ directory
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v2:
>  - move phy into phy/
>  - added maxItems for gpios
>  - simplified pinctrl-names
>  - dropped some inconsistent quotes
> 
> v3:
>  - adjusted $id of phy file to the new path from v2
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/msm/hdmi.txt  |  99 ---------
>  .../bindings/display/msm/qcom,hdmi.yaml       | 206 ++++++++++++++++++
>  .../bindings/phy/qcom,hdmi-phy.yaml           | 119 ++++++++++
>  3 files changed, 325 insertions(+), 99 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy.yaml
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
> index 000000000000..33ebc879af93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
> @@ -0,0 +1,206 @@
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
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hdmi-tx-8996
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: iface
> +            - const: core
> +            - const: alt_iface
> +            - const: extp
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 5
> +
> +        clock-names:
> +          minItems: 1
> +          maxItems: 5

So for !8996 we have a 1-5 undefined clocks? Though like all the other 
messes I imagine there's 5 different variations.

> +
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hdmi-tx-8996
> +      - qcom,hdmi-tx-8994
> +      - qcom,hdmi-tx-8084
> +      - qcom,hdmi-tx-8974
> +      - qcom,hdmi-tx-8660
> +      - qcom,hdmi-tx-8960
> +
> +  clocks: true
> +
> +  clock-names: true
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

Don't need a generic description.

> +
> +  power-domains:
> +    description: should be <&mmcc MDSS_GDSC>

Drop. Should be 'maxItems: 1'.

> +
> +  core-vdda-supply: true
> +
> +  core-vcc-supply: true
> +
> +  hdmi-mux-supply:
> +    description: phandle to mux regulator
> +
> +  phys:
> +    description: the phandle for the HDMI PHY device

How many?

> +
> +  phy-names:
> +    description: the name of the corresponding PHY device

names?

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
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  '#phy-cells':
> +    const: 0

The HDMI block is a phy provider?

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
> +        unevaluatedProperties: false
> +        description: |
> +          Input endpoints of the controller.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                maxItems: 4
> +                minItems: 4
> +                items:
> +                  enum: [0, 1, 2, 3]
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: |
> +          Output endpoints of the controller.
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                maxItems: 4
> +                minItems: 4
> +                items:
> +                  enum: [0, 1, 2, 3]
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi: hdmi@4a00000 {
> +      compatible = "qcom,hdmi-tx-8960";
> +      reg-names = "core_physical";
> +      reg = <0x04a00000 0x2f0>;
> +      interrupts = <0 79 0>;
> +      power-domains = <&mmcc 1>;
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
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy.yaml
> new file mode 100644
> index 000000000000..1203b0c6709f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: "http://devicetree.org/schemas/phy/qcom,hdmi-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Adreno/Snapdragon HDMI phy
> +
> +maintainers:
> +  - Rob Clark <robdclark@gmail.com>
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hdmi-phy-8996
> +    then:
> +      properties:
> +        reg:
> +          minItems: 6
> +          maxItems: 6
> +
> +        reg-names:
> +          items:
> +            - const: hdmi_pll
> +            - const: hdmi_tx_l0
> +            - const: hdmi_tx_l1
> +            - const: hdmi_tx_l2
> +            - const: hdmi_tx_l3
> +            - const: hdmi_phy
> +
> +    else:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: hdmi_phy
> +            - const: hdmi_pll
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hdmi-phy-8960
> +    then:
> +      properties:
> +        clock-names:
> +          const: slave_iface
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hdmi-phy-8996
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: iface
> +            - const: ref
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - qcom,hdmi-phy-8084
> +        - qcom,hdmi-phy-8660
> +        - qcom,hdmi-phy-8960
> +        - qcom,hdmi-phy-8974
> +        - qcom,hdmi-phy-8994
> +        - qcom,hdmi-phy-8996
> +
> +  reg: true
> +
> +  reg-names: true
> +
> +  clocks: true
> +
> +  clock-names: true
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  core-vdda-supply: true
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
> +  - reg
> +  - reg-names
> +  - '#phy-cells'
> +
> +additionalProperties: false
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
> -- 
> 2.34.1
> 
> 
