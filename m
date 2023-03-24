Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7CA6C7BDA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 10:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAEE10E16E;
	Fri, 24 Mar 2023 09:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB4C10E525
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 09:47:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o12so5436766edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679651234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=68LL2tN+tvRxnHcGQimYX0Fn4/Y+S7c6syZHdYwPnTI=;
 b=y/BAVhf7XMGXQZE1Y13WxXscpyxTT6091AZrh9ix9L48/sVvusr11hqc6a7R5l4o07
 Hef2LRkOT+/26787JYdcyIWbdLbGoSouYknRmm1W6yTY4olkw1zNQiKkQjpSVIBG694e
 27BbXDBWavVqMKuQvkf9SWWT2uJXHWenF7lwpBBXIRyMc8eQfDB97lfSsniY8/5/nANA
 Hy2G84NnlaQRruaNSjgPu8QVQ1zX6q3NkY0AZzKWfCQMnUvVqs0IvFDe/Xhb6PofXjet
 FlaT1RqrIOulyaSc2MGAiA2I2ipBZC05OzulHp8ycMGQJLraqRxSVgs0f6iNIl4MwLqX
 Ki9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679651234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=68LL2tN+tvRxnHcGQimYX0Fn4/Y+S7c6syZHdYwPnTI=;
 b=10vCXh7RLQc427IirHuKHcw1bZPrikUGRmQCA0DAqTPNKTu5HKoGQrS09F+5b9GoAP
 tYhIYbROIW2m+tyY1LSwHqkzxaN13olDdS+REBH9qz+ozlv3gncBTHGu5RbiDSM+4JsQ
 hTck+85cjarFpsOPX63Gnftdi7rdCNi8RgplPvU25YRab1m8ordx64cWuGGjxbfMZFJ9
 vysdh7KjNH76Aeg3QbMgC2bzY9TLCHrJqP0HALLCUqyf7YgF8al0bjZNGk8qqOUhM81h
 TNAjV/bpWbe9HFAdJbEOYjgzOp6YRPCQuYaLgTDFW1YWTg7RcoOUZbbkfT0uuBVG1dwE
 o9Ug==
X-Gm-Message-State: AAQBX9ex/6/vEl11IETUcpS7KFNJ+HJwpunLL04zFiHxwGGjAbyWdvWC
 bMX7pxN0VHUm4kFam1jJYP1DIMYR8CymW2dDuSI=
X-Google-Smtp-Source: AKy350Y4KNEVHV8TIh4Rz8tGeMz+jN+kqcpiakNF+uVS+SRrsU5RH3vG1yCVv74fqqlCu7gw965hmA==
X-Received: by 2002:a05:6402:481:b0:4fc:7201:6de with SMTP id
 k1-20020a056402048100b004fc720106demr2150057edv.26.1679651233788; 
 Fri, 24 Mar 2023 02:47:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373?
 ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a508d4e000000b004d8287c775fsm10384125edt.8.2023.03.24.02.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 02:47:13 -0700 (PDT)
Message-ID: <b712b832-6b92-53aa-d6cd-124e079c8e07@linaro.org>
Date: Fri, 24 Mar 2023 10:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/4] dt-bindings: display: msm: sm8450-mdss: Fix DSI
 compatible
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-1-0ca1bea1a843@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-1-0ca1bea1a843@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2023 10:28, Neil Armstrong wrote:
> The DSI compatible changed between patchset revisions, but that wasn't
> reflected in the bindings. Fix it.
> 
> Fixes: 0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

