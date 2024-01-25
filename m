Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC92083C669
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 16:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42E510F90B;
	Thu, 25 Jan 2024 15:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 720 seconds by postgrey-1.36 at gabe;
 Thu, 25 Jan 2024 15:20:27 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A52C10F90B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:20:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PF6dnU032526; Thu, 25 Jan 2024 16:08:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=8rJa20GotSKJ5iYLJMiNzR9xpxHOsQ8NoAB1sa07s0g=; b=D7
 TTtkalkFoqSjrmtTbzqkEYWf0T9ZV2gREaUJrJBA6R89gghKylLEWavUGl/yhfUW
 LsgT5tRu2FGKkxLV1YcVYsM5qdum550LZMRIjjN6PVF0GH59+luVtlAwZVYlLyQk
 C/Lh5MyAQbLXsHzvuGtWWFUrMsJSCP/H96EhyIAQdPywk6mPj6PJ7h+xrjKFvRHO
 HEE2ccs/0GVK33P/2T81jub7vFEW+mBGdeEBMkU7HeFUcoz4YU6xvi0nTzmnABgg
 W7hJ+DOKNnajkVafpjnInEiAIRNaTEehwt0TUZVVX/aEiwBvJamIQOf9JadE4lFW
 Wb0fmGr/Ojqv837nFzYQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vtmf9gpa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 16:08:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B2EF10005D;
 Thu, 25 Jan 2024 16:08:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54B5429D7EE;
 Thu, 25 Jan 2024 16:08:10 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 25 Jan
 2024 16:08:09 +0100
Message-ID: <bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st.com>
Date: Thu, 25 Jan 2024 16:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm: dts: st: fix DSI peripheral clock on
 stm32mp15 boards
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104134434.744497-1-raphael.gallais-pou@foss.st.com>
 <20240104134434.744497-5-raphael.gallais-pou@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240104134434.744497-5-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On 1/4/24 14:44, Raphael Gallais-Pou wrote:
> In RCC driver, 'DSI_K' is a kernel clock while 'DSI' has pclk4 as parent
> clock, which means that it is an APB peripheral clock. Swap the clocks
> in the DSI peripheral clock reference.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---

After updating commit title:

Applied on stm32-next.

Thanks
Alex

>   arch/arm/boot/dts/st/stm32mp157.dtsi          | 2 +-
>   arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp157.dtsi b/arch/arm/boot/dts/st/stm32mp157.dtsi
> index 6197d878894d..97cd24227cef 100644
> --- a/arch/arm/boot/dts/st/stm32mp157.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp157.dtsi
> @@ -20,7 +20,7 @@ gpu: gpu@59000000 {
>   		dsi: dsi@5a000000 {
>   			compatible = "st,stm32-dsi";
>   			reg = <0x5a000000 0x800>;
> -			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
> +			clocks = <&rcc DSI>, <&clk_hse>, <&rcc DSI_PX>;
>   			clock-names = "pclk", "ref", "px_clk";
>   			phy-dsi-supply = <&reg18>;
>   			resets = <&rcc DSI_R>;
> diff --git a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> index afcd6285890c..8634699cc65e 100644
> --- a/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts
> @@ -30,7 +30,7 @@ &cpu1 {
>   };
>   
>   &dsi {
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
> index 39358d902000..3a897fa7e167 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts
> @@ -36,7 +36,7 @@ &cryp1 {
>   
>   &dsi {
>   	phy-dsi-supply = <&scmi_reg18>;
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> index 07ea765a4553..29d6465b1fe6 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts
> @@ -35,7 +35,7 @@ &cryp1 {
>   };
>   
>   &dsi {
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> index 813086ec2489..5acb78f0a084 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts
> @@ -37,7 +37,7 @@ &cryp1 {
>   
>   &dsi {
>   	phy-dsi-supply = <&scmi_reg18>;
> -	clocks = <&rcc DSI_K>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
> +	clocks = <&rcc DSI>, <&scmi_clk CK_SCMI_HSE>, <&rcc DSI_PX>;
>   };
>   
>   &gpioz {
