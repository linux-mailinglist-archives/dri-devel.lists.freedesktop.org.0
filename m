Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449B5A6C3D1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 21:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC0710E84E;
	Fri, 21 Mar 2025 20:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="VMotOcUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A410E831
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 20:02:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0AFC510206773; Fri, 21 Mar 2025 21:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1742587333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=a14P7c9Bp63M0MikNJ0Fvj67ia2oHwxPak9QEd1B7t4=;
 b=VMotOcUjpl1dTWWEKwIByS8XW1DZznwH/22i39U16DkYz+o0LxVp22AjGOgnvAJdMC4zAi
 84RK7OrxFPOWowuQ9XaihDLTGw6uIWaxi5E/SRZSo2gVkblvdPtMBNQuf7rciyG00O9iTL
 /Nzd/6AT+a0w9H4xiyeh8cc1Un12OGqFeSDfKS5YMh/vcq57IYeiCESxTGKa9zPRaX1M6X
 MCd++V8xRc3pCSogyVZbD+k9i4NJJLhS55AxDnXL6LtVLdQ2WahxppQORHOra1Z7yDjiAE
 eX/XV5KSQIh/bxBnkezBsFXhq1EaJQMIczhpqN2bZKwh6DF/VZWALBTfeKWFng==
Message-ID: <6034b024-381c-4fed-9d97-ad7d5d293112@denx.de>
Date: Fri, 21 Mar 2025 20:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-10-marex@denx.de> <2153305.bB369e8A3T@steina-w>
 <4a27b6bf-aca8-4f29-9561-609a42eb81a0@denx.de>
 <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z8XFCv6ku6mG1_x5@e110455-lin.cambridge.arm.com>
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

On 3/3/25 4:04 PM, Liviu Dudau wrote:

[...]

>>>> +			#reset-cells = <1>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			assigned-clocks = <&scmi_clk IMX95_CLK_GPUAPB>;
>>>> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
>>>> +			assigned-clock-rates = <133333333>;
>>>> +			power-domains = <&scmi_devpd IMX95_PD_GPU>;
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		gpu: gpu@4d900000 {
>>>> +			compatible = "fsl,imx95-mali", "arm,mali-valhall-csf";
>>>> +			reg = <0 0x4d900000 0 0x480000>;
>>>> +			clocks = <&scmi_clk IMX95_CLK_GPU>;
>>>
>>> There is also IMX95_CLK_GPUAPB. Is this only required for the rese control above?
>>
>> I think I have to describe those clock here too, possibly as 'coregroup'
>> clock ?
> 
> The 'coregroup' clock does indeed control the MMU and L2$ blocks as well as the AXI interface,
> so if that is indeed a separate external clock source it should be defined. Could it be why
> you're seeing issues with L2$ resume on the fast reset path?
Sorry for the delayed reply.

I did define these clock, they are enabled, but the L2 reset problem is 
still present .
