Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3E8561A6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF0210E1E1;
	Thu, 15 Feb 2024 11:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="j1cyQGYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF3C10E1E1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:34:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FBYCPa104278;
 Thu, 15 Feb 2024 05:34:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707996852;
 bh=gAf2mxcuBIaLKTTKin78CXmfTwaUJE6J4P686AD0TPk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=j1cyQGYN7pK7ojxOKA9TqCcnw07vjMKnTucKqNhcM3RWuPsRQKXVhnG+/sy8igCTl
 OF8di7XXAFWm2QCFLdGU29517vELXYjfV5IgFwylssSiVCU/zgtiNZ3se63xYMb2iL
 2ZY4jY+w4JXTiw47VeWLmQaUCxqVgudvYl92k2X4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FBYCg7027322
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Feb 2024 05:34:12 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 05:34:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 05:34:11 -0600
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FBX1NG008649;
 Thu, 15 Feb 2024 05:34:07 -0600
Message-ID: <2242fca2-3cef-4ef9-adfc-322822e6a24e@ti.com>
Date: Thu, 15 Feb 2024 17:04:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: Add common1 register space for
 AM62x, AM62A & AM65x SoCs
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <praneeth@ti.com>, <j-luthra@ti.com>
References: <20240215083205.2902634-1-devarsht@ti.com>
 <20240215083205.2902634-3-devarsht@ti.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240215083205.2902634-3-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Thanks for the fixes, Devarsh!

On 15/02/24 14:02, Devarsh Thakkar wrote:
> This adds common1 register space for AM62x, AM62A and AM65x SoC's which are
> using TI's Keystone display hardware and supporting it as described in
> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> 
> Fixes: 3618811657b3 ("arm64: dts: ti: k3-am62a-main: Add node for Display SubSystem (DSS)")
> Fixes: 8ccc1073c7bb ("arm64: dts: ti: k3-am62-main: Add node for DSS")
> Fixes: fc539b90eda2 ("arm64: dts: ti: am654: Add DSS node")
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>

Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>

> ---
> V2: Add common1 region for AM62A SoC too
> V3: Add Fixes tag
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi  | 5 +++--
>  arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 5 +++--
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi  | 5 +++--
>  3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index fe0cc4a9a501..8cee4d94cdd3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -779,9 +779,10 @@ dss: dss@30200000 {
>  		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
>  		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
>  		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Used for OLDI */
> -		      <0x00 0x3020b000 0x00 0x1000>; /* vp2: Used as DPI Out */
> +		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI Out */
> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
>  		reg-names = "common", "vidl1", "vid",
> -			    "ovr1", "ovr2", "vp1", "vp2";
> +			    "ovr1", "ovr2", "vp1", "vp2", "common1";
>  		power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
>  		clocks = <&k3_clks 186 6>,
>  			 <&dss_vp1_clk>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index 972971159a62..f475daea548e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -994,9 +994,10 @@ dss: dss@30200000 {
>  		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
>  		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
>  		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Tied OFF in the SoC */
> -		      <0x00 0x3020b000 0x00 0x1000>; /* vp2: Used as DPI Out */
> +		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI Out */
> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
>  		reg-names = "common", "vidl1", "vid",
> -			    "ovr1", "ovr2", "vp1", "vp2";
> +			    "ovr1", "ovr2", "vp1", "vp2", "common1";
>  		power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
>  		clocks = <&k3_clks 186 6>,
>  			 <&k3_clks 186 0>,
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 07010d31350e..ff857117d719 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -991,9 +991,10 @@ dss: dss@4a00000 {
>  		      <0x0 0x04a07000 0x0 0x1000>, /* ovr1 */
>  		      <0x0 0x04a08000 0x0 0x1000>, /* ovr2 */
>  		      <0x0 0x04a0a000 0x0 0x1000>, /* vp1 */
> -		      <0x0 0x04a0b000 0x0 0x1000>; /* vp2 */
> +		      <0x0 0x04a0b000 0x0 0x1000>, /* vp2 */
> +		      <0x0 0x04a01000 0x0 0x1000>; /* common1 */
>  		reg-names = "common", "vidl1", "vid",
> -			"ovr1", "ovr2", "vp1", "vp2";
> +			"ovr1", "ovr2", "vp1", "vp2", "common1";
>  
>  		ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>  
