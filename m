Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159DF988B93
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEA410ED21;
	Fri, 27 Sep 2024 20:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pNQtjfWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF8110ED21
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 20:55:13 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RFF6XB000545;
 Fri, 27 Sep 2024 20:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZVtTouYEup2ywkcvJ3vnR/xj7zvqD+xeaTlsEZGjgnQ=; b=pNQtjfWkwDP95o5m
 XWLNo/OY3u2r1mDjDtbJE1VUg5mDdNei3uYZQKx/mv9Sv3PjkviZAGXVF+e0uTM+
 tncHhnXWGe/ybqM0P49kmibE3z1MuX+RQEG2C3VejIUWaTKqkHuxcDIMeqmUSn7K
 yRvSClFO2TQ7kSmjr/8nVP5W1HTf63RzKI/bJ2nu9a4vV3XEPjBsIsz5+SSe2bDG
 Xx+l2wxVT5MS6tHdLvYfbDUvZUP0gxYlKBIcRr9/FKI07M/WagWJ4A/ERw/iV8bX
 OIop1aFi0vcZCdCzVmv5vCSp/onJ+aI4DQ0EIo6vOtpbIevjkvTa6qKfR7RG/Txc
 rzMv9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9kw0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 20:55:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48RKtA3V025645
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 20:55:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 27 Sep
 2024 13:55:10 -0700
Message-ID: <e276a13f-8add-26f9-9fc4-960a10664e98@quicinc.com>
Date: Fri, 27 Sep 2024 14:55:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 09/29] accel/ivpu: Add FW version debugfs entry
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Karol Wachowski <karol.wachowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-10-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240924081754.209728-10-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VIRyDOvOGA8P7PkW1GKymVDOgacfE-A9
X-Proofpoint-GUID: VIRyDOvOGA8P7PkW1GKymVDOgacfE-A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270153
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

On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Add debugfs that prints current firmware version string on read.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_debugfs.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
> index cd3ac08f0409a..65245f45cc701 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/debugfs.h>
> +#include <linux/firmware.h>
>   
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_file.h>
> @@ -20,6 +21,8 @@
>   #include "ivpu_jsm_msg.h"
>   #include "ivpu_pm.h"
>   
> +#include "vpu_boot_api.h"
> +
>   static inline struct ivpu_device *seq_to_ivpu(struct seq_file *s)
>   {
>   	struct drm_debugfs_entry *entry = s->private;
> @@ -45,6 +48,14 @@ static int fw_name_show(struct seq_file *s, void *v)
>   	return 0;
>   }
>   
> +static int fw_version_show(struct seq_file *s, void *v)
> +{
> +	struct ivpu_device *vdev = seq_to_ivpu(s);
> +
> +	seq_printf(s, "%s\n", (const char *)vdev->fw->file->data + VPU_FW_HEADER_SIZE);

This FW file comes from userspace. Is there a check somewhere else that 
this string is properly NULL terminated as expected?

