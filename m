Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D312A861EED
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC9910ECDE;
	Fri, 23 Feb 2024 21:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g0M0a/Rn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733BD10ECDF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:24:54 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-60495209415so8799327b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723493; x=1709328293; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wgdv/OJ7jeihH3J71yo7/tj9HKsPe0FnbUozf7yDTNQ=;
 b=g0M0a/RnWDtlohJgyx88K2gNYtTB1HWk75jebFi9kLmuB3aBd2N4hySfPfKt6nEX/M
 pWACd03ahHyeUQulE0QXNAMxkTuuZMZtTgtN+p+IevvsJqObELCXMRJrQ+6SpKJBzO6t
 jyV3JBRiB2pHLGh8toZKuk7bcnR011bqW7JiaxrIzv8SLB4Ph/TErIwTnB33mJRk4eJq
 WLIP8xakaXaD7ooyRUTsnYTG0pcyklE93ZkD6UMgoNDCt6THxJqyjoT7a+iggck85N+m
 WtmSEMxY9MCcRzR5Va/+ErU6yo7fnR/bMjDar3jswkU5WZpJaSR4fEm/o7Yb3M5Jv2sb
 vvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723493; x=1709328293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgdv/OJ7jeihH3J71yo7/tj9HKsPe0FnbUozf7yDTNQ=;
 b=l1JC/jH5yrAYqHkisSgWEYT6arB4ed79UgtoIcYL4J/t9YYzp3GOckXhL6cnT42H3X
 dcQFhnFPQk+TLnIcV9plsFUUjHn7oeh8rJWUZBaYHUl43kdjxOoMWXBTYGlJtMb0PDJx
 70P95hJEsix8CrSvK4NBx5hbTxgLmkBEPUtOQn+59Dcym8+61fhzri9Zq1NtPgH/6zsV
 Sc9lrTtPgtt4j4CvtIMFotSAPW1DrmYRQhFxTivFcBDwySThV/dFamzo5wP82MkNiKAs
 4OlqYilx6iPkG8MajZpY5y3UvO/KO7vqiGlVqkyCbh9m8gIZSPcjnX2yAtCNmQTFkHvV
 cUtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKaVzrIhTx/Ib3d8Pv0J8X61m/Q19SBMvySRYGwPWn0ZUbx6tB8YWUjY6ZL/yuR/BXUdc1ZzE328pjrjvRJof6ZwH0ezsF/sHBY/Hcm08s
X-Gm-Message-State: AOJu0Yw/08f6O94caD0ZAztOVyRUj9DoQNF4SsboCFEFaT5AXdGlPwiH
 +gp+LWTvl+LGi+V06i2GFCF45v3F60PtYDqksoNbdHPMWI/u1HA/QrSa450Csa7PZ904r663nsm
 AXVbuB6BVqWuSIq9tTndCgTYd7omC4uxOLNhuWA==
X-Google-Smtp-Source: AGHT+IFMmUBgDbCE2Q2G9lsAmZpvVhtEQwvP+lU1HPMuQilfEiaGC1y+Wv7lhCQH4132jTFroLi4zQTtEiwxKXXZKTw=
X-Received: by 2002:a25:3082:0:b0:dc6:c2b2:c039 with SMTP id
 w124-20020a253082000000b00dc6c2b2c039mr998519ybw.41.1708723493452; Fri, 23
 Feb 2024 13:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
 <20240219-topic-rb1_gpu-v2-4-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-4-2d3d6a0db040@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 23:24:42 +0200
Message-ID: <CAA8EJpqnAoCDer93V34BaFHf5mhiNOFMQTP1Xaeoio0BWaPzhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add missing defines for A702
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

On Fri, 23 Feb 2024 at 23:21, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add some defines required for A702. Can be substituted with a header
> sync after merging mesa!27665 [1].
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
