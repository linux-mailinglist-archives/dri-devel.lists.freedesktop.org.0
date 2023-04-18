Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37D46E5A5E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921D10E6A7;
	Tue, 18 Apr 2023 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCEC10E699
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:24:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id xd13so36771348ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681802678; x=1684394678;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mc2ExA+PYqwwVZ/2XtG8G8622ouzIpPkXOpvzHUJGzY=;
 b=LlL3Ix9wb13p8+AVSBkcuTAG/yELJ9qLYyM2yRbHicQzplcpKd+hMWgco8vu+ABC0c
 0fBZwOlnJ0lL5OuakMB3mxO+yT/DMbRF/x21gW1Y5m2HG1yLCXjfHm/qcF3iisRgpF2F
 /RQTSKn0omVPRYl34oN3630drxBEXMpp5En18nWgh7LTfXl2NbBGuCnT11yLejK0wO/s
 ZFgUc0Mlf07+zuDYn6YAsX38ej6CVapUP6kgoJP2TACb7KEtnvJOFQ7hjlLjbks49LYK
 qsM9HN4jIazntQ95nbJK5ksqIaDlfSXQENJJ7qGNMoxOU20Ek3VLTxM/SPX9WyK+0kQW
 aFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681802678; x=1684394678;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mc2ExA+PYqwwVZ/2XtG8G8622ouzIpPkXOpvzHUJGzY=;
 b=FOlMGmFm8uFmoPrRiqfEDcJO5j5tYd7oAgDRAvfuCLVIe1mH1twCdmg1ZsgQSmSqNH
 wNtQT7E0sgTBlgOrpAMkq7l0f+NtWtqtw1GhoaImNXDDHysXLh1FYsLJVd5u7qkDYdFs
 YTCzsu+MZI6SO9NX0rLNm2T0ZcACuvX/3OAK7MKUDRwvivtj4GNC7hjeYypAcu/lqPmy
 DKVJXTGsZzPN7UjiiQlS6KvC9Zw4f1VftsD8fQZLXaFtkbctt0pTqxGFpLMgekueP+5O
 w1T2IDRdjlSxOnaNKpWHLLNVEK4d1qeL04fiKizSx6R4zaJABnkZSXhnsF3ys338jutk
 RH4Q==
X-Gm-Message-State: AAQBX9dqDFRudBDxW60738Si6osZMs+NHgrN6khtqfTKTUcfAI8yj3Lm
 3jh9Kpwf+fbh2jUp2BBzHQrPcw==
X-Google-Smtp-Source: AKy350ZiD4lH0dbwhlOPNgRf0zXiwlE5tOpXAZnVwKUxlUGU4tbmGbLlxHA0xKSydZHhGMIj5ANaQg==
X-Received: by 2002:a17:906:938d:b0:94e:46ef:1361 with SMTP id
 l13-20020a170906938d00b0094e46ef1361mr9458125ejx.34.1681802678423; 
 Tue, 18 Apr 2023 00:24:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a170906615400b0094aa087578csm7730783ejl.171.2023.04.18.00.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:24:38 -0700 (PDT)
Message-ID: <cec395c8-83b0-8626-7229-dd8427db48fc@linaro.org>
Date: Tue, 18 Apr 2023 09:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Add reg bus interconnect
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-1-06fbdc1643c0@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-1-06fbdc1643c0@linaro.org>
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 17:30, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
> Describe it in bindings to allow for use in device trees.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index ccd7d6417523..9eb5b6d3e0b9 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -72,6 +72,7 @@ properties:
>      items:
>        - const: mdp0-mem
>        - const: mdp1-mem
> +      - const: cpu-cfg

You added only interconnect-name, not actual interconnect.

Best regards,
Krzysztof

