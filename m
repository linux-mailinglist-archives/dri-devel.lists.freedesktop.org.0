Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8BB57003
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 08:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418D10E2B1;
	Mon, 15 Sep 2025 06:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="voKqXK/A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D800910E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:02:35 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F625Zj1429273;
 Mon, 15 Sep 2025 01:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757916125;
 bh=n0u4PxfyY4PoKcxJ30zJrCWPuw9liRt9K8tJCU5A/vc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=voKqXK/A+wMyudxPFxyJd/wGyiswo0uMUOQj9Sf27kEBrVrKCO8k7RreRXF8IE2mM
 g3k0WF/MwZcDg9WdtLODVrkKqFluJPjKr08miXXgoG4qvxcoaR2PvhzGRDUinNfgrb
 EdTIeL0iUU5p9FaL26x61RzhQenHRfyjtxneEZKE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F624dX3181974
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 15 Sep 2025 01:02:04 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 01:02:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 01:02:03 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F61vdW3240035;
 Mon, 15 Sep 2025 01:01:58 -0500
Message-ID: <c34213a8-adc2-4cbb-a255-85486e7042d2@ti.com>
Date: Mon, 15 Sep 2025 11:31:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am62: Add support for AM625 OLDI
 IO Control
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
 <20250913064205.4152249-2-s-jain1@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250913064205.4152249-2-s-jain1@ti.com>
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
> Add TI DSS OLDI-IO control registers for AM625 DSS. This is a region of
> 12 32bit registers found in the TI AM625 CTRL_MMR0 register space[0].
> They are used to control the characteristics of the OLDI DATA/CLK IO as
> needed by the DSS display controller node.
> 
> [0]: https://www.ti.com/lit/pdf/spruiv7
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 029380dc1a35..dcc71db8afd4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
>   			assigned-clock-parents = <&k3_clks 157 18>;
>   			#clock-cells = <0>;
>   		};
> +
> +		dss_oldi_io_ctrl: oldi-io-controller@8600 {
> +			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
> +			reg = <0x8600 0x200>;
> +		};
>   	};
>   
>   	dmss: bus@48000000 {

