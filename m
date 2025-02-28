Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C15A4A17E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2023410E2DE;
	Fri, 28 Feb 2025 18:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="FwveDW+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E374F10E284
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:27:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ED201102901CC; Fri, 28 Feb 2025 19:27:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740767250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtwTjTpw0Vr5sz6bdwu5/AqqBhdI7OSOUmgECWI+xPM=;
 b=FwveDW+W0Zn4acPWayV/4P1UVN2P1khcGzVmkJVhGS101XEfdWPoOyh8+AG7WIaKam633t
 uDzHhOiDp0imrWhBZMmUREAaLwQdPgPKem8CyvX2T1ZrRDRe1Mh6UsbhOpxE7oH0udlcGc
 IIVEaPn8mfY+5hQHRP7W0n+D3mOSzEocFwefXjspugKDwozTtccc8HXC+FfAY5lxhPEmEw
 MTz7HZz5M7QuqPn20F3ZKC60ni935e0zwSsB3X1fyqFQFFaZUsTJAElVz15dHQATRW/48P
 IIyfxRvvG/LYHhzcD3AEZDxSs/4Onu5JlLRMjcv1dU5uTYt6gWvzKDdvxgC7dA==
Message-ID: <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
Date: Fri, 28 Feb 2025 18:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de> <2153305.bB369e8A3T@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2153305.bB369e8A3T@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 2/28/25 11:36 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3af13173de4bd..36bad211e5558 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -249,6 +249,37 @@ dummy: clock-dummy {
>>   		clock-output-names = "dummy";
>>   	};
>>   
>> +	gpu_fixed_reg: fixed-gpu-reg {
>> +		compatible = "regulator-fixed";
>> +		regulator-min-microvolt = <920000>;
>> +		regulator-max-microvolt = <920000>;
>> +		regulator-name = "vdd_gpu";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
> 
> Is this an internal voltage?

I think so.

>> +
>> +	gpu_opp_table: opp_table {
> 
> Node-Names use dash instead of underscore.

Fixed, thanks.

[...]

>> @@ -1846,6 +1877,37 @@ netc_emdio: mdio@0,0 {
>>   			};
>>   		};
>>   
>> +		gpu_blk_ctrl: reset-controller@4d810000 {
>> +			compatible = "fsl,imx95-gpu-blk-ctrl";
>> +			reg = <0x0 0x4d810000 0x0 0xc>;
> 
> Mh, GPU_BLK_CTRL is /just a bit) more than the GPU reset. Does it make sense
> to make this an gpu-reset-only node, located at 0x4d810008?

The block controller itself is larger, it spans 3 or 4 registers, so 
this should describe the entire block controller here.

>> +			#reset-cells = <1>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>> +			assigned-clock-rates = <133333333>;
>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>> +			status = "disabled";
>> +		};
>> +
>> +		gpu: gpu@4d900000 {
>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>> +			reg = <0 0x4d900000 0 0x480000>;
>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
> 
> There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?

I think I have to describe those clock here too, possibly as 'coregroup' 
clock ?

>> +			clock-names = "core";
>> +			interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gpu", "job", "mmu";
> 
> DT bindings say this order: job, mmu, gpu
Yes, currently it is sorted by IRQ number, fixed.
