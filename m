Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CA9180BF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 14:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E6910E881;
	Wed, 26 Jun 2024 12:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BAX9pz4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BE310E79A;
 Wed, 26 Jun 2024 12:16:02 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70656b43fd4so3994969b3a.0; 
 Wed, 26 Jun 2024 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719404162; x=1720008962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I05K1/ywYAS4VCu7rfDnTBdklddZWqSo+1+tW9APewM=;
 b=BAX9pz4rrmX8J73JCJcmY6rYe1m8RcEwfDawyJmEgNZGVuUxbc8RpYP5kMSWbm1zsi
 ihX+rYaEiJ5l3lK2MzeOd/8Jst3rtALdTT7UwTfQfYyFWtxFw7x5btnyRhSUSNACTvuA
 bob8D0sJBxxDu5IVBYVAaqOGLL3A82FJeoiNcXygNUZugSWewJ5jsOtwcAmptpyHmlZK
 gAggVUGWKcgAtavr4ylB16CqozGtaYW4zzpbfbHZ2cwgzMB+22CzUfc6Is9zM7QWYOLo
 KlFAp9AF1f5e6YW/wf9q7zPNoNhslbgjfsByzalEUqKTnQnTFmKN8ujLME7LVWww8ePL
 Lu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719404162; x=1720008962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I05K1/ywYAS4VCu7rfDnTBdklddZWqSo+1+tW9APewM=;
 b=JgJil8e2+NpAqjD2XWQ0fr+1++RXON4Ff+3GiBRIrWXLFLbt6uQDRDuBkwrgAh0ZtK
 wBMLwAKzKXqNiPAiRSWqRx/IIKhRGJfUSSp+6z2nNtaxc2qUH2Uis1bcPHzgXzwcLAyr
 NPl70zKP74m4tIQb11QpKvLZWwdLTD9EIm5OEGREUdFKoKPyY8I0sesmTUkjLz+kWAg6
 R03kzQhjsYABX0/xUvHCeAmXcPzdZf+uWW6qhntRE1gxVp6rIsE3Z9zV/WYcc0XAMSWL
 Ms12CfObBPCov5rBVlqPedtvjaxHz/YdZuBRcLv3o3r3AbvjTHUB89+zdZSp7iJ6NYAA
 iH+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/eYuDwmJj5AxRQxMqx1ZYUVfQoV7dGS1Tu3i2o6S9tO8FKlWiDokJpfgKGmf7wvizLA/NLn/DNNje6oKpNCcn5juNjV3OyN02WOcrcElddbBr5DpLlWpzTaeCI1/I0vaZOMuqxWZ31ly7RpUJ3EE9
X-Gm-Message-State: AOJu0YxLivkqcwWAHpEzjzPBMGHnAqWnvicIRF4WT97sWZIQ3r1i1MDG
 pGAXe+1a+Xi+nZ4c/Fu04bKhCDKme4z2Ss5EbX4IHPCDapwXmr3MaNbjs7hTUhqGppbiGoIE+jJ
 d5m9jacCeh1IXoq3MVAygIDev8y8=
X-Google-Smtp-Source: AGHT+IG3anRqa+MiJAAggts5EH1CGLqq7RvzapM9iWuCH7mcUV/xDmy8QcLVo8Tb5lGP2lriA0FSn+KTa+LN6LElifk=
X-Received: by 2002:a05:6a21:78a4:b0:1be:c18d:9f66 with SMTP id
 adf61e73a8af0-1bec18da0c4mr1242338637.19.1719404161989; Wed, 26 Jun 2024
 05:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-v1-1-fd7e94694ab9@linaro.org>
In-Reply-To: <20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-v1-1-fd7e94694ab9@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 26 Jun 2024 13:15:48 +0100
Message-ID: <CACu1E7GakWGRTdWc055n7RNbYdBZgcNDATHsog8rntXsYajHgg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix a743 and a740 cx mem init
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 26, 2024 at 1:04=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Disable the call to qcom_scm_gpu_init_regs() for a730 and a740
> after init failures on the HDK8550 and HDK8450 platforms:
> msm_dpu ae01000.display-controller: failed to load adreno gpu
> msm_dpu ae01000.display-controller: failed to bind 3d00000.gpu (ops a3xx_=
ops [msm]): -5
> msm_dpu ae01000.display-controller: adev bind failed: -5
>
> While debugging, it happens the call to:
> qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ)
> returns -5 and makes the gpu fail to initialize.
>
> Remove the scm call since it's not done downstream either and
> works fine without.
>
> Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Connor Abbott <cwabbott0@gmail.com>
