Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8D115202E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 19:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E726E6E8AB;
	Tue,  4 Feb 2020 18:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59E66E8A9;
 Tue,  4 Feb 2020 18:03:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r21so20764928edq.0;
 Tue, 04 Feb 2020 10:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWvde0WuuXX7CPS5xkAIWw6infFPw3FSlM3GIfSoQP8=;
 b=qKHIX6A6NSCUgZK7iuUx14Hz4eEJffzhloZxzvaPkj73uFGKOcMsR7Lbx9EdLwuS+w
 mk+NMv4zxNZv9OD2EKTVjZUaI7L14261YFIlV66/UAPnOkkD6aNeKRhXzGDzB2KS9+zZ
 LtgOHFRMmK5nPWgMSnuZtwgEbpasAuYtyWQZe7avTOjQ/wxVlAiwJyK8Ga3UcmpzmTnX
 g50JKCjVVWSG0Qls4Ua9LdkgPQiF+JEkNidZM2mrC24y11ghR3tOeWtNU08xFeiLFNrs
 nAoi1zb4eYt25HOMLPiDlipN4QPbhqPUNo1ntHfAlgHzjdPoycijorar+vCTvRgQY7Fd
 49kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWvde0WuuXX7CPS5xkAIWw6infFPw3FSlM3GIfSoQP8=;
 b=HvyfeY0nB0ra//on9cn25H7dBjaSEzJMEIBQiFDcurwmKV1zKWhQm+otxFbQdKShzz
 boseX5milX5Ey8KyPuJ6h4gJfmxvYSdErU7kq9RdWM9lxK6o+14k8+gcxxz9QKDqCmYZ
 Lh+YDGtUci99iu6PqA5X2DWpYl/aDeBcuG2A2gSNpyRLUMAJ0ptqU/7TaFuiWv1cYEta
 RR/nJsBqp180CQo7AlJvIucjFZEZj/XO46N7Tn8vMckqS4nkpwYdoGakvHOwIpZcczL4
 Gps9XxbJL7BRFwes/3xOF/QY82RQD8vBVCaXuPhiDMLgtahcNRmGqKeQVCMVuVTJEEkS
 efqQ==
X-Gm-Message-State: APjAAAVYDFlJZx46V3a9FG/1b8YeCjXIDR1Ka55+U7KwqxLJH+C4w7ec
 c9S61kL9CU58+B4B0iW/eMAvAz9XQTtSzmQ24os=
X-Google-Smtp-Source: APXvYqyWPgr+XP7Kc61q5ucd7+66soDxza7EDsiQJiHhZinA/4dQPsj7r9MgjJM5zWCOKF/CMt37Ed1nd54+McUf1Pk=
X-Received: by 2002:aa7:c6c5:: with SMTP id b5mr1389168eds.281.1580839425205; 
 Tue, 04 Feb 2020 10:03:45 -0800 (PST)
MIME-Version: 1.0
References: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 4 Feb 2020 10:03:34 -0800
Message-ID: <CAF6AEGt+aKC-pZZNK34mcjiYrtVuNvzQ_Qc5GwWvJ3NRkHbnWg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+jstultz

On Tue, Feb 4, 2020 at 9:42 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
> universal GBIF un-halt into a6xx_start(). This can cause problems for
> a630 targets which do not use GBIF and might have access protection
> enabled on the region now occupied by the GBIF registers.
>
> But it turns out that we didn't need to unhalt the GBIF in this path
> since the stop function already takes care of that after executing a flush
> but before turning off the headswitch. We should be confident that the
> GBIF is open for business when we restart the hardware.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index daf0780..e51c723 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -378,18 +378,6 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>         int ret;
>
> -       /*
> -        * During a previous slumber, GBIF halt is asserted to ensure
> -        * no further transaction can go through GPU before GPU
> -        * headswitch is turned off.
> -        *
> -        * This halt is deasserted once headswitch goes off but
> -        * incase headswitch doesn't goes off clear GBIF halt
> -        * here to ensure GPU wake-up doesn't fail because of
> -        * halted GPU transactions.
> -        */
> -       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> -
>         /* Make sure the GMU keeps the GPU on while we set it up */
>         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
>
> --
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
