Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2346E40CA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2257B10E122;
	Mon, 17 Apr 2023 07:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B98E10E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:26:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so640631wmr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681716372; x=1684308372;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ljLgaaf57A126KMMOllSF/kT0Vj9S+Mosp/GL21iGtQ=;
 b=qI3Wq776VwZ2nPk9GQWZBx9TGiAT78sh8fzSiMUeSKKIpsmgbl8fe7HI7tdaZLget1
 xaSGiv0/HvATfZUWp2LY4l7T6deS9FFPP+X+0DQjqUontVDYSgqCdyJ1VCe4klUPQDEu
 BVb+FPQxloA12zau4dBE6uEVdqC7epvq+DpSRr12lMOVu6cghkeJqyhkYm903pvBEzkW
 lQHpu/hZ9naLkUdg2RLgQqbr6ubQ01t3kCAR39GPKXRY3Dik5sJ4CDt0q/rO0QBhpBnK
 +A8PxDu7i1EZW9QENM/oBHD1BhuAdzuFcxWZm7jsY2MPiiN65C7fXCGAcxlvFalXGi2H
 j+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716372; x=1684308372;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ljLgaaf57A126KMMOllSF/kT0Vj9S+Mosp/GL21iGtQ=;
 b=GDAceWwU5BpiUN7XunjnlRBQLLdPsWKRhK8zP4FWHp2qLPb+sWViuDMTJasEyODlVW
 AqfgGM7jajfp44quLKhwCKTMWRETzK4NN2X228nUxo+t6xpR+lcncP2o/gQwFlVuSkwE
 Bwaf++IjezYZNMTCaeyRuIsJb6alDGthhC1IGIovYYpUzz6u6PGDNp3iGzsZzbm+miNp
 kpZwBi04TZYxhPm4/Uo/WpWM/id0vC9e/EFIF0I54eKeMa2uxZabgW4fBEQ2wY5T21pG
 ga0CEIMdo2u7n7eecMefd+0rZbL+6wiUJ/M2q7zjZH19iP0SwoX+xSGRd0WBMf1QjuTb
 UH+g==
X-Gm-Message-State: AAQBX9eibPok4vZ7UbAzLFbyxpJbvwkkSoRY8acrxR3GPuvfIXxqFmWC
 TWe2ll5tYRedCq5MjLOljXIAWg==
X-Google-Smtp-Source: AKy350aXTDBhJlSS7l+PbovD5yC3f5gUBwVC4AAsGrRjVNtF3fljLlitOHnHziKqn4q7vNPxM16IWg==
X-Received: by 2002:a1c:6a10:0:b0:3f1:7316:6f4 with SMTP id
 f16-20020a1c6a10000000b003f1731606f4mr2138005wmc.20.1681716372523; 
 Mon, 17 Apr 2023 00:26:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91?
 ([2a01:e0a:982:cbb0:a1e1:81a8:1acc:2b91])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a05600c365900b003f0aeac475esm9089599wmq.44.2023.04.17.00.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 00:26:12 -0700 (PDT)
Message-ID: <e35d5610-6189-8421-2ebf-77d46c42d264@linaro.org>
Date: Mon, 17 Apr 2023 09:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: simplify compatibles syntax
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Xin Ji
 <xji@analogixsemi.com>, Thierry Reding <treding@nvidia.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230414104230.23165-1-krzysztof.kozlowski@linaro.org>
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

On 14/04/2023 12:42, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just const or enum because it is
> shorter and simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230406. I hope it applies cleanly...
> ---
>   .../display/bridge/analogix,anx7625.yaml      |  3 +--
>   .../display/panel/sharp,lq101r1sx01.yaml      |  4 ++--
>   .../bindings/display/solomon,ssd1307fb.yaml   | 24 +++++++++----------
>   3 files changed, 14 insertions(+), 17 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

