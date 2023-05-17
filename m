Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B0706C51
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 17:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FE110E441;
	Wed, 17 May 2023 15:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA02910E441
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 15:12:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34HEnFSu004022; Wed, 17 May 2023 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Eh6DM2BXuzdEiz/5380GZOi/7cYP/Y43A1Uy0AUkQRU=;
 b=BaPb7vlsCcXw2eRy2akSBCY6au8GLkYB0VwPboCBvwNineXYnXL9vQZ4aurnEjJ6X3Wf
 Ag60Teum3xMOjRxMGnSwRrKNu1ifwUfbd3/qzVtreIhdUZU3nUrSleZPbqXNQa66nBVh
 eJmL+N7vTpJBybTVCwdK/kftHtD6O34qrmp6Rc6g5DtuHV61fpMFQjOvYY4s11mb7PhJ
 D/Se+zPk7OXfGz5LdNhENqjuk91yMGjR7+hdGs4YwZeP7GzushmQUmTOuC73jkQzkHWi
 dl/XHmw2XIr9jOrli1GH/5+vOy1ZhIADhszjFKNJ+TzlvQPZRnTMJ/8ZwIVsWHmL+3D1 Ig== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmwnr8m00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 15:12:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HFCBsO010993
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 May 2023 15:12:12 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 17 May
 2023 08:12:10 -0700
Message-ID: <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
Date: Wed, 17 May 2023 09:12:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
References: <20230517145237.295461-1-abailon@baylibre.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xdufAva3TRcFfqBsoaM5Jab-1ErNBgGj
X-Proofpoint-ORIG-GUID: xdufAva3TRcFfqBsoaM5Jab-1ErNBgGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1011 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170122
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sumit.semwal@linaro.org,
 jstephan@baylibre.com, nbelin@baylibre.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
> This adds a DRM driver that implements communication between the CPU and an
> APU. The driver target embedded device that usually run inference using some
> prebuilt models. The goal is to provide common infrastructure that could be
> re-used to support many accelerators. Both kernel, userspace and firmware tries
> to use standard and existing to leverage the development and maintenance effort.
> The series implements two platform drivers, one for simulation and another one for
> the mt8183 (compatible with mt8365).

This looks like the 3 existing Accel drivers.  Why is this in DRM?

> For the people interested by the firmware or userspace library,
> the sources are available here:
> https://gitlab.baylibre.com/baylibre/libapu/libapu

I don't see a compiler.  What am I missing?

> The support of APU has to be upstreamed to libdrm.
> Until this is done, you could find the source here:
> https://gitlab.baylibre.com/baylibre/libapu/libdrm/-/tree/abailon/main
> 
> The driver for mt8183 depends on this series (which is currently blocked):
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=620429
> 
> Alexandre Bailon (5):
>    drm: Add support of AI Processor Unit (APU)
>    drm/apu: Add memory allocator
>    drm/apu: Add support of requests
>    drm/apu: Add support of IOMMU
>    dt-bindings: Add bidings for mtk,apu-drm
> 
> Julien Stephan (2):
>    drm/apu: allow platform driver to implement their own mmap function
>    drm/apu: Add support for a simulated APU
> 
>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
>   drivers/gpu/drm/Kconfig                       |   2 +
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/apu/Kconfig                   |  22 +
>   drivers/gpu/drm/apu/Makefile                  |  10 +
>   drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
>   drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
>   drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
>   drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
>   drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
>   include/uapi/drm/apu_drm.h                    |  81 +++

"apu" seems too generic.  We already have 3 "AI processing units" over 
in drivers/accel already...

>   11 files changed, 1776 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
>   create mode 100644 drivers/gpu/drm/apu/Kconfig
>   create mode 100644 drivers/gpu/drm/apu/Makefile
>   create mode 100644 drivers/gpu/drm/apu/apu_drv.c
>   create mode 100644 drivers/gpu/drm/apu/apu_gem.c
>   create mode 100644 drivers/gpu/drm/apu/apu_internal.h
>   create mode 100644 drivers/gpu/drm/apu/apu_sched.c
>   create mode 100644 drivers/gpu/drm/apu/simu_apu.c
>   create mode 100644 include/uapi/drm/apu_drm.h
> 

I feel like device/driver based documentation in Documentation/ would 
really help in reviews.

-Jeff

