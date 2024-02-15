Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E88855C1E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2E910E2A2;
	Thu, 15 Feb 2024 08:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="LlwQoB5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9E310E245
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 08:16:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41F4sA47004833; Thu, 15 Feb 2024 09:16:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=pvtxoJhmnxjDqlBcy+m+EW9LOlI+xq+K0k8SrAAqebE=; b=Ll
 wQoB5bNmOCHjXB2SCCmpVtLVgogBAq/lsnMsEXcHnmd7akpjA9jW0dcVBIsjuS0d
 1iJ3S0YpVb2PtkhoEoGgUAlFLaqgoZYajYG6xIhCreTDu8f0/rm0xPBvVM4FiGL5
 ne4Od0shXVEpMGTcaPw+wnFyF10+pvG3/R43G+6/4XW+QBdm9RsR4hxVErJ3Re4v
 hFfKP+JHR79ICT9LVugA4wQvPtjCIwprp9YP22xZUe+RY2wUhYkZnnrFQY3bAoiE
 Hmi5tOYSHPP+8d71epf3fY4+AgPIAdPHi+tqOySlEn0P+fBYJeWYslHZeS823Fvl
 XB7EDKmskozTibHJoyYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62sj256t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 09:16:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A1B434002D;
 Thu, 15 Feb 2024 09:16:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DF8122F7CF;
 Thu, 15 Feb 2024 09:15:14 +0100 (CET)
Received: from [10.129.178.155] (10.129.178.155) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 15 Feb
 2024 09:15:12 +0100
Message-ID: <77b05018-bdab-4737-a64b-1b7404626200@foss.st.com>
Date: Thu, 15 Feb 2024 09:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add display support for stm32mp135f-dk board
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Yannick Fertre
 <yannick.fertre@foss.st.com>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
 <0c551a84-5c4a-4d79-ae59-d5b0d34b017d@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <0c551a84-5c4a-4d79-ae59-d5b0d34b017d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.155]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_08,2024-02-14_01,2023-05-22_02
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

Hi Alex

On 2/14/24 14:40, Alexandre TORGUE wrote:
> Hi Raphael
>
> On 2/5/24 10:06, Raphael Gallais-Pou wrote:
>> This serie aims to enable display support for the stm32mp135f-dk board
>>
>> Those are only patches of the device-tree since the driver support has
>> already been added [1].
>>
>> It respectivelly:
>>     - adds support for the display controller on stm32mp135
>>     - adds pinctrl for the display controller
>>     - enables panel, backlight and display controller on
>>       stm32mp135f-dk
>>
>> Finally it fixes the flags on the panel default mode in the
>> 'panel-simple' driver, allowing to override the default mode by one
>> described in the device tree, and push further the blanking limit on the
>> panel.
>>
>> [1] commit 1726cee3d053 ("drm/stm: ltdc: support of new hardware version")
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>> Raphael Gallais-Pou (5):
>>        ARM: dts: stm32: add LTDC support for STM32MP13x SoC family
>>        ARM: dts: stm32: add LTDC pinctrl on STM32MP13x SoC family
>>        ARM: dts: stm32: enable display support on stm32mp135f-dk board
>>        drm/panel: simple: fix flags on RK043FN48H
>>        drm/panel: simple: push blanking limit on RK32FN48H
>>
>>   arch/arm/boot/dts/st/stm32mp13-pinctrl.dtsi | 57 +++++++++++++++++++++++++++++
>>   arch/arm/boot/dts/st/stm32mp135.dtsi        | 11 ++++++
>>   arch/arm/boot/dts/st/stm32mp135f-dk.dts     | 55 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/panel/panel-simple.c        |  7 ++--
>>   4 files changed, 127 insertions(+), 3 deletions(-)
>> ---
>> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
>> change-id: 20240124-ltdc_mp13-2f86a782424c
>>
>> Best regards,
>
> I got the following errors during YAML verification:
>
> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: /soc/i2c@40012000/pinctrl@21: failed
> to match any schema with compatible: ['microchip,mcp23017']
> /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb:
> panel-backlight: 'default-brightness-level' does not match any of the regexes:
> 'pinctrl-[0-9]+'
>     from schema $id:
> http://devicetree.org/schemas/leds/backlight/gpio-backlight.yaml#
> /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb:
> panel-rgb: data-mapping:0: 'bgr666' is not one of ['jeida-18', 'jeida-24',
> 'vesa-24']
>     from schema $id:
> http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb:
> panel-rgb: compatible: ['rocktech,rk043fn48h', 'panel-dpi'] is too long
>     from schema $id:
> http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb:
> panel-rgb: data-mapping: False schema does not allow ['bgr666']
>     from schema $id:
> http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb:
> panel-rgb: 'height-mm', 'panel-timing', 'width-mm' do not match any of the
> regexes: 'pinctrl-[0-9]+'
>     from schema $id:
> http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> /local/home/frq08678/STLINUX/kernel/my-kernel/stm32/arch/arm/boot/dts/st/stm32mp135f-dk.dtb:
> panel-rgb: 'data-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id: http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
>
> Do I miss something ?


I think I messed using a wrong  make option :

make DTBS_CHECK=y W=1 -j$(nproc) st/stm32mp135f-dk.dtb

instead of

make CHECK_DTBS=y W=1 -j$(nproc) st/stm32mp135f-dk.dtb


I'll send a fix promptly.


Thanks,

Raphaël

>
> Alex
>
>
