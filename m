Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214B6617DF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 19:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BB610E1FE;
	Sun,  8 Jan 2023 18:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1345410E1FE;
 Sun,  8 Jan 2023 18:11:22 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id h26so3823386ila.11;
 Sun, 08 Jan 2023 10:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiypBw1FFoQC+gIVSsz3bdQtqAHOH/d5JbPQdSsewDY=;
 b=2l+FD8S5gqOJm3PDTqhs5IPRfQ2SPjjvZh6hozF/6q6Ea7rRKku3QBFaBQJ8TUaccy
 XAvqDkXJvC1gmT3DM+YiWqJ9qmiYYdIz36YURet6NBdtOF8pEw0nI55ChoW86t/TyLNN
 yRQ5lBJpwGbGSWJIkw8S5BkKncWlzySLvLx1N2XS5Rk1e18BF6HM7/zB85BlvBB6lVHS
 nVuwH8JvTFlS+uCwutsJpUZO5SNi1JvMrrizqpZoCBzpJSi++DynU66Ig6CdBoPKNRF7
 VluKHeOZKl1pOBeXsP1uWTJ39v+7T4/Wr259vDt539Odw2/WgFORuahPQytbxEQSPfZ7
 HLHQ==
X-Gm-Message-State: AFqh2krU/NdqphKdw8I7Hjl3CBDixm27Rj5D/MQ7dELZ8lJNEuDTuTmr
 njKNt6AFTwdB6UXAt3TAJQ==
X-Google-Smtp-Source: AMrXdXuYDz5mzS+d03/EiJebiBeLhsVbqPJcw3Ay/ahTEpGsd0G1G7HVqSpVRNyYJa06WCL4gtW/Lw==
X-Received: by 2002:a92:dc06:0:b0:30d:7b2f:c0b1 with SMTP id
 t6-20020a92dc06000000b0030d7b2fc0b1mr10948191iln.16.1673201481239; 
 Sun, 08 Jan 2023 10:11:21 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a02220c000000b0039e5fa071a2sm1981012jao.173.2023.01.08.10.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:11:20 -0800 (PST)
Received: (nullmailer pid 155243 invoked by uid 1000);
 Sun, 08 Jan 2023 18:11:18 -0000
Date: Sun, 8 Jan 2023 12:11:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: display: msm: drop unneeded list for
 single compatible
Message-ID: <167320147769.155186.14878775779910261810.robh@kernel.org>
References: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
 <20221225115925.55337-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221225115925.55337-2-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 25 Dec 2022 12:59:25 +0100, Krzysztof Kozlowski wrote:
> With only one compatible, there is no need to define it as list (items).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml      | 3 +--
>  .../devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml     | 3 +--
>  .../devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml      | 3 +--
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml     | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml       | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml      | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml       | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml      | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml       | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 3 +--
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml      | 3 +--
>  11 files changed, 11 insertions(+), 22 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
