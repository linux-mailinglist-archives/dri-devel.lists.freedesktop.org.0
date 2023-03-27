Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944AC6C9C3E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0145D10E267;
	Mon, 27 Mar 2023 07:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0253710E267
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 07:36:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j24so7635530wrd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 00:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679902609;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=NbYmGbS5uaBCRcMwyPZQrI6VMogdLbv4M+SG8lk+chs=;
 b=wg0cLRtGHOzjEqnn6wJzNGYyPEk33R5HZsMfaePIN5X0eiVdVpdFvDQ8JEL2He8pJO
 n5ya6PKRhQN/Ewi/PR+1J7nkFYcTEhevMdjfkiDfvTLYtsN8RvWs6wgWBwfnRQDldA9S
 pfkVZLtYllCfaCnihAzkkyxrxDsWoIhakvQqiyZ9a0aAiZVAMBaDqFrUFIimaAj90pVm
 u/IyC7go5tYf8uMRJNDk27tNmUxwUQ36z0Es2Q/Mmnbdg+k54WwCLu/dab7nxFakyXra
 xmDeDegoEXX5sSPBj+nghbQropkNAvw0woUyMGdTNbqTO1Rg1bKA4CdwXQDC7JUOO01J
 gmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679902609;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NbYmGbS5uaBCRcMwyPZQrI6VMogdLbv4M+SG8lk+chs=;
 b=6t3Fri2IpNYMkI+TduNf3lVyOw/Dik/eXaAkwxgfxs62jOgc0tMndBqplO54bdH3ld
 hBXA3OTcEz/9oUFlN/Rh4+oA23LWigwXrV6/I/kCuYsaVelvLtB06f3y4iFZLtOHkqtL
 kA7idykxlyFFzr45tsGsVxNliVnpFRl++ZMEJOgJ1sY/yX7s57ZB5+4e6oIEVLdIi6uZ
 Pd+v1WLwT5Nkp3br/pzcZh7ySJWQN2NY2JIpjx9F9L9BL8hs3iHk4QlWZmweAv70LBAe
 SQr4Bt5TaZSSLmxMPbuENMybZ3mBqtMoFl8EH/Y1qVEGyJvdul/L7OEuoEAnm4Y5ugVU
 2z3w==
X-Gm-Message-State: AAQBX9dxJ1eVUJXK8Co+F+J1k3HbJAQiU89gPiiZCIld2jMPzkflqW51
 HoRZaPF/PtzSdk+0lKd7OdM9Ug==
X-Google-Smtp-Source: AKy350ZR+iZ8CU4+6lZ0dAb/tRTaCxmQCiUUBubE3HwF5ZsO/o1ChMh3bOjSEzu1DgEdtZg9H+j9yQ==
X-Received: by 2002:a5d:428c:0:b0:2d3:3cda:b3c6 with SMTP id
 k12-20020a5d428c000000b002d33cdab3c6mr8427206wrq.40.1679902609335; 
 Mon, 27 Mar 2023 00:36:49 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d6903000000b002e105c017adsm872386wru.44.2023.03.27.00.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 00:36:49 -0700 (PDT)
Message-ID: <d538eab9-a97a-25c4-f4a9-fe3f1e1ef449@linaro.org>
Date: Mon, 27 Mar 2023 09:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: panel-simple-dsi: allow vddio
 variant
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
 <20230326155425.91181-3-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230326155425.91181-3-krzysztof.kozlowski@linaro.org>
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
> Few panels like Samsung s6e3fc2x01 and sofef00 use vddio-supply instead
> of power-supply (in DTS and Linux driver), so allow it to fix:
> 
>    sdm845-oneplus-enchilada.dtb: panel@0: 'power-supply' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../display/panel/panel-simple-dsi.yaml       | 24 +++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
