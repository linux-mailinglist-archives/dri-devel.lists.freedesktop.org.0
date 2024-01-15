Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A3182DDF5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 17:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE7710E350;
	Mon, 15 Jan 2024 16:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1138310E34E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 16:51:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40FDrZU1008279; Mon, 15 Jan 2024 17:51:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=v/GemSIloeASK3WLJ1Xew5INevRA7DxBKaKXrgp0BrI=; b=yW
 I9NouHDCyq43z3fEbedcH1DBWBHnlGwKnS2NFXi0ofmWWeaCMJLvOFimeL7TiLvv
 0Rm4EJ2vXjSkSoVbG93Q47Ib0LjVySE0FJVc83GQM3158cyKguQ0YwenISvU75T8
 f3odqvHeu7q26Ic++F5pOUt2H/vQUM917hoP0IiHBHWN/a6+h/dlmUX+NciD0XP5
 3DpK0ZkYCCBHWuncmuD7WFLnDxGiyliD3bzb0BuQIKszMEPo5/WG4xXrrN9R8/J1
 swRCMM6ZEKiw8y3RVrwDxe+boWapMNCRfB6KaVFEet/6LA3P/crX6rXDVcgJ3iQt
 H1hlwJ5mEXRw1hxKmdGw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmddstng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jan 2024 17:51:30 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1111910002A;
 Mon, 15 Jan 2024 17:51:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE6662EAB7A;
 Mon, 15 Jan 2024 17:51:28 +0100 (CET)
Received: from [10.129.178.37] (10.129.178.37) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 15 Jan
 2024 17:51:28 +0100
Message-ID: <3479c5d7-a9c3-40cf-a415-b8324f160ec7@foss.st.com>
Date: Mon, 15 Jan 2024 17:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: display: add dt-bindings for STM32
 LVDS device
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
 <20240115154659.GA815331-robh@kernel.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240115154659.GA815331-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.37]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
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
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/15/24 16:46, Rob Herring wrote:
> On Mon, Jan 15, 2024 at 02:20:04PM +0100, Raphael Gallais-Pou wrote:
>> Add "st,stm32mp25-lvds" compatible.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>> Depends on: "dt-bindings: stm32: add clocks and reset binding for
>> 	    stm32mp25 platform" by Gabriel Fernandez
>>
>> Changes in v3:
>> 	- Clarify commit dependency
>> 	- Fix includes in the example
>> 	- Fix YAML
>> 	- Add "clock-cells" description
>> 	- s/regroups/is composed of/
>> 	- Changed compatible to show SoC specificity
>>
>> Changes in v2:
>> 	- Switch compatible and clock-cells related areas
>> 	- Remove faulty #include in the example.
>> 	- Add entry in MAINTAINERS
>> ---
>>  .../bindings/display/st,stm32-lvds.yaml       | 119 ++++++++++++++++++
> Filename matching compatible.

Hi Rob,


I was unsure about this.

The driver will eventually support several SoCs with different compatibles,
wouldn't this be more confusing ?

I also wanted to keep the similarity with the "st,stm32-<ip>.yaml" name for the
DRM STM drivers. Would that be possible ?


Regards,

Raphaël



>
>> +properties:
>> +  compatible:
>> +    const: st,stm32mp25-lvds
>
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
>> +    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>> +
>> +    lvds: lvds@48060000 {
>> +        compatible = "st,stm32-lvds";
> Wrong compatible.
