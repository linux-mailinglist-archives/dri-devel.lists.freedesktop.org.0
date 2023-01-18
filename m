Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A54671126
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933310E643;
	Wed, 18 Jan 2023 02:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0979210E643
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:28:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bk15so22401216ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1TSyUdp4Jkds0cmJxddHX9zPn7SkqnsbQ6bC5wfOng=;
 b=xrw2W7Kly2r6bTGksOwrn1vGjQhSuUBsKiTJSqeOXP50hfepW3Ib90dJRMoxtoyPlm
 AdXZTdJibjsouWzBqXAq18GApiGJIojYiO3/5EtWvl8dpD3Fcwtt0PCkWsJhxNWkCbEr
 IDcmicMVj8UXh0AP8OvrXnmvrbGmIIHvolBIa4+ZUbLbCbX+Uyrc6ruC7LmwlHOlYzaZ
 ZJsIwQbUdmKAkjmyAKCEGHuEhlyMkGfCAWNZKliRzO1KFcENgngfEcZHgkhyY4Y/RUsV
 gvuCmFox8WT8y8Fl/+vuIWqbPZ/OmKziGyD9rDYN9VBFPaeze/KRdTeghnVTSLgQGQac
 4sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1TSyUdp4Jkds0cmJxddHX9zPn7SkqnsbQ6bC5wfOng=;
 b=UoWOBIaPbkp1w+8qojgsWlbaA8sK4uBcNfIS4OTpOs7GWay/MqE6k1daYWA89DCEcS
 /PAYgiSMhz48dsXXGdCd8kw0SVzIkfmY72zSHKTqjeRo1I21zyChV2MA56S8gKzkynT6
 MG5JR2CqVSfPHiBkH5K9KsRbt4medE9eOhhiRKMX4BP4XYdH27jNUWx5/wO8qtY+cAWo
 V1ByhDfpZUtI5r8JRJn5WL8rj60N3AsLKyL+UOCu/0z+TyXv4qzFtA2zwXCLOzN/03ZR
 VGoj/8KHcS2mAcSXdQmp7mSYAIYr86PXty7X+1QdPx7v2e0mAvP7lE/4eNJTKIIfDW7V
 zhag==
X-Gm-Message-State: AFqh2kqVvikCZKZfnu4DmuG5D9Fzi5Iqxkem3z9xllEhz9R0f3bpXLgS
 blsmWKYVr+7g1GQZfhnrRX8idw==
X-Google-Smtp-Source: AMrXdXvDc9I51HhY1IunUYtmSRVaUY3aNhtaCa9ZwYi9f/vzw6oGFSF1qdOoHWyFp2t2cE5Y+P1n2A==
X-Received: by 2002:a17:907:ca85:b0:7c1:1e5a:ed10 with SMTP id
 ul5-20020a170907ca8500b007c11e5aed10mr5648255ejc.8.1674008904506; 
 Tue, 17 Jan 2023 18:28:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 fy5-20020a170906b7c500b0084d3bf4498csm12550657ejb.140.2023.01.17.18.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 18:28:24 -0800 (PST)
Message-ID: <2ec13e85-6640-df02-3069-9e2e67fb0e79@linaro.org>
Date: Wed, 18 Jan 2023 04:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 04/11] dt-bindings: display/msm: rename mdss nodes to
 display-subsystem
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
 <167362341911.2212079.15291287366051593468.robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <167362341911.2212079.15291287366051593468.robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2023 17:26, Rob Herring wrote:
> 
> On Fri, 13 Jan 2023 10:37:13 +0200, Dmitry Baryshkov wrote:
>> Follow the 'generic names' rule and rename mdss nodes to
>> display-subsystem.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>>   .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

This should be fixed already by the commit e5266ca38294 ("dt-bindings: 
display: msm: Rename mdss node name in example")

See https://gitlab.freedesktop.org/drm/msm/-/commit/e5266ca38294

-- 
With best wishes
Dmitry

