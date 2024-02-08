Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239884DF3B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 12:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E836F10E65C;
	Thu,  8 Feb 2024 11:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="g136W+sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDC010E60C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 11:05:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418B5aT5048727;
 Thu, 8 Feb 2024 05:05:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707390336;
 bh=P2gEaJpWpM17V/KHrI9FNPRGZeVLQmLeQTEACfJn5n0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=g136W+sjmMqPxG/tT25QzUOvh2oH0E6mUvntVtoiTURqoXxHSgya3IMPWjZ6SBJkI
 +q+V7mtaXDc+s9JYXPZTEV1i1suQxH+FyfDWYrma2yfMW7FOBvP1XE/Y1SQIJX6K23
 uPJRuLX4hx47CQR0OeAR3i+IiqeLBLtwqcvSPE7k=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418B5aeI051832
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Feb 2024 05:05:36 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 05:05:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 05:05:35 -0600
Received: from [10.250.146.202] ([10.250.146.202])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418B5Sps095452;
 Thu, 8 Feb 2024 05:05:29 -0600
Message-ID: <91bafebd-ccbe-d6ea-134d-77c8d9776ac8@ti.com>
Date: Thu, 8 Feb 2024 16:35:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 3/3] arm64: dts: ti: k3-am62x: Add overlay to use DSS
 in display sharing mode
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <praneeth@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
 <jyri.sarha@iki.fi>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
References: <20240116134142.2092483-1-devarsht@ti.com>
 <20240116134142.2092483-4-devarsht@ti.com>
 <e452c6ae-e889-44a9-9fbf-99527f5c50b9@ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <e452c6ae-e889-44a9-9fbf-99527f5c50b9@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Hi Tomi,

Thanks for the review.

On 23/01/24 13:59, Tomi Valkeinen wrote:
> Hi,
> 
> On 16/01/2024 15:41, Devarsh Thakkar wrote:
>> This overlay needs to be used with display sharing supported device
>> manager firmware only.
>>
>> Remote core running this firmware has write access to "common" register
>> space, VIDL pipeline, OVR1 overlay and VP1 videoport.
>>
>> The processing core running Linux is provided write access to VID
>> pipeline and "common1" register space.
>>
>> The VP1 video port is shared between Linux and remote core with remote
>> core configuring the overlay manager to set Zorder 1 for VID pipeline
>> and Zorder 2 for VIDL pipeline.
>>
>> Add reserved memory region for framebuffer region used by remote core in
>> dss shared mode overlay file so that Linux does not re-use the same
>> while allocating memory.
> 
> I don't understand this one. Why is RAM used by RTOS accessible by Linux
> in the first place?
> 

Well, I think the R5 SPL initializes full DDR before starting firmwares
on remote cores and the regions used by this remote cores be it for IPC
or Code/data are marked as reserved both in Linux as well as U-boot so
that Linux/U-boot does not use it [1].

Same scheme is followed here w.r. t RTOS framebuffer too.

[1] :
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi?h=v6.7#n63

Regards
Devarsh

>  Tomi
> 
>> Also add a label for reserved memory region in base device-tree file so
>> that it can be referred back in overlay file.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/Makefile               |  1 +
>>   .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  2 +-
>>   .../dts/ti/k3-am62x-sk-dss-shared-mode.dtso   | 33 +++++++++++++++++++
>>   3 files changed, 35 insertions(+), 1 deletion(-)
>>   create mode 100644
>> arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
>>
>> diff --git a/arch/arm64/boot/dts/ti/Makefile
>> b/arch/arm64/boot/dts/ti/Makefile
>> index 52c1dc910308..ff832741b367 100644
>> --- a/arch/arm64/boot/dts/ti/Makefile
>> +++ b/arch/arm64/boot/dts/ti/Makefile
>> @@ -35,6 +35,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-ov5640.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-tevi-ov5640.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-imx219.dtbo
>>   dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-hdmi-audio.dtbo
>> +dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-dss-shared-mode.dtbo
>>     # Boards with AM64x SoC
>>   dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> index 33768c02d8eb..8b55ca10102f 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> @@ -34,7 +34,7 @@ memory@80000000 {
>>           reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
>>       };
>>   -    reserved-memory {
>> +    reserved_memory: reserved-memory {
>>           #address-cells = <2>;
>>           #size-cells = <2>;
>>           ranges;
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
>> b/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
>> new file mode 100644
>> index 000000000000..02153748a5c2
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-dss-shared-mode.dtso
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/**
>> + * DT overlay to enable display sharing mode for AM62P DSS0
>> + * This is compatible with custom AM62 Device Manager firmware
>> + *
>> + * Copyright (C) 2023 Texas Instruments Incorporated -
>> http://www.ti.com/
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +&dss0 {
>> +    ti,dss-shared-mode;
>> +    ti,dss-shared-mode-vp = "vp1";
>> +    ti,dss-shared-mode-vp-owned = <0>;
>> +    ti,dss-shared-mode-common = "common1";
>> +    ti,dss-shared-mode-planes = "vid";
>> +    ti,dss-shared-mode-plane-zorder = <0>;
>> +    interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
>> +};
>> +
>> +&reserved_memory {
>> +    #address-cells = <2>;
>> +    #size-cells = <2>;
>> +    rtos_framebuffer_memory_region: rtos-framebuffer-memory@94800000 {
>> +        compatible = "shared-dma-pool";
>> +        reg = <0x00 0x94800000 0x00 0x08000000>;
>> +        no-map;
>> +    };
>> +};
> 
> 
