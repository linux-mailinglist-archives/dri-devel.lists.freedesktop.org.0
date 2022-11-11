Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A5626393
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 22:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F39510E8B8;
	Fri, 11 Nov 2022 21:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7B310E0D4;
 Fri, 11 Nov 2022 21:29:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ABK7gPl008799; Fri, 11 Nov 2022 21:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=uIanU9LhbPaQaWYLWFzBHASxrX1ZhAwia93DNI3Lt5w=;
 b=Y3gxuXWG+PYMnlBIMzLOmA0h9scoDO9nm4MbliAuZ7idBe0IKK8aRC7qYID6CHIuzO2E
 nzRcJQ2A0qEcqzywwidIQT14jrFkYDAE4pknWrU8qKol+TVTYZYO6aBAjSB4vJy4uHSG
 zxGAFfGB+ULjIRSGu5hc7rSIDO7Vwdi+kBICD1u2OiRfEAU8oQ8UkxeZuAwVh1F/twN+
 zQot2cwYPEXH9RJ9TfMRLrJKF6rzAwK+PTxrjMrAPQt/nafG9yz/7P9KOLgBoodWPAXh
 kF5ueuWwkHGe4MRhwcgeY2u14dhh5dMww9NfR6CEyvSaayYkWqy+90WSR8YELyG0h0nt 8g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ksu6tredq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 21:28:54 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ABLSroC030675
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 21:28:53 GMT
Received: from [10.216.43.102] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 11 Nov
 2022 13:28:47 -0800
Message-ID: <899db0f8-7b8a-ed8f-30b8-4f630da1298d@quicinc.com>
Date: Sat, 12 Nov 2022 02:58:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] adreno: Detect shutdown during get_param()
Content-Language: en-US
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>,
 <linux-kernel@vger.kernel.org>
References: <20221111194957.4046771-1-joel@joelfernandes.org>
 <20221111194957.4046771-2-joel@joelfernandes.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20221111194957.4046771-2-joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: T4aAOvsz-SnCrYaaU2dbJSwGA7soN8OB
X-Proofpoint-ORIG-GUID: T4aAOvsz-SnCrYaaU2dbJSwGA7soN8OB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_11,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211110145
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/2022 1:19 AM, Joel Fernandes (Google) wrote:
> Even though the GPU is shut down, during kexec reboot we can have userspace
> still running. This is especially true if KEXEC_JUMP is not enabled, because we
> do not freeze userspace in this case.
>
> To prevent crashes, track that the GPU is shutdown and prevent get_param() from
> accessing GPU resources if we find it shutdown.
>
> This fixes the following crash during kexec reboot on an ARM64 device with adreno GPU:
>
> [  292.534314] Kernel panic - not syncing: Asynchronous SError Interrupt
> [  292.534323] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> [  292.534326] Call trace:
> [  292.534328]  dump_backtrace+0x0/0x1d4
> [  292.534337]  show_stack+0x20/0x2c
> [  292.534342]  dump_stack_lvl+0x60/0x78
> [  292.534347]  dump_stack+0x18/0x38
> [  292.534352]  panic+0x148/0x3b0
> [  292.534357]  nmi_panic+0x80/0x94
> [  292.534364]  arm64_serror_panic+0x70/0x7c
> [  292.534369]  do_serror+0x0/0x7c
> [  292.534372]  do_serror+0x54/0x7c
> [  292.534377]  el1h_64_error_handler+0x34/0x4c
> [  292.534381]  el1h_64_error+0x7c/0x80
> [  292.534386]  el1_interrupt+0x20/0x58
> [  292.534389]  el1h_64_irq_handler+0x18/0x24
> [  292.534395]  el1h_64_irq+0x7c/0x80
> [  292.534399]  local_daif_inherit+0x10/0x18
> [  292.534405]  el1h_64_sync_handler+0x48/0xb4
> [  292.534410]  el1h_64_sync+0x7c/0x80
> [  292.534414]  a6xx_gmu_set_oob+0xbc/0x1fc
> [  292.534422]  a6xx_get_timestamp+0x40/0xb4
> [  292.534426]  adreno_get_param+0x12c/0x1e0
> [  292.534433]  msm_ioctl_get_param+0x64/0x70
> [  292.534440]  drm_ioctl_kernel+0xe8/0x158
> [  292.534448]  drm_ioctl+0x208/0x320
> [  292.534453]  __arm64_sys_ioctl+0x98/0xd0
> [  292.534461]  invoke_syscall+0x4c/0x118
> [  292.534467]  el0_svc_common+0x98/0x104
> [  292.534473]  do_el0_svc+0x30/0x80
> [  292.534478]  el0_svc+0x20/0x50
> [  292.534481]  el0t_64_sync_handler+0x78/0x108
> [  292.534485]  el0t_64_sync+0x1a4/0x1a8
> [  292.534632] Kernel Offset: 0x1a5f800000 from 0xffffffc008000000
> [  292.534635] PHYS_OFFSET: 0x80000000
> [  292.534638] CPU features: 0x40018541,a3300e42
> [  292.534644] Memory Limit: none
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Ross Zwisler <zwisler@kernel.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 2 +-
>   drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
>   3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index f0cff62812c3..03d912dc0130 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -612,6 +612,7 @@ static void adreno_shutdown(struct platform_device *pdev)
>   {
>   	struct msm_gpu *gpu = dev_to_gpu(&pdev->dev);
>   
> +	gpu->is_shutdown = true;
>   	WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
>   }
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 382fb7f9e497..6903c6892469 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -251,7 +251,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   
>   	/* No pointer params yet */
> -	if (*len != 0)
> +	if (*len != 0 || gpu->is_shutdown)
>   		return -EINVAL;
This will race with shutdown. Probably, propagating back the return 
value of pm_runtime_get() in every possible ioctl call path is the right 
thing to do.

I have never thought about this scenario. Do you know why userspace is 
not freezed before kexec?

-Akhil.
>   
>   	switch (param) {
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ff911e7305ce..f18b0a91442b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -214,6 +214,9 @@ struct msm_gpu {
>   	/* does gpu need hw_init? */
>   	bool needs_hw_init;
>   
> +	/* is the GPU shutdown? */
> +	bool is_shutdown;
> +
>   	/**
>   	 * global_faults: number of GPU hangs not attributed to a particular
>   	 * address space

