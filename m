Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933DC855E36
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 10:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6403F10E55D;
	Thu, 15 Feb 2024 09:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WuSq1cJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379E210E572
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 09:32:22 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso613196276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 01:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707989541; x=1708594341; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xhsL/cUAT42+vhfZnH+MnscoqoxI62SZOZMcf2180Ao=;
 b=WuSq1cJxfpgmZDmJjdkZuhRS/VPmNig3S8JOjc6DyT/B97cL1Yn7aKOfEOzPlOF0O6
 3x2OdOOeRdZ0E+BTIXJQNateycVW+XO9zZRTIis7nuIYXJcpexk4AkcJyhN16q8YwzJp
 pQRr5qie8VefPvJ4mk6GEWJIso9MwxR1LSL2NjB3tMcrPKXbn4U3A+s5pMa+lw5Yntb4
 KgN/FABb/DNNtUKCIZgy5rA72hy9FKG6cNpn4MOSGFaXjUvveQBKvuJl0iY4g8AUHBge
 S0RIpCcfT7eJblkPUGnr09EJvydrtB2NCf6jFQloB7MYamgL7tyemwV4x8XwSWDbfHax
 lHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707989541; x=1708594341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xhsL/cUAT42+vhfZnH+MnscoqoxI62SZOZMcf2180Ao=;
 b=VBB/rWgh4Uslj+NLREsHbFn04kCqnVMTCNEHuAZ4tINbanEAq78OTtZgyEZ4rP4FhJ
 +R+wV+UEmcZH2c8CKda8rf9Z7RZbITY7pElcnMjAqWreMMc7JuN/w8n8sPRFobi+OF0N
 wDyaTvehAM7CvfVoZRgoPEYapiop5oPVmWo/s9T7zdS0sGXpRK5LGs617jemcImjWnPg
 TYICSYdJ3V/7F7MRdKvcxHS/88AWR6dIpXPLxANHEWZ2VXd41gKtZIJW8xbmZJrqm7Bh
 dVftANNADbokXYlySjSv5FXlGDp3eIFMeLCfB0ir8gbcL93V9XQvbWrk0LmmKdU+Wm4X
 XWhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTTLAXEWAMJUOpPVNZan/6H7o2h9dv/2a+SZNa24Aqq2uEwPn7zaxcLyKR3Yys8okn5jfpIfSzQ8J/1NohnVMIUaGyQTrLFQHGTkuLT5cK
X-Gm-Message-State: AOJu0YzlFPoOdiv5T0zYvVlKgYlUYL/fJjzT/rxij3+m9xfANMK0vw9c
 IODbuWHHIOuvbm1mr3T3cv5qMYk3k7UfENHidyBIkOobwbFrdU7QKeb3kBxGpImR3nEFcqYxtti
 XM47Dw1vLmk7FApGxCktAZUMCbTeIPEGUYy6oMw==
X-Google-Smtp-Source: AGHT+IGo2HcfVD2s8rsl4Q6UKE4zYlvCOdCjsO2WiOwy9pC6rfEmy2MtkOAphVrWtXxWh32cSnZlcfv9SsjiJWqGlD8=
X-Received: by 2002:a25:d68b:0:b0:dc6:aed5:718a with SMTP id
 n133-20020a25d68b000000b00dc6aed5718amr968831ybg.26.1707989541228; Thu, 15
 Feb 2024 01:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
 <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
 <ffb16ef6-fc9a-42b1-b9c3-4e8f6b52d849@linaro.org>
In-Reply-To: <ffb16ef6-fc9a-42b1-b9c3-4e8f6b52d849@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 11:32:10 +0200
Message-ID: <CAA8EJpobWYu8LoHZarOw82z78=kLJrKH0P4ncK6sX7zE1nHuqQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
To: neil.armstrong@linaro.org
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

On Thu, 15 Feb 2024 at 11:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 15/02/2024 10:25, Dmitry Baryshkov wrote:
> > On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> Document the GPU SMMU found on the SM8650 platform.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> >> index a4042ae24770..3ad5c850f3bf 100644
> >> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> >> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> >> @@ -93,6 +93,7 @@ properties:
> >>                 - qcom,sm8350-smmu-500
> >>                 - qcom,sm8450-smmu-500
> >>                 - qcom,sm8550-smmu-500
> >> +              - qcom,sm8650-smmu-500
> >>             - const: qcom,adreno-smmu
> >>             - const: qcom,smmu-500
> >>             - const: arm,mmu-500
> >> @@ -508,7 +509,10 @@ allOf:
> >>     - if:
> >>         properties:
> >>           compatible:
> >> -          const: qcom,sm8550-smmu-500
> >> +          contains:
> >> +            enum:
> >> +              - qcom,sm8550-smmu-500
> >> +              - qcom,sm8650-smmu-500
> >
> > Doesn't this cause warnings for non-GPU SMMU on this platform?
>
> No because it doesn't add those to required, it simply allows clock the properties.

Can we further constrain this branch so that it is applicable only to
the Adreno SMMUs (and enforce requirement)? And maybe constrain the
second if-branch so that it doesn't apply to the Adreno SMMUs?

>
> >
> >>       then:
> >>         properties:
> >>           clock-names:
> >> @@ -544,7 +548,6 @@ allOf:
> >>                 - qcom,sdx65-smmu-500
> >>                 - qcom,sm6350-smmu-500
> >>                 - qcom,sm6375-smmu-500
> >> -              - qcom,sm8650-smmu-500
> >>                 - qcom,x1e80100-smmu-500
> >>       then:
> >>         properties:
> >>
> >> --
> >> 2.34.1
> >>
> >
> >
>


-- 
With best wishes
Dmitry
