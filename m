Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0275E5BE9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9025510E570;
	Thu, 22 Sep 2022 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7737810E570
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:11:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id g20so8640720ljg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=;
 b=T3mVBaJwvES3FaV8YLG+gKGlW4ElLKPh5ChWHSrNIodjkllrZ8OQYmIrgIuU7FK4mY
 gtckyzupo4ix1OZra5CINB67aFDwsrI36Oc9bV+mP78teb+wc2F73GjoF1Iagtd8u5Ig
 X5GsWm4RA2xFuJ/c07wohmcaJ+7FV4LFKuQsfyrl4NIZqpGKOiFzxxJUiFzOZkuV4Obq
 zR7yFDmao8u+qZLIGzFxSCOGuzx2n1pNtsfAwk7rUlRlLqVkkE+c1sBYU6Q77Qe+1O1a
 MG/81Il1kTsJT2cEToM+YF/EBSmt86qCF5FTSoaLYoa5tOkA3jc+V4RyoFhCq+vZd0hT
 xJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9Be+A/VflX8S5BSqS53W57zqfNrh5ghlqPax0x4FTS8=;
 b=dc6tRsGPXIiJjrfB5UTHAgz5sfotC73vkcw49r263OgxbHg6wLXhpXS7i+CMli8RTs
 BdN+rtKMrF7vd7Wd6IgfpzSNCQ5sRpLGtMhhbM64YG0XKXljoLTYbHYsfy44OYGArxTn
 QhC36Dt9LT+uCYI02k/5R5olFwAJjCWENQ+x4u1ozvjn4kBCseHUsZKgUNDj4cCG65Iy
 pw1DN3D9iqfnq/U3oNOHMXHE8NT2rePfI8U3KNjv5s43d9sXGjIaMZgoU/OFCIOzTgHt
 s6KGQ7XvcsoHZwGPZ5Zpj9mCYKlPSU1OyIiJ4vFrc/RQ1afQeGXc+RuqnvXLxgkFaUuB
 nvlQ==
X-Gm-Message-State: ACrzQf1Xz1DWPYuQpNgg60iIRi0dWtiZCaqpO8WCKyaP9UqVCFn0ZRVl
 iyDVH/E3pMuHlC06PV8Ozszq9w==
X-Google-Smtp-Source: AMsMyM7iojxShj6IEudo+H4VWui9taf1pE4pa+BEPva5UkHYdDaU9Dgt+hBCkSrdVpL9VnVmgusIXw==
X-Received: by 2002:a05:651c:2108:b0:26c:6102:5d3b with SMTP id
 a8-20020a05651c210800b0026c61025d3bmr667340ljq.168.1663830679817; 
 Thu, 22 Sep 2022 00:11:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05651239c400b0049908e21e26sm785597lfu.253.2022.09.22.00.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:11:18 -0700 (PDT)
Message-ID: <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
Date: Thu, 22 Sep 2022 09:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
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
 <20220919-v1-1-4844816c9808@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-1-4844816c9808@baylibre.com>
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

On 19/09/2022 18:55, Guillaume Ranquet wrote:
> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> Expand dt-bindings slot for VDOSYS1 of MT8195.
> This clock is required by the DPI1 hardware
> and is a downstream of the HDMI pixel clock.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 

Looks like broken patch.

Best regards,
Krzysztof

