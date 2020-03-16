Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE1186E36
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 16:06:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FFD6E204;
	Mon, 16 Mar 2020 15:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F456E204
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 15:05:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AFEF32003B;
 Mon, 16 Mar 2020 16:05:50 +0100 (CET)
Date: Mon, 16 Mar 2020 16:05:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 2/2] dt-bindings: Document the Synopsys ARC HDMI TX
 bindings
Message-ID: <20200316150548.GA25294@ravnborg.org>
References: <20200316144647.10416-1-Eugeniy.Paltsev@synopsys.com>
 <20200316144647.10416-3-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316144647.10416-3-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=jIQo8A4GAAAA:8
 a=e5mUnYsNAAAA:8 a=M7aO59fNJ6i23PoMEtIA:9 a=OoSG_5CIhO75MOo9:21
 a=GlqmvLfQ7YiL8mw-:21 a=CjuIK1q_8ugA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eugeniy.

On Mon, Mar 16, 2020 at 05:46:47PM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> HDMI 2.0 TX encoder driver for ARC SoCs.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  .../display/bridge/snps,arc-dw-hdmi.txt       | 73 +++++++++++++++++++

New bindings in DT Schema format please (.yaml files).
We are working on migrating all bindings to DT Schema format.

	Sam

>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
> new file mode 100644
> index 000000000000..d5e006b392cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
> @@ -0,0 +1,73 @@
> +Synopsys DesignWare HDMI 2.0 TX encoder driver for ARC SoCs
> +================================
> +
> +The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
> +with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.
> +
> +These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> +Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> +with the following device-specific properties.
> +
> +
> +Required properties:
> +
> +- compatible : Shall contain
> +  - "snps,dw-hdmi-hsdk" for HSDK4xD compatible HDMI TX
> +
> +- reg: See dw_hdmi.txt.
> +- interrupts: HDMI interrupt number.
> +- clocks: See dw_hdmi.txt.
> +- clock-names: Must contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> +- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
> +  corresponding to the video input of the controller and one port numbered 1
> +  corresponding to its HDMI output.
> +
> +Example:
> +
> +hdmi: hdmi@0x10000 {
> +	compatible = "snps,dw-hdmi-hsdk";
> +	reg = <0x10000 0x10000>;
> +	reg-io-width = <4>;
> +	interrupts = <14>;
> +	clocks = <&apbclk>, <&hdmi_pix_clk>;
> +	clock-names = "iahb", "isfr";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			hdmi_enc_input: endpoint {
> +				remote-endpoint = <&pgu_output>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			hdmi_enc_out: endpoint {
> +				remote-endpoint = <&hdmi_con>;
> +			};
> +		};
> +	};
> +};
> +
> +hdmi-out {
> +	...
> +
> +	port {
> +		hdmi_con: endpoint {
> +			remote-endpoint = <&hdmi_enc_out>;
> +		};
> +	};
> +};
> +
> +pgu {
> +	...
> +
> +	port_o: port {
> +		pgu_output: endpoint {
> +			remote-endpoint = <&hdmi_enc_input>;
> +		};
> +	};
> +};
> -- 
> 2.21.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
