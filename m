Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BD3DEF1A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 15:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDC66E082;
	Tue,  3 Aug 2021 13:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125486E115
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 13:30:03 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id db14so10539952qvb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T5LWJvLNPFvrsP+8rTSctWTnBPUV+sbu54F2/XzyL04=;
 b=E6R+q4WD1t1XqkKiv21e6XxoY3rFhv0SUhabTeyBnlgtYjYkcuLEL2myi7zpIuFI83
 0JaWLF5/xzmhLU/qAQeCbCFjodX3T8KK2qtxtj8uLvgrSP82TlPHQkDLcKL3Xb7Nn8m+
 yZYTnDb8nSQJz43u71xWnFYk0OlWdf1+jMb8rMTl2Akyu/QeulcJHs2hbG+RaQH8h21z
 hSnhqu8cocPiEDi1rAyTJgb0lYgW26KuwQHbWeAaYxl3EkacCTGQknHBCBqcN5VAsVLa
 6MfptddAV/eaZXWdiEgJ6u7UYk0HqMdidvm98aRF7DA83RUDOTsgE8k3D8FpiarUSIXr
 q6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T5LWJvLNPFvrsP+8rTSctWTnBPUV+sbu54F2/XzyL04=;
 b=PBPuKcs6ncY3wx2nhogFw+dTiVwMuZv+c1R7gNLADOzUN1WejLJCN6n8lMmGg0GQ7q
 juhyg/gz5lr5S+QBPiExOQlIABnfvViTxOtxX3nYprQFnKjzaUPVPYjFOMH1thtQNbMe
 xDruIjsPCMuNGn8BcZfCxPK6FtEZOlaOHLnIYg15APWwHifinZbmc/jPxN9r4ANrcoUb
 FegXwWXhggu0CpkaC2XisOvEBaYDDz2fNRPpVDI2jd7D1l+C//rygDGjW8ab7Q3kgUxu
 eb8cJH1Ftzjc+xjd7qtWzIZC9Y2yTckMGVODgFp2/4DjGW8LY2IcNdu6No20b+465OMY
 SuJg==
X-Gm-Message-State: AOAM533lt93m36vu68j8oBZUwCbIZQSs0UM5bMuDOxlMrO0wGLhSPfJm
 yr90Q2TRf1oCXhmgbliyp7JZsXETgsp5KpkaH+Vfrw6oF6Y=
X-Google-Smtp-Source: ABdhPJx51VqlQMR3Ad0jd5YW0uaLDMWfS3K+CFXKdlzNGEDquQFkMceVecHmwQWoRFCePUdCzX792/HbKXHewVIIelA=
X-Received: by 2002:a05:6214:1021:: with SMTP id
 k1mr21594531qvr.4.1627997401968; 
 Tue, 03 Aug 2021 06:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Aug 2021 16:29:51 +0300
Message-ID: <CAA8EJpotuiBFDXvNP3BRKYGmjMt0MzduggXJye__jYbAshfLUA@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: add safe lut config in dpu driver
To: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Krishna Manikandan <mkrishn@codeaurora.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Aug 2021 at 13:42, Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
>
> Changes in v1:
> - Add fixes tag (Sai)
> - CC stable kernel (Dimtry)
>
> Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for SC7280 target)
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> (sc7280, sc7180)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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
