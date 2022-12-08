Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B564799D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 00:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8FD10E4DB;
	Thu,  8 Dec 2022 23:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA34C10E205
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 23:15:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p8so4355373lfu.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 15:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7MLWqHmXw3e31A19JR59i7HY0RQ5DxjozWj3XhLsrl8=;
 b=Rc9ZeeWN3T4pFCyd8oR4JeEfHi+caKb82imwtttTViOt1NE7dQHgPsOR4BDnEG1D1z
 d7IdDrM1gTVuriCshf4VteM1/hJT7noha6pzIQpo+GlqTL6mQ6hDAH35HG2JnKLGO/NG
 egVsBGp9vQxb4M1hFQrvO1KnwFJ1RvfGLNuy4Dgjs4yTvbFRNMzLbmn0n5eCDrkuSkbj
 yRS1YO+3VOYgveiUHmHKV+5qx/TB+iXO3hQd0WjCLGMAUVnS9aChTMyCTE5Rvb1kRHdP
 EUNEM0cecqrdbNhxVx8xkMP6i0U1uLAv6peoDl9dG4P7KVkgIvEE52FBGUHloHPQ6al8
 yYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7MLWqHmXw3e31A19JR59i7HY0RQ5DxjozWj3XhLsrl8=;
 b=rNBtMrs9GIVahGrJhpwoYIhQUOZMc9b/uO+FoGOkRQWhgsrxhXnKPij5hpoW+z22ih
 JONvHO/JPbPc6s0TMBOiTPniendaypeaUe0B32t+xohoJbrZwMERjCfQ4f+Q3Min7NtZ
 VN0/gEUO9LZl5f72zyo1licbUzsFbnLzxD0rKGnF3g1N86dak7smagxXZtp0r13uSp89
 TK+U+RnzlKRws2pobdRt47VHuwF3CZMpHQoapRE5V0eVmQGPaiCJRStmsRmZ1htma9st
 gRWlReoUCy4AkwDeoaHlmkFse6Wznw6Gx/28G6CGuiQvTFgMPnzkDmoozNnfCXjLajG3
 S2Dw==
X-Gm-Message-State: ANoB5plXVV5v4+DSRriaYhWmTh7VygaNw5HRLTKMaWT5/ZjJFvlW0AP3
 JKIY5m025qINgWO52qajp4WfAg==
X-Google-Smtp-Source: AA0mqf6siW3890I1w3DufKwd9C/HMgXgs7NHanLd8th0sy7Rd98xbdw8OKUW1b7TN1BAj2kJyozw7w==
X-Received: by 2002:a05:6512:e96:b0:4b5:1bbd:3a64 with SMTP id
 bi22-20020a0565120e9600b004b51bbd3a64mr1192539lfb.21.1670541304622; 
 Thu, 08 Dec 2022 15:15:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n10-20020ac2490a000000b004b58d457f2dsm1123994lfi.61.2022.12.08.15.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 15:15:04 -0800 (PST)
Message-ID: <40327ddc-dc6e-e803-acb0-310aad63515e@linaro.org>
Date: Fri, 9 Dec 2022 01:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 04/12] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-5-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221207220012.16529-5-quic_bjorande@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2022 00:00, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes since v4:
> - None
> 
>   .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af8256f..a1dc3a13e1cf 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,6 +21,9 @@ properties:
>         - qcom,sc7280-edp
>         - qcom,sc8180x-dp
>         - qcom,sc8180x-edp
> +      - qcom,sc8280xp-dp
> +      - qcom,sc8280xp-edp

This also should be added to the eDP conditional, to allow the aux-bus 
child node (and disallow #sound-dai-cells).

> +      - qcom,sdm845-dp
>         - qcom,sm8350-dp
>   
>     reg:

-- 
With best wishes
Dmitry

