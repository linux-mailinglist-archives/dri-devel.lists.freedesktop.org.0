Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EBE663847
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 05:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E734288FB2;
	Tue, 10 Jan 2023 04:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7740B882D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 04:40:30 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu8so16446644lfb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 20:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/VZBjH5gsDW8KxWmn2J15tQmqPxdBBAnZYWi6vDDbs=;
 b=xHCza/ulC/757X8uz95BgN6GgBV+gfNjAAnpslrE0Pk98pz+X+XrB5ryXOMqCQp/lz
 +ZqnIyy6w2Ln6RCAgbLxZ+XtrS2GaRKbDJr2oIbJXMjrX2k7M+gothSwZx0vdvsZx/T1
 FstD6iNibSDIIn+2P7hUqiVJykj7u/mm5lArpSYKwWDj0Y8n2tM2X5oLphytvi+50ypt
 jwecNsKS6Rgc05ITe2C03Fys+vqra3ZoT+uVVeHPnS12qeyfpKZLWywggIk19cN6I5Fx
 j7w2hpq5viFDRfVZD9JAfjGwcpN6oqI+YNpyVqiYs8NpY1cEkjJXvSVVRovJ8JrH12D3
 fEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/VZBjH5gsDW8KxWmn2J15tQmqPxdBBAnZYWi6vDDbs=;
 b=e6Ox/geD7iCxEmH/kAjy+U2ad2MuOBNwgA6lh+0qbenNR5m2CT+95XYAlZnf/Pim5x
 BUiGf2ijFFh9SpJDiqy9ed2Wv5TWTL5CwexIbxIeQgZ1zZbSoDuFAkQsGtTozhIWdWfv
 2ftZLm3dSKZCxPbX28bcvnpLHWCqNyvFcfXPQJWFUdpEscu50mHi9LuPp9SwqOJangyu
 f0oHQkBrG4yCHXYweRtCRMlxYdfR6yR9QBED+3U1dYamy/edwEA9eDoFVTiive3YFKBe
 1x+v68kTpul/GId3Wf/2ekvtCZvC0hgwLlqpMHSGLYe4n2UEHnUiVwSuqBi8+fprAxPa
 iBSA==
X-Gm-Message-State: AFqh2koQgoLNXNNJaY+JneodFsukr1TKTAtTvXDWNd44egua8MjSHLPq
 LTVD/Z+ebul5Xb63NLTdSTLiCw==
X-Google-Smtp-Source: AMrXdXvTdGbxR0RsotmD/7b3sXVQ4L0DS5K1zU2dWDJWe0FpmgjsFSMxj1XCSbT/lCjTQdDPe1h29w==
X-Received: by 2002:a05:6512:1104:b0:4bb:35c9:dfbb with SMTP id
 l4-20020a056512110400b004bb35c9dfbbmr21380202lfg.1.1673325628762; 
 Mon, 09 Jan 2023 20:40:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y19-20020ac24473000000b004946b549a19sm1975196lfl.45.2023.01.09.20.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 20:40:28 -0800 (PST)
Message-ID: <997dbd09-03d6-d60d-1dce-db0bc6415582@linaro.org>
Date: Tue, 10 Jan 2023 06:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
 <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109074947.5vnfrn6shzpm6iqi@SoMainline.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 09:49, Marijn Suijten wrote:
> On 2023-01-09 07:01:49, Dmitry Baryshkov wrote:
>> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>>   - MSM8996 has additional "iommu" clock, define it separately
>>   - Add new properties used on some of platforms:
>>     - interconnects, interconnect-names
>>     - iommus
>>     - power-domains
>>     - operating-points-v2, opp-table
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
>>   .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
>>   2 files changed, 138 insertions(+), 132 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
>> deleted file mode 100644
>> index 65d03c58dee6..000000000000
>> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
>> +++ /dev/null
>> @@ -1,132 +0,0 @@
>> -Qualcomm adreno/snapdragon MDP5 display controller
>> -
>> -Description:
>> -
>> -This is the bindings documentation for the MDP5 display
>> -controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
>> -
>> -MDP5:
>> -Required properties:
>> -- compatible:
>> -  * "qcom,mdp5" - MDP5
>> -- reg: Physical base address and length of the controller's registers.
>> -- reg-names: The names of register regions. The following regions are required:
>> -  * "mdp_phys"
>> -- interrupts: Interrupt line from MDP5 to MDSS interrupt controller.
>> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
>> -- clock-names: the following clocks are required.
>> --   * "bus"
>> --   * "iface"
>> --   * "core"
>> --   * "vsync"
>> -- ports: contains the list of output ports from MDP. These connect to interfaces
>> -  that are external to the MDP hardware, such as HDMI, DSI, EDP etc (LVDS is a
>> -  special case since it is a part of the MDP block itself).
>> -
>> -  Each output port contains an endpoint that describes how it is connected to an
>> -  external interface. These are described by the standard properties documented
>> -  here:
>> -	Documentation/devicetree/bindings/graph.txt
>> -	Documentation/devicetree/bindings/media/video-interfaces.txt
>> -
>> -  The availability of output ports can vary across SoC revisions:
>> -
>> -  For MSM8974 and APQ8084:
>> -	 Port 0 -> MDP_INTF0 (eDP)
>> -	 Port 1 -> MDP_INTF1 (DSI1)
>> -	 Port 2 -> MDP_INTF2 (DSI2)
>> -	 Port 3 -> MDP_INTF3 (HDMI)
>> -
>> -  For MSM8916:
>> -	 Port 0 -> MDP_INTF1 (DSI1)
>> -
>> -  For MSM8994 and MSM8996:
>> -	 Port 0 -> MDP_INTF1 (DSI1)
>> -	 Port 1 -> MDP_INTF2 (DSI2)
>> -	 Port 2 -> MDP_INTF3 (HDMI)
>> -
>> -Optional properties:
>> -- clock-names: the following clocks are optional:
>> -  * "lut"
>> -  * "tbu"
>> -  * "tbu_rt"
>> -
>> -Example:
>> -
>> -/ {
>> -	...
>> -
>> -	mdss: mdss@1a00000 {
>> -		compatible = "qcom,mdss";
>> -		reg = <0x1a00000 0x1000>,
>> -		      <0x1ac8000 0x3000>;
>> -		reg-names = "mdss_phys", "vbif_phys";
>> -
>> -		power-domains = <&gcc MDSS_GDSC>;
>> -
>> -		clocks = <&gcc GCC_MDSS_AHB_CLK>,
>> -			 <&gcc GCC_MDSS_AXI_CLK>,
>> -			 <&gcc GCC_MDSS_VSYNC_CLK>;
>> -		clock-names = "iface",
>> -			      "bus",
>> -			      "vsync"
>> -
>> -		interrupts = <0 72 0>;
>> -
>> -		interrupt-controller;
>> -		#interrupt-cells = <1>;
>> -
>> -		#address-cells = <1>;
>> -		#size-cells = <1>;
>> -		ranges;
>> -
>> -		mdp: mdp@1a01000 {
>> -			compatible = "qcom,mdp5";
>> -			reg = <0x1a01000 0x90000>;
>> -			reg-names = "mdp_phys";
>> -
>> -			interrupt-parent = <&mdss>;
>> -			interrupts = <0 0>;
>> -
>> -			clocks = <&gcc GCC_MDSS_AHB_CLK>,
>> -				 <&gcc GCC_MDSS_AXI_CLK>,
>> -				 <&gcc GCC_MDSS_MDP_CLK>,
>> -				 <&gcc GCC_MDSS_VSYNC_CLK>;
>> -			clock-names = "iface",
>> -				      "bus",
>> -				      "core",
>> -				      "vsync";
>> -
>> -			ports {
>> -				#address-cells = <1>;
>> -				#size-cells = <0>;
>> -
>> -				port@0 {
>> -					reg = <0>;
>> -					mdp5_intf1_out: endpoint {
>> -						remote-endpoint = <&dsi0_in>;
>> -					};
>> -				};
>> -			};
>> -		};
>> -
>> -		dsi0: dsi@1a98000 {
>> -			...
>> -			ports {
>> -				...
>> -				port@0 {
>> -					reg = <0>;
>> -					dsi0_in: endpoint {
>> -						remote-endpoint = <&mdp5_intf1_out>;
>> -					};
>> -				};
>> -				...
>> -			};
>> -			...
>> -		};
>> -
>> -		dsi_phy0: dsi-phy@1a98300 {
>> -			...
>> -		};
>> -	};
>> -};
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
>> new file mode 100644
>> index 000000000000..cbcbe8b47e9b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
>> @@ -0,0 +1,138 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Adreno/Snapdragon Mobile Display controller (MDP5)
>> +
>> +description: >
>> +  MDP5 display controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994
>> +  and MSM8996.
>> +
>> +maintainers:
>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> +  - Rob Clark <robdclark@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,mdp5
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mdp_phys
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 4
>> +    maxItems: 7
>> +
>> +  clock-names:
>> +    oneOf:
>> +      - minItems: 4
>> +        items:
>> +          - const: iface
>> +          - const: bus
>> +          - const: core
>> +          - const: vsync
>> +          - const: lut
>> +          - const: tbu
>> +          - const: tbu_rt
>> +        #MSM8996 has additional iommu clock
>> +      - items:
>> +          - const: iface
>> +          - const: bus
>> +          - const: core
>> +          - const: iommu
>> +          - const: vsync
>> +
>> +  interconnects:
>> +    minItems: 1
>> +    items:
>> +      - description: Interconnect path from mdp0 (or a single mdp) port to the data bus
>> +      - description: Interconnect path from mdp1 port to the data bus
>> +      - description: Interconnect path from rotator port to the data bus
>> +
>> +  interconnect-names:
>> +    minItems: 1
>> +    items:
>> +      - const: mdp0-mem
>> +      - const: mdp1-mem
>> +      - const: rotator-mem
>> +
>> +  iommus:
>> +    items:
>> +      - description: Phandle to apps_smmu node with SID mask for Hard-Fail port0
> 
> As Krzysztof has said many times, these documents describe the hardware,
> not the DT format.  Drop the "phandle" part.

Ack

> 
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +  opp-table:
>> +    type: object
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description: |
> 
> Should multiline descriptions be treated as a oneline string with `>`?

Ack, I'm fine with either of them, let's use the >

> 
>> +      Contains the list of output ports from DPU device. These ports
>> +      connect to interfaces that are external to the DPU hardware,
>> +      such as DSI, DP etc. MDP5 devices support up to 4 ports::
> 
> How do these double colons render?  Is this intentional?

double colons is an escape for a single colon if I remember correcly.

BTW: how to render the DT schema?

> 
> - Marijn
> 
>> +      one or two DSI ports, HDMI and eDP.
>> +
>> +    patternProperties:
>> +      "^port@[0-3]+$":
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +    # at least one port is required
>> +    required:
>> +      - port@0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    display-controller@1a01000 {
>> +        compatible = "qcom,mdp5";
>> +        reg = <0x1a01000 0x90000>;
>> +        reg-names = "mdp_phys";
>> +
>> +        interrupt-parent = <&mdss>;
>> +        interrupts = <0>;
>> +
>> +        clocks = <&gcc GCC_MDSS_AHB_CLK>,
>> +                 <&gcc GCC_MDSS_AXI_CLK>,
>> +                 <&gcc GCC_MDSS_MDP_CLK>,
>> +                 <&gcc GCC_MDSS_VSYNC_CLK>;
>> +        clock-names = "iface",
>> +                      "bus",
>> +                      "core",
>> +                      "vsync";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                endpoint {
>> +                    remote-endpoint = <&dsi0_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>> -- 
>> 2.39.0
>>

-- 
With best wishes
Dmitry

