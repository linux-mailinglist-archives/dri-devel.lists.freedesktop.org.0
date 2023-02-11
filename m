Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7A69327A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 17:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABC710E16A;
	Sat, 11 Feb 2023 16:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D22310E149
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 16:33:46 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a10so7854708edu.9
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kx45aI5MoVIFzyTEpOI8RmqbIW54Ij/B0GNnIHLTWaw=;
 b=kAaF12q22GV2jAoFjuxVc17Gxngk9KuA+fuJLgUig0gx6gaMam6BGZ/y+YEyJXVsZ7
 3JjwpZ6rWvQHNyYKtwu1jqja7at/grXLDb94AnRpQxkNV4zcvtv+CbxBulm7HOkYq8Q0
 jotvUZMyTdSNuNfEXcpGguJl4hskq0IW6OwIZ5y0z3W9kuLXOAvomteqlY7ktbFJIdj+
 hdsW08RswAcprTxFBlw9o8EH348n7jr6kdzlGCRUEdEPjn+An593IInWDdamVa4NWHSY
 P6UNYgQOQhIVZ1VSlpALVF375IDml2rWhP8jdbH1Wk43wMHcNjYG6dgNYLIM8XTTVm83
 CwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kx45aI5MoVIFzyTEpOI8RmqbIW54Ij/B0GNnIHLTWaw=;
 b=Xv1HruSR/DhZME78/liIsN+ZJEp2b0sgLiwpEScwzivDJCd7iHmW+9vEdFqfMzTs2r
 pIjeiIlnhZvxnh19kB0VFguzllqQqpMVKo6LPr6ATgs2CFAmxD5Rqv8SpG24znXPQyCa
 QgfHvo1sJ2PVno4pwyVRJi7OAU3QS4jJJI+pOvUvjhffqYo9G6N58ol+4crfnoq25S4z
 sSJXgUcpz8n3CqTIzJo12hAoAyNST3TAgTZe9+ZPwqNxHX+TxEAVBnazLqKS+le04z7x
 NpfWMxjxS1HYAafIo7dsp7bE0p+p2acWUP2rRlSuW31GsQRkIFxn6G6yCj2irpP+Zlka
 AGUQ==
X-Gm-Message-State: AO0yUKXjsCwy7nd9kbPC40Nrkr/lfUsxfGKfW7R+NtGGbxwYmsHYp5Ju
 3wCG+A4ZjfaIsI0/uQeE/ly+4g==
X-Google-Smtp-Source: AK7set8IQyTpkJ45KUL+RTTH5sucoHYIkehu7H0vxwYZf81qJBhyEoHmznfYTYPaQr9hV4vDMxGgFA==
X-Received: by 2002:a05:6402:268a:b0:4a3:43c1:843f with SMTP id
 w10-20020a056402268a00b004a343c1843fmr2391061edd.19.1676133224840; 
 Sat, 11 Feb 2023 08:33:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090666c700b0088e5f3e1faesm4041134ejp.36.2023.02.11.08.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 08:33:44 -0800 (PST)
Message-ID: <869e0a8e-f960-afe3-2048-d0a2f2b59588@linaro.org>
Date: Sat, 11 Feb 2023 18:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/10] dt-bindings: display/msm: Add SM6350 DPU & MDSS
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211122656.1479141-4-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2023 14:26, Konrad Dybcio wrote:
> Document 6350 DPU and MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../bindings/display/msm/qcom,sm6350-dpu.yaml |  94 ++++++++
>   .../display/msm/qcom,sm6350-mdss.yaml         | 213 ++++++++++++++++++
>   2 files changed, 307 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml


Could you please split mdss to a separate patch?

-- 
With best wishes
Dmitry

