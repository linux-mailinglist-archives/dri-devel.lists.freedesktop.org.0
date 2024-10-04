Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB4990A0C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6D010EA4C;
	Fri,  4 Oct 2024 17:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OZ0Qzua0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0D110EA4C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 17:21:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AleTe022372;
 Fri, 4 Oct 2024 17:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h8pDrKThNBMRHWCD93WtzCOuodX0EWrNg30D82b5kf4=; b=OZ0Qzua0TY2kVHYA
 TDe/R0SdJ4LOisYZO7l51wuhY0dACkmvDW5jNcu8WLjGLC45F+rHcrXl9akUfz8g
 x9MHnBoZQdSnECRZJ/aOW0sGiMFLALSdGoDVVDFXU/plh+k65XJ92zKXMOVIMNHH
 G1V/o3aL62KgEgNUV9O/Yvz8pNIJEUCSvqa2Q0lAVPR3VpYsHaPaAbYmXWbyGYCA
 GzLFhH1acB8E6QNSGVZWB6VUthjqti64gCD54BHVKTClILlisw0p5QfNnBrHSzRu
 oeplhr1jXFRELcEpo3dbUWCBSzldYqzkqc0EG/CXeT3Agh4HMkflATB0sLfzOWAU
 JZoT7Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205datcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 17:21:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494HLWCl004057
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Oct 2024 17:21:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:21:31 -0700
Message-ID: <f81addf5-f9eb-5d39-313e-b18788cd8418@quicinc.com>
Date: Fri, 4 Oct 2024 11:21:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V3 02/11] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240911180604.1834434-1-lizhi.hou@amd.com>
 <20240911180604.1834434-3-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240911180604.1834434-3-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wpYxAsAV87ue9CPWyW899sescKxEBGU3
X-Proofpoint-ORIG-GUID: wpYxAsAV87ue9CPWyW899sescKxEBGU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040119
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

On 9/11/2024 12:05 PM, Lizhi Hou wrote:
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> new file mode 100644
> index 000000000000..e21b32557fc2
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +#include <linux/errno.h>
> +#include <linux/firmware.h>
> +#include <linux/iommu.h>
> +#include <linux/pci.h>
> +
> +#include "amdxdna_pci_drv.h"
> +#include "aie2_pci.h"

Feels like a blank line is missing here.

> +static void aie2_hw_stop(struct amdxdna_dev *xdna)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
> +	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
> +
> +	aie2_psp_stop(ndev->psp_hdl);
> +	aie2_smu_fini(ndev);
> +	pci_disable_device(pdev);
> +}
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> new file mode 100644
> index 000000000000..b3c360a10c04
> --- /dev/null
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -0,0 +1,130 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AIE2_PCI_H_
> +#define _AIE2_PCI_H_
> +
> +#define AIE2_INTERVAL	20000	/* us */
> +#define AIE2_TIMEOUT	1000000	/* us */
> +
> +/* Firmware determines device memory base address and size */
> +#define AIE2_DEVM_BASE	0x4000000
> +#define AIE2_DEVM_SIZE	(64 * SZ_1M)

SZ_64M? Then the code, and reader's brains, are not doing multiplication.

> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> new file mode 100644
> index 000000000000..33133f2503cd
> --- /dev/null
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + */
> +
> +#include <drm/drm_accel.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
> +#include <linux/pci.h>
> +
> +#include "amdxdna_pci_drv.h"
> +
> +/*
> + *  Bind the driver base on PCI class and later use the (device_id, rev_id)
> + *  pair as a key to select the devices. The devices with same device_id
> + *  have very similar interface to host driver.
> + */

Looks like this comment didn't get updated when the class matching was 
removed.

> +static const struct pci_device_id pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x1502) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x17f0) },
> +	{0}
> +};
> +
> +MODULE_DEVICE_TABLE(pci, pci_ids);
