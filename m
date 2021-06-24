Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662D3B277B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84C86E83B;
	Thu, 24 Jun 2021 06:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994576E83B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 06:35:59 +0000 (UTC)
Received: from mail-wm1-f72.google.com ([209.85.128.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwIxx-0004li-Ou
 for dri-devel@lists.freedesktop.org; Thu, 24 Jun 2021 06:35:57 +0000
Received: by mail-wm1-f72.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so2635899wms.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R0aLcGzQ8alnnx9N3rRdFLtO2M7ctE9WWithaXsLLWI=;
 b=OIJRQlhK20WIVBgJfEPb4nT9O7Gv30aBKQYobT0aPZKwfGHkrxltTWGjqNZVd07QHB
 uWNsvH6dVY2S58Oh3Dkvo1f660k5g30F/XPUbQEOd7zzTswjgLIelcFWp10EmSgsz9fC
 6r3j++s5xtyQyGaqKewYVGJTd6ZrboSlN1qLVmOXJyH3vS/xPVUoXs/j4+A2wErkhoQ1
 Z2E3/FS77J5VPQ7h1zUqGOtpJJEDuFu0eyVOlb99yxjjKXjTu5RTc1qPJ1CbCHWqYx1D
 8YRJ43pZYfYJr6Hnne57Q68hgSvenlyy+VbJu0NEPO6x5H6iUJBgW0MvEQ0LQfCjAaAe
 0vpQ==
X-Gm-Message-State: AOAM532c/cAoLOunV746XbBC/ifl0oLxyD3Uo62po+Liabdvhm2VgBcg
 KBnVIV2JsgXxOIc2AVHKwckV47oqCWSWoAjfgD/o9yIMmFOaooZ6Mk04j91hjWcaU0L43DnIvUI
 i3JKE0LgaMb6YqeCRnvRGWDS5ytZkKan4zXQFhVTI23Avow==
X-Received: by 2002:a1c:a597:: with SMTP id o145mr2277264wme.53.1624516557585; 
 Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7R5Kid8X3SyYMWnamWceIwi3ZiQ7MY/ZL5RhUroHzBxtla7y73sqnE4+q/iG5Y5wgPNqwng==
X-Received: by 2002:a1c:a597:: with SMTP id o145mr2277246wme.53.1624516557384; 
 Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id m184sm1893490wmm.26.2021.06.23.23.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: Fix 'unevaluatedProperties' errors in DT
 graph users
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210623164344.2571043-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0fbde9aa-03c1-0343-3b6f-5a7945fd8df8@canonical.com>
Date: Thu, 24 Jun 2021 08:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623164344.2571043-1-robh@kernel.org>
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
Cc: linux-renesas-soc@vger.kernel.org,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2021 18:43, Rob Herring wrote:
> In testing out under development json-schema 2020-12 support, there's a
> few issues with 'unevaluatedProperties' and the graph schema. If
> 'graph.yaml#/properties/port' is used, then neither the port nor the
> endpoint(s) can have additional properties. 'graph.yaml#/$defs/port-base'
> needs to be used instead.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/imx258.yaml        | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/renesas,vin.yaml       | 3 ++-
>  6 files changed, 8 insertions(+), 6 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
