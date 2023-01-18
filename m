Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A46711F3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5930610E65B;
	Wed, 18 Jan 2023 03:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ADD10E1C4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:29:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x36so13214624ede.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f22eo9eS2+umBBEiAmmR4UxB2/bNY49apLHEf3F7vXc=;
 b=bxz7gGBCOtkpE6PEgY9c2/2u8h8M3a7aLEjc5LhLn5eyJp6w4wCeXiQM/uXGZY/UO3
 CDsErP/BD/Cy7SfRFb/jnRPM6IF9SHMJ3ir7SquTwOAh9xnAueuK+nO5STyJc9WT6/5w
 OZGLPcwtpSHtrG7kELSY7HUqN2Lknhlr9/E7oI0MQr5dGJu+/eVOgNxPbZ6JqFU+HGRr
 xEc40Wn3t+Bcg6sB9R+HdR9PbJ5hOMwbmZS2ReLXHv5rEd7yI3EARt1PqrlwS2W1+MEy
 /oxYpLE12LVrrpMouKfRAseBZ5enKqV82GRBtkK1DR4kqNd8l8V+JYqJszDeJRh3kCwM
 CPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f22eo9eS2+umBBEiAmmR4UxB2/bNY49apLHEf3F7vXc=;
 b=7G2eLRYy83wbR4MNb86C82OvTH6l+OwuNE43jzqlYk2bdmpxKSE2GjC2TzMJPzN1KN
 2bxYNtC1VwjDpx72Gb5ws3O9Q/TXPmTriyWMsQYeetZo/R6QUxab7roIbfCPSzIoMCfg
 VYOSnDp6l1QIY4LXFrMFVilJHflmehKe6rDBmxo+0gCADqO9lGJPqkFMx7kCyR8C1EJr
 nh45voAgeUxet2zg2NMRJ+2byZHWf8jdPBvFU6wJuzKr3jjOWYXykiuX85WCx6gb/3Gg
 3ff4Vg4iXO2FbzzhV8q7EPHmfB0cmZ2802ebwHBh1I3mFHNjSwgd7Wul3wy3OjM83wqs
 udkQ==
X-Gm-Message-State: AFqh2kpEpGq6n+Y8IZlQGfSRSifNMkmPi2ypEinTWgxq4PXC8s7sKpn7
 ujoxXggZvYSXAXaCyU4XF/YnvA==
X-Google-Smtp-Source: AMrXdXsFAiMSEeE2jv/0i2yE7K7wg58Ad8xfQq+oTG9hEPm/VYsjsbejv1CDlAxupFCZjj7Oh8L0Tw==
X-Received: by 2002:aa7:dd48:0:b0:497:233d:3ef7 with SMTP id
 o8-20020aa7dd48000000b00497233d3ef7mr5387954edw.7.1674012558961; 
 Tue, 17 Jan 2023 19:29:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 et14-20020a056402378e00b00497d8613532sm12782557edb.5.2023.01.17.19.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 19:29:18 -0800 (PST)
Message-ID: <7bfd7a4b-95fd-0e95-70a9-7287ddbd3a8c@linaro.org>
Date: Wed, 18 Jan 2023 05:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 1/3] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
 <20230116225217.1056258-2-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230116225217.1056258-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 00:52, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8953-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,msm8998-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8150-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> - qcom,sm8350-dsi-ctrl
> - qcom,sm8450-dsi-ctrl
> - qcom,sm8550-dsi-ctrl
> - qcom,qcm2290-dsi-ctrl
> 
> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
> do so.
> 
> Several MDSS yaml files exist which document the dsi sub-node.
> For each existing SoC MDSS yaml, provide the right dsi compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../display/msm/dsi-controller-main.yaml      | 30 ++++++++++++++++---
>   .../bindings/display/msm/qcom,mdss.yaml       |  3 +-
>   .../display/msm/qcom,msm8998-mdss.yaml        |  8 +++--
>   .../display/msm/qcom,sc7180-mdss.yaml         |  6 ++--
>   .../display/msm/qcom,sc7280-mdss.yaml         |  6 ++--
>   .../display/msm/qcom,sdm845-mdss.yaml         |  8 +++--
>   .../display/msm/qcom,sm8150-mdss.yaml         |  8 +++--
>   .../display/msm/qcom,sm8250-mdss.yaml         |  8 +++--
>   .../display/msm/qcom,sm8350-mdss.yaml         |  6 ++--
>   .../display/msm/qcom,sm8450-mdss.yaml         |  4 ++-
>   10 files changed, 63 insertions(+), 24 deletions(-)

[skipped]


> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> index c268e0b662cf9..599a6bad80f43 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
> @@ -46,7 +46,9 @@ patternProperties:
>       type: object
>       properties:
>         compatible:
> -        const: qcom,mdss-dsi-ctrl
> +        items:
> +          - const: qcom,sm8450-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl
>   
>     "^phy@[0-9a-f]+$":
>       type: object

The example also should be updated in this file to include 
qcom,sm8450-dsi-ctrl for DSI nodes

-- 
With best wishes
Dmitry

