Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C282997852
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 00:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8DD10E81E;
	Wed,  9 Oct 2024 22:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BgH2grxe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FDF10E820
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 22:13:58 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6e2ef9af517so3092327b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 15:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728512038; x=1729116838; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZSnAryhvRVAxOzTa39firHYc0HGN21O7Mp2XuZXfKY=;
 b=BgH2grxemHFA9VG+Y/aCLLVnR1of/LfNI3UKo7WpjCGS+/xeyKV5Kj82mN2BtUxbLQ
 cBIyOEihixCWbgARwB1xaRvReN0SqsQGI2HSYOkBuXkIi1mopNvYcuiM5YUtDZy1qP8g
 spYYuHv4vyFdpFqP7bEW66yDTE3xpwxzb4+cTNFQpVfPWTTnmRD09iEOjhORFP+yknuF
 kRqDinaGFyIqUbTXxBEsk7xYwNdqRXZXrrBBe+e0enz7yZjZ5tQst3sragbqC0lKPED2
 AFe0riLUg+DcYA2g/lN6jPj1DAU7GiPgWFWA9gON01sIZVRDDAHndTIv8m3UfYoy/3PR
 w80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728512038; x=1729116838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ZSnAryhvRVAxOzTa39firHYc0HGN21O7Mp2XuZXfKY=;
 b=koy8tWLAaSFmbcUjwfPaGgqsIuy7rMWwhvb7KSHd2ywa2NXmSguvfIo0TBO+etT2B2
 ckHHhdzXf9zm6V/opJGTu1a+i75ylZQLkokMexXTVUzogO2KiU5T6V7mpPs/PwMJZlyE
 ARs/gjTQ/Cf5fuKrPyRoQz174/qDAn4fXphpC3N5OfX6cIfg3+XTxHi4pUA4xUm0uZmY
 5zyUitEYHtDKtdA1uaLp3kgkubYFHoBE7uEYiMiNiyAkdynYIzdWrbCjdLyY3PjFIUKo
 7UyVr20PFlj+ulAb3yaotrJMwmRTREJb46YGJWG4uUvF1pXME0uJ0GV/qhOUehzeRt1H
 OYSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFm2PeAD7m8nJUvzWBmnqp+Zf40yvvPtu/mFQ/wKCYrE1WxsTYZoqEFdLKrZwwFmVqBr7wy3z9Jf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcThJARBTTu63vqhh7fbiwGXmmB6W5uytkW2IVX0hP7PPto34B
 9WxQxewDrIBbeUZP8DSUGEZJnYuT5oNH+7h2R+zMBWvL2is5Jq48nlQv/+1wQJOY+BIfv/G7YG/
 WbogUhm1BMxhPF++ytf6mKL1X+DGAPttsVSNlHw==
X-Google-Smtp-Source: AGHT+IE8N/AQRHVkfQpViJ7j87DJYPlLqudgKJPaHi0a2xWoaLY/SYqNoHWu/8CjFR85/GwjoCayPnP8Gpj2MkizG/U=
X-Received: by 2002:a05:690c:113:b0:6e3:ceb:ce2b with SMTP id
 00721157ae682-6e32250ade9mr39940947b3.44.1728512037720; Wed, 09 Oct 2024
 15:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
In-Reply-To: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 01:13:46 +0300
Message-ID: <CAA8EJpquGKn1kC1Z7dDgBd-ZXKO34ZFRPAHjYaAZQguUs6N__w@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Display enablement changes for Qualcomm SA8775P
 platform
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Wed, 9 Oct 2024 at 17:34, Mahadevan <quic_mahap@quicinc.com> wrote:
>
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
>
> ---
> In this series
> - PATCH 1: "dt-bindings: display/msm: Document MDSS on SA8775P" depends on dp
>   binding documetion in this change:
>   https://lore.kernel.org/all/20240923113150.24711-5-quic_mukhopad@quicinc.com/
> - PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU"
>   depends on the clock enablement change:
>   https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
>
> ---
>
> [v4]
> - Removed new YAML added for sa8775p dpu dt-binding documention as it is similar
>   to qcom,sm8650-dpu.yaml and added the compatible in same. [Krzysztof]

And this wasn't tested. Please test the bindings before posting.

>
> [v3]
> -Edited copyright for catalog changes. [Dmitry]
> -Fix dt_binding_check tool errors(update reg address as address-cells and
>  size-cells of root node one and maintain the same for child nodes of mdss,
>  added additionalProperties in schema).
>  [Rob, Bjorn, Krzysztof]
> -Add QCOM_ICC_TAG_ACTIVE_ONLY interconnect path tag to mdp0-mem and mdp1-mem
>  path in devicetree. [Dmitry]
> -Update commit subject and message for DT change. [Dmitry]
> -Remove interconnect path tags from dt bindings. (ref sm8450-mdss yaml)
>
> [v2]
> - Updated cover letter subject and message. [Dmitry]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in the binding example, droping unused labels,
>   droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> - Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
> - add reg_bus_bw in msm_mdss_data. [Dmitry]
> - Fix indentation in the devicetree. [Dmitry]
>
> --
> 2.34.1
>
> ---
> Mahadevan (5):
>       dt-bindings: display/msm: Document MDSS on SA8775P
>       dt-bindings: display/msm: Document the DPU for SA8775P
>       drm/msm: mdss: Add SA8775P support
>       drm/msm/dpu: Add SA8775P support
>       arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
>
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 ++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  89 ++++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  8 files changed, 830 insertions(+)
> ---
> base-commit: e390603cfa79c860ed35e073f5fe77805b067a8e
> change-id: 20240930-patchv3_1-600cbc1549e8
>
> Best regards,
> --
> Mahadevan <quic_mahap@quicinc.com>
>


-- 
With best wishes
Dmitry
