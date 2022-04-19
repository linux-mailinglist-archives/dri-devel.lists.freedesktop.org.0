Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6F507C0D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86C010E2C6;
	Tue, 19 Apr 2022 21:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D259A10E2C6;
 Tue, 19 Apr 2022 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650404743; x=1681940743;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gw0iGZByL3fO5YsgmcD1S3iUEmEvHtG6m+MeOjmAdsQ=;
 b=mneHLBIOxazGRC0zTt8c+qP8o79hrSeSZ1sim6LcsYVBF9KxBngB4JVk
 BYRYnZPbDljejQyi1mLPnHqGptdKJkj1NZZSfSyEn8UJdJFTkcSwmy2t3
 /X+LMr3fWbXtQw8FOZvE9hhKPggfPWQ9qgL9coYylzLz/5d+1Tmjpc7PO w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Apr 2022 14:45:43 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 14:45:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 14:45:42 -0700
Received: from [10.111.175.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 19 Apr
 2022 14:45:40 -0700
Message-ID: <609d2dd1-ec25-c0ce-6396-856c4d2660b2@quicinc.com>
Date: Tue, 19 Apr 2022 14:45:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: fixup DSC support for the cases when there
 is no pannel attached
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220419213706.1452361-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Vinod
 Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

typo in the subject

pannel --> panel

Otherwise,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

On 4/19/2022 2:37 PM, Dmitry Baryshkov wrote:
> Unable to handle kernel paging request at virtual address fffffffffffffe2b
> Mem abort info:
>    ESR = 0x96000004
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x04: level 0 translation fault
> Data abort info:
>    ISV = 0, ISS = 0x00000004
>    CM = 0, WnR = 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000a1a39000
> [fffffffffffffe2b] pgd=0000000000000000, p4d=0000000000000000
> Internal error: Oops: 96000004 [#1] SMP
> Modules linked in:
> CPU: 7 PID: 8 Comm: kworker/u16:0 Not tainted 5.18.0-rc3-00055-g3120774492e8 #672
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : msm_dsi_host_modeset_init+0x30/0xcc
> lr : msm_dsi_host_modeset_init+0x28/0xcc
> sp : ffff800008093640
> x29: ffff800008093640 x28: ffff0757131ef080 x27: 0000000000000000
> x26: ffffa1d966bca440 x25: 0000000000000000 x24: 0000000000000001
> x23: ffff0757131e6880 x22: ffff075700dc9c00 x21: ffffa1d965d40f60
> x20: fffffffffffffdfb x19: ffff0757131ea480 x18: ffffffffffffffff
> x17: ffffa1d966c51b10 x16: 00000000000003e8 x15: ffff075713989287
> x14: ffffffffffffffff x13: ffff075713989284 x12: ffff07587effaf90
> x11: ffff07587effaf70 x10: 00000000000b4220 x9 : 0000000000000003
> x8 : 0101010101010101 x7 : 0000000000000003 x6 : 1d150c11f5f38080
> x5 : 0000000000000000 x4 : ffff0757001f63c0 x3 : ffffa1d966bc02b8
> x2 : 0000000000000000 x1 : ffff0757001f63c0 x0 : fffffffffffffdfb
> Call trace:
>   msm_dsi_host_modeset_init+0x30/0xcc
>   msm_dsi_modeset_init+0x40/0x1e4
>   _dpu_kms_drm_obj_init.isra.0+0xdc/0x5c0
>   dpu_kms_hw_init+0x338/0x590
>   msm_drm_bind+0x1d8/0x5f0
>   try_to_bring_up_aggregate_device+0x164/0x1d0
>   __component_add+0xa4/0x170
>   component_add+0x14/0x20
>   dsi_dev_attach+0x20/0x30
>   dsi_host_attach+0x94/0x150
>   devm_mipi_dsi_attach+0x34/0xb0
>   lt9611uxc_attach_dsi.isra.0+0x84/0x100
>   lt9611uxc_probe+0x538/0x5e0
>   i2c_device_probe+0x2ac/0x2f0
>   really_probe.part.0+0x9c/0x28c
>   __driver_probe_device+0x98/0x144
>   driver_probe_device+0x40/0x140
>   __device_attach_driver+0xb4/0x120
>   bus_for_each_drv+0x78/0xd0
>   __device_attach+0xdc/0x184
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0x9c/0xa4
>   deferred_probe_work_func+0x88/0xc0
>   process_one_work+0x1ec/0x444
>   worker_thread+0x294/0x4dc
>   kthread+0xfc/0x100
>   ret_from_fork+0x10/0x20
> Code: f940e675 97fdc7ba b40000c0 aa0003f4 (f9401800)
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Note: I'm going to squash this fix into the respective patch from the
> DSC series
> 
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 03921649bd28..c983698d1384 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2167,7 +2167,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   	msm_host->dev = dev;
>   	panel = msm_dsi_host_get_panel(&msm_host->base);
>   
> -	if (panel && panel->dsc) {
> +	if (!IS_ERR(panel) && panel->dsc) {
>   		struct msm_display_dsc_config *dsc = msm_host->dsc;
>   
>   		if (!dsc) {
