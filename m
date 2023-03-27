Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C13E6C9C54
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7231D10E26F;
	Mon, 27 Mar 2023 07:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CAA10E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:37:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id l37so4448348wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902669;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=PTyjeyB+LiPlbSLSBvv/DoCKWzMb1pZcoCNBXde7efk=;
 b=CF2bcNKzDLgbNseAerc+0cAre9/4rDu3GzL2RRUeKhnjkWjGLkvL1wtOgmHwuoI5aJ
 OBOgBVcpFlfTTWDWcrMGbfmo6Fb9iqGYRHvKxMZO8eGOm65sBFoskXv/As9gkvxvHrO3
 zbjpD/bg8kg5qbfPrKIFmNEryBbdebsYUPIiJ081KTYtAFMCdnHpd2/VKPbSjPxYLYiH
 igBUGTFq243kTaLZDyCi1OuVe78bceZu1I/+1O63RRhQWLd5DqeptIAkHIKs/L7oU7Do
 PPFJRTyB5d9tMLvbcFDUvOOFdBMq2EEv3W+7Vya15W2kih4kuyA7l54CrWvk6mEx1AVA
 QCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902669;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PTyjeyB+LiPlbSLSBvv/DoCKWzMb1pZcoCNBXde7efk=;
 b=P+Pbce/M6fcdk6uViZK7R7PWqGDcqsM/Bi3MQYDrBLoKhL8+TjN9Xokx9ReXvLLuQQ
 43On2z5/Lg88XUJs9MSANxDJev2sb1aMLOs2BVHvTLa3Yvy4a7bInHRYguMnAmpdOdrb
 /YyxOqrT6WSrNS4aBKG1VtodG7FICvAogaWbIQkXN+ZVQboujem2lISYXO0f0z2AjTom
 uOCuLjuPeL736S0Coqk2WJMLO7d2O4gFQ1owrMLhHsjw2kAaXtOaTEhylryrUSuQlEC5
 ZfCgcP/ns5ZmozXrxfVz1bqDb1fkkCDu1BxyF1+znYpru7Z9af3vOTPdOwMd24g4tlx0
 plAw==
X-Gm-Message-State: AO0yUKVc4uu3YwBFdSgLK5X01YAIlDJ1xb5u3r2UWnG27rqtg3j1TONI
 qAJXmaMtoFVFNY+1EP1pw5fMvA==
X-Google-Smtp-Source: AK7set/gBEBLHlpaqospGTeQnkjVDZlPZ+h6+Fz/IXtUpLQgYPM75dXsSD+nbRDJh26Q5hxWuEf6fg==
X-Received: by 2002:a05:600c:3150:b0:3ed:1fa1:73c5 with SMTP id
 h16-20020a05600c315000b003ed1fa173c5mr8461158wmo.27.1679902668757; 
 Mon, 27 Mar 2023 00:37:48 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003ede6540190sm7893266wmq.0.2023.03.27.00.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:37:48 -0700 (PDT)
Message-ID: <0296a9df-2d40-8852-efc4-955cf4f791d1@linaro.org>
Date: Mon, 27 Mar 2023 09:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/6] dt-bindings: display: panel-simple-dsi: document port
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
 <20230326155425.91181-4-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326155425.91181-4-krzysztof.kozlowski@linaro.org>
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
> Panels are supposed to have one port (coming from panel-common.yaml
> binding):
> 
>    msm8916-samsung-a3u-eur.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../display/panel/samsung,s6e88a0-ams452ef01.yaml         | 8 ++++++++
>   1 file changed, 8 insertions(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
