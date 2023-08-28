Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1178B9AE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 22:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C0C10E0CF;
	Mon, 28 Aug 2023 20:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E4710E0CF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 20:41:55 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SKfqo2007415; Mon, 28 Aug 2023 20:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FFnqoGw98CIH0fTB4rnsMwun5QbyUBnfz0IXWr1lCbQ=;
 b=W+PTj6XPMSq3/ld/611RSmxGmQ2TxbJaaX4zfn2QnbYvdjTQAQHpaurRJrkeqZrFaFGw
 YYrrF+qshnt+I5klofXMb39ZobJOzekKODhwyvpCJZclLk32h2gYfIKYb1DdnqCWJ6Qh
 Mn4SBpFz/BSfF2PDZ7pokh5jzOWMBQDt7u7TIGnyhNepltEJ0X1sGJ89BTkuCiu4amDH
 Arj+ffVp86EDNXqvdIHcGmxCk4rnuJdbffG7C6XFSMM7rBhNkEeonTr5o605j6HXGv2h
 eGFA9UbQWT8Q/oX2ZVUitHXUy8h9JK4SNudG4VkSUD9uRSBtdy7tR2E4sDMQr9DkIzw8 vQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sq9m8vpdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 20:41:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37SKfp1x001382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 20:41:51 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 28 Aug
 2023 13:41:50 -0700
Message-ID: <0b1f3c3a-cb46-fcce-2423-d8a4df852d69@quicinc.com>
Date: Mon, 28 Aug 2023 14:41:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/9] accel/ivpu: Remove duplicated error messages
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
 <20230828094736.4137092-3-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230828094736.4137092-3-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VF0jBdBvXvLAEGW6je_08fJezGyECaOv
X-Proofpoint-GUID: VF0jBdBvXvLAEGW6je_08fJezGyECaOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_18,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280179
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

On 8/28/2023 3:47 AM, Stanislaw Gruszka wrote:
> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> 
> Reduce the number of error messages per single failure in
> ivpu_dev_init(). Error messages are already printed by functions
> called from ivpu_dev_init().
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c         | 54 +++++++--------------------
>   drivers/accel/ivpu/ivpu_fw.c          |  2 +-
>   drivers/accel/ivpu/ivpu_ipc.c         | 13 +++++--
>   drivers/accel/ivpu/ivpu_mmu_context.c |  6 ++-
>   drivers/accel/ivpu/ivpu_pm.c          |  4 +-
>   drivers/accel/ivpu/ivpu_pm.h          |  2 +-
>   6 files changed, 29 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index ba79f397c9e8..b10b2909f05f 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -518,78 +518,52 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>   	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
>   
>   	ret = ivpu_pci_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize PCI device: %d\n", ret);
> +	if (ret)
>   		goto err_xa_destroy;
> -	}
>   
>   	ret = ivpu_irq_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize IRQs: %d\n", ret);
> +	if (ret)
>   		goto err_xa_destroy;
> -	}
>   
>   	/* Init basic HW info based on buttress registers which are accessible before power up */
>   	ret = ivpu_hw_info_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize HW info: %d\n", ret);
> +	if (ret)
>   		goto err_xa_destroy;
> -	}
>   
>   	/* Power up early so the rest of init code can access VPU registers */
>   	ret = ivpu_hw_power_up(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to power up HW: %d\n", ret);
> +	if (ret)
>   		goto err_xa_destroy;
> -	}
>   
>   	ret = ivpu_mmu_global_context_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
> +	if (ret)
>   		goto err_power_down;
> -	}
>   
>   	ret = ivpu_mmu_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
> +	if (ret)
>   		goto err_mmu_gctx_fini;
> -	}
>   
>   	ret = ivpu_fw_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize firmware: %d\n", ret);
> +	if (ret)
>   		goto err_mmu_gctx_fini;
> -	}
>   
>   	ret = ivpu_ipc_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
> +	if (ret)
>   		goto err_fw_fini;
> -	}
>   
> -	ret = ivpu_pm_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize PM: %d\n", ret);
> -		goto err_ipc_fini;
> -	}
> +	ivpu_pm_init(vdev);
>   
>   	ret = ivpu_job_done_thread_init(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize job done thread: %d\n", ret);
> +	if (ret)
>   		goto err_ipc_fini;
> -	}
>   
>   	ret = ivpu_fw_load(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
> +	if (ret)
>   		goto err_job_done_thread_fini;
> -	}
>   
>   	ret = ivpu_boot(vdev);
> -	if (ret) {
> -		ivpu_err(vdev, "Failed to boot: %d\n", ret);
> +	if (ret)
>   		goto err_job_done_thread_fini;
> -	}
>   
>   	ivpu_pm_enable(vdev);
>   
> @@ -651,10 +625,8 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	pci_set_drvdata(pdev, vdev);
>   
>   	ret = ivpu_dev_init(vdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to initialize VPU device: %d\n", ret);
> +	if (ret)
>   		return ret;
> -	}

Commit text doesn't mention anything about this change.

>   
>   	ret = drm_dev_register(&vdev->drm, 0);
>   	if (ret) {
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 9827ea4d7b83..9b6ecd3e9537 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -78,7 +78,7 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
>   		}
>   	}
>   
> -	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
> +	ivpu_err(vdev, "Failed to load firmware: %d\n", ret);

Commit text doesn't mention anything about this.  Nor do I understand it 
as this function doesn't load the firmware.


Everything below this point seems to be not related to $SUBJECT and 
feels like should be a separate patch.


>   	return ret;
>   }
>   
> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
> index fa0af59e39ab..6b2e9dbb284a 100644
> --- a/drivers/accel/ivpu/ivpu_ipc.c
> +++ b/drivers/accel/ivpu/ivpu_ipc.c
> @@ -426,15 +426,20 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
>   int ivpu_ipc_init(struct ivpu_device *vdev)
>   {
>   	struct ivpu_ipc_info *ipc = vdev->ipc;
> -	int ret = -ENOMEM;
> +	int ret;
>   
>   	ipc->mem_tx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
> -	if (!ipc->mem_tx)
> -		return ret;
> +	if (!ipc->mem_tx) {
> +		ivpu_err(vdev, "Failed to allocate mem_tx\n");
> +		return -ENOMEM;
> +	}
>   
>   	ipc->mem_rx = ivpu_bo_alloc_internal(vdev, 0, SZ_16K, DRM_IVPU_BO_WC);
> -	if (!ipc->mem_rx)
> +	if (!ipc->mem_rx) {
> +		ivpu_err(vdev, "Failed to allocate mem_rx\n");
> +		ret = -ENOMEM;
>   		goto err_free_tx;
> +	}
>   
>   	ipc->mm_tx = devm_gen_pool_create(vdev->drm.dev, __ffs(IVPU_IPC_ALIGNMENT),
>   					  -1, "TX_IPC_JSM");
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index 1d2e554e2c4a..1144d6eb5120 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -427,8 +427,10 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
>   	INIT_LIST_HEAD(&ctx->bo_list);
>   
>   	ret = ivpu_mmu_pgtable_init(vdev, &ctx->pgtable);
> -	if (ret)
> +	if (ret) {
> +		ivpu_err(vdev, "Failed to initialize pgtable for ctx %u: %d\n", context_id, ret);
>   		return ret;
> +	}
>   
>   	if (!context_id) {
>   		start = vdev->hw->ranges.global.start;
> @@ -488,7 +490,7 @@ int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context
>   
>   	ret = ivpu_mmu_context_init(vdev, ctx, ctx_id);
>   	if (ret) {
> -		ivpu_err(vdev, "Failed to initialize context: %d\n", ret);
> +		ivpu_err(vdev, "Failed to initialize context %u: %d\n", ctx_id, ret);
>   		return ret;
>   	}
>   
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 954c9ecd3e14..28a0d1111e12 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -282,7 +282,7 @@ void ivpu_pm_reset_done_cb(struct pci_dev *pdev)
>   	pm_runtime_put_autosuspend(vdev->drm.dev);
>   }
>   
> -int ivpu_pm_init(struct ivpu_device *vdev)
> +void ivpu_pm_init(struct ivpu_device *vdev)
>   {
>   	struct device *dev = vdev->drm.dev;
>   	struct ivpu_pm_info *pm = vdev->pm;
> @@ -303,8 +303,6 @@ int ivpu_pm_init(struct ivpu_device *vdev)
>   	pm_runtime_set_autosuspend_delay(dev, delay);
>   
>   	ivpu_dbg(vdev, PM, "Autosuspend delay = %d\n", delay);
> -
> -	return 0;
>   }
>   
>   void ivpu_pm_cancel_recovery(struct ivpu_device *vdev)
> diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
> index fd4eada1290f..f41c30a14a40 100644
> --- a/drivers/accel/ivpu/ivpu_pm.h
> +++ b/drivers/accel/ivpu/ivpu_pm.h
> @@ -19,7 +19,7 @@ struct ivpu_pm_info {
>   	u32 suspend_reschedule_counter;
>   };
>   
> -int ivpu_pm_init(struct ivpu_device *vdev);
> +void ivpu_pm_init(struct ivpu_device *vdev);
>   void ivpu_pm_enable(struct ivpu_device *vdev);
>   void ivpu_pm_disable(struct ivpu_device *vdev);
>   void ivpu_pm_cancel_recovery(struct ivpu_device *vdev);

