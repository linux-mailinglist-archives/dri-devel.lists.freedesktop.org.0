Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C428FB2C526
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 15:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F87010E5F5;
	Tue, 19 Aug 2025 13:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="v5ardJpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766EB10E5FA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:20:11 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JC1ZpJ008923;
 Tue, 19 Aug 2025 15:20:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QFvqz+B7siHkzQW6WosQ1OICBHcfdz0CqDSUjuLlYg8=; b=v5ardJpZoJ/NvqNX
 f4jxy8ZwgZYVTCJ1sCgIFZtE7m97VwKq5re3ao20inrRsqD7XZvG+zyXzn6Dz45t
 gb2J10sr4S5W1yKGivcA8affvQLkF08RUucTuB/LR1qX1g+gT0fE38LtsZDZ1m/F
 PKW351mdlAzcllWo5H0ChiXyW910ZnOSJMNdOKR6jzmRCn9m5AaqgPw1s6805YiE
 GuDNNIalignEyZgHlHZCUO2Kzj/Vcsj6MruBIW7UDSNWlTse6eRzvtf6pyHukmWU
 qwOZ0gd+xGksY5DQ9H3jgkYo4oGkVG2LZ7s213qfZk2t2UB5moYa3O/CzKKMwK6+
 kUVxrg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48k4xmrrx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Aug 2025 15:20:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B499040047;
 Tue, 19 Aug 2025 15:18:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C12A772BD5A;
 Tue, 19 Aug 2025 15:17:47 +0200 (CEST)
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 15:17:47 +0200
Message-ID: <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
Date: Tue, 19 Aug 2025 15:17:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
To: "Rob Herring (Arm)" <robh@kernel.org>
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
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <175560127037.3969097.6130940505156039734.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
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



On 8/19/25 13:01, Rob Herring (Arm) wrote:
> On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
>> The new STMicroelectronics SoC features a display controller similar to
>> the one used in previous SoCs.  Because there is additional registers,
>> it is incompatible with existing IPs.
>>
>> Add the new name to the list of compatible string.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>>  1 file changed, 28 insertions(+), 2 deletions(-)

Hi Rob,

It seems several patches of this series triggered your bot without
warnings/errors messages.

Did I missed something or is it just a glitch in the matrix ? :)

Best regards,
Raphaël
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
>
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

