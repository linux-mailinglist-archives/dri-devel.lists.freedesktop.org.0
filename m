Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4FB570C7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 08:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1840310E331;
	Mon, 15 Sep 2025 06:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OaYUMthy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3087 seconds by postgrey-1.36 at gabe;
 Mon, 15 Sep 2025 06:58:38 UTC
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B61010E327
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:58:38 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F66qpD979199;
 Mon, 15 Sep 2025 01:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757916412;
 bh=cPfd07ZOdvUhzODlvHhJl75jq74vTGl43U5ZELEC+hQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=OaYUMthyr33aAC7dzCX+PEMhliUlbpvZGq0mAsf11GEWYWfILThL2tt8dE3t9qx7D
 eszInXNJSlZMdht14Kv0TvAkopuGwLqdcKm4TRA4Tb3ff50rxa+5S+yy+1VoYogtei
 6Kkv7lcwH1cfiCJNndoR+v7v0Qr22OqtqFuIR9q0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F66qGX3184091
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 15 Sep 2025 01:06:52 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 01:06:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 01:06:52 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F66jEK3245914;
 Mon, 15 Sep 2025 01:06:46 -0500
Message-ID: <cc5a5e12-4e71-4662-9a0d-f925c5bc50ed@ti.com>
Date: Mon, 15 Sep 2025 11:36:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am625: Add OLDI support
To: Swamil Jain <s-jain1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
 <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250913064205.4152249-1-s-jain1@ti.com>
 <20250913064205.4152249-3-s-jain1@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250913064205.4152249-3-s-jain1@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 13/09/25 12:12, Swamil Jain wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The AM625 SoC has 2 OLDI TXes under the DSS. Add their support.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 47 ++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index dcc71db8afd4..d240c157d819 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -793,6 +793,53 @@ dss: dss@30200000 {
>   		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
>   		status = "disabled";
>   
> +		oldi-transmitters {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			oldi0: oldi@0 {
> +				reg = <0>;
> +				clocks = <&k3_clks 186 0>;
> +				clock-names = "serial";
> +				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					oldi0_port0: port@0 {
> +						reg = <0>;
> +					};
> +
> +					oldi0_port1: port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +
> +			oldi1: oldi@1 {
> +				reg = <1>;
> +				clocks = <&k3_clks 186 0>;
> +				clock-names = "serial";
> +				ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					oldi1_port0: port@0 {
> +						reg = <0>;
> +					};
> +
> +					oldi1_port1: port@1 {
> +						reg = <1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		dss_ports: ports {
>   			#address-cells = <1>;
>   			#size-cells = <0>;

