Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6CA5D94B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5EB10E313;
	Wed, 12 Mar 2025 09:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RAGgEdWN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427D510E6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 06:27:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52C6QqDM1502234
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Mar 2025 01:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1741760812;
 bh=DnPiYLU+W55E9DeSsjm78osM0IQbGrhucNB0Egl1iXE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=RAGgEdWN3M1TDMMXpL03T6WxLCjAHuHjghMiPlxxYlDK9Jb31NaT0VlNnyKuaFI2x
 6XKGpBBRXxmxP8W6ViWQMxuLAYto884WyEXmyrTqeldl4tO0ZstmpimioCC0+xlFvK
 QlmiDO5xkP3ChG9OFcVeOEGb3RTtCy94fviievJc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52C6Qqr1112070
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 12 Mar 2025 01:26:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 01:26:51 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 01:26:51 -0500
Received: from [172.24.227.96] (hkshenoy.dhcp.ti.com [172.24.227.96])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52C6Qg59073673;
 Wed, 12 Mar 2025 01:26:43 -0500
Message-ID: <de0cb22d-d251-4b0b-8fc7-e8b5a891a527@ti.com>
Date: Wed, 12 Mar 2025 11:56:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>
CC: Harikrishna Shenoy <h-shenoy@ti.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <jani.nikula@intel.com>, <j-choudhary@ti.com>,
 <sui.jingfeng@linux.dev>, <viro@zeniv.linux.org.uk>,
 <r-ravikumar@ti.com>, <sjakhade@cadence.com>, <yamonkar@cadence.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
 <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
Content-Language: en-US
From: Harikrishna Shenoy <a0512644@ti.com>
In-Reply-To: <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Wed, 12 Mar 2025 09:22:44 +0000
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



On 05/02/25 19:03, Dmitry Baryshkov wrote:
> On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
>> On 05/02/2025 12:50, Harikrishna Shenoy wrote:
>>> From: Rahul T R <r-ravikumar@ti.com>
>>>
>>> The mhdp bridge can work without its HPD pin hooked up to the connector,
>>> but the current bridge driver throws an error when hpd line is not
>>> connected to the connector. For such cases, we need an indication for
>>> no-hpd, using which we can bypass the hpd detection and instead use the
>>> auxiliary channels connected to the DP connector to confirm the
>>> connection.
>>> So add no-hpd property to the bindings, to disable hpd when not
>>> connected or unusable due to DP0-HPD not connected to correct HPD
>>> pin on SOC like in case of J721S2.
>>>
>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>>
>> Why are you sending over and over the same? You already got feedback.
>> Then you send v2. You got the same feedback.
>>
>> Now you send v3?
>>
>> So the same feedback, but this time: NAK
> 
> Krzysztof's email forced me to take a look at the actual boards that you
> are trying to enable. I couldn't stop by notice that the HPD signal
> _is_ connected to a GPIO pin. Please stop hacking the bridge driver and
> use the tools that are already provided to you: add the HPD pin to the
> dp-controller device node. And then fix any possible issues coming from
> the bridge driver not being able to handle HPD signals being delivered
> by the DRM framework via the .hpd_notify() callback.
> 
> TL;DR: also a NAK from my side, add HPD gpio to dp-controller.
> 
We tried implementing a interrupt based HPD functionality as HPD signal 
is connected to GPIO0_18 pin, we were able to get interrupt based HPD 
working however to route this signal to SoC we are loosing audio 
capability due to MUX conflict. Due to board level limitations to
route the signal to SoC, we will not be able to support interrupt
based HPD and polling seems a possible way without loosing on audio 
capability.

Link to schematics zip:
https://www.ti.com/tool/J721S2XSOMXEVM#design-files
File:sprr439b/PROC118E4_RP/PROC118E4(001)_SCH.pdf, Page 17, MUX1

Regards,
Hari

