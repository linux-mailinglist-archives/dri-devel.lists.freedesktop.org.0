Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3E5EFE0D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 21:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8094910EC76;
	Thu, 29 Sep 2022 19:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1402210EC75;
 Thu, 29 Sep 2022 19:36:09 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id c81so2654417oif.3;
 Thu, 29 Sep 2022 12:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=R6Fx1GZLpV1QRnBBMILVQk0FCMQZPR9gcz/0eV1V+30=;
 b=HiXzuuteB7X9U6RrSbfTvg8o9OsMphepGxJsHde+FWs+saIQyNkUkIIaLkPQWwzSCW
 V5IPmEB/jTPIpuY4IJjITCLytFNKwjtB9OFXItMhdmfPGQ0DktOQ+vSDOZ+JfJlw0OYp
 4GzNC8P5+Ff9q1XOraTmMbZHEpPy04qjampOYjwoU3tuZQNdrJ/32zMG8hRZTdpl0wx1
 4SMMLG6QY+MPW58yv429EnFtn7UL1PO5003yDDYq1lt26/RDU59Fg6j2j1BgVuHVkbEx
 emR2wAZWgnGXgWcPSV+Xw5GKACPEU9BwSid+1NBuoqUJM2AkUO6npoSdRUmkyHbsKawD
 smfg==
X-Gm-Message-State: ACrzQf3FrBPONkt65lwuLdYL6Lit8PPJDlWj+9lmNC+Q+4fEsC3u3gne
 6VupBTlfRuh2lUu1HTVkfg==
X-Google-Smtp-Source: AMsMyM7wumYHj5Di5UZXrYcudyqXxaGDmcrSg4h9U5d0fxPE1xPAm3edqGlszMTz+y14KJ3XhsIh1Q==
X-Received: by 2002:a05:6808:285:b0:34f:b12b:565e with SMTP id
 z5-20020a056808028500b0034fb12b565emr7911683oic.24.1664480167952; 
 Thu, 29 Sep 2022 12:36:07 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056870e74f00b0011f00b027bdsm146159oak.45.2022.09.29.12.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 12:36:07 -0700 (PDT)
Received: (nullmailer pid 2619055 invoked by uid 1000);
 Thu, 29 Sep 2022 19:36:06 -0000
Date: Thu, 29 Sep 2022 14:36:06 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <166448016545.2618978.3839528347670225478.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:03 +0300, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-common.yaml      | 52 +++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 44 +---------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 39 +-------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 43 +--------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 44 +---------------
>  6 files changed, 62 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
