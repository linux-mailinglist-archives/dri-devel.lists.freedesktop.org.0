Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C75E62D3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 14:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDBA10EB03;
	Thu, 22 Sep 2022 12:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400310EB03
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:52:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s10so10866398ljp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 05:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PNn1OQ2Plf4WVBh8wbrS607nOaHGst3TaPaRJYK7Aak=;
 b=CVGA+9eYGLDgWkSPKlFtUYW7Io1/rFSCvwEMKB7Gs/8EG6JZbR6Klv1N/Ssdfs+JO6
 3Kr1a01uH9k/kaacPBCO4DpAJ4HrfKFcCD7ZgKpoPkG6YHm7RaUDrQB1ciLK6fvi23F+
 LAe8eD4drDrtN1FtQURTmtvpR2coeGjD+xWZt61UNnAOy4+gomuZPUYs+X0rgsqOlE89
 1mk4T0wlxkGlScUZZk+4wtbPpL+LnUTrsbMSOGutcLpxe9NwTsPY9IopfBRrBg1XEaBZ
 ML0D2CDd32mohuD8Xstavzd0cUwk3sfurhLWThgIctivIdhfRmfWDtlydGQS3DGOysSh
 V8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PNn1OQ2Plf4WVBh8wbrS607nOaHGst3TaPaRJYK7Aak=;
 b=0uWryq4Th+0uh+gvYS9pyWmPq88tTvoMhqHTbplBNCX7OTsEafSsnh/OjiWW+bbphq
 7UaybKm4UMsiUiTNSMb4PExvC/aan7Qs0hkMCZlZBti1EUB85yEqmFARBPHYm+QFJx37
 Mm+uZhakXQYH81GQhVcFESS4uUL42GzEb6/DxoEFDAy8ofNHCZuFvagjE95sBJeOCwU1
 MqBPdgHEeKTC/IZSEGRiaAy9lUZspSyIioUlopEWkacgzfm10PpBlImEd8zgA7bLey9E
 EZKpgTgdbdlNPCUVMKoSd/WWZe80Xa0I71l8jYZ5qz3rX6K5nl2pPQ4avXOD67Qy2YqT
 ugRw==
X-Gm-Message-State: ACrzQf3i3C8Ri+94dcgvPuwPEJ9F6Pb1f98OnmAff0NuospBNaKId8hH
 qfZocAKjShzSFQZ/iqgpjYBtvQ==
X-Google-Smtp-Source: AMsMyM5673D4f9tuM/pxeZPs6CGF5k+tgPEYNZ/c3GXJJnsbfS77mWqxFlfpPqoIXPaNAY62naOkMg==
X-Received: by 2002:a2e:b712:0:b0:26a:d1d9:f8d1 with SMTP id
 j18-20020a2eb712000000b0026ad1d9f8d1mr1100753ljo.271.1663851124500; 
 Thu, 22 Sep 2022 05:52:04 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05651c204700b0026acd11cd51sm904641ljo.59.2022.09.22.05.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 05:52:04 -0700 (PDT)
Message-ID: <179bc9a0-8d11-cc3e-80f6-25bb15325e35@linaro.org>
Date: Thu, 22 Sep 2022 14:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 03/17] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-3-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-3-4844816c9808@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add a compatible for the HDMI PHY on MT8195
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

