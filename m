Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A5A5C79D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 16:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2641C10E5C0;
	Tue, 11 Mar 2025 15:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HjYyUw/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3708810E5BB;
 Tue, 11 Mar 2025 15:37:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5CFE5C65C1;
 Tue, 11 Mar 2025 15:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF956C4CEEA;
 Tue, 11 Mar 2025 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741707421;
 bh=6MY+p+THkRLPDJf4bpCm16v7GT3wOaJEbrTnEIllu/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HjYyUw/lf6uzVXxn+qnTyXm9oCP52lArYSzZvoKk+6DHf3d5wD31s0RM9RWQaj86x
 doZcgNSmhjkb86YsxSwO/tPTGlaOHEUeL1sPuWO0Q+m0YNNjiNQqs41Hoen3nVKOUa
 H/1JvTxD3Y9PV2RraIdsQefBxr3yweepjTYXry2yxQIW5OUJA4NEsjFPR+KQo0Nhh8
 ixFfmbB1sjMX6XKTC/up8/BFwmZjCyG+XR9DPvgIINpgVJ0iRVPTtYpuqTYygRFGUJ
 qhZti1CoHKysnzP45rzhSufZ35yK4+RHCgYy9j2LPltRJow3dlEO1oGWirN7Lvt+de
 2rdB+n/lvv31Q==
Date: Tue, 11 Mar 2025 17:36:53 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 03/10] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P
Message-ID: <emlstgunwzmmymq7pu7ouuzpo5jamatsfqbkbfah25gnvwb3gl@y6t2lxl7vwsy>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-4-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-4-quic_amakhija@quicinc.com>
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

On Tue, Mar 11, 2025 at 05:54:38PM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on SA8775P platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index a90a8b3f1a9e..628ca68871f4 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -52,6 +52,26 @@ patternProperties:
>          items:
>            - const: qcom,sa8775p-dp
>  
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sa8775p-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
> +
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,sa8775p-dsi-phy-5nm
> +          - qcom,sa8775p-edp-phy

This does more than is written in the commit message: it also adds eDP
PHY as a possible child. Please expand the commit message to account for
that.

> +
>  required:
>    - compatible
>  
> @@ -131,6 +151,20 @@ examples:
>                          remote-endpoint = <&mdss0_dp0_in>;
>                      };
>                  };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&mdss0_dsi0_in>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    dpu_intf2_out: endpoint {
> +                        remote-endpoint = <&mdss0_dsi1_in>;
> +                    };
> +                };
>              };
>  
>              mdss0_mdp_opp_table: opp-table {
> @@ -158,6 +192,160 @@ examples:
>              };
>          };
>  
> +        dsi@ae94000 {
> +            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae94000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <4>;
> +
> +            clocks = <&dispc_byte_clk>,
> +                     <&dispcc_intf_clk>,
> +                     <&dispcc_pclk>,
> +                     <&dispcc_esc_clk>,
> +                     <&dispcc_ahb_clk>,
> +                     <&gcc_bus_clk>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +            assigned-clocks = <&dispcc_byte_clk>,
> +                              <&dispcc_pclk>;
> +            assigned-clock-parents = <&mdss0_dsi0_phy 0>, <&mdss0_dsi0_phy 1>;
> +            phys = <&mdss0_dsi0_phy>;
> +
> +            operating-points-v2 = <&dsi0_opp_table>;
> +            power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss0_dsi0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss0_dsi0_out: endpoint { };
> +                };
> +            };
> +
> +            dsi0_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-358000000 {
> +                    opp-hz = /bits/ 64 <358000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +            };
> +        };
> +
> +        mdss0_dsi0_phy: phy@ae94400 {
> +            compatible = "qcom,sa8775p-dsi-phy-5nm";
> +            reg = <0x0ae94400 0x200>,
> +                  <0x0ae94600 0x280>,
> +                  <0x0ae94900 0x27c>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc_iface_clk>,
> +                     <&rpmhcc_ref_clk>;
> +            clock-names = "iface", "ref";
> +
> +            vdds-supply = <&vreg_dsi_supply>;
> +        };
> +
> +        dsi@ae96000 {
> +            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae96000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <4>;
> +
> +            clocks = <&dispc_byte_clk>,
> +                     <&dispcc_intf_clk>,
> +                     <&dispcc_pclk>,
> +                     <&dispcc_esc_clk>,
> +                     <&dispcc_ahb_clk>,
> +                     <&gcc_bus_clk>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +            assigned-clocks = <&dispcc_byte_clk>,
> +                              <&dispcc_pclk>;
> +            assigned-clock-parents = <&mdss0_dsi1_phy 0>, <&mdss0_dsi1_phy 1>;
> +            phys = <&mdss0_dsi1_phy>;
> +
> +            operating-points-v2 = <&dsi1_opp_table>;
> +            power-domains = <&rpmhpd SA8775P_MMCX>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss0_dsi1_in: endpoint {
> +                        remote-endpoint = <&dpu_intf2_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss0_dsi1_out: endpoint { };
> +                };
> +            };
> +
> +            dsi1_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-358000000 {
> +                    opp-hz = /bits/ 64 <358000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +            };
> +        };
> +
> +        mdss0_dsi1_phy: phy@ae96400 {
> +            compatible = "qcom,sa8775p-dsi-phy-5nm";
> +            reg = <0x0ae96400 0x200>,
> +                  <0x0ae96600 0x280>,
> +                  <0x0ae96900 0x27c>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc_iface_clk>,
> +                     <&rpmhcc_ref_clk>;
> +            clock-names = "iface", "ref";
> +
> +            vdds-supply = <&vreg_dsi_supply>;
> +        };
> +
>          displayport-controller@af54000 {
>              compatible = "qcom,sa8775p-dp";
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
