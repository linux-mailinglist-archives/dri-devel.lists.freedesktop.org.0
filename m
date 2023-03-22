Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9776E6C4D8D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8990110E968;
	Wed, 22 Mar 2023 14:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EC110E968
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:25:16 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MCVoiE004697; Wed, 22 Mar 2023 14:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wh06Og1yYXJrPq1TN8WWhWA/WDSeO90JJlKDERI1kF4=;
 b=NImb/RQd8GKu7/E2InUOxa643EXv55FPOMCouji8XbTZ0DddH6lo5cE5X04LpdGVKxv2
 NGK7gvee3TI9jvdofvnXVSTRJm9tKrhbcs2CCBKQTrLNvRQbU5skWjf5/tT06grT8/U6
 sXK4d4CvnnbfbX1hD8br7yZkhF72jz9LdYMEN7QK/YYtUDWqHYP9d+gzbyYxLUTY/o5F
 lUR36jgXDY+QvL07xc9EVPIbCND9HzNX1iYzOgbAmLKIYwG2OzxuI9LsbWPEk8Rf4a+7
 WyQVxOWSw1LeoEkSKhjfWt9vUzYEdfCJcUfNgLq1US4d5hg0gODzg7b8jZzCMVkaOibL /w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfdc43a4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:25:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MEPAmx010341
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:25:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:25:10 -0700
Message-ID: <78fbafe5-6ae2-89ce-eb36-83c869ff7755@quicinc.com>
Date: Wed, 22 Mar 2023 08:25:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/7] accel/ivpu: Do not use SSID 1
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-4-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230322091900.1982453-4-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xa_cH-elvJxMkHmNyaQhxTyqBlRvFRdv
X-Proofpoint-ORIG-GUID: xa_cH-elvJxMkHmNyaQhxTyqBlRvFRdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220105
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/2023 3:18 AM, Stanislaw Gruszka wrote:
> The SSID=1 is used by the firmware as default value in
> case SSID mapping is not initialized. This allows
> detecting use of miss-configured memory contexts.
> The future FW versions may not allow using SSID=1.
> 
> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 4 ++--
>   drivers/accel/ivpu/ivpu_drv.h | 5 ++++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index d9e311b40348..70245cf84593 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -474,8 +474,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   
>   	vdev->hw->ops = &ivpu_hw_mtl_ops;
>   	vdev->platform = IVPU_PLATFORM_INVALID;
> -	vdev->context_xa_limit.min = IVPU_GLOBAL_CONTEXT_MMU_SSID + 1;
> -	vdev->context_xa_limit.max = IVPU_CONTEXT_LIMIT;
> +	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
> +	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
>   	atomic64_set(&vdev->unique_id_counter, 0);
>   	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
>   	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index 1b2aa05840ad..ef12a38e06e1 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -25,7 +25,10 @@
>   #define PCI_DEVICE_ID_MTL   0x7d1d
>   
>   #define IVPU_GLOBAL_CONTEXT_MMU_SSID 0
> -#define IVPU_CONTEXT_LIMIT	     64
> +/* SSID 1 is used by the VPU to represent invalid context */
> +#define IVPU_USER_CONTEXT_MIN_SSID   2
> +#define IVPU_USER_CONTEXT_MAX_SSID   (IVPU_USER_CONTEXT_MIN_SSID + 63)

The old MAX was 64.  Now the MAX is 65.  I'm guessing the intent is to 
keep the number of valid SSIDs constant (63), but it is unclear if SSID 
65 is valid for the FW.

Maybe the commit text could clarify this a bit?

> +
>   #define IVPU_NUM_ENGINES	     2
>   
>   #define IVPU_PLATFORM_SILICON 0

