Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 171015B0DA4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA5D10E867;
	Wed,  7 Sep 2022 20:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B2810E868;
 Wed,  7 Sep 2022 20:00:09 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1278a61bd57so20195580fac.7; 
 Wed, 07 Sep 2022 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Ezjz3pR0ZD7JxS32x6H4PWVYd4DbErGzq0myuVFhl7k=;
 b=4Flc37EN2dgzeS0e/kIVEoz74djBk+uqpkKdr6QKcSYYjhkweSFX/eOKqyMS6gsnQr
 ka5mG+Vwdr525FRrOH9XV4L0VLK+mtKpbvPZ8LjafTbIvFfbYckE2Cpc1zauDKwHmj7Y
 g6O8zvGlCRQXBDNrU8KNygy/Z3wAMio/4u8ydpU6SN9dfqjv/qFyFDd7VjgQpF8+HSVq
 +tAp62eMIAAfIePoSdgUF9WNhgIjmHIel3ENZWENqEDdGhfdLyDKClxgDDV96+WvqLgK
 hHdLNHigWxZEqdYGiwnjC4pmyXED+hAQSMedywDCOAdELT+il/16QWgWe44Q/oeSZpZ1
 E+Pg==
X-Gm-Message-State: ACgBeo2+OjkfqXED7SQAorqwXr9H0DdT8bKSC5Zr6dhAcDHn3hz5PoSu
 SWYgxS/TnQ9A+0m57n72bw==
X-Google-Smtp-Source: AA6agR6mtZOVx+jt1TqJIGzVJ9zUjh/ebkpMh6FfEDDo2YrBSHibeAEp46mZ6ufVap+F8l2EmOwnIw==
X-Received: by 2002:aca:2810:0:b0:344:e898:35aa with SMTP id
 16-20020aca2810000000b00344e89835aamr44380oix.279.1662580808956; 
 Wed, 07 Sep 2022 13:00:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o84-20020acaf057000000b0034484c532c7sm6821240oih.32.2022.09.07.13.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 13:00:08 -0700 (PDT)
Received: (nullmailer pid 113022 invoked by uid 1000);
 Wed, 07 Sep 2022 20:00:07 -0000
Date: Wed, 7 Sep 2022 15:00:07 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Message-ID: <20220907200007.GB98468-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-5-dmitry.baryshkov@linaro.org>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 01:23:04PM +0300, Dmitry Baryshkov wrote:
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
>  .../bindings/display/msm/dpu-common.yaml      | 44 ++++++++++++++++++
>  .../bindings/display/msm/dpu-msm8998.yaml     | 46 ++-----------------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 41 ++---------------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 45 ++----------------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 46 ++-----------------
>  6 files changed, 64 insertions(+), 203 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> new file mode 100644
> index 000000000000..bf5764e9932b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -0,0 +1,44 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dpu-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DPU dt properties (common properties)

Qualcomm Display DPU common properties
