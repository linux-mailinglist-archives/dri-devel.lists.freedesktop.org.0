Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878E578909
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00292112C3A;
	Mon, 18 Jul 2022 17:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A930C112C1A;
 Mon, 18 Jul 2022 17:58:17 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id r70so8757673iod.10;
 Mon, 18 Jul 2022 10:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9/D5m5qV27tEBYYCCg0RQaXxh+5fqETc+p8ErLupmSk=;
 b=LF7bCPGysCBAFVEybaYOtppJ2JzbU7z8tZmqtbE9kGflntNFpLmFMLX5GBaO0pcwhN
 UM3VUC9db9ND1hxan44qMVPgF8KFhRQNYWw6gBFTMUkglkLvXtCnpZce2WYPpO1M1FIN
 QLbsABIoyo5drrjtBd4WfNS6BFFH4KwwhaUx4p7phlnbsuAJQmf8TPHOIn3i38B1QeAk
 WvIDSPKIEYSbLQDxtP9iQpYrtrJPM8txve6ndo+WKxLrC0/guCeFPnllw3Vwt6u9mvn/
 NJ30xu1OQ20+VX8lumR5Z1zINHGLtRPPO+CNcJcw64NDgUw/AfyvVnfg59HfAUZagx2n
 Tckw==
X-Gm-Message-State: AJIora8nf2ZIRCEjOA1o1X4GgFmlZXUZVBlfVjJV0KhuP9OhzCQnaB2M
 mI3IiDAVeE7Rb/E1S0V0nQ==
X-Google-Smtp-Source: AGRyM1t8UAFZ8KvRZgdmKJs3inUJsWWFU2EOvJWTvEAzbRMCp3mflj/YEPUf5RMcFwd/OoeWWKYJnw==
X-Received: by 2002:a05:6638:4513:b0:33f:680f:255 with SMTP id
 bs19-20020a056638451300b0033f680f0255mr15286746jab.232.1658167096857; 
 Mon, 18 Jul 2022 10:58:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f67-20020a0284c9000000b0033f22c2e5b3sm5750567jai.98.2022.07.18.10.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:58:16 -0700 (PDT)
Received: (nullmailer pid 3252001 invoked by uid 1000);
 Mon, 18 Jul 2022 17:58:15 -0000
Date: Mon, 18 Jul 2022 11:58:15 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 09/11] dt-bindings: display/msm: move
 qcom,msm8998-mdss schema to mdss.yaml
Message-ID: <20220718175815.GA3251937-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-10-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:38 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,msm8998-mdss from dpu-msm8998.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 142 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
>  2 files changed, 64 insertions(+), 102 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
