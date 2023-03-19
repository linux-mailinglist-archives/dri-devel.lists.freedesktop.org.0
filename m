Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1C6C014B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 13:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8010E0F0;
	Sun, 19 Mar 2023 12:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DA610E126
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 12:03:58 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id eg48so36641180edb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679227437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YSXUCaRqA2KtFe3Fei38UJFcRtmzs4d/93iu0lEJ7eE=;
 b=A3UdxjgBuua477jAvg/jfzl8VfYvRAp5jD2nIFvnnso6EJ0HJW7BERvWj4q6oJx5qw
 L+aAgmNW38AvQKfLcm2Cw40S1ju3aTn26Hh2fCBB1m34+1wQGgONJ3GBgBr6OyTZmaol
 q00OFQ5ZJofiqPgZf+Zt4CFoMcw91iF8qN5Dnd0lKgbcUNUkSN7BhjiF9nXVhZewXQ0G
 B3A4GBAdRtrvc/ngn7ZxTLvMKE6+wHlY9Nfdw9MZVj/2K/sVgwVPLkcgnJ57i23rzXFR
 jIH4HidO7VrFPiNIzIfycQlaZHGvUeQsZnxSj2+X8Il9mr39VuA+aLovCvZiKggW8HKS
 +O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679227437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSXUCaRqA2KtFe3Fei38UJFcRtmzs4d/93iu0lEJ7eE=;
 b=eDbdJeCkDL2VqpYsUIX4Gj8FKl5R4yv8jPIu6sP5n2n0CJHUJAd0vvS6WkvmqX+88c
 uN7/y9UehlSUUjG7wg8+9/MJjZyPr7LawXoaIweSxeG2h5UA77n8jvcm5Qmu6vz9UNDO
 3ZHjVlE1GCVRYA7k2GWGiRIOtRIdvBICbiONWvH1AGYBohq2LnW9l6c/kyAwu8M1H3D+
 mvCmTYwURY+NrNpuQQmRVb+NHDELEh6vskUkn4LXM2GtOJhkuv3tIuOpN+JlrPuGxGVO
 cEaqnfSmIvO38n2sA/tvRuCn3eG0rherEk7hzjyi2Ec9xk6bwJ2dSfxkObxx8Kzgdz2b
 oVSg==
X-Gm-Message-State: AO0yUKWoMwbtCGH/BkwoHF7nJ3bRO/rnxGRHIcVFNiEZm35A2hFTeugT
 FVbh0A5fYKkmkChJrUc8RjfRnQ==
X-Google-Smtp-Source: AK7set+90vgthv/jxsDWW9xfaWDLTNj1lisQrdqpycvWFzwCMmchtYzT7MyBWOCRp8E9tH88s4X5ig==
X-Received: by 2002:a17:907:9709:b0:8dd:5710:a017 with SMTP id
 jg9-20020a170907970900b008dd5710a017mr7030413ejc.4.1679227437125; 
 Sun, 19 Mar 2023 05:03:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5096d1000000b004aee4e2a56esm3435257eda.0.2023.03.19.05.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 05:03:56 -0700 (PDT)
Message-ID: <ec652851-4d6d-cc0f-c071-f83a71d9748d@linaro.org>
Date: Sun, 19 Mar 2023 13:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/9] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated QCM2290 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
 <20230307-topic-dsi_qcm-v6-1-70e13b1214fa@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-1-70e13b1214fa@linaro.org>
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

On 18/03/2023 14:42, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became
> undocumented instead of deprecated. Fix that.
> 
> Additionally, the "qcom," prefix was missed previously. Fix it.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

