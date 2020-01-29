Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58714D417
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 00:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E3F6E055;
	Wed, 29 Jan 2020 23:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2666 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jan 2020 23:53:13 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5FD6E055
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 23:53:13 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TN8Glt074646;
 Wed, 29 Jan 2020 17:08:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580339296;
 bh=8M9ojDbSJHfliIaE8Iz+4SUYlSEo4PZfCL4CyB/5na0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QEWBNKRkUCswNAKvV1BrxAfPgSwUz6WepsQkNon0Umj1lkj2osc92fliC0qlMsBIp
 NJxdYeOmOtsk58cBhchZkolqyPjU1f7W4cmXtVCWtFXS025aNJcVmTT5J8GdXFxCLJ
 did3qeDygtr5GIKoV1aT/0aEOnPsnv1MhRLFVkk4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TN8GO0058050
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Jan 2020 17:08:16 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 17:08:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 17:08:15 -0600
Received: from [10.250.70.160] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TN8EUb105462;
 Wed, 29 Jan 2020 17:08:14 -0600
Subject: Re: [PATCH v4 4/8] ARM: DTS: omap3: add sgx gpu child node
To: "H. Nikolaus Schaller" <hns@goldelico.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>, Ralf Baechle
 <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>, James Hogan
 <jhogan@kernel.org>
References: <cover.1576605726.git.hns@goldelico.com>
 <103c92a7d19387860aea406e0356249b02a3cbce.1576605726.git.hns@goldelico.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <3fce9260-12f2-a678-5d09-0def4d02b261@ti.com>
Date: Wed, 29 Jan 2020 18:08:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <103c92a7d19387860aea406e0356249b02a3cbce.1576605726.git.hns@goldelico.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/19 1:02 PM, H. Nikolaus Schaller wrote:
> and add interrupt
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OpenPandora 600 MHz.
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/omap34xx.dtsi | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
> index c4dd9801840d..a858a2e8002d 100644
> --- a/arch/arm/boot/dts/omap34xx.dtsi
> +++ b/arch/arm/boot/dts/omap34xx.dtsi
> @@ -159,7 +159,7 @@
>  		 * are also different clocks, but we do not have any dts users
>  		 * for it.
>  		 */
> -		sgx_module: target-module@50000000 {
> +		target-module@50000000 {
>  			compatible = "ti,sysc-omap2", "ti,sysc";
>  			reg = <0x50000014 0x4>;
>  			reg-names = "rev";
> @@ -169,10 +169,11 @@
>  			#size-cells = <1>;
>  			ranges = <0 0x50000000 0x4000>;
>  
> -			/*
> -			 * Closed source PowerVR driver, no child device
> -			 * binding or driver in mainline
> -			 */
> +			sgx: gpu@0 {
> +				compatible = "ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530";
> +				reg = <0x0 0x4000>;	/* 64kB */


Just for future reference, this range should be 0x10000.

Andrew


> +				interrupts = <21>;
> +			};
>  		};
>  	};
>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
