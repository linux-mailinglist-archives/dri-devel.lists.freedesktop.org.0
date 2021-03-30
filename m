Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46834F44F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 549C088FE5;
	Tue, 30 Mar 2021 22:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1E36E94E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 18:35:02 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so16492368ota.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 11:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7htaQKxbftoYBoBRvo6Fw3o/xGPBC8mf4mLzA2dc/4o=;
 b=Ft5K1BDKQVSaTIL9aJRJ/hHCgyhttM6MmqYsQMbiLPuOd2RI52tQyVuF0WSh1DgmT0
 jQONm6nzuGp4Jg11PZc07nR1wdwndptUnGbXhDajnM9XKugPZ50Gz9PgR2cvm0eOer80
 yO8N6RxphvKTM098kSf/P/lKulCSAzDjTGFVr9XbbOPGJsLnLamWtsfU5EEv71VZZ+vd
 zWmVYbudtEgS5wW4IRzsUcFhP8mPcS3ODLRX/9hSNHY8f/UGlzbQTYYfAbcqLkrCYccP
 It6xI8BpDhRk6cDXlAoHpf1epj6vcxco20xdEDUFbPM7AEu7jJeNLKVnbQNixtHR89O0
 cTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7htaQKxbftoYBoBRvo6Fw3o/xGPBC8mf4mLzA2dc/4o=;
 b=NiOQ2Z2NVfaw2fqoWltq5lgRXmIBJDHtWjMb1RxcK42mBLnHf2N4pPo43NfPzrA84u
 MFGTwtlhLEPqvT35I7NQ6i97sYYLpJi/Dfbry/VzESOpIexoJxUfS7BKEXn65KRq7Z1J
 fJYL+2F1SGe3vBOGVcA8OJZqj0pdWXGw5eZwK3OcHc0GaMiTML3EZdc0J/c3NJEi+MRZ
 ROSG+u6Wz6LJpNViJ+5gO9h6dgCWb+FouKPK+FT0VuqXfHlvQt31jwRl9yLAU7Ivx1bE
 ekveXTVsD2j7PK8LPhu00JCHqXpkUFuvYlqCmmR/hKG+por2rTw/FzG5IRAUeG5GrAN2
 RBiA==
X-Gm-Message-State: AOAM5335iY8PGk5RJnkF+XjtArvzYQ582x0zRKD4OUvlDJjswvmZ9PHG
 X44kVyXyGfZvJWT1lfOwx0icKQ==
X-Google-Smtp-Source: ABdhPJxm/HKy8G9IahnJtm9yGlmSCpqOeKz1dBEhVN8GGToPwn+I+VZJQQyGDe8lEGomZ9Kyg1y2uw==
X-Received: by 2002:a9d:4811:: with SMTP id c17mr29460104otf.206.1617129302172; 
 Tue, 30 Mar 2021 11:35:02 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net
 (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id g2sm5232437otn.32.2021.03.30.11.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 11:35:01 -0700 (PDT)
Subject: Re: [v1] drm/msm/disp/dpu1: icc path needs to be set before dpu
 runtime resume
To: Kalyan Thota <kalyan_t@codeaurora.org>, y@qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <823f7f00-444e-8e22-e8d0-2ced97e4c291@kali.org>
Date: Tue, 30 Mar 2021 13:34:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 30 Mar 2021 22:33:16 +0000
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
Cc: mkrishn@codeaurora.org, hywu@google.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, mka@google.com, midean@google.com,
 Kalyan Thota <kalyant@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/22/21 4:17 AM, Kalyan Thota wrote:
> From: Kalyan Thota <kalyant@codeaurora.org>
>
> DPU runtime resume will request for a min vote on the AXI bus as
> it is a necessary step before turning ON the AXI clock.
>
> The change does below
> 1) Move the icc path set before requesting runtime get_sync.
> 2) remove the dependency of hw catalog for min ib vote
> as it is initialized at a later point.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ed636f1..cab387f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -44,6 +44,8 @@
>  #define DPU_DEBUGFS_DIR "msm_dpu"
>  #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>  
> +#define MIN_IB_BW	400000000ULL /* Min ib vote 400MB */
> +
>  static int dpu_kms_hw_init(struct msm_kms *kms);
>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>  
> @@ -932,6 +934,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		DPU_DEBUG("REG_DMA is not defined");
>  	}
>  
> +	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> +		dpu_kms_parse_data_bus_icc_path(dpu_kms);
> +
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>  
>  	dpu_kms->core_rev = readl_relaxed(dpu_kms->mmio + 0x0);
> @@ -1037,9 +1042,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	dpu_vbif_init_memtypes(dpu_kms);
>  
> -	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> -		dpu_kms_parse_data_bus_icc_path(dpu_kms);
> -
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  
>  	return 0;
> @@ -1196,10 +1198,10 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  
>  	ddev = dpu_kms->dev;
>  
> +	WARN_ON(!(dpu_kms->num_paths));
>  	/* Min vote of BW is required before turning on AXI clk */
>  	for (i = 0; i < dpu_kms->num_paths; i++)
> -		icc_set_bw(dpu_kms->path[i], 0,
> -			dpu_kms->catalog->perf.min_dram_ib);
> +		icc_set_bw(dpu_kms->path[i], 0, Bps_to_icc(MIN_IB_BW));
>  
>  	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
>  	if (rc) {

With this patch now applied to 5.12-rc5, I am seeing the following when
booting the Lenovo Yoga C630 -

Mar 30 13:16:03 c630 kernel: [    2.038491] ------------[ cut here ]------------
Mar 30 13:16:03 c630 kernel: [    2.038495] WARNING: CPU: 3 PID: 125 at drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:1196 dpu_runtime_resume+0xc0/0xf0 [msm]
Mar 30 13:16:03 c630 kernel: [    2.038551] Modules linked in: ti_sn65dsi86 i2c_hid_of crct10dif_ce msm rtc_pm8xxx llcc_qcom ocmem drm_kms_helper i2c_qcom_geni phy_qcom_qusb2 ipa(+) qcom_common qcom_glink_smem qmi_helpers mdt_loader panel_simple drm pwm_bl
Mar 30 13:16:03 c630 kernel: [    2.038599] CPU: 3 PID: 125 Comm: kworker/3:1 Not tainted 5.12.0-rc5 #1
Mar 30 13:16:03 c630 kernel: [    2.038605] Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
Mar 30 13:16:03 c630 kernel: [    2.038610] Workqueue: events deferred_probe_work_func
Mar 30 13:16:03 c630 kernel: [    2.038621] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
Mar 30 13:16:03 c630 kernel: [    2.038627] pc : dpu_runtime_resume+0xc0/0xf0 [msm]
Mar 30 13:16:03 c630 kernel: [    2.038674] lr : pm_generic_runtime_resume+0x30/0x50
Mar 30 13:16:03 c630 kernel: [    2.038683] sp : ffff800010b9b7e0
Mar 30 13:16:03 c630 kernel: [    2.038685] x29: ffff800010b9b7e0 x28: 0000000000000000 
Mar 30 13:16:03 c630 kernel: [    2.038692] x27: 0000000000000000 x26: ffff6b42c0c16cf4 
Mar 30 13:16:03 c630 kernel: [    2.038698] x25: 000000007965f7df x24: 0000000000000001 
Mar 30 13:16:03 c630 kernel: [    2.038705] x23: ffff6b42c0a34180 x22: ffffda2e0cc5b3d0 
Mar 30 13:16:03 c630 kernel: [    2.038712] x21: ffffda2e0b3ed6a0 x20: ffff6b42c6845000 
Mar 30 13:16:03 c630 kernel: [    2.038718] x19: ffff6b42c6851080 x18: ffffda2e0cce1220 
Mar 30 13:16:03 c630 kernel: [    2.038725] x17: ffffda2e0cce1238 x16: ffffda2e0b23e5f0 
Mar 30 13:16:03 c630 kernel: [    2.038731] x15: 0000000040000000 x14: 0000000000000000 
Mar 30 13:16:03 c630 kernel: [    2.038738] x13: ffff6b42c5f0b5b0 x12: 0000000000000000 
Mar 30 13:16:03 c630 kernel: [    2.038744] x11: 0000000000000001 x10: 0000000000003fff 
Mar 30 13:16:03 c630 kernel: [    2.038750] x9 : 0000000000000000 x8 : 0000000000000000 
Mar 30 13:16:03 c630 kernel: [    2.038755] x7 : 0000000000000000 x6 : 000000000c473b7e 
Mar 30 13:16:03 c630 kernel: [    2.038761] x5 : 00ffffffffffffff x4 : 00221806fff8f800 
Mar 30 13:16:03 c630 kernel: [    2.038768] x3 : 0000000000000018 x2 : ffffda2dc3d34320 
Mar 30 13:16:03 c630 kernel: [    2.038774] x1 : 0000000000000000 x0 : 0000000000000000 
Mar 30 13:16:03 c630 kernel: [    2.038781] Call trace:
Mar 30 13:16:03 c630 kernel: [    2.038784]  dpu_runtime_resume+0xc0/0xf0 [msm]
Mar 30 13:16:03 c630 kernel: [    2.038831]  pm_generic_runtime_resume+0x30/0x50
Mar 30 13:16:03 c630 kernel: [    2.038836]  __genpd_runtime_resume+0x30/0xb0
Mar 30 13:16:03 c630 kernel: [    2.038842]  genpd_runtime_resume+0x90/0x250
Mar 30 13:16:03 c630 kernel: [    2.038848]  __rpm_callback+0x90/0x160
Mar 30 13:16:03 c630 kernel: [    2.038854]  rpm_callback+0x24/0x84
Mar 30 13:16:03 c630 kernel: [    2.038859]  rpm_resume+0x450/0x6ec
Mar 30 13:16:03 c630 kernel: [    2.038865]  __pm_runtime_resume+0x3c/0x90
Mar 30 13:16:03 c630 kernel: [    2.038870]  dpu_kms_hw_init+0x124/0x5dc [msm]
Mar 30 13:16:03 c630 kernel: [    2.038918]  msm_drm_bind+0x468/0x594 [msm]
Mar 30 13:16:03 c630 kernel: [    2.038965]  try_to_bring_up_master+0x164/0x1d0
Mar 30 13:16:03 c630 kernel: [    2.038973]  component_master_add_with_match+0xb8/0x100
Mar 30 13:16:03 c630 kernel: [    2.038979]  msm_pdev_probe+0x260/0x300 [msm]
Mar 30 13:16:03 c630 kernel: [    2.039026]  platform_probe+0x68/0xe0
Mar 30 13:16:03 c630 kernel: [    2.039032]  really_probe+0xe4/0x4c0
Mar 30 13:16:03 c630 kernel: [    2.039036]  driver_probe_device+0x58/0xc0
Mar 30 13:16:03 c630 kernel: [    2.039040]  __device_attach_driver+0xa8/0x104
Mar 30 13:16:03 c630 kernel: [    2.039045]  bus_for_each_drv+0x78/0xd0
Mar 30 13:16:03 c630 kernel: [    2.039051]  __device_attach+0xd8/0x17c
Mar 30 13:16:03 c630 kernel: [    2.039055]  device_initial_probe+0x14/0x20
Mar 30 13:16:03 c630 kernel: [    2.039059]  bus_probe_device+0x9c/0xa4
Mar 30 13:16:03 c630 kernel: [    2.039065]  deferred_probe_work_func+0x74/0xb0
Mar 30 13:16:03 c630 kernel: [    2.039069]  process_one_work+0x1d0/0x494
Mar 30 13:16:03 c630 kernel: [    2.039076]  worker_thread+0x13c/0x470
Mar 30 13:16:03 c630 kernel: [    2.039080]  kthread+0x158/0x160
Mar 30 13:16:03 c630 kernel: [    2.039085]  ret_from_fork+0x10/0x34
Mar 30 13:16:03 c630 kernel: [    2.039093] ---[ end trace 65a4c9cc3f59c59a ]---
Mar 30 13:16:03 c630 kernel: [    2.039124] [drm:dpu_kms_hw_init:943] dpu hardware revision:0x40000000

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
