Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5E70B0FE
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603B510E0F9;
	Sun, 21 May 2023 21:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C710E0F9
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:51:06 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-510b6a24946so9827710a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 14:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1684705862; x=1687297862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wYWgt0VqCtWdLOPpm6CHjxKMZf+d9teDj5vjcml/jo=;
 b=bwoD8k0kF8udgKhccj2w69B2h9ks7l4IMcGTKw+Q5aZDVnlm42MZZw3H+WjlM+G4Wj
 HfsL2xBY4yCQrR/8htbxscMyq2V8o7zUxHztYdOKEYSZxT9Cvh4Z1AL9pnDmQ+7pn3GS
 P8z5pyHwCbkpBDksuuQFXr5mspF/e97YEEpxlka3aiFhso0mogB2wRaGEiR8l7B4WoTN
 RpZUJc3nXyJDSqZpE3ow8WyKVDnhSrzq2JdQJjFM4hB0W5dUmEcEBL1cIcS8CbH/AtlV
 IJVCY6dv3dJd28ay4C3tGZ1gks7taEpqVViOAD3xe/uoIo8Vsr/Yr90NmK7gPzIo9SDA
 un/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684705862; x=1687297862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wYWgt0VqCtWdLOPpm6CHjxKMZf+d9teDj5vjcml/jo=;
 b=OAqWdnrKZ5A8eVoRrjsKUfCC+p1RWoMVLFWINF9ch/12uOHMoM4GYR5gxDMY3Rkdw4
 LL82CabimppYHjKDOI2TM0SOwQ1zJQxJe1TMNVnJMKSfwPrChE7v3RkczJQSmT+TewLt
 U23/tpJiHBbFwvhtH5GfIzqL14bqFMQR8CTsSt3DCnohwnnYLBo1XDR9MulV0706dtXf
 /DrQ2Mdw12GZfGkA8s8vmKAYg09ybEvnmYc6tiidRNZXinev3lFrKywpqacSPxDsXabp
 26yTZnKgY7SansMNCAvWFmioYbbOSoUBgb+IUlmx95kAJMNWwGIAnoB8heLTeLgciXZI
 b9HA==
X-Gm-Message-State: AC+VfDx3VML67Go81Bbey32/8v+UfwlXOS8pEBs41cFNq+uGr78mK7+c
 jczcUcc9LdIKeiCI9vs/lzvVlWmWoQuMUGpeQGnNfg==
X-Google-Smtp-Source: ACHHUZ47pnTttIYz7YAlKv4jIg6XlsnfovO8JpNyIhcN+wF0NakvkgxzQ0HecWS8msW6nxnGLJeKMrbf5XL0H7Jewyo=
X-Received: by 2002:a05:6402:8d0:b0:50d:9b59:4336 with SMTP id
 d16-20020a05640208d000b0050d9b594336mr6885049edz.37.1684705862525; Sun, 21
 May 2023 14:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 21 May 2023 16:50:51 -0500
Message-ID: <CAKXuJqgf-MeQe8kwmBaz7DBP9sxsWHr=AZmsbRfQgVKGg=6iUQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/msm/dpu: use UBWC data from MDSS driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On Sun, May 21, 2023 at 12:28=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Both DPU and MDSS programming requires knowledge of some of UBWC
> parameters. This results in duplication of UBWC data between MDSS and
> DPU drivers. To remove such duplication and make the driver more
> error-prone, export respective configuration from the MDSS driver and
> make DPU use it, instead of bundling a copy of such data.
>

Surely you mean less error prone?

> Dmitry Baryshkov (6):
>   drm/msm/mdss: correct UBWC programming for SM8550
>   drm/msm/mdss: rename ubwc_version to ubwc_enc_version
>   drm/msm/mdss: export UBWC data
>   drm/msm/mdss: populate missing data
>   drm/msm/dpu: use MDSS data for programming SSPP
>   drm/msm/dpu: drop UBWC configuration
>
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 --
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
>  drivers/gpu/drm/msm/msm_mdss.c                | 90 ++++++++++++-------
>  drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
>  22 files changed, 122 insertions(+), 139 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
>
> --
> 2.39.2
>
