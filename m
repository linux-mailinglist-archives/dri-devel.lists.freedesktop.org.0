Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDADC68C410
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 18:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDB010E9DD;
	Mon,  6 Feb 2023 16:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0173010E9DD;
 Mon,  6 Feb 2023 16:59:56 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 v24-20020a05683011d800b0068bdd29b160so3353491otq.13; 
 Mon, 06 Feb 2023 08:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWK0RCI2c9XCQOLVOEExMr3jmCL7DBxo8zA9Z9kn5Ag=;
 b=yKTbSydlinaRkT3foZpH0AVpbtmB0FTgPhVtYxMuy1kf8l0n/vTlllkoXzspf+GGR6
 h9i7QSqVXcMDwaaER16ZEVOgpHuxJIf96Eri5hvBFuQL3iIGB17Hs6QOzeuphSSehOVA
 GJ7FHxB9KoFlpkskANQdpmel5n0HwxVZRXb1/VlZa/5f7ZsGbrRx94a1P7zBPxm9yAY4
 m7XDl9Qq4C/Q9k5O9YJw5RXPyoC+NWCYZIKBmNr7kgnHcDRx5YTe+Bxh2dhif117klQE
 I895WKxLJizD9EFct4WszHXfNBRQg2Bla8beuWgvoliN2xaGw1jn/HWTDIAiTCIvoU4v
 Esjw==
X-Gm-Message-State: AO0yUKVuvE1HSwbWNhcEZuwcjMC58I/EDIMUIcQgOUZ3Imi/HhmJZb/c
 2dbIzUpc3n0cm2LLPLhBJg==
X-Google-Smtp-Source: AK7set+XQrYkk7RAD6BXw1EcNpzL9QdntLhl7DipkBZC75I4/eFBpxanK/9FuQ3Xv7ABN9tYcoDv3Q==
X-Received: by 2002:a05:6830:6483:b0:68d:51fe:7b6b with SMTP id
 ck3-20020a056830648300b0068d51fe7b6bmr153666otb.8.1675702796198; 
 Mon, 06 Feb 2023 08:59:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r5-20020a9d7cc5000000b0068bcd200247sm5132312otn.75.2023.02.06.08.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 08:59:55 -0800 (PST)
Received: (nullmailer pid 224852 invoked by uid 1000);
 Mon, 06 Feb 2023 16:59:54 -0000
Date: Mon, 6 Feb 2023 10:59:54 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into
 qcom,gpucc.yaml
Message-ID: <167570279425.224789.8066014720500178753.robh@kernel.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <sboyd@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 06 Feb 2023 02:27:27 +0200, Dmitry Baryshkov wrote:
> The GPU clock controller bindings for the Qualcomm sm8350 platform are
> not correct. The driver uses .fw_name instead of using indices to bind
> parent clocks, thus demanding the clock-names usage. With the proper
> clock-names in place, the bindings becomes equal to the bindings defined
> by qcom,gpucc.yaml, so it is impractical to keep them in a separate
> file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gpucc-sm8350.yaml     | 71 -------------------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
>  2 files changed, 2 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

