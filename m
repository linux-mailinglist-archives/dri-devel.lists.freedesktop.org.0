Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DC485A689
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E65710E37D;
	Mon, 19 Feb 2024 14:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GGwreiAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D947510E272
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:54:44 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-607eefeea90so30215687b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354484; x=1708959284; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
 b=GGwreiAyUJWWwDl/pmeMKXAa26tg/Zb6joibQowkrL0x8wt+ACL2eguI0Ux+PYjzWS
 6a19iJ41849VeQtf+nO24XwvV3c6aNCzMEJjw3eY7n2Swr3CRRJ75SLtDF+PGabmDYKs
 ngI8qusT+6iJ1xjGEUOSMc5TW8ldFG67H9HIYcTk7DhSRh31DAjo7h6E7CYDKyk7y1jq
 COi9q+AnglOT83VfnbPBDQ61nQ1KlaDH3EmbgDItyPoyPg1jK+Klv5qJyKM5qBYbTl4m
 Pcg91pltGmObwMaluPOdLObZgpSZ44eme6MD9V2A0+QGGThzDiMgqYf31l/rZSFgQ1pq
 /ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354484; x=1708959284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+Vf6X891RpEKNXrdBrteASyRB3a3/HliSNBQV8d1lo=;
 b=uobTzGa3V/CI3lxWNuW4UeAk+sgPnm06c6I6f9d5CdLO7e/RobueMp/YM2tAjQK63p
 XKYDuV1gS/meTeMChLNBrOdZFKnvVMw4iA6WDtqZLyeUx/7mjk4ArZG3huEH55jsChey
 BqNePV/zkF+Uf+iu/FKvai/gERd4bjAO73y60vHayME1C0vXBxDY9I+qs2mltJkije9u
 9ZyzD8po+y8XnhLtIrB16kHePyFjY7rvucRN/GAxspUbvms4nCNJwRpRyFRwlaFZVTXJ
 DgJSJOV013bMbkCdDz+Hrbr0zNcEbPLyycOw9caF3ToSPEcXpROvk3QqGgBSd11euiJ8
 4ZcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC7YLvRVXq1B5et+2DxgkU+SbjzzJuFaZ6oBLLayiS7Ik4NGSYtyf1e4EoRbDHKk7zbiac+Ms9HU4G6K0l3yqhbjSVMcaJzjv5vIpyP2y7
X-Gm-Message-State: AOJu0YzrJUdrB6m0pSuNtKowdkJhbKUDLesk+sxBQtQuOjkXpAOh/c4A
 O4gMbGypE6U/QFvLMPGcW2Qkf7VL4hFPOZ57xKjrrYI78EtzDHmrt2tJHTOucqS0+NfOJ94KlFP
 qoz6OV52z5Cm0393SO4j3VlDpi43emSqC/cpNNQ==
X-Google-Smtp-Source: AGHT+IHg7XEOTTrtpgQqphtP3Xw9sPuPWwJbqow3gZN5qRELJzU++tbN2bRulnySBEDH7nL4PxT+8aS1knEIIJLBbCc=
X-Received: by 2002:a81:a185:0:b0:608:59a5:4ad1 with SMTP id
 y127-20020a81a185000000b0060859a54ad1mr39629ywg.22.1708354483969; Mon, 19 Feb
 2024 06:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-4-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:54:33 +0200
Message-ID: <CAA8EJpq46Wn+gWKL81_zMxyddUpJRuKHDrx=4Q2DvbwufmWHWA@mail.gmail.com>
Subject: Re: [PATCH 4/8] clk: qcom: Add QCM2290 GPU clock controller driver
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add a driver for the GPU clock controller block found on the QCM2290 SoC.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |   9 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/gpucc-qcm2290.c | 423 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 433 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
