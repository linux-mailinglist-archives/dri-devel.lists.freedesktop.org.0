Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E9475F7A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAF210F41E;
	Wed, 15 Dec 2021 17:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4619210F41E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 17:39:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id l22so44544874lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fzaqJ5meWUrCpUjSsb9uzssS9OJDirXSHWdElGY2Tk8=;
 b=gEfx0dDuompkfWezqonxci1CaIPqQ7Y3CLZG+hG/zvK4zZfLRLrKcdNKynoxHKzXhX
 /rCNZCbuAry32EF93PoFR/lyeZ/aUV2j+Jw15KyAWFVW0PV9AljhwxGH3nIR3mr/viMU
 4Aegix9rKmYqrfhcUDuKoa7ocakSvk6oEdpX/MJoQg4bBtbwA+ZgJi3f7QPEEKOAfvKS
 ZkvFuzpYmeFgyclxFDew7Pev166JpS3XBm8NN565a8sIpflhfxp1RHV7sZ7JG5Uah5P2
 paCBjwibHl7j0TbG9yRfxb+0vkQos8DXru/5DRljoP3UluwMemZ33SwBVHg8gGT+9IbD
 1ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzaqJ5meWUrCpUjSsb9uzssS9OJDirXSHWdElGY2Tk8=;
 b=fdMrUmz3TdU8iWSx0K0SETE1WJ5qbiCfmmxZSrAp+t2xXfyInx9CR/K0+ZOoTIyC1S
 Lnmohsaeucmt2ty5FFFe9A7ai4d87YY1NLH6nj6K7M5VqRsQj5mz/wWQG/tTWGoYkEAC
 HovYcf8LDPwMQHYDwzcVvVISh1J0ylvrJtSN72vqNYo3KfEreIazIweo5ZdsC1fGn4M6
 ZFVEVuxpYyHbpSTpcHTKzuFVxOleDceoKPxWSskKSTsWaEs80hXjDFgi9zo/3CM2DRAe
 KH1CotDUfVg+uCnJdUk0g/xYI8EY+emIVojZ+mnXpWj+y7oFpGdCwF+yBk3znOBqkRB6
 OstQ==
X-Gm-Message-State: AOAM5337zfYsQe2xtq9fp+khbkj14eu0TGhJE/yhwet1L0/gd/JIPBD1
 M1mt08Y5TjVANn5TKoo7ijo=
X-Google-Smtp-Source: ABdhPJwp/P+WVJvywsDi0ZdsqMyufBgQy00WZlSqIAI2FPQv8OrlYLAcE+uj3wSe0eM6UiFSKbeTiw==
X-Received: by 2002:a05:6512:3b9c:: with SMTP id
 g28mr11016231lfv.651.1639589957644; 
 Wed, 15 Dec 2021 09:39:17 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id w6sm562147ljj.118.2021.12.15.09.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:39:17 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: display: bridge: document Toshiba TC358768
 cells and panel node
To: David Heidelberg <david@ixit.cz>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20211215152712.72502-1-david@ixit.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4fbabde7-e3f2-fe6a-db3b-182ddbbdf73e@gmail.com>
Date: Wed, 15 Dec 2021 20:39:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215152712.72502-1-david@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

15.12.2021 18:27, David Heidelberg пишет:
> Properties #address-cells and #size-cells are valid.
> The bridge node can also contains panel node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/bridge/toshiba,tc358768.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index eacfe7165083..3186d9dffd98 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -69,6 +69,16 @@ properties:
>        - port@0
>        - port@1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^panel@[0-3]$":
> +    $ref: ../panel/panel-common.yaml

The panel is always fixed to port 1, isn't it? Shouldn't it be just
port@1 here?
