Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907FF66CF77
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 20:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B29710E49D;
	Mon, 16 Jan 2023 19:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679A410E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 19:20:12 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id vm8so70257941ejc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eDJhl2JrEfjVRzKQvqBIMz7y/1765blM/Rj+5k8sN3A=;
 b=dMuefG64FEW3xgijUTbpxZl/QVCMjI4rPW55P+7ETbewC1Lq0kcKsAZR8IcIKfPkli
 4HZQtF2DVAtRd6m/3w/i19ZQ49JQ4noTpmGnd7qEcuFXb9sDZEBIWy/r4H/jqTm8/EuO
 e3/t7Aqkbxsw73YuTRkYMm0kM4AwWH+kV4JxkUakKQ3H/7FiNlzT7jyo/sxL2DtZuxSj
 VVGchKDFTn+gv3I7hYjvCVP3nlnvf/TbNrPoN1PoxzAd7/HVIk34vNFE19ZS+GsqLw02
 4tdb3jDAVtNlF7juhkj0CquFde30fTi13j5rRzlgoGTXZEoS3npMQmmREoS+uTpHEPew
 6V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDJhl2JrEfjVRzKQvqBIMz7y/1765blM/Rj+5k8sN3A=;
 b=uvoht3m3+a/jP/EiWkVp5PM6Hg6CnW5MXuDZrhv0YQ8iwaknz+3ik6mVOwNmKw2iFM
 /az/66FhhsHbgK2/5uDY9LBfTp5G0aKoQ0IMHCSSo8i8GI0VLhZI1nB6xhNMdMECW1i1
 UESh1F7RVvglkMNsNyGeLuDJeHDtMIKugLMGqiWz9khhl5McyaWMx6zrkBk1KY3xBlVl
 8XOomU4AJy5qcwRg/HM0ZyOVtW9IdLQ+JAzy5I2c9EfHPtc48mK5gY16d3lfNY4TQ9SY
 VfFzsq/d2+3hxqr9KW22pW8iI4YAef+g8wtKtm5G++Xv6EIYTrKdLTCN/6/3CxnNJcPF
 Gwuw==
X-Gm-Message-State: AFqh2koCHJAR27vig5hgX38xMDq8B+AHNTPqNPtui8xpxsLBagBZp9X2
 O+BdGs8npvbPzVeRpLsHJKqHAg==
X-Google-Smtp-Source: AMrXdXvRp1jhXQmTSRUs0FqepxPK0fgrpXAf5m/8kczSCQMkAwnBPCYakTyiXOPRvyGSw0x4I9lc8Q==
X-Received: by 2002:a17:906:4950:b0:870:5ed6:74af with SMTP id
 f16-20020a170906495000b008705ed674afmr4624045ejt.77.1673896810745; 
 Mon, 16 Jan 2023 11:20:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a170906c31800b0086dee4e5555sm2891358ejz.87.2023.01.16.11.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 11:20:10 -0800 (PST)
Message-ID: <ed199baf-a4e2-cbb5-d399-2387e538c466@linaro.org>
Date: Mon, 16 Jan 2023 20:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116114059.346327-1-konrad.dybcio@linaro.org>
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
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 12:40, Konrad Dybcio wrote:
> SM6375 has a single 7nm DSI PHY. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

