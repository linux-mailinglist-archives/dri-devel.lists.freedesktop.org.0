Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC676E1E14
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC29710E9BE;
	Fri, 14 Apr 2023 08:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED70B10E9BE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:24:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id xi5so43697493ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460674; x=1684052674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2Jcp3MHbUi0An/a7aTvvHXRZrnAjkyy08HzPYUNJaQ=;
 b=rOK4LSiTwFa45v7CqOu0/5w1TpdCvImZLKI0EreaaDS4Qt8uwnG/N6J8+2tejZ0Ncx
 Vu2pwvpPgpVPBZq0kLQBHW6NYYiF5FVcS0HyUTJqmrdDJrKW7ItcUjIC4JkDbd5VLnjK
 jQPtltLGQj9//1ahJFAjqgXcv5ZN0eTiR4+ifdVmQRSoodnUG9sBuhBHSnJGoC8lSra4
 z21dv4CWbcfcU15KeXgSir6XRYKF+TPCryNDhGOOI68A844uJlTWWJzf6D7mT2tRgvuX
 e9ohtOXM0207XaiaLqe6FZHBL1QoaUkHNH+IvgYyuQNxKFlk9QbNq5rZ1AE9zbbsKyRM
 UtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460674; x=1684052674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e2Jcp3MHbUi0An/a7aTvvHXRZrnAjkyy08HzPYUNJaQ=;
 b=fDLPWPmIZj8LS//PxuveJqJEKDpIsEhdwZY1pHvH/VoZHUQbQguaV2xOjPnMqM5uOa
 WA0I/iayRwIt6cqjNlm+PIn1WlKY+B3izR0BMdUyTBxnpHtuDyIC1N73FaGZvkjmwSFw
 CYVWMHnTY04iSc7KPo9xhHba9XjXvkqNp0ozTuaGXmhKjfkrPWHADk+MjbjYJjrYEiRv
 xClgML1ZPX3BO5VqZVn1ibNahiluYziaNkzv3PwJoc3KK7oKwBDvlCj5sYTua+P7qL7o
 ujgTSR4dLfcBu4f61z9ppsOYEkAEFlE2Z5Mav01nxu2h6jq5os0NzhaLeg9KOF1Cs3Ee
 zSqw==
X-Gm-Message-State: AAQBX9fBE2d0ax1lfAmXm+vFIqfqO8GV/o976GeT9V+bAGy75KTN+K3B
 Yn+N7tI9eRT59jOeG/2cRsl+Rg==
X-Google-Smtp-Source: AKy350aZW4Ylqj7ITSxe6hxQlasg4qhTISV9/uV8NXP7fxhQ71VUUtZk6WFshZK1/CWOD71AeHcviw==
X-Received: by 2002:a17:906:4312:b0:8ae:11ca:81de with SMTP id
 j18-20020a170906431200b008ae11ca81demr5357467ejm.34.1681460674536; 
 Fri, 14 Apr 2023 01:24:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906584700b0094e597f0e4dsm2062292ejs.121.2023.04.14.01.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:24:34 -0700 (PDT)
Message-ID: <fb79c6df-6a7a-7988-0c3f-6fbdc05a593a@linaro.org>
Date: Fri, 14 Apr 2023 10:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/27] dt-bindings: display: mediatek: dsi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-6-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795, using the same
> DSI block as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,dsi.yaml        | 19 ++++++++++++-------

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

