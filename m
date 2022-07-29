Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C2585747
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 01:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA41710E176;
	Fri, 29 Jul 2022 23:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04F10E176
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 23:22:51 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id l24so4652905ion.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 16:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=0AOLCG1NTy8Zh8NrZUMZYBr5WD2rLOm1rI0WWJyHoXE=;
 b=ragBe4pqkTdK1vtymwXvXybryK4SV5ZAt9r9SCwhrIqSawRJDNi3KxL//oPAv3pdyG
 +CEgcyPiPayorxu/67spIvKbn11Yq5OJR+16fjLLgwrOkcbgCF8EVWXDeyGu7B6h929V
 4xjX3BvuM5NaZ27gXAXuMP0AEss4XaxOkcD1BaDNQQn6KXGj7vkjz3H4Sw4ZT3znomVJ
 EsmBkXRwhr1W5rI5bGKmo7w2mmH+At838WJrYuS/5UsGXVEYiDnsJEyzLT4FiK1L3rGJ
 RswOqJsWx/9mqcqABM9up2vrECFuU9ZCXDGIYHSOjrIuaBSKe09bPsmzOphG7r74FnOI
 eQGg==
X-Gm-Message-State: AJIora9xKFageajcWQzAsjfHmickztckZrLHHVaAZWhw3EVFvBeZsTLy
 IfZgJ8YPmUhQiXIQ7YhvNA==
X-Google-Smtp-Source: AGRyM1tB97C6ctbit302MqTEFIpjr4tyMng5IykEoSCRqP5gd+519HFVQRNIMVQhX575tVHqrqLmig==
X-Received: by 2002:a05:6638:dcb:b0:33f:8242:4131 with SMTP id
 m11-20020a0566380dcb00b0033f82424131mr2137232jaj.80.1659136970510; 
 Fri, 29 Jul 2022 16:22:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a02b0cf000000b00339f1d1c090sm2213808jah.113.2022.07.29.16.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:22:49 -0700 (PDT)
Received: (nullmailer pid 130433 invoked by uid 1000);
 Fri, 29 Jul 2022 23:22:47 -0000
Date: Fri, 29 Jul 2022 17:22:47 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: use spi-peripheral-props.yaml
Message-ID: <20220729232247.GA130318-robh@kernel.org>
References: <20220727164312.385836-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727164312.385836-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Lechner <david@lechnology.com>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Schocher <hs@denx.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 18:43:12 +0200, Krzysztof Kozlowski wrote:
> Instead of listing directly properties typical for SPI peripherals,
> reference the spi-peripheral-props.yaml schema.  This allows using all
> properties typical for SPI-connected devices, even these which device
> bindings author did not tried yet.
> 
> Remove the spi-* properties which now come via spi-peripheral-props.yaml
> schema, except for the cases when device schema adds some constraints
> like maximum frequency.
> 
> While changing additionalProperties->unevaluatedProperties, put it in
> typical place, just before example DTS.
> 
> The sitronix,st7735r references also panel-common.yaml and lists
> explicitly allowed properties, thus here reference only
> spi-peripheral-props.yaml for purpose of documenting the SPI slave
> device and bringing spi-max-frequency type validation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Technically, this depends on [1] merged to SPI tree, if we want to
> preserve existing behavior of not allowing SPI CPHA and CPOL in each of
> schemas in this patch.
> 
> If this patch comes independently via different tree, the SPI CPHA and
> CPOL will be allowed for brief period of time, before [1] is merged.
> This will not have negative impact, just DT schema checks will be
> loosened for that period.
> 
> [1] https://lore.kernel.org/all/20220722191539.90641-2-krzysztof.kozlowski@linaro.org/
> ---
>  .../devicetree/bindings/display/panel/lg,lg4573.yaml       | 2 +-
>  .../devicetree/bindings/display/sitronix,st7735r.yaml      | 1 +
>  .../devicetree/bindings/display/solomon,ssd1307fb.yaml     | 7 +++----
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

Applied, thanks!
