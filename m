Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DB464CCD8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E0210E412;
	Wed, 14 Dec 2022 15:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757A810E412
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:07:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEEXmlR012651; Wed, 14 Dec 2022 15:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+3+AQVh8779qKNkiecNwOHHZY3GPN68YN29X0HscMdU=;
 b=poE7A4v8Zl5BHxDZyDfTrd/9N5Z6pMyaRSep3JVPlr6vyHu72lh5CLeL4811t+uP5BeR
 Yl1zYdvq12ytMOQN4oe1Q3BOg+Qxu+Ky5XQ9xA91JZg7fCy4Sz/R1SGpH0lotxO168eg
 UYoWyxQGaLAqBIDGnyvqFShgUw7XKkE4hiA0C6zF9bJ+/andqJjSaylaroVpw+K9xvD9
 I7PCSscsbf0mZJsMH0pUheyCT4U/soHxvucijU71lMHTED/flbwRpqi3AcoAFdaWYpFn
 wPpQ8tR66nDu+AzR48rqVhOgkO2rhmcnnjYxkGKXkSNvCIIou/He/zMxfQPnybFm3dix Bw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6rrhk5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 15:07:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BEF7aHU007649
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 15:07:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 14 Dec
 2022 07:07:35 -0800
Message-ID: <d7ab7c6b-cbeb-b140-ac7a-0209fa627308@quicinc.com>
Date: Wed, 14 Dec 2022 08:07:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/7] accel/ivpu: Introduce a new DRM driver for Intel
 VPU
Content-Language: en-US
To: Oded Gabbay <oded.gabbay@gmail.com>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-2-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf12MLFaVU_GsxA_=ko_YMGEjDZbvTSGL=ueiq3=XMT61og@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAFCwf12MLFaVU_GsxA_=ko_YMGEjDZbvTSGL=ueiq3=XMT61og@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 05HXh-UcBM86P9_LXD6LZnyBx0_XFA5C
X-Proofpoint-ORIG-GUID: 05HXh-UcBM86P9_LXD6LZnyBx0_XFA5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140120
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, stanislaw.gruszka@linux.intel.com,
 tzimmermann@suse.de, andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/14/2022 6:57 AM, Oded Gabbay wrote:
> On Thu, Dec 8, 2022 at 1:08 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
>> +
>> +static inline int ivpu_hw_info_init(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->info_init(vdev);
>> +};
>> +
>> +static inline int ivpu_hw_power_up(struct ivpu_device *vdev)
>> +{
>> +       ivpu_dbg(vdev, PM, "HW power up\n");
>> +
>> +       return vdev->hw->ops->power_up(vdev);
>> +};
>> +
>> +static inline int ivpu_hw_boot_fw(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->boot_fw(vdev);
>> +};
>> +
>> +static inline bool ivpu_hw_is_idle(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->is_idle(vdev);
>> +};
>> +
>> +static inline int ivpu_hw_power_down(struct ivpu_device *vdev)
>> +{
>> +       ivpu_dbg(vdev, PM, "HW power down\n");
>> +
>> +       return vdev->hw->ops->power_down(vdev);
>> +};
>> +
>> +static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
>> +{
>> +       vdev->hw->ops->wdt_disable(vdev);
>> +};
>> +
>> +/* Register indirect accesses */
>> +static inline u32 ivpu_hw_reg_pll_freq_get(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->reg_pll_freq_get(vdev);
>> +};
>> +
>> +static inline u32 ivpu_hw_reg_telemetry_offset_get(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->reg_telemetry_offset_get(vdev);
>> +};
>> +
>> +static inline u32 ivpu_hw_reg_telemetry_size_get(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->reg_telemetry_size_get(vdev);
>> +};
>> +
>> +static inline u32 ivpu_hw_reg_telemetry_enable_get(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->reg_telemetry_enable_get(vdev);
>> +};
>> +
>> +static inline void ivpu_hw_reg_db_set(struct ivpu_device *vdev, u32 db_id)
>> +{
>> +       vdev->hw->ops->reg_db_set(vdev, db_id);
>> +};
>> +
>> +static inline u32 ivpu_hw_reg_ipc_rx_addr_get(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->reg_ipc_rx_addr_get(vdev);
>> +};
>> +
>> +static inline u32 ivpu_hw_reg_ipc_rx_count_get(struct ivpu_device *vdev)
>> +{
>> +       return vdev->hw->ops->reg_ipc_rx_count_get(vdev);
>> +};
>> +
>> +static inline void ivpu_hw_reg_ipc_tx_set(struct ivpu_device *vdev, u32 vpu_addr)
>> +{
>> +       vdev->hw->ops->reg_ipc_tx_set(vdev, vpu_addr);
>> +};
>> +
>> +static inline void ivpu_hw_irq_clear(struct ivpu_device *vdev)
>> +{
>> +       vdev->hw->ops->irq_clear(vdev);
>> +};
>> +
>> +static inline void ivpu_hw_irq_enable(struct ivpu_device *vdev)
>> +{
>> +       vdev->hw->ops->irq_enable(vdev);
>> +};
>> +
>> +static inline void ivpu_hw_irq_disable(struct ivpu_device *vdev)
>> +{
>> +       vdev->hw->ops->irq_disable(vdev);
>> +};
> Why hide all the calls to the hw ops functions inside inline functions ?
> I mean, it just makes it one step longer to read the code...
> Why not directly call vdev->hw->ops->operation ?
> 
>> diff --git a/include/uapi/drm/ivpu_drm.h b/include/uapi/drm/ivpu_drm.h
>> new file mode 100644
>> index 000000000000..922cbf30ce34
>> --- /dev/null
>> +++ b/include/uapi/drm/ivpu_drm.h
>> @@ -0,0 +1,95 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) 2020-2022 Intel Corporation
>> + */
>> +
>> +#ifndef __UAPI_IVPU_DRM_H__
>> +#define __UAPI_IVPU_DRM_H__
>> +
>> +#include "drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +#define DRM_IVPU_DRIVER_MAJOR 1
>> +#define DRM_IVPU_DRIVER_MINOR 0
> I would prefer not to define versions for the driver. Don't get in
> this trap of trying to keep a version
> number updated over time.  It breaks down the moment you get the code
> merged into the kernel tree as the driver is what is in the kernel, not
> separate from it.
> 
> Also think of the stable kernels, you will backport fixes to those for
> the driver as part of the development process.  So what "version" are
> they now?  They are some mis-match of the old one with new fixes, and as
> such, the version number now means nothing.
> 
> Just stick to the version number of the kernel itself, that's the only
> sane way.

This seems to assume that the user is running whole kernels and not a 
backport of the driver (similar to the backports project that is popular 
with net).

Lets assume this gets merged into 6.3.  End user is on say Ubuntu 20.04 
which GA'd with a 5.4 kernel and is maintaining that.  Intel here 
backports the 6.3 driver to 5.4 to support this end user and tries to do 
the "right thing" by using the upstream code instead of some downstream 
fork.  Now the kernel version is meaningless because 5.4 never had this 
driver.  Of course if the user reports an issue to Intel, it would be 
handy to know exactly what version of the driver the user has.

The src version hash that modinfo provides is meaningless because it 
changes based on the entirety of the build, which includes things like 
the compiler used.

If there is an alternative solution for this, I'd love to hear it.
