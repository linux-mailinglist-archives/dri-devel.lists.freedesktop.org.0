Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F57857801
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4110E40E;
	Fri, 16 Feb 2024 08:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="SsTNCG6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271AC10E261
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 05:36:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41G5aCXF093423;
 Thu, 15 Feb 2024 23:36:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1708061772;
 bh=w4YhGTK+t27RaSNPXnZt3dIUmjnBjmFi3fc525Pd/Ok=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=SsTNCG6zI1H0UbO7K0MjzmdianYqMiZw566yUj8DUZo+NdirokPOgJt3Xv9BARR7z
 Ux+q0Ebp2Lii4BY01MzGfZCmHgpZjdoB0pDFw7SeVD3tCvKojz/pWzBHHSDac74/V+
 4SMXGVIwpZBlfjX/vJeqapP5voOfv/dk/oApZh9o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41G5aCkG063356
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Feb 2024 23:36:12 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 23:36:12 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 23:36:12 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41G5a6C9032963;
 Thu, 15 Feb 2024 23:36:07 -0600
Message-ID: <d2b6dcda-cd22-4163-bdf5-2bc4b8e276ea@ti.com>
Date: Fri, 16 Feb 2024 11:06:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: ti: Add common1 register space for
 AM62x, AM62A & AM65x SoCs
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <kristo@kernel.org>
CC: <praneeth@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>
References: <20240215115516.3157909-1-devarsht@ti.com>
 <20240215115516.3157909-3-devarsht@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20240215115516.3157909-3-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 16 Feb 2024 08:52:17 +0000
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



On 15/02/24 17:25, Devarsh Thakkar wrote:
> This adds common1 register space for AM62x, AM62A and AM65x SoC's which are
> using TI's Keystone display hardware and supporting it as described in
> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> 
> Fixes: 3618811657b3 ("arm64: dts: ti: k3-am62a-main: Add node for Display SubSystem (DSS)")
> Fixes: 8ccc1073c7bb ("arm64: dts: ti: k3-am62-main: Add node for DSS")
> Fixes: fc539b90eda2 ("arm64: dts: ti: am654: Add DSS node")

This doesn't work. Patch wont apply cleanly to kernels before before
AM62A was introduced.

Please split this into 3 patches, one per SoC with appropriate Fixes: tag.

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Reviewed-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
> V2: Add common1 region for AM62A SoC too
> V3: Add Fixes tag
> V4: Add Reviewed-by
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

-- 
Regards
Vignesh
