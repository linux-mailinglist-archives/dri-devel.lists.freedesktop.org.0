Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BA5EFE47
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3A810EC8F;
	Thu, 29 Sep 2022 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D68810EC88;
 Thu, 29 Sep 2022 20:03:48 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id w13so2710219oiw.8;
 Thu, 29 Sep 2022 13:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=JirSIK3cnM81kdhd4iuCrHBGYWBMiXarjyhxxJXgyFE=;
 b=G3I268fGjDG6FFt9p2DWySBmdi37EYgV8brApFpP8E4GGx9HN4Ju67goQxSpDMEuDX
 PTl9pjzG5wqVdpr2pTPyNuFBCPPA8FTAmFUERRWeJE0rAUE8nBKF5BjXArNB+yweJepj
 Yscy0Cjp8ZcAPTHG+DbvEnXAIZT15BBP1OZPqsq0TiaXpJYR5Ble6OMXTnjNAx6qT1EZ
 qgj/jv20XonPCfOVKqph/+ePUZlalXE0IuJvdvntbvEzRwhHAGeU4qjQrWiF5sTG0irw
 su0eWDbFtUwGQFM6JA/wbmdRoTWOslZvAzqWAe20aVlW4AJtOZcTba3jcvEy3xysHYok
 QvWQ==
X-Gm-Message-State: ACrzQf0/ZsCtxvmdSFv6QbwqsHJ8GEwYngCInX9nFZg0tO7701p4TJNb
 H2H3Q47fhSwj66O8S1pfZg==
X-Google-Smtp-Source: AMsMyM6Rhfu+Dl+uHmwLPrEXwtu853A135Qmf3eg0wxxhT6qjZb3t8ym5JhBC1/s5igGju1hXiNT0w==
X-Received: by 2002:a05:6808:188f:b0:34f:e3da:49d0 with SMTP id
 bi15-20020a056808188f00b0034fe3da49d0mr7888497oib.162.1664481827358; 
 Thu, 29 Sep 2022 13:03:47 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y18-20020a4ae712000000b00475db5c28f9sm98050oou.10.2022.09.29.13.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:03:47 -0700 (PDT)
Received: (nullmailer pid 2649869 invoked by uid 1000);
 Thu, 29 Sep 2022 20:03:45 -0000
Date: Thu, 29 Sep 2022 15:03:45 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
Message-ID: <166448182507.2649595.5777318884355818199.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-7-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:05 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-sc7180 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7180.yaml      | 158 ------------------
>  .../bindings/display/msm/qcom,sc7180-dpu.yaml |  95 +++++++++++
>  .../display/msm/qcom,sc7180-mdss.yaml         | 125 ++++++++++++++
>  3 files changed, 220 insertions(+), 158 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
