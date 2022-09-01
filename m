Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F25A91AE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 10:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4063410E64C;
	Thu,  1 Sep 2022 08:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A4F10E64C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 08:10:06 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x10so17041089ljq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SKGmwv8AbUSC9zege3PH8qea0gYr5fiWxmtpqEyUyAg=;
 b=VdsXrRQzInj9f2cf+DidXonzE4h3voXfwU/iUZWeLf5mneEZHid2UF7sHva8v2eRxF
 3MJ8W83cZCc1khW/EjjndoKtR7A4NvRuMpp/2qehoJIZgECLjcwMK3GVeYl2t7cqlSQD
 aKRFF1txHvWHYfC/svIOtwXcqtPMR4KhBewzVc5DLTVYIDTodZD0UpNOmI0qv/YOMu0e
 oj1qEOp/2FL+ZEwnpICszfuydtO7V+5/FpSrjBX9I5v4BB76fY8G7XMiDwhgcH92un3t
 90wpuBtFrrixeGEsdfYP/4iApWhGbQ2/xqTyMptoXVVERtph2p2a8tYywAI9sRmZvF5p
 UZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SKGmwv8AbUSC9zege3PH8qea0gYr5fiWxmtpqEyUyAg=;
 b=JPsTE+bv6tDz2ujeq+b3KvmKcKsYhpJZPr2IsOvi2K6UJrxNwb8e7yDEgGIF38nG1B
 s9JpH4SmYT+lRGEU/JPM3biwfpbLQA2+Ek86TfaL4KVqDV5zEGH7hEJs/6RphIY1H8wd
 4TgvVYSOA5xKfKXSePtvrfYxj2e9rs8In9e/n2qY2AjBZN8s5mD9ee2f5WqTMFrZfNRe
 wWno64425BNErYzY1+kJM2nUypzZZ3uMcvu+GliSXxvwhHr14Q21D4Wr++j2rjBdMxdR
 HVdlzPH7Ozvn/00wOxt7OdT0hLBuyffphxx/aRRFVY6KmodF1bkWTzxsBToftsQdI+WB
 KIPw==
X-Gm-Message-State: ACgBeo3w73cdMrjxUEvlRQTTD6PDXGQg3zvnW+CFr4lLp5h+A3t8LahW
 iYKFD6MB5wiCYpGYYImYzCVW5g==
X-Google-Smtp-Source: AA6agR67ZwDjKHNlqrgITbSej3pDpqFcTje7eL8XIngDydh7nyivybENP1bQMjqNGOIRKAN2ynvUqQ==
X-Received: by 2002:a05:651c:1114:b0:268:9d4b:c208 with SMTP id
 e20-20020a05651c111400b002689d4bc208mr1561461ljo.4.1662019804190; 
 Thu, 01 Sep 2022 01:10:04 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 z20-20020a0565120c1400b004946b3d4517sm1405111lfu.55.2022.09.01.01.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:10:03 -0700 (PDT)
Message-ID: <7367b752-bd27-35c3-4114-92d950983982@linaro.org>
Date: Thu, 1 Sep 2022 11:10:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dw-hdmi: Add
 resets property
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
References: <20220831213536.7602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831213536.7602-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On 01/09/2022 00:35, Lad Prabhakar wrote:
> The DWC HDMI blocks on R-Car and RZ/G2 SoC's use resets, so to complete
> the bindings include resets property.
> 
> This also fixes the below warning when running dtbs_check:
> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: hdmi@fead0000: Unevaluated properties are not allowed ('resets' was unexpected)
> 	From schema: Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
> 
> While at it mark resets property as required as all the DT sources
> in the kernel specify resets and update the example node.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
