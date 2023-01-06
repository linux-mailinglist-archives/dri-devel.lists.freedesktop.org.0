Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E665FBD1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 08:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DE910E2E3;
	Fri,  6 Jan 2023 07:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7DF10E2CE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 07:18:24 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b3so911382lfv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 23:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fwNOkK/619F6kwc/0Tj1pDo4Y9cxK12cXZ8QRlsLr6c=;
 b=JYJ70ritw2cx4/IvR9IiIbsgwqw4HWs/g4hPHX5vB+Fsokz0YvbAkV+WT8PMDX3Yrv
 o1pI0tIcLqzWLHzSWTosiOtxcIE2Q79xD3r2kBD1KlCfS8P3OreyFq39ARAthzF7dUaW
 0k44EHlzwnAMW1ZhKTHumoJz/TemXhH3+CVxBLTUW4Vsv9U5tGm8VrmLXp/aVXFRRJwu
 chqKdo7ZT5FExXxJSE3ck4oltx83rsKafIBfjQ2enm2ymVH5Idk6bRj1o/DeWE0jVxo5
 yJlgrF3e1cGCBjesc0AZACf9j7oRegCzyHa+PjrvlX01fjVSHEw0eKJu5MuCuuXRctO0
 /y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fwNOkK/619F6kwc/0Tj1pDo4Y9cxK12cXZ8QRlsLr6c=;
 b=5h9LEs6r8qFqLXQ5VZHF+e3jYD+WcyFLaws6vhBZLkAVgG+WKcL5aiwaBJk8GSBl73
 3ZEMzkjh2mxCDtndk1YgBxha2JZxXinu9Vmo3iMmcSzm4MT/zWqRbGChedrazzncFn9n
 hl91LJpk5yGtKDnfB1+gThD3/7/XHT6ULmVEmwbp9uOyOMWs0TMBokIO4JgH/15zNP/Y
 0kSqKjDJuc1Dt2+lWWMK/Ga3mE2aqutWhca6aB8SfAn5BvweuGncOYQusm/XlDlcFJ91
 h4t6oPIREybNrmZDybl9x3gPyAI/0OhB8S2X9gZE5d8cVg2Cryg1j2OUx+OmLcCSC8ET
 5qVQ==
X-Gm-Message-State: AFqh2kqyx/yrAlzEbgyyK/mIwwBlOP3vRShg8fRaJZVagLd7bTzpzDB+
 DzABhcBtB+EJM60MxCHgX9p07g==
X-Google-Smtp-Source: AMrXdXtkBlNpkecak93UASBcKEuMXUx4GuG2RT59y+bG+p5w0zFuJUEV6ziyHNppyL41uyZ+n65U3g==
X-Received: by 2002:a05:6512:3c9e:b0:4b6:a6e4:ab7a with SMTP id
 h30-20020a0565123c9e00b004b6a6e4ab7amr17977799lfv.8.1672989503149; 
 Thu, 05 Jan 2023 23:18:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y8-20020ac255a8000000b004a9b9ccfbe6sm57707lfg.51.2023.01.05.23.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 23:18:22 -0800 (PST)
Message-ID: <f52cca60-ab6a-460a-65f9-367c083b51fa@linaro.org>
Date: Fri, 6 Jan 2023 09:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm: Set preferred depth.
Content-Language: en-GB
To: Steev Klimaszewski <steev@kali.org>
References: <20230106071609.3948-1-steev@kali.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230106071609.3948-1-steev@kali.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/01/2023 09:16, Steev Klimaszewski wrote:
> As of commit 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format
> selection"), if no supported color formats are found, it tries to use the
> driver provided default, which msm didn't have set and leads to the
> following output:
> 
> msm_dpu ae01000.display-controller: [drm] bpp/depth value of 32/0 not supported
> msm_dpu ae01000.display-controller: [drm] bpp/depth value of 32/0 not supported
> msm_dpu ae01000.display-controller: [drm] bpp/depth value of 32/0 not supported
> msm_dpu ae01000.display-controller: [drm] No compatible format found
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 73 at drivers/gpu/drm/drm_atomic.c:1604 __drm_atomic_helper_set_config+0x240/0x33c
> Modules linked in: ext4 mbcache jbd2 msm mdt_loader ocmem gpu_sched llcc_qcom gpio_keys qrtr
> CPU: 0 PID: 73 Comm: kworker/u16:2 Not tainted 6.2.0-rc2-next-20230106 #53
> Hardware name: LENOVO 21BX0015US/21BX0015US, BIOS N3HET74W (1.46 ) 10/12/2022
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __drm_atomic_helper_set_config+0x240/0x33c
> lr : __drm_atomic_helper_set_config+0x68/0x33c
> sp : ffff800008a7b790
> x29: ffff800008a7b790 x28: ffff73ee3e130a00 x27: 0000000000000000
> x26: ffff73ee3d256e00 x25: 0000000000000038 x24: ffff73e6c0d65e00
> x23: ffff73e6c17a7800 x22: ffff73e6c0d64e00 x21: ffff73e79c025e00
> x20: 00000000c0d64e00 x19: ffff73ee3e130a00 x18: ffffffffffffffff
> x17: 662074616d726f66 x16: 20656c6269746170 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> x11: 0000000000000000 x10: 0000000000000000 x9 : ffffa829144ff8bc
> x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffff73e6c0d65f50 x4 : ffff73ee3d254950 x3 : ffff73e6c0d65ec0
> x2 : ffff73ee3c953a00 x1 : ffff73e79c025580 x0 : 0000000000000000
> Call trace:
> __drm_atomic_helper_set_config+0x240/0x33c
> drm_client_modeset_commit_atomic+0x160/0x280
> drm_client_modeset_commit_locked+0x64/0x194
> drm_client_modeset_commit+0x38/0x60
> __drm_fb_helper_initial_config_and_unlock+0x528/0x63c
> drm_fb_helper_initial_config+0x54/0x64
> msm_fbdev_init+0x94/0xfc [msm]
> msm_drm_bind+0x548/0x614 [msm]
> try_to_bring_up_aggregate_device+0x1e4/0x2d0
> __component_add+0xc4/0x1c0
> component_add+0x1c/0x2c
> dp_display_probe+0x2a4/0x460 [msm]
> platform_probe+0x70/0xcc
> really_probe+0xc8/0x3e0
> __driver_probe_device+0x84/0x190
> driver_probe_device+0x44/0x120
> __device_attach_driver+0xc4/0x160
> bus_for_each_drv+0x84/0xe0
> __device_attach+0xa4/0x1cc
> device_initial_probe+0x1c/0x2c
> bus_probe_device+0xa4/0xb0
> deferred_probe_work_func+0xc0/0x114
> process_one_work+0x1ec/0x470
> worker_thread+0x74/0x410
> kthread+0xfc/0x110
> ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>   1 file changed, 1 insertion(+)

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

