Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52C855DEF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD98010E2C0;
	Thu, 15 Feb 2024 09:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="myZK+Ouo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588910E2FA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:25:45 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc6d8bd618eso569009276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707989144; x=1708593944; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ut8NlXOEY0y/ncuagbllCtcYDmgG86ebbFIp8z5hh8U=;
 b=myZK+OuoyJSt7huTBBWMU4RB0TQMvvSqBqwIG/7tUtkbSaNQcc7Zl9VG3gH6gLZYBV
 v23gfQuVVML9Bfie4xXibkPzKNZaEGgcZh0pStM15lRCs5vbHAtkB3N1U9MAPr3fQaXe
 RcSaanmF9YuS67s1yn1/i4w3adGEUAAKqHLXdSfFRAVQj7kAqbRzk2gdf4WkRxbElMbS
 CUlnlSDE1UVc15MC9UKxBZv7yWXGlCOdbEmsLwubx1fhpLTMqkc16Kyo5TH9umFG1s5T
 ETV6JF1bj6toPGI22g7n4P44CSmzoQh7ZiS2J7meP2x4EtNWtHSA8aedLT+TmQLnM/jO
 ibyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707989144; x=1708593944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ut8NlXOEY0y/ncuagbllCtcYDmgG86ebbFIp8z5hh8U=;
 b=j6mv0IkyZ3HpYX6KfXTp0AzPBxR16J2dfa/2xkn7Zv0h/bI+zpOvkeOunrQpd5XYeI
 sV9GJdG4csmwNQFF3Kvv+MUGxJD34EvIEZzQpZiu876DQKcKJLBArx05OfZGooDF6PrM
 KAs+NfnNfi5gmHKhKw0B898agZm0M45v5rM7DFyb7WrveZAH9cxC2nJstvx4GSEiqg32
 p7dSCoXVdfXx9QhkkGXLhP9NgDDz0oY1oC51md4rXWkpvPDb3EKdogWFDcEhj5J2sc+s
 FIba2CGbmdQfzNWO4d+dV4KP6oHAKtbvLx8Vx+gqbJHiyAdsa7IqFHeBh4Z9X2v2IgFB
 EMTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU0YmoI4xk8G0/tF5eJH8lovkgnZ3BUO2KMjcX8sJSMkvKrZIpHqqXvGVrQLn4BDEihy2M4R00fxk14Hq1ZozYKjZNiF3+idiaq57xHhQJ
X-Gm-Message-State: AOJu0YwxgminWg7Ju0KP5cnIikLfrzqSqfLAdU7q+dr5/1VUunlX6Fd3
 gUoCtD5K94qysQwfi784qJxVvrIEH8svR5VMjFrYoTQmI35n3Pg5eJxVch1ZeYKffooFEei89G/
 OQuFFsg+h7wyH4GmgP8RQ6M7EedhGcbWDJDT5iw==
X-Google-Smtp-Source: AGHT+IGK2EB5aTs8BfG4jSsckxgl2EOaTmuQv0ycjxUuZs5Mb4QsZ7LrFpeHU2Kn6y9+s5eezLpdwLHcymkVAR1BGTw=
X-Received: by 2002:a25:7447:0:b0:dcc:273e:1613 with SMTP id
 p68-20020a257447000000b00dcc273e1613mr1232044ybc.40.1707989144074; Thu, 15
 Feb 2024 01:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
In-Reply-To: <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 11:25:33 +0200
Message-ID: <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev
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

On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Document the GPU SMMU found on the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index a4042ae24770..3ad5c850f3bf 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -93,6 +93,7 @@ properties:
>                - qcom,sm8350-smmu-500
>                - qcom,sm8450-smmu-500
>                - qcom,sm8550-smmu-500
> +              - qcom,sm8650-smmu-500
>            - const: qcom,adreno-smmu
>            - const: qcom,smmu-500
>            - const: arm,mmu-500
> @@ -508,7 +509,10 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: qcom,sm8550-smmu-500
> +          contains:
> +            enum:
> +              - qcom,sm8550-smmu-500
> +              - qcom,sm8650-smmu-500

Doesn't this cause warnings for non-GPU SMMU on this platform?

>      then:
>        properties:
>          clock-names:
> @@ -544,7 +548,6 @@ allOf:
>                - qcom,sdx65-smmu-500
>                - qcom,sm6350-smmu-500
>                - qcom,sm6375-smmu-500
> -              - qcom,sm8650-smmu-500
>                - qcom,x1e80100-smmu-500
>      then:
>        properties:
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
