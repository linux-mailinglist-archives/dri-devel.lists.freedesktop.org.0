Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC56C9C7C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F8510E31F;
	Mon, 27 Mar 2023 07:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7E10E31F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:42:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i9so7627966wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902930;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JOOOBiroamhenwfuo5ga6dE+XPuQESypbE4qSgQtMmw=;
 b=p/Brd6ggDoF2ypyCtWUYx9hxs9tk4yrURUQxVCyXR3p24EObbQ9+nRO0YIl73Solxf
 k1JaXKrbxsxsP81V6V5gHBOcPz7s5iSomtk/ZpFoKXO1bytHoMgh0dZEJnmHTIdBM97Z
 8maNgbwBmv1gtySCMnGhM6faanOdwFQ5VDaq5GBH6b9aU2s2jKfsSe/6eebQfcUVsFTh
 AmgTTcRhMxCgYc7AC6AWBL+L/SpzLwsehxm6EzJLjisXUbVw/jsnatXTktUEGk26eoUH
 q92VBezC7lQ8ygCmOFIgBFWxFsbNKIL7h83j5TkOGU9hgqieiv1raW83bNB3eihw+GUb
 HRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902930;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOOOBiroamhenwfuo5ga6dE+XPuQESypbE4qSgQtMmw=;
 b=oGaFE/HvjO0FQhWAQVRe0yzCG/XwI5l8vNqgCKlQ4m7jdP0edIL//dpJfr90xG0pRl
 3vsuvjdf8dA3YtiDkfcqJnERtgV6A28n/zlt+VEv/z2yz7Naf/BVE8qwyrn1pxB4Lovx
 aiL14EveWd0woLS9PQlyjEz1W/pg9b0t42ZK2m5k38MBIQSpwIKN+dIdeRwiPPw3cF6n
 rrWL5A7mSVhHS9DPM+T/d+XrVJ3DpRN/fa+q4kzV3OzZefS0tljLA44epG9HraPIscaZ
 J0+sk0+WB3AU9wk9Bq3bX0o4vw7MYScEIemCvgPu71tGWKCpcNMe+d3BRkPmvHoW8nmq
 lVTA==
X-Gm-Message-State: AAQBX9frPKs4K+Rqyr7VSP9Z7W7hLHUOa2386V8SyxzSLlPdX1lO9Lv5
 DNC76Zb6OAK8mxOPyH6QtwrgDA==
X-Google-Smtp-Source: AKy350YqQy+pbOYZ6Soh7L7C3RBpiSINUxjeCX9YBoZBQYWARi3ekoerDhsAJpTYKLCwciDv0Od6Cw==
X-Received: by 2002:adf:e84d:0:b0:2dc:f007:38d6 with SMTP id
 d13-20020adfe84d000000b002dcf00738d6mr8668408wrn.6.1679902930106; 
 Mon, 27 Mar 2023 00:42:10 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b002cfec8b7f89sm24490954wrd.77.2023.03.27.00.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:42:09 -0700 (PDT)
Message-ID: <8a4b3e73-2dc5-3b2c-ed73-f43893406beb@linaro.org>
Date: Mon, 27 Mar 2023 09:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] dt-bindings: display: elida,kd35t133: document port
 and rotation
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
 <20230326204224.80181-3-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326204224.80181-3-krzysztof.kozlowski@linaro.org>
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

On 26/03/2023 22:42, Krzysztof Kozlowski wrote:
> Panels are supposed to have one port (defined in panel-common.yaml
> binding) and can have also rotation:
> 
>    rk3326-odroid-go2.dtb: panel@0: 'port', 'rotation' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/display/panel/elida,kd35t133.yaml           | 9 +++++++++
>   1 file changed, 9 insertions(+)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
