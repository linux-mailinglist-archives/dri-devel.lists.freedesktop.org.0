Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D918A52285A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF74710E693;
	Wed, 11 May 2022 00:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445D210E6AA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:20:12 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f7ca2ce255so3684947b3.7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 17:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NOKwGUyMeVgfGZrU/c9rklePCH6FmNPSbNn+SDO/ULs=;
 b=u6V34wycssLfvzE8R/Nf/ApseGDPsJSTrsu8mIdnblsdOB6MZSXiMqyP7zTA7YEFmM
 CyzZ/rM/48ctt6GKrDV5me5XeD8TMaJHoK/OPte8dYFifopvtQbhkszFqSsbolxmJTSl
 GbvW319vb+WFBHpzt1GkLOgC4hqgqi0N33cNKF288+Ip3WEkRarnPQC+1PBXEFu97BpT
 PLuyNE9KCV5Q1Unx/dUqGpkFflzhg0ykcePnHvZHbk/Ey25adD+kTzhSH1J0tPqgvxfE
 dfp8nTo/g6IVNmXiPuI2F3fdSWLVxibKqBtol1ryIOaBOEeeN4BamnngqLids2ASPcqq
 Tr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NOKwGUyMeVgfGZrU/c9rklePCH6FmNPSbNn+SDO/ULs=;
 b=zAztDh8Oulpq4PReKEXfcX5OYFBThDV3u1A19LPcoih5bj6DQChdmmzhVQJ/BNC/lM
 HZm5Kzew+zMPT6STx51erWzHmX6gcpvCrZkOTvjTcDFyWCwOd2rondmkAyyMZErzqwgu
 EE1lyF3aUy9m0YO9zWBJZzrYANcZUcZFIg3kNAnCa9dbwzmnJNiWozD+TbwdQ2ak+YCA
 aGIA0z3r+S0Kr/4jyRKnxWtSh86BGI0Hbs7NRqU/XMJKwQhjIcAnomL0xgxezh7rXOhs
 y8vF1aLo3xATW/FclptWGcV7xMxhuaDHGKNw1gn7GHpaMyhLkXf7yt8jTHoDcam6HiT/
 Up+g==
X-Gm-Message-State: AOAM530zRdCy4nzA/+nKh+NjXDhh63UEsShl+PqTJgZz/oudL7219mbu
 YybnfxT5Fu4i8lipRNsVoAcnAHPFQOb+Xkzc69Uokw==
X-Google-Smtp-Source: ABdhPJxlG6XQ5mhCKsFPgTu2pCahShBgY3mb8Xr2yU4IY/oWlb19oiP8XGjsrDKtbiK7OF6IYdtQsojIB/qbUx23yeo=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr23005145ywe.359.1652228411446; Tue, 10
 May 2022 17:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220510235439.31916-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20220510235439.31916-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 May 2022 03:20:00 +0300
Message-ID: <CAA8EJppOjzENORK9UFAFUus7GkjjrSsKtQp6cURHFM9oz9Fizw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add writeback support for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 at 02:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add writeback support for sc7180 devices. This has been
> validated on sc7180 chromebook using IGT writeback test
> suite.
>
> localhost /usr/local/libexec/igt-gpu-tools # ./kms_writeback
> Starting subtest: writeback-pixel-formats
> Subtest writeback-pixel-formats: SUCCESS (0.001s)
> Starting subtest: writeback-invalid-parameters
> Subtest writeback-invalid-parameters: SUCCESS (0.004s)
> Starting subtest: writeback-fb-id
> Subtest writeback-fb-id: SUCCESS (0.009s)
> Starting subtest: writeback-check-output
> Subtest writeback-check-output: SUCCESS (0.203s)
>
> Adding this will increase IGT coverage on chromebooks and also
> allow using writeback functionality for other use-cases as
> necessary.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 400ebceb56bb..210becd2a9b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1803,6 +1803,8 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .pingpong = sc7180_pp,
>                 .intf_count = ARRAY_SIZE(sc7180_intf),
>                 .intf = sc7180_intf,
> +               .wb_count = ARRAY_SIZE(sm8250_wb),
> +               .wb = sm8250_wb,
>                 .vbif_count = ARRAY_SIZE(sdm845_vbif),
>                 .vbif = sdm845_vbif,
>                 .reg_dma_count = 1,
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
