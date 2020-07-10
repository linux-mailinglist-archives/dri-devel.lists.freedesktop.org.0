Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88C21BDD7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 21:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F47E6ECFF;
	Fri, 10 Jul 2020 19:41:01 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77E56ED00
 for <dri-devel@freedesktop.org>; Fri, 10 Jul 2020 19:41:00 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id l12so7276527ejn.10
 for <dri-devel@freedesktop.org>; Fri, 10 Jul 2020 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Mfk46Wt0EkqUcbzqXWWdXTqCsqh4r5j+eF9fbxeot0=;
 b=Y7xXCS1nOyST5iaTPkncvqxbKVgFj+Nfn88bRSj5S4OQHG4kl1muiQw/AvZYLNudnY
 9mPoOtL6Pt896dSy83Z2dzSkM7nl4FiBi/v8tuWypIw2LqrCLpodTF9fmoLXMu+Ej30S
 k2DwUlGDQfXjBxJL+d+Lgumj2g42UGKwXpN8Knytkji13XJi+RusTz1bmPzggaxcbAiT
 1dZLUkbOKTp1siTDY+nEzLfpzQWWkVJKY9wNRhV5+9AKOciOZjEA8hxs2RJ0Ai4bvFLf
 q9+wsgdRL0qTHOnRDRpPH0qiHuUR/P7l9kgLy9FTHiAG9994JxxqpCBS7khSp1dMSBS+
 vvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Mfk46Wt0EkqUcbzqXWWdXTqCsqh4r5j+eF9fbxeot0=;
 b=lz14PdENWPRyg2+is3V6WNSolA6xMD6yKGgAvGyOMgJ6EqMdi2i1PHbkE7PJQOw6E0
 d6na1+JwO7M3PIoIf25o+CJs6ovDDCeqsJlYG+6TCIgdz7SZPcSQQtJ9etkwk29bivtD
 P68dgg4aRUVY4UN0icjUQJ7x4zRvmHzB5tYoBwNd8njY9mPJi+Mne4goyGL82oMFPt9+
 EP9nK3QLXN9ePhE78p2N/jnDgLkOD7sql3vggSW9YzUZeN3prD/MXOo3UKuPvKG7Hb5u
 G/R3jELiMyf2Px0x2npmPRNZ9kgBo0hw6oeA3AwZCGvthO092UuVEyEcsy+197lgDy+J
 sw5Q==
X-Gm-Message-State: AOAM533cyeUEf/hxBMIAKS1QRA/S2QUYAnn5yYaey6lmlPt0LaVmk6XF
 78jzwSkiuJxJNAuI4vap4HOMI+gjoevy8SacYok=
X-Google-Smtp-Source: ABdhPJwwtakCaQKxyz/Xgq/TraHmqTx5+wz3uRxu6aBHqI7ZcwPjE6kUBX1Sx322eMeOiNMBX1MH0LMW8jw21ilN+fs=
X-Received: by 2002:a17:906:328d:: with SMTP id
 13mr63567977ejw.71.1594410059289; 
 Fri, 10 Jul 2020 12:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 Jul 2020 12:41:31 -0700
Message-ID: <CAF6AEGv4Nc6ZAxGoCC1s5KT=rxLR6uZDHfDnWZRnnLhqnegOpA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 4/7] drm: msm: a6xx: use dev_pm_opp_set_bw
 to scale DDR
To: Akhil P Oommen <akhilpo@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 1:01 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> From: Sharat Masetty <smasetty@codeaurora.org>
>
> This patches replaces the previously used static DDR vote and uses
> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> GPU frequency. Also since the icc path voting is handled completely
> in the opp driver, remove the icc_path handle and its usage in the
> drm driver.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b547339..6fbfd7d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -123,7 +123,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>
>         if (!gmu->legacy) {
>                 a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> -               icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +               dev_pm_opp_set_bw(&gpu->pdev->dev, opp);

What is the status of the patch to add dev_pm_opp_set_bw()?  If it is
ready to go, and I get an ack-by from the OPP maintainer, I suppose I
could merge it via drm/msm.

Otherwise should we consider pulling in a private copy of it into
drm/msm (and then drop it to use the helper in, hopefully, the next
cycle)?

I'm pulling the patches preceding this one into msm-next-staging to do
some testing.  And the dt patches following this one would normally
get merged via Bjorn.  At the moment, I'm not sure what to do with
this one.

BR,
-R

>                 return;
>         }
>
> @@ -149,11 +149,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>         if (ret)
>                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>
> -       /*
> -        * Eventually we will want to scale the path vote with the frequency but
> -        * for now leave it at max so that the performance is nominal.
> -        */
> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +       dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>  }
>
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> @@ -840,6 +836,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>         dev_pm_opp_put(gpu_opp);
>  }
>
> +static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> +{
> +       struct dev_pm_opp *gpu_opp;
> +       unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
> +
> +       gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
> +       if (IS_ERR_OR_NULL(gpu_opp))
> +               return;
> +
> +       dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
> +       dev_pm_opp_put(gpu_opp);
> +}
> +
>  int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  {
>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> @@ -864,7 +873,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>         }
>
>         /* Set the bus quota to a reasonable value for boot */
> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
> +       a6xx_gmu_set_initial_bw(gpu, gmu);
>
>         /* Enable the GMU interrupt */
>         gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
> @@ -1040,7 +1049,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>                 a6xx_gmu_shutdown(gmu);
>
>         /* Remove the bus vote */
> -       icc_set_bw(gpu->icc_path, 0, 0);
> +       dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
>
>         /*
>          * Make sure the GX domain is off before turning off the GMU (CX)
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
