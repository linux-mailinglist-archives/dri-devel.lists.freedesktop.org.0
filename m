Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07C73E185
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 16:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DF210E20B;
	Mon, 26 Jun 2023 14:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBAD10E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 14:04:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso19586841fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687788272; x=1690380272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wyIEHWHQ/LcvFyprRxFC+Na0w05IbCRKTBTbUS5cgdA=;
 b=WrUvnmCzy00urIpPmpCzBuKn8wT0tNNC0Wvh8x2Hzr/jbBkLeZGDoUteOMHOBFsEEY
 WoPRB0G/A6/yyXEiFRPlmcWraG49HRyjcV8/EBzHdiTYK56VLk7u1kEfLdxvH8qDXJSh
 I8dbmVCYnd94fxo/J65iv6vyR2bH/EYT8qSC0DRPY4D5jLf6QLfkW59Cb7by6aaSuZxm
 NhzdyHUz0tKyGRIwNit5zGQG6ZpIiQJ8jyTCnRzP1tFP5MVQzSoegV74zffZPfyQ24y1
 nP5pt7iHRUmuMqk2td+hy+rZLyhFJ08iiX5HZ7WorozJbCVkmk0hcbbBY9t4rfbnYsVD
 Fxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687788272; x=1690380272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyIEHWHQ/LcvFyprRxFC+Na0w05IbCRKTBTbUS5cgdA=;
 b=Ubsc4924efta4nUIqdl5Z4NONYYxL3XeNN/9EBkGXP1P+NTGDgVfFXIqFosqqwHOxx
 8qkUTr/9ZM39ly48NMyWEkaJf0zvws4yZGaaQAFSKHCuAPNcI0KQ2LsysoazrTblj4vP
 gfS1W2+Iq4kfKt/57csf6ylcJCpcubpkS/ixQGHQEndVFS2fZSmwS1Yg0pXEocaCbH7d
 6UZywcMebm7FY99micbrwgwJqNqbu+TYMHIOrUZ7Nrzx90kETa3bQ1c4U0IDvy4BB3ku
 EbdHBo2Z6q87pZXXgBQiPzO2UobSaw5eDhm9k+2kQPpx6QbR4NalqNYOmXPlTyQTWdNp
 gEeA==
X-Gm-Message-State: AC+VfDxr23V8aPXxxlwOEUFUSnRVf5Y+H6SNrXVITRHe8NEnA/4yRYmp
 T5OoCw4RKeGrzI4qigo1tjWSQg==
X-Google-Smtp-Source: ACHHUZ4cCys5jLmsTbxwl6vC2/4BuewVlsgk63nHZjzLyOKbLNIGAd+7i6deIkRRAZW5T+VP+CDn+Q==
X-Received: by 2002:a2e:8855:0:b0:2b5:fef9:6ad6 with SMTP id
 z21-20020a2e8855000000b002b5fef96ad6mr3241115ljj.25.1687788272229; 
 Mon, 26 Jun 2023 07:04:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a2e88ca000000b002b6a4f35a0csm297726ljk.35.2023.06.26.07.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 07:04:30 -0700 (PDT)
Message-ID: <631728c5-9e4f-fa5d-e954-d4ba35f6fd19@linaro.org>
Date: Mon, 26 Jun 2023 17:04:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 03:41, Marijn Suijten wrote:
> SM6125 is identical to SM6375 except that while downstream also defines
> a throttle clock, its presence results in timeouts whereas SM6375
> requires it to not observe any timeouts.

I see that the vendor DTS still references this clock.

Abhinav, Tanya, do possibly know what can be wrong here?

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> index 630b11480496..6d2ba9a1cca1 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> @@ -15,6 +15,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,sc7180-dpu
> +      - qcom,sm6125-dpu
>         - qcom,sm6350-dpu
>         - qcom,sm6375-dpu
>   
> 

-- 
With best wishes
Dmitry

