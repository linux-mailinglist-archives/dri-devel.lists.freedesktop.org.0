Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5208AA01B43
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2025 19:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32C110E0AE;
	Sun,  5 Jan 2025 18:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QmovjQTi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A4810E0AE;
 Sun,  5 Jan 2025 18:03:06 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6d8e8445219so121854356d6.0; 
 Sun, 05 Jan 2025 10:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736100125; x=1736704925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XxNEftZua09LK0hM2esB8aQB+qauXYBXnPyeQF/u7M=;
 b=QmovjQTiTvsfBGA2BKNBSwINSA1z98zvB9R7USZf8axsVOJ6Jyn1QOgdxPGHJN8dBj
 jmyedCDd732XCSNYkgWh80aueswiSSjD+T+9lUCPCEHaaY1J5YP4Y/XKjL/+lLUALQMu
 vsm8iUGmC8MvPLBL6IiI9em/lpdCcNcjQni/UI2IupIHeFYctN42aACdr40m9sr/ZQjO
 6n/m1mfPxZ39IyM6cVPhGxmulQyhE9NIngoi+jU2GyUvBdIZQ5yLn8quTKgjbWHB7/YU
 37InEH3JH9NAHv1x0NLeB8QgIz9cfxZr3Z12IKaC+f3i+LTazouZ+hXtwvjzPKe+BGCp
 mfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736100125; x=1736704925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XxNEftZua09LK0hM2esB8aQB+qauXYBXnPyeQF/u7M=;
 b=wuJeT43jT6a2j+AkdnV0wsDKZdGLCCwFpI8fFPb9dxq1bPsLWeKJywasOho6hWJsyg
 ffRX9vJLeVZMnt4qvxMLwxN9kyjdIWXAuNevJ05EX89gMDgMWg8aym968DYnyiXnBdAk
 SYk4HmImBVPTRPUCB/xagH4kznMV9cbd9qkCps76NVnE/EeYVaztBSJyuV06YTsjUF00
 Ro43TU0PUcF16/O5Dw9tyJsj9IdslhyTRSVqPMKycqRIXd81p8Vp2iVonJj6WD5Uk6KP
 zDL93lV5RJx7BF/Vgn1N6y+voY/3H8V4Tnka7GjVoYnQkI0JlE+XBtu9ViX9Yb1oQcY8
 ZzOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyOn13ujtyj2P+QK9bWgAjtpxCG73C213FPzohI1MwMSVzOROzqqxXeel5+lUm5mkqbf2S+4ea4tv1@lists.freedesktop.org,
 AJvYcCXm5XRX68F0d6ForO9oyGP8jmwwQ02kwaNJskppAZwWnvjBKd/4vDh9g/OMrh8SEhCmFs4aTDkDKwc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5zWzrmf3T3lZ4bMuoYTdQcIM0HRJXByaXua18Refydd0YfYaR
 31+anDHWsd9VIpEzvUJaR9C7gJ6e010HZO+ZKDE3rBFKd9KMmEIT/7+6ceNhlasJa15DYagn69y
 9rcYYuNDpC6OuEMZwbKb/UTk16cXC3Pr9kwE=
X-Gm-Gg: ASbGncuCQpFvDBTUUOBvrTS1wI2M6Vu5hmdWydyOrUSe6QtrnLSKTNg/GMsrEkjftJS
 62mOxFVhJU41OFMQw13APnuvFXo0mDlCOEDY169L46KitjTqjWXC0/YlquW0yZxALo9CTtSD8
X-Google-Smtp-Source: AGHT+IHvCPNMz64lZgikf9PqNcOhvTMRwGCdjgxlvaOeMmuPREPE2VatSotMqePlInthqSEKKYUwoJA15I6O4EM0eaU=
X-Received: by 2002:a05:6870:20d:b0:29e:32e7:5f17 with SMTP id
 586e51a60fabf-2a7fb4b7bb3mr25812289fac.28.1736099781938; Sun, 05 Jan 2025
 09:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
In-Reply-To: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sun, 5 Jan 2025 18:55:46 +0100
Message-ID: <CAO_MupJ21kOQPZG_=87mC-fQKmL=-K9AgOjriWR=wXCKU0897w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Support for GPU ACD feature on Adreno X1-85
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org
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

Hi,
I've applied this series for testing, and I've no performance
increase, and some screen corruption, there's some lines(mostly white)
on my yoga slim 7x that appear on the bottom of the screen. When I
move my cursor in swaywm over it, the lines get occluded by the cursor
and screenshots don't show these lines.

Best Regards,
Maya Matuszczyk

pon., 30 gru 2024 o 22:11 Akhil P Oommen <quic_akhilpo@quicinc.com> napisa=
=C5=82(a):
>
> This series adds support for ACD feature for Adreno GPU which helps to
> lower the power consumption on GX rail and also sometimes is a requiremen=
t
> to enable higher GPU frequencies. At high level, following are the
> sequences required for ACD feature:
>         1. Identify the ACD level data for each regulator corner
>         2. Send a message to AOSS to switch voltage plan
>         3. Send a table with ACD level information to GMU during every
>         gpu wake up
>
> For (1), it is better to keep ACD level data in devicetree because this
> value depends on the process node, voltage margins etc which are
> chipset specific. For instance, same GPU HW IP on a different chipset
> would have a different set of values. So, a new schema which extends
> opp-v2 is created to add a new property called "qcom,opp-acd-level".
>
> ACD support is dynamically detected based on the presence of
> "qcom,opp-acd-level" property in GPU's opp table. Also, qmp node should b=
e
> present under GMU node in devicetree for communication with AOSS.
>
> The devicetree patch in this series adds the acd-level data for X1-85
> GPU present in Snapdragon X1 Elite chipset.
>
> The last two devicetree patches are for Bjorn and all the rest for
> Rob Clark.
>
> ---
> Changes in v3:
> - Rebased on top of v6.13-rc4 since X1E doesn't boot properly with msm-ne=
xt
> - Update patternProperties regex (Krzysztof)
> - Update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml
> - Update the new dt properties' description
> - Do not move qmp_get() to acd probe (Konrad)
> - New patches: patch#2, #3 and #6
> - Link to v2: https://lore.kernel.org/r/20241021-gpu-acd-v2-0-9c25a62803b=
c@quicinc.com
>
> Changes in v2:
> - Removed RFC tag for the series
> - Improve documentation for the new dt bindings (Krzysztof)
> - Add fallback compatible string for opp-table (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20241012-gpu-acd-v1-0-1e5e91aa95b=
6@quicinc.com
>
> ---
> Akhil P Oommen (6):
>       drm/msm/adreno: Add support for ACD
>       drm/msm: a6x: Rework qmp_get() error handling
>       drm/msm/adreno: Add module param to disable ACD
>       dt-bindings: opp: Add v2-qcom-adreno vendor bindings
>       arm64: dts: qcom: x1e80100: Add ACD levels for GPU
>       arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU
>
>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 25 +++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 ++++++++++++++++=
++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 36 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
>  8 files changed, 268 insertions(+), 13 deletions(-)
> ---
> base-commit: dbfac60febfa806abb2d384cb6441e77335d2799
> change-id: 20240724-gpu-acd-6c1dc5dcf516
>
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
>
>
