Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043EA6C9C56
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3557C10E271;
	Mon, 27 Mar 2023 07:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A1410E271
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:38:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id p34so4438947wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902700;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/qD7FjtvhZtJ81NOzUBx3LFaX12EP53IsdEv9Tl4bAI=;
 b=aCjXanFbaLw6M4VjmfBrrCt/WP0u1RNUsO+qupKmrHDpo2Pns2BofEaCHbZl3yb4Ac
 S5UKozMj86cIrzr7Uv77bHR7XtbQE8mEu3UnwfqwoPeCZCWBtS4IDbjz+39/I49vAXkn
 2sXvK57OoaJb8Bvap/bltiDHSAwhY+Oqa/rgAh1MmBP3mHUwUrrAA/8KllcgIwRs+HQj
 9B0qvmbo7Hl0gNg1R2baAs44Rzy7guY6qLF63xk8ZASRXgN5pr2wsB/E5WYH5X1XjDZE
 i8AINF31s85s2hhaElh5coliA4DQZ3SUfZmnREojxXXl+aiqeGcU3BHanP88eTq+YFty
 WKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902700;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/qD7FjtvhZtJ81NOzUBx3LFaX12EP53IsdEv9Tl4bAI=;
 b=0JCEozFcmYto4D3WgRUQamq2HGFDoWWEzBMuRxDZbogXSiSb268gsCWuLKVpLifLP0
 mVLpCZwV5qNOJk365vZ7xP24P2d1VUvPrkZVOJSIzWoHJJvidvMJ+LFY24rBCzJJFdja
 QgZd+xOl1jN+NOmbFoaSr/XZkHFc72S4KTuH+6CodE+jnxILNosjozaUTVg8F9yXetQ7
 hGuzXhF2HNX3ilaEFKcfezeny2nXTNRHuYWYBD9f6TcQoJh1ZSL41cSa2qVgxQYOGkUr
 WvcXug24KT+ZObCcShxSOCy+7Jj9Hdei95BkB4ZmhSfgy37MjUqllEvSGORnpzxabAt6
 6nQA==
X-Gm-Message-State: AAQBX9cE2LB5u8u5Os0IADZFGbm2h2uPiokZdrOIxk1Hi7+otXK17AG3
 TteZfRQR5vVf8VLM1rHW5CF4QQ==
X-Google-Smtp-Source: AKy350a2wxNM50qk+pj7L2It/9Y8AxzXlhVA3FjGXQkX6PTzQ9sSZL2rJXy43EngRugYesbfAevI5Q==
X-Received: by 2002:a7b:c444:0:b0:3ef:72e7:fce2 with SMTP id
 l4-20020a7bc444000000b003ef72e7fce2mr164229wmi.17.1679902700621; 
 Mon, 27 Mar 2023 00:38:20 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003ed2433aa4asm12783619wml.41.2023.03.27.00.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:38:20 -0700 (PDT)
Message-ID: <f786f389-d03f-1cef-dff0-dcdf3b5e4042@linaro.org>
Date: Mon, 27 Mar 2023 09:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] dt-bindings: display: visionox,rm69299: document reg
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
 <20230326155425.91181-5-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326155425.91181-5-krzysztof.kozlowski@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2023 17:54, Krzysztof Kozlowski wrote:
> Panels are supposed to have one reg.  This fixes dtbs_check warnings
> like:
> 
>    sc7180-idp.dtb: panel@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../display/panel/visionox,rm69299.yaml       | 25 +++++++++++++------
>   1 file changed, 17 insertions(+), 8 deletions(-)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

