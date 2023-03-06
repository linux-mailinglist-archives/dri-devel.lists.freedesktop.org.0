Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FB6AB8E6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922A10E1B7;
	Mon,  6 Mar 2023 08:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFD610E1B1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:57:13 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s11so35323920edy.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 00:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678093032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vNo+uuSekh3H7ze6n9zNYBHA+NkH+zV6npVC4VhhfNY=;
 b=dRWmz5HJXEbQsrxAVOqk7G0LiPKXDbLwoUQJy4TAJIwlDpPercz/1a34Arggibw+ZP
 rkti8UfsyNWoRMhfCedTthBDlwHYui8IHxo0a3ky9rnL1hyGt9DZXfxTePOo3hyVbT7A
 rCXvmkAoiqjtr7Ey4h/KXMgYascCITt9UPH66doEH1YJylLPLh6WC7+MTRJzNthnDJb5
 GS5WfvhEp9lPW0DiiPbr+93GAI9UzUF6hFDv1gypZ3j/b/aKkqHJVWjn4nd1av8OzvE9
 uo2Mm7+uxu8BCTrxGvxJXlsZW5fqugyvnDhX2JgYJrIkc91HthZFJOx4QwKVZtGgYo4G
 f2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678093032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNo+uuSekh3H7ze6n9zNYBHA+NkH+zV6npVC4VhhfNY=;
 b=qrKvMr7n0BWc2lDusWwB75LvyYeJW+ANZGfeJ8fSpTfCvEcogAqifzahbPTz8s5xhj
 9TncfYtLe7PQWghe8QusIXlHquYURjF6VU9/jmQTlJDaHcrZXEduosiJSsspcvwG76aX
 NrSK5wSD1gTRSK5qohaLThur5dhzq6zSs4DtY9f3xzJu9QyJd4elR1sn6r3Y0E2/8Oj2
 fM/kRMT3DJJbDVIEbULDUxBVsc1BIvvICBT+2MDgIaFMLNKjwCf1U4LmGqfCN7NxbDVq
 Gj9IgvTFSKctMtWymAfVvJFe0l4Eu9wh22WHFfRWDAoNvbkp9KNrCrSW/NqT0B1KRSGN
 le9Q==
X-Gm-Message-State: AO0yUKVxXpPI/Kj4PR4JGxLV5upyOQL6l3i2IA61IEdrIVrv9cvRGwkn
 SpVoeBocL9psugGXMHf//3mJLw==
X-Google-Smtp-Source: AK7set9E+9VfxFOl+4OpZLwOQ28HVvZerDzF2iisocUdWkDK+qdGEmtp6f6b2ZsGD8X10GG5v9YNrA==
X-Received: by 2002:aa7:c585:0:b0:4bf:38dc:d78 with SMTP id
 g5-20020aa7c585000000b004bf38dc0d78mr10444081edq.21.1678093032310; 
 Mon, 06 Mar 2023 00:57:12 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe?
 ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
 by smtp.gmail.com with ESMTPSA id
 hy26-20020a1709068a7a00b008d92897cc29sm4271074ejc.37.2023.03.06.00.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:57:11 -0800 (PST)
Message-ID: <e105eff0-816e-b9e8-b47a-5c85731c9ba0@linaro.org>
Date: Mon, 6 Mar 2023 09:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-2-b8565944d0e6@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304-topic-dsi_fixup-v3-2-b8565944d0e6@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2023 16:55, Konrad Dybcio wrote:
> Since the DSI autodetection is bound to work correctly on 6115 now,
> switch to using the correct per-SoC + generic fallback compatible
> combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> index 2491cb100b33..605b1f654d78 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
> @@ -40,7 +40,13 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: qcom,dsi-ctrl-6g-qcm2290
> +        oneOf:
> +          - items:
> +              - const: qcom,sm6115-dsi-ctrl
> +              - const: qcom,mdss-dsi-ctrl

Does it actually work? You did not define qcom,sm6115-dsi-ctrl in
dsi-controller-main?

> +          - description: Old binding, please don't use
> +            deprecated: true
> +            const: qcom,dsi-ctrl-6g-qcm2290
>  
>    "^phy@[0-9a-f]+$":
>      type: object
> 

Best regards,
Krzysztof

