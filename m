Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED4715F37
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 14:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D3F10E14A;
	Tue, 30 May 2023 12:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7578D10E059
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 12:26:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso7971059a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449616; x=1688041616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=stytcPLfmtfo2fgiuSzdRWfNyIk7zVG1HeYjVvCDz9w=;
 b=gfCtr7jZXqESNbxzXiO43l3qqczxibfd/8w9kd1Ym8YdWhXyG+fyLdmQMpEwRJKnLX
 9CDjSBYhIeVFltkeDw6O7TZhpN4ll73Ic+iWAWQazQlPM/ceWi/cDavmggYTsBKvUASV
 M6XloXq9jSWBv2+6ermKsbpEfF9PDrvNQ5TfLnbNOBsaXF4WOoln+deS7pYJ+eRfKA2W
 FsjnppkAX32eN6OEzpNHzIxIwiHZBKMlK7lyRfmgHUD5DcyxstEfzXndYdKrIJNjIKsA
 Ll+gsI3BBLsHgdonbzLUfx83IhNiMrctNLGvHNsMHAicOLaLYPIyyfHbosoQGidJXN57
 hMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449616; x=1688041616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stytcPLfmtfo2fgiuSzdRWfNyIk7zVG1HeYjVvCDz9w=;
 b=Fbm9Y2D5H0yF0Tw7kpjNFLdstM9EsSCsBwe1qCfhss2fUpAlsT2WPo5dsScDV+TbA8
 Gmt+fE7UDT3NUi9IqR/VJk0P+K3T1uQIr993TsKsFB/Ik597IS1rXSuy6dY9Tfqvjzwe
 dbraGpIoTl6hxuJqqK0bh7/M1I3ONFkmuo7pw75+Ilh/IlAX+FxXdSapVXZBkL2cJhAF
 MBBdEeoR03N+T5DU1BPZyRdFcsEsPNBE/CDBX8T2t8IA408ap6xCzBkYlQF0CFw3mY2h
 y8oQoPYOjVtKw0swXcLo5/IJoFNCSWtYOqZ88cMkI0cAzhmY3nyGrGh5dd4ZMytRY4R4
 xOLQ==
X-Gm-Message-State: AC+VfDwXhdrtO4A9ix0PYGdaL40HRTF6L1pw58Ix64UulVQ+EFOFZroM
 SNfY/O0BHKiwBNxlGx53+g4vwg==
X-Google-Smtp-Source: ACHHUZ66izEDUSaQQp76hTrSWMdC6fb+uAdYBYs6F5ndxLqGKRKd2/soK1F7uCXH6BQ11yXPM73REg==
X-Received: by 2002:a05:6402:693:b0:506:83fc:2dab with SMTP id
 f19-20020a056402069300b0050683fc2dabmr1537814edy.22.1685449616416; 
 Tue, 30 May 2023 05:26:56 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204]) by smtp.gmail.com with ESMTPSA id
 z4-20020aa7d404000000b0050bc9ffed66sm4302283edq.53.2023.05.30.05.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 05:26:55 -0700 (PDT)
Date: Tue, 30 May 2023 14:26:52 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 01/18] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Message-ID: <20230530122652.lct6tk6zseny6gxl@krzk-bin>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 May 2023 15:52:20 +0200, Konrad Dybcio wrote:
> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> we'd normally assign to the GMU as if they were a part of the GMU, even
> though they are not". It's a (good) software representation of the GMU_CX
> and GMU_GX register spaces within the GPUSS that helps us programatically
> treat these de-facto GMU-less parts in a way that's very similar to their
> GMU-equipped cousins, massively saving up on code duplication.
> 
> The "wrapper" register space was specifically designed to mimic the layout
> of a real GMU, though it rather obviously does not have the M3 core et al.
> 
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins. Account
> for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
>  1 file changed, 52 insertions(+), 9 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1787121


gpu@2c00000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
