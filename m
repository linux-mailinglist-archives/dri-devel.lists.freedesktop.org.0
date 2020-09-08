Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0182612F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 16:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0996E84C;
	Tue,  8 Sep 2020 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009896E84C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 14:51:04 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C25E53B;
 Tue,  8 Sep 2020 16:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599576660;
 bh=/cK59t8GP4lrx2MFKT2wagK882I88lbeRzHoCNEQFE0=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=igiBt8c/5Kly3IfGgFpTHUB70ymR5EPHC75hVQLiUtq5/3fbqoynTSd9QLplqWmMw
 kBJLFfkiE+tCgekC8t3Hec7GCpG1VXqFThgwdfvDrhIKvD3XhxGiC0NpchBUIQijE+
 DymYohoh1e2PpwFVic5aERuQQpuo9RkhAo0Qk2I0=
Subject: Re: [PATCH v2 05/10] arm64: dts: renesas: r8a77961: Add FCP device
 nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Laurent
 <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <cba5bbe0-0c68-0950-5cba-5fb10c9a51f4@ideasonboard.com>
Date: Tue, 8 Sep 2020 15:50:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

On 08/09/2020 01:34, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds FCP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 52 +++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 0abfea0b27be..fe0db11b9cb9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2004,6 +2004,58 @@ pciec1: pcie@ee800000 {
>  			status = "disabled";
>  		};
>  
> +		fcpf0: fcp@fe950000 {
> +			compatible = "renesas,fcpf";
> +			reg = <0 0xfe950000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 615>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 615>;
> +		};
> +
> +		fcpvb0: fcp@fe96f000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfe96f000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 607>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 607>;
> +		};
> +
> +		fcpvi0: fcp@fe9af000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfe9af000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 611>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 611>;
> +			iommus = <&ipmmu_vc0 19>;
> +		};
> +
> +		fcpvd0: fcp@fea27000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea27000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 603>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 603>;
> +			iommus = <&ipmmu_vi0 8>;
> +		};
> +
> +		fcpvd1: fcp@fea2f000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea2f000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 602>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 602>;
> +			iommus = <&ipmmu_vi0 9>;
> +		};
> +
> +		fcpvd2: fcp@fea37000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea37000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 601>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 601>;
> +			iommus = <&ipmmu_vi0 10>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			reg = <0 0xfea80000 0 0x10000>;
>  			/* placeholder */
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
