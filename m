Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA73C22FA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 13:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBED16EA0E;
	Fri,  9 Jul 2021 11:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216C76EA0E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 11:38:25 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id g12so7359371qtb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dCwg9ut4EDITBOxfJ4J1SRh2WUbTm60uSi2jMmQEDTI=;
 b=jyU2woStEcmTuVj0XqnUaHJJ4e6mZdN3EfUsbeoKJP8wgB1Rgk9U2+wCklNUHEyJ7D
 QBBCsyq2B2y+oNH6BweVwhzSJ7Ps2PFMSe+bQWBF6yMeijnnaDB9A4UmSj/WwlBFj4e3
 SYi128aTT1+DF4NyALRmbd1p8Q/IU2l4xvFKUGx93Gb4kaO/GLwSm/b3Se6fgqIw4dvq
 C59BKeTtZFZY2vHKRsRSjMU6yGMCPh7gA5hc8PlizhiffArWP3+N7bZlboRAK9vNikaQ
 t1w52mE3D8fOu5qswSUZM2xqu47G7APVc+VxNoWtdGqABvX+PzQ9RCT+iaJG15R5nX/T
 U8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dCwg9ut4EDITBOxfJ4J1SRh2WUbTm60uSi2jMmQEDTI=;
 b=PDRhqbCr4fdfptxQNQ3apxHZOvY6s3QjfcH7JKtXh2JniszHzkqWf5CTLOYMhq56vz
 kjKJ6CYPftseoumAKoUKksTe6ebspiQLR9gGGO8E7fBPaHmpdrI8WynrPZTE/d4E2Qa+
 d1fMnKgQTBvivUO0fb3v1iWJGJpyrXREj4agQw3sQN7D+T6Wz1KGY8XkP/0m1Gc6t5Ty
 qSv+TU//eNZieygxe6jQs0XR4qBa423zhoSTX1vVGET/pajpFZBcF8+b35Y89F7Vq9gI
 OvpHOiSl0B/UsY/1CEN03HDDVNxkuTmTivsz6+kO/gm9D1PyIdkV4BapwmqiY/xPDdJi
 dZZg==
X-Gm-Message-State: AOAM532sPd06akNbCvn6Wiw5scd6nxNBl0dtq8fpl6wBMbVFHVsrb5SS
 ea3Kw6J9xCUrQicv7/AyQqNxNkIHsjDmJPG+uuKV4A==
X-Google-Smtp-Source: ABdhPJzd2Sqw7S1Zwy1+cDR6Wc+Q1A4Ur3kw+Td9q2UqydJCX2my+iB+LfsQcSsggxygo5/bc/aCPK3o8HC2HnCNt/k=
X-Received: by 2002:ac8:7f87:: with SMTP id z7mr33232964qtj.238.1625830704228; 
 Fri, 09 Jul 2021 04:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <1625827244-23274-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1625827244-23274-1-git-send-email-kalyan_t@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Jul 2021 14:38:13 +0300
Message-ID: <CAA8EJpp9nRhpE5HP+qzmSsY6_8XTW0yXqj_Hx0WvV8F3cnTcAQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: add safe lut config in dpu driver
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Jul 2021 at 13:41, Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Add safe lut configuration for all the targets in dpu
> driver as per QOS recommendation.
>
> Issue reported on SC7280:
>
> With wait-for-safe feature in smmu enabled, RT client
> buffer levels are checked to be safe before smmu invalidation.
> Since display was always set to unsafe it was delaying the
> invalidaiton process thus impacting the performance on NRT clients
> such as eMMC and NVMe.
>
> Validated this change on SC7280, With this change eMMC performance
> has improved significantly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It might be a good option to push it to the stable tree also.

>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d01c4c9..2e482cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -974,6 +974,7 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>         .amortizable_threshold = 25,
>         .min_prefill_lines = 24,
>         .danger_lut_tbl = {0xf, 0xffff, 0x0},
> +       .safe_lut_tbl = {0xfff0, 0xf000, 0xffff},
>         .qos_lut_tbl = {
>                 {.nentry = ARRAY_SIZE(sdm845_qos_linear),
>                 .entries = sdm845_qos_linear
> @@ -1001,6 +1002,7 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>         .min_dram_ib = 1600000,
>         .min_prefill_lines = 24,
>         .danger_lut_tbl = {0xff, 0xffff, 0x0},
> +       .safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
>         .qos_lut_tbl = {
>                 {.nentry = ARRAY_SIZE(sc7180_qos_linear),
>                 .entries = sc7180_qos_linear
> @@ -1028,6 +1030,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>         .min_dram_ib = 800000,
>         .min_prefill_lines = 24,
>         .danger_lut_tbl = {0xf, 0xffff, 0x0},
> +       .safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
>         .qos_lut_tbl = {
>                 {.nentry = ARRAY_SIZE(sm8150_qos_linear),
>                 .entries = sm8150_qos_linear
> @@ -1056,6 +1059,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
>         .min_dram_ib = 800000,
>         .min_prefill_lines = 35,
>         .danger_lut_tbl = {0xf, 0xffff, 0x0},
> +       .safe_lut_tbl = {0xfff0, 0xff00, 0xffff},
>         .qos_lut_tbl = {
>                 {.nentry = ARRAY_SIZE(sc7180_qos_linear),
>                 .entries = sc7180_qos_linear
> @@ -1084,6 +1088,7 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>         .min_dram_ib = 1600000,
>         .min_prefill_lines = 24,
>         .danger_lut_tbl = {0xffff, 0xffff, 0x0},
> +       .safe_lut_tbl = {0xff00, 0xff00, 0xffff},
>         .qos_lut_tbl = {
>                 {.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
>                 .entries = sc7180_qos_macrotile
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
