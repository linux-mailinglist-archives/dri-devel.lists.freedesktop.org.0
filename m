Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5856C4D6A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC2210E961;
	Wed, 22 Mar 2023 14:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60DD10E95C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:21:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MDp3sK029019; Wed, 22 Mar 2023 14:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=W4XYz9Xw3XPs2lhJJsd6CzPl7VS3fiwGWqbHr2Jj31U=;
 b=h1QU7+l2HUep2MUXIcAW6FU4lzuD0R3kPqNETPiQAQ6FuXvHPSYmJ4MvTRVSUKmP9nda
 sc4MCpVUttnXTLJMeYBe0lZ7bxtma1ofZvCZEasoZCu71mqD3JmluLlZfoM670odSGUo
 hA0jY4fv7nNGRdLSmQMlq5qFZ/jwotsYkmIFNKJy/HM5IVjDueg2JLkbBv9SOvsb7lYd
 YQ1q6gRv8gAtXDpNqr4UuR9ry6KBs70kCYLImFW4H2PbfhqPoHbZeuqKlapA05kp003Y
 50IdNVyR8kigNpaMo/xkvp4ePO0iSXsIxPFaOuvAB0hDqJhepG0jLUMszFdCFJx/wRBP Rg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfrk0sk4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:21:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MEL4bt032337
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:21:04 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:21:04 -0700
Message-ID: <e08e5d48-3139-01e8-2c91-c439a42824d9@quicinc.com>
Date: Wed, 22 Mar 2023 08:21:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/7] accel/ivpu: Cancel recovery work
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-3-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230322091900.1982453-3-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yd6XuQP0vTFHfZRFSSqVVqvt3IxJICMX
X-Proofpoint-ORIG-GUID: yd6XuQP0vTFHfZRFSSqVVqvt3IxJICMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220105
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/2023 3:18 AM, Stanislaw Gruszka wrote:
> Prevent running recovery_work after device is removed.
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c |  2 ++
>   drivers/accel/ivpu/ivpu_pm.c  | 15 +++++++++++++--
>   drivers/accel/ivpu/ivpu_pm.h  |  1 +
>   3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index ac06bbfca920..d9e311b40348 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -580,6 +580,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
>   	ivpu_pm_disable(vdev);
>   	ivpu_shutdown(vdev);
>   	ivpu_job_done_thread_fini(vdev);
> +	ivpu_pm_cancel_recovery(vdev);
> +
>   	ivpu_ipc_fini(vdev);
>   	ivpu_fw_fini(vdev);
>   	ivpu_mmu_global_context_fini(vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index a880f1dd857e..df2e98cc0a56 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -98,11 +98,17 @@ static int ivpu_resume(struct ivpu_device *vdev)
>   static void ivpu_pm_recovery_work(struct work_struct *work)
>   {
>   	struct ivpu_pm_info *pm = container_of(work, struct ivpu_pm_info, recovery_work);
> -	struct ivpu_device *vdev =  pm->vdev;
> +	struct ivpu_device *vdev = pm->vdev;
>   	char *evt[2] = {"IVPU_PM_EVENT=IVPU_RECOVER", NULL};
>   	int ret;
>   
> -	ret = pci_reset_function(to_pci_dev(vdev->drm.dev));
> +retry:
> +	ret = pci_try_reset_function(to_pci_dev(vdev->drm.dev));
> +	if (ret == -EAGAIN && !drm_dev_is_unplugged(&vdev->drm)) {
> +		cond_resched();
> +		goto retry;
> +	}
> +
>   	if (ret)
>   		ivpu_err(vdev, "Failed to reset VPU: %d\n", ret);

I'm unsure about this now.  Yes, you did fail to reset the VPU, but is 
it an error if the device is unplugged?  Feels like this message could 
be misleading in that corner case.

> @@ -302,6 +308,11 @@ int ivpu_pm_init(struct ivpu_device *vdev)
>   	return 0;
>   }
>   
> +void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
> +{
> +	cancel_work_sync(&vdev->pm->recovery_work);
> +}
> +
>   void ivpu_pm_enable(struct ivpu_device *vdev)
>   {
>   	struct device *dev = vdev->drm.dev;
> diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
> index dc1b3758e13f..baca98187255 100644
> --- a/drivers/accel/ivpu/ivpu_pm.h
> +++ b/drivers/accel/ivpu/ivpu_pm.h
> @@ -21,6 +21,7 @@ struct ivpu_pm_info {
>   int ivpu_pm_init(struct ivpu_device *vdev);
>   void ivpu_pm_enable(struct ivpu_device *vdev);
>   void ivpu_pm_disable(struct ivpu_device *vdev);
> +void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);
>   
>   int ivpu_pm_suspend_cb(struct device *dev);
>   int ivpu_pm_resume_cb(struct device *dev);

