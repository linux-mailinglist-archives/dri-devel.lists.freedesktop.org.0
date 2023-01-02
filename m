Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C365ACC8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 02:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34C810E180;
	Mon,  2 Jan 2023 01:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F171510E17C;
 Mon,  2 Jan 2023 01:39:57 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 k44-20020a9d19af000000b00683e176ab01so11785693otk.13; 
 Sun, 01 Jan 2023 17:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xoVvMXphc/SXKzYDr9NRNdOZvsFIrre0zLtyjQhD54s=;
 b=e85zvQZpz2zbZhUIJgpMcPOEkMSOxf6/0RQGoqP8pIW3Kvrs2Xx/zha4mUTmXc6HQk
 Gg77O+2RMyOH3CudW2zTCBhRqskxqiszxjPcBF/Dv7TFxitLUDx8M+4BJ0IyadBcmK4C
 L+5DBK65ZOqmV2AjEZoL47S9FglVAmR73sBNQhTvEe6EE8eupo4/hp2cUxWhjFA4UU91
 MyC+AGw27NlhZvt+WCVQ1gN+HRjH7jJU3QovPyY0DVllnTSpczbM719FrqfrU4asX7ih
 VS9P+DueCVUxFhcPhQfUn2VzjCkEd9TFeoke67/dV0O1KctKhlQfv2KW8yw6qKbrvmF4
 EMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xoVvMXphc/SXKzYDr9NRNdOZvsFIrre0zLtyjQhD54s=;
 b=OI0zBthdLA7zVpBHxmf16aQTPghPlZJjQznJyIUCOhA/g/b6PyFqd9w6RiuZICdm8s
 57PtYRqxN1a8YEf4vBA3GW5eON18Vlb6FzJ1nYbtivJOcem8nsICSmt9UsWtMT5ujXzU
 ZV5cTddknKV0mwm/ts0l9dN79BOCsv8Fg+LKs5ij4v54Pe+5VpUwJSfA0vBLvxAVqmDL
 P+4xxnjBO2hip42CERHdpU0YQjO8epxWKKBSVzmgAQhN9NF+r5DYQJxeR/kq1G2J/Nsu
 4t51N1Bi9TclkxzD7u8s5f+P9c6689gTTzlCxHWdflBaN8QcXiAMhzqDCYNGGjTAsjba
 Pi6w==
X-Gm-Message-State: AFqh2kq71v0qXQfwvXEOvhnqt4saWYEOjzHerBzJ181ItVUtOy6MWI45
 kfWuddYcCFVXRJ6mk1KC5HcLs4JOSi7PV3Bsfjo=
X-Google-Smtp-Source: AMrXdXv9jAX0MMNb9GVNkuUXevGJiRXiTGf0djUWUTVFFgtAWmoGGcc4UoSAPUQgnijspPmaE986LkaKRtLke9VJLPg=
X-Received: by 2002:a9d:17e9:0:b0:670:82d5:fde3 with SMTP id
 j96-20020a9d17e9000000b0067082d5fde3mr2406053otj.22.1672623597006; Sun, 01
 Jan 2023 17:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 1 Jan 2023 17:39:44 -0800
Message-ID: <CAF6AEGvG9UJzvjvvfBeO6tC+APqOStAHBgeRwsuHUFSozyE8oA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 1, 2023 at 7:57 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Support loading A200 firmware generated from the iMX firmware header
> files. The firmware lacks protection support, however it allows GPU to
> function properly while using the firmware files with clear license
> which allows redistribution.
>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 27 +++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h |  1 +
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 6c9a747eb4ad..c67089a7ebc1 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -53,6 +53,8 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>
>  static bool a2xx_me_init(struct msm_gpu *gpu)
>  {
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
>         struct msm_ringbuffer *ring = gpu->rb[0];
>
>         OUT_PKT3(ring, CP_ME_INIT, 18);
> @@ -84,15 +86,20 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
>         /* NQ and External Memory Swap */
>         OUT_RING(ring, 0x00000000);
>         /* protected mode error checking (0x1f2 is REG_AXXX_CP_INT_CNTL) */
> -       OUT_RING(ring, 0x200001f2);
> +       if (a2xx_gpu->protection_disabled)
> +               OUT_RING(ring, 0x00000000);
> +       else
> +               OUT_RING(ring, 0x200001f2);
>         /* Disable header dumping and Header dump address */
>         OUT_RING(ring, 0x00000000);
>         /* Header dump size */
>         OUT_RING(ring, 0x00000000);
>
> -       /* enable protected mode */
> -       OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
> -       OUT_RING(ring, 1);
> +       if (!a2xx_gpu->protection_disabled) {
> +               /* enable protected mode */
> +               OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
> +               OUT_RING(ring, 1);
> +       }
>
>         adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
>         return a2xx_idle(gpu);
> @@ -101,6 +108,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
>  static int a2xx_hw_init(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
>         dma_addr_t pt_base, tran_error;
>         uint32_t *ptr, len;
>         int i, ret;
> @@ -221,6 +229,17 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>         len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
>         DBG("loading PM4 ucode version: %x", ptr[1]);
>
> +       /*
> +        * New firmware files seem to have GPU and firmware version in this
> +        * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
> +        * Older firmware files, which lack protection support, have 0 instead.
> +        */
> +       if (ptr[1] == 0) {

I don't really have a good enough picture about all the possible fw
versions floating around out there, esp back to the pre-qc days, to
know if this is a good enough check.  But I guess we can go with it,
and in the worst case later add an allowlist table of fw checksums (or
similar) if this doesn't turn out to be sufficient, so the overall
approach isn't painting us into a corner.

Reviewed-by: Rob Clark <robdclark@gmail.com>

> +               dev_warn(gpu->dev->dev,
> +                        "Legacy firmware detected, disabling protection support\n");
> +               a2xx_gpu->protection_disabled = true;
> +       }
> +
>         gpu_write(gpu, REG_AXXX_CP_DEBUG,
>                         AXXX_CP_DEBUG_MIU_128BIT_WRITE_ENABLE);
>         gpu_write(gpu, REG_AXXX_CP_ME_RAM_WADDR, 0);
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> index 02fba2cb8932..161a075f94af 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> @@ -15,6 +15,7 @@
>  struct a2xx_gpu {
>         struct adreno_gpu base;
>         bool pm_enabled;
> +       bool protection_disabled;
>  };
>  #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
>
> --
> 2.39.0
>
