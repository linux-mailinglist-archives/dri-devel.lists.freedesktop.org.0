Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D436B952228
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 20:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1D110E514;
	Wed, 14 Aug 2024 18:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cyUmz/qQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D2B10E514
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 18:46:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAa4dr009099;
 Wed, 14 Aug 2024 18:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kvfrd1e24qw6Tj5HoUm+cmxo4uJmth6FrhN9Xz5bRX0=; b=cyUmz/qQaN0MTGrr
 f4clMCV5iMMAuU54McUAABIfjCB9wKAFL4AKbKpyNXYE8WZiUBHrNnEldcMW/xiv
 6H55s++cCuUshc4mfxcT5kvdBl2mLk2lbtciMXuyesRh+A9fre1x57qPC84QFnDL
 /8B4lroZHbmDCDHtClvUqYo9J6IJ2uKVlUfJKBuN6UFc0l5j9zlYcjMgpRCJTOkx
 aVl6ShPS7Z8rUfXNtjXcnvUCf41+ZzpFW3RixEdWT5cZtV64gQffGKVV5GC6Zpqi
 MT2JqHdTf9pZkmR4xASAb1FKEwHFYStylYDVYOrry9wCtexFb5VmhqkkxxUzCsSf
 ofjuFg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4108bc4eqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2024 18:46:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EIk7Sq028575
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2024 18:46:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 11:46:06 -0700
Message-ID: <edaa7f7d-a3e8-1b1a-37b8-3fd5a8a7790d@quicinc.com>
Date: Wed, 14 Aug 2024 12:46:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-2-lizhi.hou@amd.com>
 <f5e9f517-77b8-998d-9bf7-d9bf4ee2fbb8@quicinc.com>
 <172cde68-930f-381e-df9f-da2a48955828@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <172cde68-930f-381e-df9f-da2a48955828@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hyY6znZLKYzpDm9Sa6xm_cAB9QJ68kjB
X-Proofpoint-GUID: hyY6znZLKYzpDm9Sa6xm_cAB9QJ68kjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_14,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140128
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

On 8/14/2024 12:16 PM, Lizhi Hou wrote:
> 
> On 8/9/24 09:11, Jeffrey Hugo wrote:
>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>>> b/drivers/accel/amdxdna/aie2_pci.c
>>> new file mode 100644
>>> index 000000000000..3660967c00e6
>>> --- /dev/null
>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>> @@ -0,0 +1,182 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include <linux/amd-iommu.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/firmware.h>
>>> +#include <linux/iommu.h>
>>
>> You are clearly missing linux/pci.h and I suspect many more.
> Other headers are indirectly included by "aie2_pci.h" underneath.

aie2_pci.h also does not directly include linux/pci.h

>>> +
>>> +    ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>> +    if (ret) {
>>> +        XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
>>> +        goto release_fw;
>>> +    }
>>> +
>>> +    nvec = pci_msix_vec_count(pdev);
>>
>> This feels weird.  Can your device advertise variable number of MSI-X 
>> vectors?  It only works if all of the vectors are used?
> That is possible. the driver supports different hardware. And the fw 
> assigns vector for hardware context dynamically. So the driver needs to 
> allocate all vectors ahead.

So, if the device requests N MSIs, but the host is only able to satisfy 
1 (or some number less than N), the fw is completely unable to function?

>>> +struct psp_device *aie2m_psp_create(struct device *dev, struct 
>>> psp_config *conf)
>>> +{
>>> +    struct psp_device *psp;
>>> +    u64 offset;
>>> +
>>> +    psp = devm_kzalloc(dev, sizeof(*psp), GFP_KERNEL);
>>> +    if (!psp)
>>> +        return NULL;
>>> +
>>> +    psp->dev = dev;
>>> +    memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>>> +
>>> +    psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
>>> +    psp->fw_buffer = devm_kmalloc(psp->dev, psp->fw_buf_sz, 
>>> GFP_KERNEL);
>>
>> Feels like this (and a bunch of other instances I haven't commented 
>> on) should be drmm_* allocs.
> 
> The PSP code is kind of low level and directly interact with hardware. 
> All the PSP interfaces use struct device * instead of drm_device. I 
> think it is kind make sense because PSP is not related to drm.
> 
> I will scan all other allocs and change them to drmm_* allocs for the 
> code related to drm_device. Does this sound ok to you?

I don't think so.  Look up
drm/todo: Add TODO entry for "lints"
on the dri-devel list, and its history.

> 
>>
>>> +    if (!psp->fw_buffer) {
>>> +        dev_err(psp->dev, "no memory for fw buffer");
>>> +        return NULL;
>>> +    }
>>> +
>>> +    psp->fw_paddr = virt_to_phys(psp->fw_buffer);
>>
>> I'm pretty sure virt_to_phys() is always wrong
> 
> The hardware exposes several registers to communicate with platform PSP 
> (AMD Platform Security Processor) to load NPU firmware. And PSP only 
> accept host physical address with current hardware.
> 
> I understand usually virt_to_phys() should not be needed for device 
> driver. And maybe it is ok to use if there is hardware requirement? I 
> can see some drivers use it as well.

Eh.  I guess the PSP would never have an IOMMU in front of it or 
anything like that.

This feels similar to what Qualcomm MSM platforms do, which uses the 
remoteproc framework.  Not sure if that helps you here.

This still feels not good, but you might have a valid exception here. 
I'd suggest putting a justification comment in the code through. 
Someone looking at this in X months might raise the same question.

> 
>>
>>> +    offset = ALIGN(psp->fw_paddr, PSP_FW_ALIGN) - psp->fw_paddr;
>>> +    psp->fw_paddr += offset;
>>> +    memcpy(psp->fw_buffer + offset, conf->fw_buf, conf->fw_size);
>>> +
>>> +    return psp;
>>> +}
>>> diff --git a/drivers/accel/amdxdna/amdxdna_drm.c 
>>> b/drivers/accel/amdxdna/amdxdna_drm.c
>>> new file mode 100644
>>> index 000000000000..91e4f9c9dac9
>>> --- /dev/null
>>> +++ b/drivers/accel/amdxdna/amdxdna_drm.c
>>
>> What is the point of this file?  Seems like all of this could just be 
>> in amdxdna_pci_drv.c
> The future product may have NPU with non-pci device. So it might be a 
> amdxdna_plat_drv.c and share the same amdxdna_drm.c in the future.

This seems like a weak justification.  "may" is not definitive.  If such 
hardware appears, you could refactor the driver at that time.

>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>> new file mode 100644
>>> index 000000000000..7d0cfd918b0e
>>> --- /dev/null
>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>> @@ -0,0 +1,118 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +
>>> +#include "amdxdna_pci_drv.h"
>>> +
>>> +/*
>>> + *  There are platforms which share the same PCI device ID
>>> + *  but have different PCI revision IDs. So, let the PCI class
>>> + *  determine the probe and later use the (device_id, rev_id)
>>> + *  pair as a key to select the devices.
>>> + */
>>
>> Huh?  So, VID == AMD, DID == 0x17f0, rev == 0x1 is a completely 
>> different device?  That feels like a PCIe spec violation...
> Maybe the comment is misleading. The hardware with same device id 0x17f0 
> uses the same commands, registers etc. And they are same device with 
> different revisions.

Then I don't understand why you need to do the class matching.  Match on 
PCI_VENDOR_ID_AMD with the Device IDs you need to support like a 
"normal" PCI(e) driver?

>>
>>> +static const struct pci_device_id pci_ids[] = {
>>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_ANY_ID),
>>> +        .class = PCI_CLASS_SP_OTHER << 8,
>>
>> Weird.  I would have expected the Accelerator class to be used
> We contacted our hardware team to figure out why accelerator class is 
> not used here. Some of hardware is already released. Hopefully hardware 
> team may consider to use accelerator class with new products.
