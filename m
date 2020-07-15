Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA122113A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 17:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E006EBB0;
	Wed, 15 Jul 2020 15:36:13 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020076EBB1
 for <dri-devel@freedesktop.org>; Wed, 15 Jul 2020 15:36:11 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id bm28so1947281edb.2
 for <dri-devel@freedesktop.org>; Wed, 15 Jul 2020 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldTR/KsOkvUXfFE3oIwY06p1m96PfAnxhTKvRebiJFk=;
 b=WcIywgf/5yGovAVSIjXD9OIB0Yx1Lqe39sKQcKnE0bhl7NpHMP3wyUyXsz76eznoDN
 kLjzcwlopVjThClxHuAyihsZX8FPaEHuAR07Xs+vzRHSsrUbJI0eICfPyJGZKPi/QsKZ
 mmZYeZuAvUsvxgkbItIok1s8pKt4mmzBtXk9cwHdKDPanj9nt1L5t+ZuHliLF00lGmDj
 sgGGTAONqoqLI9wypqeA5drEqMm5oVMEDqzFIsWfOobV+z2oJKOnAPiPglVQaa4qup8s
 aimYRQqb3HkkSb9UJ3FCrUOw7rkvO35YQrAjHrLTkQRICmx+aHtbSrz7ehlxcrNUKK9x
 axwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldTR/KsOkvUXfFE3oIwY06p1m96PfAnxhTKvRebiJFk=;
 b=YHAESQw0V6wo8dl/fJqRRnnHmNILmJVlF7cQ+mzSiltZhRhA5qk6W22pversyA5G8r
 zy4eAqdRlw4DtyhyQsRjsus03UoS6aTrUjjGsAl1nxiDThaM0vcBu7BV4W490jpJzT8u
 mWEFCtPsRLA6UsuGpdUuiF0c9yy6pDupOpZhIPKcY+WF7UW0ZaCQaXHszX8jEGXH/h37
 yEdhz+MUAdliXmcJa+M3HobbS7QMTyOCkh9pQKuBIpRQyxN3IWzrlKTNQKgmG3P5WZbS
 myC4uSvbfOoMxCU7tKrCU2zhKxLkGI5zEQTvSKnELNXnS0ihdI/jMFAHuUkWcQULYGbF
 XAAA==
X-Gm-Message-State: AOAM5320MsVh81VB+8TJPAbuSLRlYXRYKRzdOFJTrFCMf9cXal0atHXJ
 jTi2mFw54veZITSDo+upMkZ3g76U11hkrvkYqAQ=
X-Google-Smtp-Source: ABdhPJwUDgryr+uwNIkAcro/MFjmRNEHds+xBye6alkuUKRwQY/Ip2yfUIBYAYZ0SbfRqlleTEVLIvRkwjo+QnLxV+0=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr209684edi.120.1594827370435; 
 Wed, 15 Jul 2020 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Jul 2020 08:36:43 -0700
Message-ID: <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 5:41 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> This series adds support for GPU DDR bandwidth scaling and is based on the
> bindings from Georgi [1]. This is mostly a rebase of Sharat's patches [2] on the
> tip of msm-next branch.
>
> Changes from v4:
> - Squashed a patch to another one to fix Jonathan's comment
> - Add back the pm_runtime_get_if_in_use() check
>
> Changes from v3:
> - Rebased on top of Jonathan's patch which adds support for changing gpu freq
> through hfi on newer targets
> - As suggested by Rob, left the icc_path intact for pre-a6xx GPUs
>
> [1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/
> [2] https://patchwork.freedesktop.org/series/75291/
>
> Sharat Masetty (6):
>   dt-bindings: drm/msm/gpu: Document gpu opp table
>   drm: msm: a6xx: send opp instead of a frequency
>   drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
>   arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
>   arm64: dts: qcom: sc7180: Add interconnects property for GPU
>   arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

I can take the first two into msm-next, the 3rd will need to wait
until dev_pm_opp_set_bw() lands

Bjorn, I assume you take the last three?

BR,
-R

>
>  .../devicetree/bindings/display/msm/gpu.txt        |  28 ++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 108 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |   3 +-
>  7 files changed, 112 insertions(+), 50 deletions(-)
>
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
