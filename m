Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCAD701D49
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 14:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC4A10E04F;
	Sun, 14 May 2023 12:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB7010E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 12:29:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so103384394a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 05:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684067367; x=1686659367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ArPtIJuVSpHEWwLn92TXk9woMkM3EW+VzLEi/vFr524=;
 b=S/kTiPFxAcro3pd2LeYSuXVNjtSAQ+tcJAwBTwBhfR2TDep/tIB9iOPGqSz45hKJdN
 tHAkQBb5G4MSDtqYIUYIorm+jrW8p6yov+tcUSKtpclbGyxdCEr1AWXCaWgNBBIFF4r3
 R5twIEtIWXXgQYM/4kwdIqdTbOrDUbiffyTKaR4r7CvidjQTKxbq3EpLcVGCuALLBhnu
 GUsMGKMyJDihULtL1goX1c37HIjy9X8JQMfvcWKRAULKHhJ9A7xqne8F3rxC5SpmdRO9
 LanHknxPtb5IfUqZm69kciw0Fg5UP4E+Gxac2n/4sGQ4RlNIK2ji76gYB65Af6d9vbwE
 4Hig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684067367; x=1686659367;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ArPtIJuVSpHEWwLn92TXk9woMkM3EW+VzLEi/vFr524=;
 b=NIWEAPar7EUK9Nyt7ydZcQL13QK/rD7Q+tOyOzIWS8YmygY7kbAXq8cd7eJfS/wvL3
 2oEFK/OZ8j4Fn0I1zB3dL7CIWGG2B9aut/3Qu+O+nrlIyTgHSsuVPru3BKJsTDDhxRV1
 /QNPdvL9w7NmXwWF+sQxnRX8h/2XSHWUOCfbNcc/qbGxx9s2+TsWi1ghBL2CMfMB5ABB
 JjAtCZavxwpPwaosM+BrlRq/2vG2e9SYmhhLS0mmkI5IzpIBxpTpTlznSSBTnngKZEba
 M/hLmTbJ0+0nN+nBXKAlCmGiwIeKNguwaSS/wGXxqslnhPQEyQ0FCER5M/OvLiBdY+Ro
 4Dgg==
X-Gm-Message-State: AC+VfDylmm0bBtY+MWvzhCSuyiqu/YPCCdBmlqZlpWZCIJD4L0U/xh7s
 Nz1oZb8nKdP2/4EC/U0Rxt0iWg==
X-Google-Smtp-Source: ACHHUZ6APBK8weoIXl7BwELg8P/pCZohgm3GayyKL2i1zQLIS6SWmmey3j4vbhvbdV5o0ce/gRIP9A==
X-Received: by 2002:a17:907:701:b0:94f:236b:9e3a with SMTP id
 xb1-20020a170907070100b0094f236b9e3amr24151004ejb.3.1684067366686; 
 Sun, 14 May 2023 05:29:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b?
 ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a1709065dd900b0094f1d0bad81sm8109373ejv.139.2023.05.14.05.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 05:29:26 -0700 (PDT)
Message-ID: <a6e549e3-a898-c7b2-1c72-4c6fa2866388@linaro.org>
Date: Sun, 14 May 2023 14:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] dt-bindings: samsung,mipi-dsim: Add
 'lane-polarities'
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230514114625.98372-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230514114625.98372-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/05/2023 13:46, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The Samsung DSIM IP block allows the inversion of the clock and
> data lanes.
> 
> Add an optional property called 'lane-polarities' that describes the
> polarities of the MIPI DSI clock and data lanes.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

