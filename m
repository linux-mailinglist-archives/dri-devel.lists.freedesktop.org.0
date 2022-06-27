Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADA55BB4A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 19:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F6E112A66;
	Mon, 27 Jun 2022 17:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB7B112A4B;
 Mon, 27 Jun 2022 17:17:58 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id l24so10213074ion.13;
 Mon, 27 Jun 2022 10:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kaxFnNRB8GMdQ+miLrcwnlUrNBhYoVcXqeLxcTf0qVw=;
 b=UT9Tt08dJx8hdNwjWIs3bjmzdn10K0PRhMv+xDy/mfQ2cm/DQXsbcj7Q49gGgbzhCX
 mb2pm980LHkTs3bW/beDIdBFsZVQ0IKnDD5rvz/ckGAqiWLfAZZAA/slAs7UttJhLVPd
 5vGE0fNgHvXXbeuA7/MCyZqE/Ymtp/YNfxTh6d1hQfAsq0HGtgqAWOVLDBLWFkNG48do
 uJ4oasNMAdcIoV3D/pQwE5uEfvyakDQFh1jGz9zXH+xLY5NnBeRAU/tG+j5ET+L73wpc
 mIhG0NlVOlzuzSUE5oACQEnONEke4D/OAJqImyg+gxdzc5fA6Gp1hHhxF6g52l2ET0aQ
 Oreg==
X-Gm-Message-State: AJIora+LPAn2f2SK5p96pF1iNS5G5s8m/+PQVQGAx3l+xdRLs5t6RsIH
 c1SFGEigsYeTzhCOpAnDn1F44DYo0A==
X-Google-Smtp-Source: AGRyM1tsXTH75Mc66rG1PrT/Fid3kLPfbtvG3eWXiFBELiDbgFfLZQ3J7nT/9SjPJIebJNZsFsq4xQ==
X-Received: by 2002:a05:6638:2684:b0:33b:afc4:298d with SMTP id
 o4-20020a056638268400b0033bafc4298dmr8613041jat.49.1656350277868; 
 Mon, 27 Jun 2022 10:17:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a6bd612000000b00674fe816f79sm5372452ioa.7.2022.06.27.10.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 10:17:57 -0700 (PDT)
Received: (nullmailer pid 2612764 invoked by uid 1000);
 Mon, 27 Jun 2022 17:17:56 -0000
Date: Mon, 27 Jun 2022 11:17:56 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
Message-ID: <20220627171756.GA2610798-robh@kernel.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
 <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620010300.1532713-2-dmitry.baryshkov@linaro.org>
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 04:02:58AM +0300, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required. Also add the XO clock to the list of the clocks used
> by the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Doesn't apply, so no checks ran.

> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index eea2e02678ed..41e6492d4a0f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -28,12 +28,14 @@ properties:
>        - const: hdmi_phy
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
>      items:
>        - const: iface
>        - const: ref
> +      - const: xo

minItems: 2

>  
>    power-domains:
>      maxItems: 1
> @@ -44,6 +46,9 @@ properties:
>    vddio-supply:
>      description: phandle to VDD I/O supply regulator
>  
> +  '#clock-cells':
> +    const: 0
> +
>    '#phy-cells':
>      const: 0
>  
> @@ -75,9 +80,12 @@ examples:
>                    "hdmi_phy";
>  
>        clocks = <&mmcc 116>,
> -               <&gcc 214>;
> +               <&gcc 214>,
> +               <&xo_board>;
>        clock-names = "iface",
> -                    "ref";
> +                    "ref",
> +                    "xo";
> +      #clock-cells = <0>;
>        #phy-cells = <0>;
>  
>        vddio-supply = <&vreg_l12a_1p8>;
> -- 
> 2.35.1
> 
> 
