Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65D663D44
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADD410E580;
	Tue, 10 Jan 2023 09:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256A10E580
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:50:48 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id jn22so12589365plb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LFUKQhnlWh+vQvC+BcQrfAAE16ClcsD92Eyht+PMCKI=;
 b=KXfAacA0vhhS3Q50pk9pO89njWnuTfVxUvLVzwZB6HGeMu64LHO+N4lhISy7kif8se
 OwopF8BfSl0ApmJp3wU8pDcULITz0yzez4EbyOiw7ggyIkdUDbYzv61/LQ11ZQWCBnt0
 ZrWrmUr9UENSkhXNwAzbNazZB02ERvf34phUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFUKQhnlWh+vQvC+BcQrfAAE16ClcsD92Eyht+PMCKI=;
 b=V5K1xBG6JfH/4jlqirzH37pWV09A3nh7BVv3Tf9PQkdniI7033MBVp2tE3KMb65Fk0
 E+jaSDrKTsyzokdmnT5bJ+YSB7vYTddoalI6YPX5GZXMmbM4JhNdUYin16b+r8kwFP5o
 6xxWLf8t/dIJWWB5IjMKs4KESVK+qbebRp6EattKPTS/CKMBFHJWd++MgiRSVlrHEa1s
 QDpl1sQUqAGgDNij+CmoPIrsONmbmbhUIcV7MawuNguYInUYmAgF24M65uFFdFxSDszM
 Gkkeg7EnvIkqc1uDoj4uWQGFRhaEpPaTuc1py5tVRRs9BrqJRBjpfqatClaV+flonf2F
 kYjg==
X-Gm-Message-State: AFqh2krapO9BGd5Oqj0baAFcl5MWuYKnydEQQVXRiDZNTqA+TWT38w6+
 zVu3yStPnTO3zmBXeRjqqdzU9Kvkad6827pKIIs=
X-Google-Smtp-Source: AMrXdXvn9V2BnC6+JrCwoqOJSTf4QVs93x1AQazN7HuO0g6QQlYTyWNk3hA/tztjOtiuw3o5NxlyDA==
X-Received: by 2002:a05:6a20:2a26:b0:af:9c65:5ba5 with SMTP id
 e38-20020a056a202a2600b000af9c655ba5mr67810351pzh.60.1673344247538; 
 Tue, 10 Jan 2023 01:50:47 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181]) by smtp.gmail.com with ESMTPSA id
 y7-20020a17090a474700b00219463262desm6660441pjg.39.2023.01.10.01.50.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 01:50:46 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id p24so12596498plw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:50:46 -0800 (PST)
X-Received: by 2002:a17:902:a984:b0:189:d081:1ebb with SMTP id
 bh4-20020a170902a98400b00189d0811ebbmr3482923plb.130.1673344245710; Tue, 10
 Jan 2023 01:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20230109222547.1368644-1-joel@joelfernandes.org>
In-Reply-To: <20230109222547.1368644-1-joel@joelfernandes.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jan 2023 10:50:34 +0100
X-Gmail-Original-Message-ID: <CANiDSCtnu=1+dKgKVBOZoQiDNPidDC=Ocrmy=k7HFPdKQgfaBA@mail.gmail.com>
Message-ID: <CANiDSCtnu=1+dKgKVBOZoQiDNPidDC=Ocrmy=k7HFPdKQgfaBA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] adreno: Shutdown the GPU properly
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 23:25, Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> During kexec on ARM device, we notice that device_shutdown() only calls
> pm_runtime_force_suspend() while shutting down the GPU. This means the GPU
> kthread is still running and further, there maybe active submits.
>
> This causes all kinds of issues during a kexec reboot:
>
> Warning from shutdown path:
>
> [  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_suspend+0x3c/0x44
> [  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> [  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
> [  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
> [  292.509905] sp : ffffffc014473bf0
> [...]
> [  292.510043] Call trace:
> [  292.510051]  adreno_runtime_suspend+0x3c/0x44
> [  292.510061]  pm_generic_runtime_suspend+0x30/0x44
> [  292.510071]  pm_runtime_force_suspend+0x54/0xc8
> [  292.510081]  adreno_shutdown+0x1c/0x28
> [  292.510090]  platform_shutdown+0x2c/0x38
> [  292.510104]  device_shutdown+0x158/0x210
> [  292.510119]  kernel_restart_prepare+0x40/0x4c
>
> And here from GPU kthread, an SError OOPs:
>
> [  192.648789]  el1h_64_error+0x7c/0x80
> [  192.648812]  el1_interrupt+0x20/0x58
> [  192.648833]  el1h_64_irq_handler+0x18/0x24
> [  192.648854]  el1h_64_irq+0x7c/0x80
> [  192.648873]  local_daif_inherit+0x10/0x18
> [  192.648900]  el1h_64_sync_handler+0x48/0xb4
> [  192.648921]  el1h_64_sync+0x7c/0x80
> [  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
> [  192.648968]  a6xx_hw_init+0x44/0xe38
> [  192.648991]  msm_gpu_hw_init+0x48/0x80
> [  192.649013]  msm_gpu_submit+0x5c/0x1a8
> [  192.649034]  msm_job_run+0xb0/0x11c
> [  192.649058]  drm_sched_main+0x170/0x434
> [  192.649086]  kthread+0x134/0x300
> [  192.649114]  ret_from_fork+0x10/0x20
>
> Fix by calling adreno_system_suspend() in the device_shutdown() path.
>
> [ Applied Rob Clark feedback on fixing adreno_unbind() similarly, also
>   tested as above. ]
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Ross Zwisler <zwisler@kernel.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 628806423f7d..36f062c7582f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -551,13 +551,14 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>         return 0;
>  }
>
> +static int adreno_system_suspend(struct device *dev);
>  static void adreno_unbind(struct device *dev, struct device *master,
>                 void *data)
>  {
>         struct msm_drm_private *priv = dev_get_drvdata(master);
>         struct msm_gpu *gpu = dev_to_gpu(dev);
>
> -       pm_runtime_force_suspend(dev);
> +       WARN_ON_ONCE(adreno_system_suspend(dev));
>         gpu->funcs->destroy(gpu);
>
>         priv->gpu_pdev = NULL;
> @@ -609,7 +610,7 @@ static int adreno_remove(struct platform_device *pdev)
>
>  static void adreno_shutdown(struct platform_device *pdev)
>  {
> -       pm_runtime_force_suspend(&pdev->dev);
> +       WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
>  }
>
>  static const struct of_device_id dt_match[] = {
> --
> 2.39.0.314.g84b9a713c41-goog
>


-- 
Ricardo Ribalda
