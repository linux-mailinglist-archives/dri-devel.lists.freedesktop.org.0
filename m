Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA96E1E2C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 10:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BB710EC7E;
	Fri, 14 Apr 2023 08:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC3F10EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:26:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id z9so16695952ejx.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681460799; x=1684052799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=;
 b=bt73naGw+ZXi4dc8Cmhv0FLtGUbeOgrPuV1QMF4QPK4DWhqcDIiQyq2SXqDshVY58+
 9i5EZRohDL67399mm6hHhCeQV/EJor+rJ8VeOerrE+yvaisOQ2EXVIzVKEzSqBMW6Bsj
 /QStpG4ys+runlabZaXcTBjIl7IH/NVwijX7kgLZam1r0Xs+zSdWpyc9iow1Bl3P9Zr6
 qTEXFqfz9+7uepReMSv77u28y+M74JLZY3/yfgzdzoLj7xro2lSoL8qMvur81rANjaL9
 4QuNXgOvOjBgmIoG5TjRbKELD2WjLfk+HiPP6p9vqHmpim7DFpm87T/BjxLYHqgQTBqD
 uyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681460799; x=1684052799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=;
 b=OhBHZUxPM+6kv0TLpXsP7Ke/6J7SSvK5qXJ3x/Cj0Lq8XT77ocDP9xQ25i+YfGk+e5
 9iuN38oEpPgCwo37UzQpXp2YGbvVGd5tMBSucMnElfwCv/RGJk8c2euADSANna/KHkRI
 6zkpfjpZPSBlRtB+tHCaMw9yusvK5lxCgZhDLjp0i96saLrwzgREPMOtL1sIweUAkSdd
 Io8JpyDF+0yY0BnU2NxapkF0KO+iR/hC32RVH7krk6NTYpA/XrQf4aQfXW5ISExNE7AI
 CWs4JSonb6wzVUeQoOy0mN2olq1iRXXZS91XGz/zt9UIehCSgTEPTKwj3pye2JxwVOF+
 2vpg==
X-Gm-Message-State: AAQBX9f+CqofUGu88nq+7J8yHMNH8eNQ+bdHiNklRgXMngWDgYM8ir26
 udkZQIVtxOTCeP6mZ7TDEV25bg==
X-Google-Smtp-Source: AKy350ZHB0iX4SpIl6nSdBkIW18ThkfNLzwYurPIDtNAv4p6SmGfIue6rSdxEw2SmolXbx+cb6/kbQ==
X-Received: by 2002:a17:906:b2d4:b0:94e:d17f:eacf with SMTP id
 cf20-20020a170906b2d400b0094ed17feacfmr2364045ejb.23.1681460799195; 
 Fri, 14 Apr 2023 01:26:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb?
 ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a1709064a4a00b0094a4e970508sm2117803ejv.57.2023.04.14.01.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 01:26:38 -0700 (PDT)
Message-ID: <d5580870-a440-a3b7-1c67-26db193a7f8f@linaro.org>
Date: Fri, 14 Apr 2023 10:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/27] dt-bindings: display: mediatek: color: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
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
> Add a compatible string for MediaTek Helio X10 MT6795's COLOR block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

