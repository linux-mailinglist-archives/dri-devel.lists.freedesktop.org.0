Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF314C0684
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 01:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF13610E2F1;
	Wed, 23 Feb 2022 00:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B5010E282;
 Wed, 23 Feb 2022 00:58:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s13so8140615wrb.6;
 Tue, 22 Feb 2022 16:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyPaBl5xkEft4MC1ElCsdVx+YIi4gPbjLrN+4aUtU3I=;
 b=lFocHm1ll8kbn256FMHTLkXa/aUbph/pSMXOho9y1i63M6UMe3mLCVD8E1ISilUUxh
 JEKRDjItmJrQy7u/Cyx0QR2BPGSHKk4y3R9JUQCIbnwWoF7fO2ON5vrboOPLUMb3aqEt
 c879lK7D3joD4EQm8Xvbk0TKiwRDtueL0VjCaQL38S4avuAzwo0fpLpiUVcKM8Cgg/mC
 rHqsuFlDc447Ik4MbGV6ys1fxiV9QoGv5V2MIpwonh7k0KQIkbMKUqPRfdrumANqjupd
 7UP7Tyq6qnt0vmzeuI0H3kEoVV7oPbcev+A9uoUBkBGAzS6SBVIsfR9sWbLPYSiZlu9r
 3e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyPaBl5xkEft4MC1ElCsdVx+YIi4gPbjLrN+4aUtU3I=;
 b=j5eVWDo2jb7gbQcLHQrn4rUM9R9XeoWMhcATyaIMYDNRJwks4vWbEazgWxV75agi0z
 CdHoSA8s74sP4gFwtMSuWmOWHt3w/wWh9YsrR8elX/3RBEBfHu6/RrKUsgY9LmmRqWUQ
 db5sZfA9DzDSsEisIC8ddhL3Tv74tJRTMzqEIA9tQbWD7GSSXdqmSIhjIUy18U9+9deV
 lgHuQOsS8SkoSjDNk2vffKmXOMVeeCLRX6w5g1NWrqs2t9YOpXgZU1wH4KNuT/oBz4Qk
 h7zndBFM2nlipgoIIxXech268K3K1rnD3V1ImmBnRFesucN7xGEGeoaa1mWgHq8N+9AX
 N0UA==
X-Gm-Message-State: AOAM532IZi+Wb+ZjZ2/no1L3RYqpBTX6bFtIIQaOmzJxZvKpv3Q7Q3WY
 ApnsatbQW9ogcRoi42gifPyZubAXyxjOyRapPh0=
X-Google-Smtp-Source: ABdhPJwJ3XDhDTwhrKJ8MvO+0QY+LlMY8p4dDQtV3Sq9hef5slGj+W0Wl7psN4DOKKetT0K5SdSycUY/8I1NpJIWgCE=
X-Received: by 2002:adf:f68d:0:b0:1e1:db49:a721 with SMTP id
 v13-20020adff68d000000b001e1db49a721mr21586110wrp.297.1645577917576; Tue, 22
 Feb 2022 16:58:37 -0800 (PST)
MIME-Version: 1.0
References: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220221201039.2.I9436e0e300f76b2e6c34136a0b902e8cfd73e0d6@changeid>
In-Reply-To: <20220221201039.2.I9436e0e300f76b2e6c34136a0b902e8cfd73e0d6@changeid>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 22 Feb 2022 16:58:56 -0800
Message-ID: <CAF6AEGuVZaOdUUf8ccokTQdAXMdW3oVYNx3ae9ShBoh8ibXVOw@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/adreno: Generate name from chipid for 7c3
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 21, 2022 at 6:41 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Use a gpu name which is sprintf'ed from the chipid for 7c3 gpu instead of
> hardcoding one. This helps to avoid code churn in case of a gpu rename.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  1 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 14 ++++++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fb26193..89cfd84 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -318,7 +318,6 @@ static const struct adreno_info gpulist[] = {
>                 .hwcg = a660_hwcg,
>         }, {
>                 .rev = ADRENO_REV(6, 3, 5, ANY_ID),
> -               .name = "Adreno 7c Gen 3",
>                 .fw = {
>                         [ADRENO_FW_SQE] = "a660_sqe.fw",
>                         [ADRENO_FW_GMU] = "a660_gmu.bin",
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index f33cfa4..158bbf7 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -929,12 +929,22 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         struct adreno_platform_config *config = dev->platform_data;
>         struct msm_gpu_config adreno_gpu_config  = { 0 };
>         struct msm_gpu *gpu = &adreno_gpu->base;
> +       struct adreno_rev *rev = &config->rev;
> +       const char *gpu_name;
> +       static char name[8];

I think 8 is not always enough.. but maybe just use devm_kasprintf()
to keep it simpler?

BR,
-R

>
>         adreno_gpu->funcs = funcs;
>         adreno_gpu->info = adreno_info(config->rev);
>         adreno_gpu->gmem = adreno_gpu->info->gmem;
>         adreno_gpu->revn = adreno_gpu->info->revn;
> -       adreno_gpu->rev = config->rev;
> +       adreno_gpu->rev = *rev;
> +
> +       gpu_name = adreno_gpu->info->name;
> +       if (!gpu_name) {
> +               sprintf(name, "%d.%d.%d.%d", rev->core, rev->major, rev->minor,
> +                               rev->patchid);
> +               gpu_name = name;
> +       }
>
>         adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>
> @@ -948,7 +958,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         pm_runtime_enable(dev);
>
>         return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
> -                       adreno_gpu->info->name, &adreno_gpu_config);
> +                       gpu_name, &adreno_gpu_config);
>  }
>
>  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
> --
> 2.7.4
>
