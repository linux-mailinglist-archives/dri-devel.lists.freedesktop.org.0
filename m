Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF15A5F46
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 11:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1909310E00E;
	Tue, 30 Aug 2022 09:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF24710E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 09:23:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br21so8903962lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=P3jHDFf6ZF+eC8L7gPkS3nO/hYBt1WKKSDQdwcqbM1g=;
 b=ro7d5377lQTowObZV1r5vVfKkJrhWz3A2GZD1czofP56rGrxWgIkvq/uDSV/wfiX8o
 wC1r5NrB8aG89lxXz7q8/wFkSqWyaLgn0PAM+y9znsmg+f+IeV/ZaHwy7LRLWB/z+Xaz
 RLl2KnYdbjNELU8jqx89db3PTYyKp8j/lzKW1fv+Dk4Jrb3mkSM8ti5AWHwYQRGwXRRU
 HDr1I0GTI8/DTnNIo9A1TZ4XwgHW98XuJZnPYvrAyxbpmD86JtBcg9mBz+aFF6W2cC7w
 lEaPFlms3BH5KoEJ6V2129cwHbHd+kteFPE0ht7gXMGMdDs3MAIG8R0e0jb3oPlEoGrX
 Axtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=P3jHDFf6ZF+eC8L7gPkS3nO/hYBt1WKKSDQdwcqbM1g=;
 b=UdHqMf0IafJ5xGwmXDKGB6Pnu6jwpW2m3CPJmAzhvjH8R2z5QvKStvKtdpqXBbks55
 6Kv/uBQYN8ZUjo3xqLM39bY5nn7/fhFNL8dSqxhBrZscv3HBnUYOZqBA0E/njOXFj6XL
 2lcLYzLw/Hd9eVgs6vOKPgSPBp1kwitMRHM9FF49+smDsu6bVDF/oqj7ij4uI99gfqMA
 ZhcjICVAfKauuul44NsQMMQY/L3ErLBs0HnCYDbVd+8sfXJoTlCsU9brnjw84FRxywzg
 +2iMV3/zxSLy2O86vdjfGeaRp8EyzQqXqXGISnafO+BOguWnA3rMcScZV1PihH6slMsk
 yukA==
X-Gm-Message-State: ACgBeo0hye5n9ir1+8m2UNG3tq2rfqjrTnrAkc2ZGqSCtKJSs3ouVXqq
 LyzYNYOifhSL1xp4+dyWEOh6ew==
X-Google-Smtp-Source: AA6agR6coigoibJ+B2ksKkaYEzr/2jSNslM78cgAgVd2xOmffVB501Xp5K5bVDHQxYg/RB+HGi2ehA==
X-Received: by 2002:a05:6512:32c9:b0:492:f53d:9c1 with SMTP id
 f9-20020a05651232c900b00492f53d09c1mr7151142lfg.127.1661851424008; 
 Tue, 30 Aug 2022 02:23:44 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 c19-20020a056512325300b0048cdf54a44dsm1544581lfr.266.2022.08.30.02.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 02:23:43 -0700 (PDT)
Message-ID: <e455ebd7-7949-47d6-5f9b-9869dfdd601d@linaro.org>
Date: Tue, 30 Aug 2022 12:23:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dw-hdmi: Fix
 'unevaluatedProperties' warnings
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20220829215816.6206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220829215816.6206-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/08/2022 00:58, Lad Prabhakar wrote:
> With 'unevaluatedProperties' support implemented, there's a number of
> warnings when running dtbs_check:
> 
> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: hdmi@fead0000: Unevaluated properties are not allowed ('resets' was unexpected)
> 	From schema: Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> 
> The main problem is that SoC DTSI's are including resets property, whereas
> the renesas,dw-hdmi.yaml has 'unevaluatedProperties: false'. So just add
> optional resets property to the binding.

This is not main problem. I already commented on two of your similar
patches, so same applies here. Please describe real problem.

Best regards,
Krzysztof
