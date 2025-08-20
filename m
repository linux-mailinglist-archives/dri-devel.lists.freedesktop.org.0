Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E5B2D514
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406B910E07A;
	Wed, 20 Aug 2025 07:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="dOhWmhU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831AF10E07A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:41:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K6jL1B023265;
 Wed, 20 Aug 2025 09:41:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 b2JiistMyWguTBCrYhx2X5NLWE9VMsmLtXvQuA0ebsM=; b=dOhWmhU1/fCHbDHB
 W0nRFLN7IrrAhIGH009ygWfyKYl4MYgCfhjmyVhajF2YyJk3byfpovKNv1TDgiXr
 8G70EHtq2IYZv6IoA844TPnUNUxieaGFq4B2NPUCFQ1oq3Lr82/+tDKtwV9dzw1x
 oIfMIm/tUJy3DRgK51cgEXoy9hpSLjyOlAA9a2dALcBYFaPo+nOsoYrtrmiHu8kZ
 SoruMBQBgysA9apOTNuNP9xk09NM4V3oBbB4YSFuQsuiLE5Bi39ag+Ek3CfF9K3u
 D3RljfLoEgPMydcdt0QvAqCyWuEHOv9J8nDWlC+rw9GMDMlK1GZgcq/bpzEL1B8n
 Kh1NSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n6uj8us5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Aug 2025 09:41:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0064B40045;
 Wed, 20 Aug 2025 09:39:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F49C52E39B;
 Wed, 20 Aug 2025 09:38:50 +0200 (CEST)
Received: from [10.252.7.99] (10.252.7.99) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Aug
 2025 09:38:49 +0200
Message-ID: <ff91b42e-be8d-4147-b489-c9938a4ab344@foss.st.com>
Date: Wed, 20 Aug 2025 09:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
To: Rob Herring <robh@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>, Christophe Roullier
 <christophe.roullier@foss.st.com>,
 David Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <devicetree@vger.kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
 <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
 <20250819135851.GA115029-robh@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819135851.GA115029-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.7.99]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
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



On 8/19/25 15:58, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 03:17:46PM +0200, Raphael Gallais-Pou wrote:
>>
>> On 8/19/25 13:01, Rob Herring (Arm) wrote:
>>> On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
>>>> The new STMicroelectronics SoC features a display controller similar to
>>>> the one used in previous SoCs.  Because there is additional registers,
>>>> it is incompatible with existing IPs.
>>>>
>>>> Add the new name to the list of compatible string.
>>>>
>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>> ---
>>>>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>>>>  1 file changed, 28 insertions(+), 2 deletions(-)
>> Hi Rob,
>>
>> It seems several patches of this series triggered your bot without
>> warnings/errors messages.
>>
>> Did I missed something or is it just a glitch in the matrix ? :)
> 'make dt_binding_check' is broken in linux-next which is used if the 
> base commit is not specified or not found. The latter was the case here. 
> Should be fixed in tomorrow's linux-next.

Indeed, I am based on latest drm-misc-next, which explains the not found base
commit.

Thanks for this info

Raphaël
>
> Rob

