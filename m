Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43666552FF0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA1B10E05C;
	Tue, 21 Jun 2022 10:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A5410E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:40:51 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id 89so19714198qvc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0pHSWTmAqkhHPu3ewOMcrRY8+PhQnj0jfHcdTdRDz8=;
 b=R3GE8vGso5FRS+jJMjZddlY67ciEK0NtOwp1vMLp6WYzw0y3wH9uVEGbIa+l9roKRX
 eSK6mQEMo66vnDTwbEETiIzI8np+jeQVbf6+569W1HDwVhjFsnKUc1h/q02E5qLdsXln
 bUomPzqz9/w7zeoWTihKrSMU5vyRT0xn6T6Gi1Fy+wi2Fpa/La+VvjpJep1yoWsBiram
 Z95mhj6iVWCSAr2InYjymblYmKgKr+2IMrlpKLN8s6JghGQVuAbiv07Dv0XISr9zI2xj
 wHUgzu0en/bM0/EGHjMkfKrkP2Ppg/bWKLGcfRmD7cEVMmNdhaq65oWAxkdvaF9Xqf4w
 C4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0pHSWTmAqkhHPu3ewOMcrRY8+PhQnj0jfHcdTdRDz8=;
 b=jeMAcTDmM0FtrtYFGNN7oN/PH5GWFMgODq3WPlVj50Okbu4yiY6KRyWatcnuLeW0YV
 RZi9OrrEVD1rseTFoCAbDoBsfDX8pgrVg8vQEgRUGoH0CiOm12Xq2J7VW2R/LD5dqde5
 pXaOQHsAURI+QFUZCwU3COuroBpkm9Uu2QM/Aybrgnc8Bswi1Iy7Nb50t7W+smyYyZCR
 Vp3Gc0pViGE3GIvM2XlsJot+eL4PRqWhICcUR/UtefzUbwJfRkM9TOQ4Nx3SxFhRKqMq
 Yom+SL71ASn/NG0XDuFMX0ghGPFUpJoC1pGGUSJBj3M0AKzi8W/UtBvih8k7mQKubgBu
 I4Yw==
X-Gm-Message-State: AJIora+UyFdWQwO5h4Rw/EkdDrz38SU3rZQ5n0VBbkHOMM5UD6AstUXB
 7mrtnxivUGG7OnSWbP1EYFOvr+cSHoPheLFO96QJ4w==
X-Google-Smtp-Source: AGRyM1urOiTfLmkkWIabUrLK/wKc4zU+J23cZPS1taggxWTn8VedAh7d2hubXG/NEdz5XLnEZWJHk8q7ZC9Z13NzqG8=
X-Received: by 2002:a05:622a:487:b0:304:fbfc:9933 with SMTP id
 p7-20020a05622a048700b00304fbfc9933mr23585690qtx.682.1655808050220; Tue, 21
 Jun 2022 03:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 13:40:39 +0300
Message-ID: <CAA8EJpqon=3NQJo_jwbXJvvZ5FJJ9xO=k-f4ogNTaH83pbVOjQ@mail.gmail.com>
Subject: Re: [v1 1/2] drm/msm/disp/dpu1: add dspp support for sc7280
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 quic_vpolimer@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 at 12:06, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Add destination side post processing hw block support in sc7280.
>
> This hwblock enablement is necessary to support color features
> like CT Matix (Ex: Night Light feature)
>
> Change-Id: Iba7d5e1693b06cede2891f5b998466070a77c6ef
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a4fe77c..021eb2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -928,7 +928,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>
>  static const struct dpu_lm_cfg sc7280_lm[] = {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
> -               &sc7180_lm_sblk, PINGPONG_0, 0, 0),
> +               &sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
>         LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
>                 &sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
>         LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
> @@ -1792,6 +1792,8 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .ctl = sc7280_ctl,
>                 .sspp_count = ARRAY_SIZE(sc7280_sspp),
>                 .sspp = sc7280_sspp,
> +               .dspp_count = ARRAY_SIZE(sc7180_dspp),
> +               .dspp = sc7180_dspp,
>                 .mixer_count = ARRAY_SIZE(sc7280_lm),
>                 .mixer = sc7280_lm,
>                 .pingpong_count = ARRAY_SIZE(sc7280_pp),
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
