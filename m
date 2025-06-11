Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA4AD5ED9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 21:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08110E715;
	Wed, 11 Jun 2025 19:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XqIX/i3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C63A10E715
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 19:12:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 59E7EA51A10;
 Wed, 11 Jun 2025 19:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775F2C4CEEA;
 Wed, 11 Jun 2025 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749669161;
 bh=MnB19TOfh+7ykleBocTv6CizHYIdFED5uoDIM0y6n9k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XqIX/i3fZR55ETgbwAWPhI0j5uEDBeW4vjrvwLkM2E1Tge9X2zRXHpj0sAFMSHd3J
 Kkaz0/TEmOasYiFG6a4lG6VJsLZh4glznnYUrsgP7/in94ur0D9faWikDPXyDPOtZK
 6eLG0cWS1X9i1+v2+HAqVhQ0ihjAqK1UhfCwqqk1WlEAYkrUQ9eDx8f8cdO+KXqGis
 vghYhn3FjVleOrD4smgdM/CfM/Rjyx8WEMuFquUBQ+S+C+A6UlXlNB6u/lurJ7LUMF
 xPWVRUpsHPIvTm42xXMaue+X3TKer3G2M+8nbet7moPc/V3VqZ5mSJzSmrmenLVt+9
 LteSgWdVkHlqQ==
Message-ID: <47bcce06-9c08-40ee-a22a-bc168952b74a@kernel.org>
Date: Wed, 11 Jun 2025 21:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11.06.25 19:32, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add device tree entries for GPUs in M-series SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 198 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
> index 89c3b211b116e96ee0a5ea0c923c3ab824008307..3b60842045d4c3277e9530a13ef2811774209697 100644
> --- a/arch/arm64/boot/dts/apple/t6000.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6000.dtsi
> @@ -16,3 +16,7 @@ / {
>   };
>   

[....]

>   	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpu_globals: globals {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		gpu_hw_cal_a: hw-cal-a {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		gpu_hw_cal_b: hw-cal-b {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_handoff: uat-handoff {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_pagetables: uat-pagetables {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_ttbs: uat-ttbs {
> +			reg = <0x0 0 0 0>;
> +		};

With W=1 this results in a bunch of new warnings like

arch/arm64/boot/dts/apple/t600x-common.dtsi:391.24-394.5: Warning
(unit_address_vs_reg): /reserved-memory/globals: node has a reg or
ranges property, but no unit name

but I'm not sure it's possible to fix that without making up fake
addresses that then get overwritten here. Would be nice to fix this some
other way but I'm not sure how and so far we don't enforce "no
additional W=1 warnings", so:


Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven



