Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0F85A658
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAE010E2EB;
	Mon, 19 Feb 2024 14:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ky7Q2zHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A3710E033
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:49:25 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-608342633b8so11312727b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354164; x=1708958964; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WJI1teD2wPawZOQzTgWhX+w1Ti/ZVP+Yv2CET7JvPGw=;
 b=Ky7Q2zHl+kJvnWuVwz0BkrbbnY2wqOLW9HiRGL1UgzMMwYLm1i7cAGyea1qI0vL77k
 1dEH+LJZIjQJBSsIvDB+/B4tjU4edFuaC7yfSkXFwIsDSASSMvrSV1PXrX+DWgAcOUWT
 J6K2GKzztwCSsBrngdtx6C6QTIrJVSdEORXVpVYFSOeUQeAgMnxjtfieE2HKOkLL0t5F
 U1Q6FTE3ai0kmzlTCXKmYp0z/EUB0p6a10fE6uz7yF5DoxoCZ7/OWawoxWr34WXSVvDl
 h5bPy3nSJuqLS+vgTMMAcvrpIQx4OBuEKzwvXKIOE2U+tpWuau8pzY5Sgt7N1zsLnH6b
 4y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354164; x=1708958964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WJI1teD2wPawZOQzTgWhX+w1Ti/ZVP+Yv2CET7JvPGw=;
 b=T+XqtoeFmm6SA/SW05SgW06BNecxpoDa4wzP6h3aMANqPvyLpRRmbWHzWt14K+7Vvv
 tadX++ROjK5OXxljYqj6rbaBZVpMUf5gGE+X0bAd7uWc+nLLX9AVkzFU3Fm/UmMKzN/e
 FIsoq03WiXT/kdGW6LQ2s+TK0h3i8BmEyV4ZTdVg1epckz7BAKqBIhQXyDcSgTQJEI8u
 EACNjnIEBSRtyRk+MO4n9ZxXkpqIZTAl1u0i52R8+SCQ0ZxcbfoYr/JHBs/ysvSabxmH
 +h3BwaIc3Icd7OS3GdejFIlpUMl4g9HWQ1rg8XQ7PMrHfAlzSZ+VxxDNvmtTD5jnCTtN
 dPjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK30ovgUa7Rx95awTH3hlktWDWDXZp6OKayQHxXr73Z87mhceRlzkGrxGObsefN59SPJobY6fVSkiaWqb657ye949y8QC0phloWxvneB8i
X-Gm-Message-State: AOJu0YwKjcvfiA6atTrWfd1LOLb+1wEnoluIbel199xAqEZBfTZ7dRs+
 1oOYZJhoCNHHki36ZyvK6nBTVpFwcvORBgn+E6JmZXrmUa/XK+qTvdW9RbDJotyBZSnSMn0P7Vn
 uW3Hz8xF4FYd7BsYYjNSHNV48AMrlAEfjdJcsYQ==
X-Google-Smtp-Source: AGHT+IHr/IUKFhapXnOD7toFxlQf0Om4NTc3bUIZPM42rFzdOhQ5udZqS0lilrwVoRYH1x47luPm3EintARWerYH8fE=
X-Received: by 2002:a81:ad1d:0:b0:604:a47e:6e52 with SMTP id
 l29-20020a81ad1d000000b00604a47e6e52mr12358877ywh.32.1708354164616; Mon, 19
 Feb 2024 06:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-8-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:49:13 +0200
Message-ID: <CAA8EJppPvXfkz=wVca8aFBhFaVUe9+OiVzcQUq7D8zPbK+T1FQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qrb2210-rb1: Enable the GPU
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
> Enable the A702 GPU (also marketed as "3D accelerator by qcom [1], lol).

Is it not?

>
> [1] https://docs.qualcomm.com/bundle/publicresource/87-61720-1_REV_A_QUALCOMM_ROBOTICS_RB1_PLATFORM__QUALCOMM_QRB2210__PRODUCT_BRIEF.pdf
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

With the exception of the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)


-- 
With best wishes
Dmitry
