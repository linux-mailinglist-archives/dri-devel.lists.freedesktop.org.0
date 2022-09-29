Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487775EFE6A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C62810ECB6;
	Thu, 29 Sep 2022 20:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDA510ECB6;
 Thu, 29 Sep 2022 20:08:32 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id m81so2743853oia.1;
 Thu, 29 Sep 2022 13:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=FeAK8O6bqdJ+JMd0u2xwGexvPcIhwzOT6tPtlE/f2/U=;
 b=P9MTyqPBai65IlVn0VmUvSLxMlMPoH3pWRvPbN9nK/ol2xyISUW737EVzZrnM83Xhu
 7xgzMgod7ROo5RKBpTpj5Kby1EvEg/Qn0paY7uzrExnKfYMCT2HpOaNjPFsgA0WbYQ23
 f7a5qyd8x/QKe0RcubwREyElBPabIe0Dx+y8inV6VJwJxEPcJlEY3OgDbGUIlWrDIucB
 Tq+zrxVl96hYWi6veLyxDwfsqOJji14VFlVF3xfl8+bReLJ3JMsCRTTyK0dT5srvQHhS
 nZ5Na7MOPWP0jTzMjeQWFhR3JMzuJc+kHUkRICiHFg6H68mOBqXY3V1DFs0ZeVtIxOGJ
 NQ5Q==
X-Gm-Message-State: ACrzQf0sgCnZD0h/uhm3yJ8SRZYoWTR5bsmcwREvqW5/5kz6vvz1ftzC
 Trfy3tKDQkpzHkGaS1UIKA==
X-Google-Smtp-Source: AMsMyM4pqWlOVyn2dmYyt9u3BqiuXJDjqF7bZ/S33RxWu6sAhGTxYOlQiMwkEGNVxwXxxCi5jae26g==
X-Received: by 2002:a05:6808:ec8:b0:34d:9031:1043 with SMTP id
 q8-20020a0568080ec800b0034d90311043mr7674399oiv.212.1664482110186; 
 Thu, 29 Sep 2022 13:08:30 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j8-20020a4adf48000000b00475dc6c6f31sm85439oou.45.2022.09.29.13.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:08:29 -0700 (PDT)
Received: (nullmailer pid 2657443 invoked by uid 1000);
 Thu, 29 Sep 2022 20:08:28 -0000
Date: Thu, 29 Sep 2022 15:08:28 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 11/12] dt-bindings: display/msm: add missing device
 nodes to mdss-* schemas
Message-ID: <166448210790.2657381.13173905656918205784.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-12-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:10 +0300, Dmitry Baryshkov wrote:
> Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
> schemas.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/qcom,msm8998-mdss.yaml        | 153 +++++++++
>  .../display/msm/qcom,qcm2290-mdss.yaml        |  81 +++++
>  .../display/msm/qcom,sc7180-mdss.yaml         | 179 +++++++++++
>  .../display/msm/qcom,sc7280-mdss.yaml         | 292 ++++++++++++++++++
>  .../display/msm/qcom,sdm845-mdss.yaml         | 153 +++++++++
>  5 files changed, 858 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
