Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF064367F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0E210E2AF;
	Mon,  5 Dec 2022 21:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E515C10E29C;
 Mon,  5 Dec 2022 21:08:59 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 s9-20020a05683004c900b0066e7414466bso8060753otd.12; 
 Mon, 05 Dec 2022 13:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXjFpm/+C4nfs0zFQWp+HDIv2IGjyOfEFa6fb6gGpMw=;
 b=Ea19uYrzOD+zWWPV8x0hzMm1VIJ+dDOweJYqdzdakNqqF7vrHa7ATVVBEGYYzJ1kE6
 sRhDXbWo9K03+gv2lc7QkfrfttH/MtvtVoHml42tjsGcK+GYmPmWwWWDr/JBnvVyc0IU
 XFC876npoYfHEN7AG9ht+L/Veb6ocbnhEjdnVgkpy1VaD1MZLX0Hilse00uwRosVhJ/b
 FED34jd7U1Plcp+VKcmmiYVZz6VtTs63nqFIG21CZzuWpjy7p0uY1lHIC6Mlb21JCokS
 OuwBXnSMDdmKqJmP0NktLMhgHp/pHDaQicr1cswMDQRFMIjts8QdsZN4/gJsE4KcSQ0x
 h5yw==
X-Gm-Message-State: ANoB5pmhBP0RQok3RWhROdTytmSyHzZ7Nx7YoUz5ANk5LaERzz8H1/jp
 HAysLmwjdDIv109woZ2k8A==
X-Google-Smtp-Source: AA0mqf4pi2xM26IK4lkpivLEq04ATV1U/s3nJb8ELurAsyYe6CVsyow1euCYO7OR3rTAz0hPf4OzCw==
X-Received: by 2002:a9d:69:0:b0:66e:976:193f with SMTP id
 96-20020a9d0069000000b0066e0976193fmr31490146ota.214.1670274539009; 
 Mon, 05 Dec 2022 13:08:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b00660e833baddsm8206891otq.29.2022.12.05.13.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 13:08:58 -0800 (PST)
Received: (nullmailer pid 2625205 invoked by uid 1000);
 Mon, 05 Dec 2022 21:08:57 -0000
Date: Mon, 5 Dec 2022 15:08:57 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: display/msm: Add binding for
 SC8280XP MDSS
Message-ID: <167027453696.2625145.2281674467563645839.robh@kernel.org>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-2-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205174433.16847-2-quic_bjorande@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 05 Dec 2022 09:44:21 -0800, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add binding for the display subsystem and display processing unit in the
> Qualcomm SC8280XP platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v3:
> - Reworked on top of redesigned common yaml.
> 
>  .../display/msm/qcom,sc8280xp-dpu.yaml        | 122 +++++++++++++++
>  .../display/msm/qcom,sc8280xp-mdss.yaml       | 143 ++++++++++++++++++
>  2 files changed, 265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
