Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056AE6ADA0C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 10:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24F710E3B4;
	Tue,  7 Mar 2023 09:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D022710E3B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 09:17:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x3so49432037edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 01:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678180626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WFABy9U7esu++afwwpsJQiDnIZRoaCQ7T2FtObsP3io=;
 b=M9FcPcGCviYeDHBK3iUL8M9xZII/LkzvDQWrPLfi7uuNQkf6x6Y6ofBP4fGdNCgIA4
 ikkicI1LPvFBXsllIRa7ewtEZjZHtv/phVduUl7oBPegVP4QP1UJQgLjd7/QOsICnUMF
 qq1Vnj01oNURFjKZaZN+nNaVgTBiYhdJEgmiVG/dT6Jk6zlhFXUmwfEdeDHz1K+QKk7v
 Qr7QC231FBTwCgiD133Z8YTy/8aV7sAsPbj3sTUIg016uV1cE93r2Quaw1C2jJuHyNPJ
 /rx4HimNxva0J6WSHtlGJDY+5q7LDNPVCiJdljNmbg8n1dMoKMg/C3MRZrtELDYFvw3a
 awPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678180626;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WFABy9U7esu++afwwpsJQiDnIZRoaCQ7T2FtObsP3io=;
 b=oIeduLRKUQnZAsDS5LvElqifogaFoMiyLVzoJkLC4+N9eBBvOJfXiaQZh9EN60HgUP
 Co+OBe7U7Ds786U25N+lsnQ1hq5ifpu2wv3ddWc7tdB0JtjejNFTP5T6V9fTi/hIXrB/
 6SOzOcap1Gpw2O6itdjEIY2CPUQeMwpNOuy5M44Cw1lSuicJu0q9LEhF/o+3UhELlSqA
 ucw3gx9+kQOYFH6pytXi1gL5RRz/e2+/K3mxky9s8bYBhMAXKM2Qv1dWd68mPIurnKO9
 dWrtQbGUEVBE9RwsyA5v4Ly988JG01stNq4AlohMGFDe18jsNFDoV+1C+pXhNGPN87px
 U3lg==
X-Gm-Message-State: AO0yUKV8GPV9d+EuAPYfMoG3QrgiH6BBBHktP8OiIm34fEPSANRSor7j
 7ryuSPYpBvd58aB1bmNSyZDHFA==
X-Google-Smtp-Source: AK7set+C7U+DtyopUxx2vW7YdSkRAjedWzNsOMtGriAwgL9ZCFn9LzJVtn+nGFhe7mYGjehkdPQYCA==
X-Received: by 2002:aa7:d78b:0:b0:4ac:c029:ea72 with SMTP id
 s11-20020aa7d78b000000b004acc029ea72mr12779040edq.36.1678180626355; 
 Tue, 07 Mar 2023 01:17:06 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3?
 ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
 by smtp.gmail.com with ESMTPSA id
 s30-20020a508d1e000000b004c5d1a15bd5sm2350448eds.69.2023.03.07.01.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 01:17:05 -0800 (PST)
Message-ID: <bcb5c17f-da78-9d68-66eb-b620ee583602@linaro.org>
Date: Tue, 7 Mar 2023 10:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 8/9] dt-bindings: display/msm: dsi-controller-main: Add
 SM6115
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-9-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213121012.1768296-9-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:10, Konrad Dybcio wrote:
> Add a compatible for the DSI on SM6115.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 2494817c1bd6..f195530ae964 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -25,6 +25,7 @@ properties:
>                - qcom,sc7280-dsi-ctrl
>                - qcom,sdm660-dsi-ctrl
>                - qcom,sdm845-dsi-ctrl
> +              - qcom,sm6115-dsi-ctrl

This looks incomplete. You also need to add it to MDSS binding.

Best regards,
Krzysztof

