Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D725F6269
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 10:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769A810E4EB;
	Thu,  6 Oct 2022 08:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57A110E4EB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 08:16:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp15so1551621lfb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 01:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=FfDc+hEkZ6RwsaJ4+0A43rieR6v2jH+WTZvfAnZBz1Y=;
 b=VY5EY1z4bbWvQXGas+BbfF2JQm5bmRSHtb1XKkt64fbrhSp6hulWrZnHh/r7teY+p9
 +G5qYPBCmVMc5i6u1kHpqWaGS4CRnjO/7YXZ1fjDK4pjhCNzONFh8nOwmARzSFNKVfeg
 iUCW6RMzluXWlsBIkkFMXJZ1xBf2ixJLbak9i5qGWXuHR1vwA22EoeyEkQB8lllCQFI3
 K41PIq3ivmz3jf/QLe63dTa7awGdMJ61F8hKfQ9C63xF8QxgqsjTYAAGCpt6PcNTyfjz
 xBuRYy4US5IpZsdC/1rb/QQDyDi7MII3DTx00pfjYu8N+PC3hHt/paXZWqNOnqnZNgUW
 eeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FfDc+hEkZ6RwsaJ4+0A43rieR6v2jH+WTZvfAnZBz1Y=;
 b=u/+IyYpsOUv/2MfDXgsXLXKKtOL0/P7wzw8OouUK9QLWJhicwIkPmindWmabh3xow5
 iS6DL3FG94fxU1hYtKjsc6ORdDL8qIpTiPLQo6r7l5yW7okH4Rcn1HEXeWdRXpJb5S1Q
 jFxAVx3/MkVH6SN/1a2IPJ4KFIrDk8NbsQeC0qRh+0FiumqNwpmGslpYLiGfE+BROfUh
 6/PEqLYj/Gn87A8Fm3EE+s4JgKDFVcXaa3EJcT49t0L6ELg+3IZnY29zjUppvvA0kKrd
 K3eNKVnmg02MgRaW29imw0RjYFV2ss4qeaV8ALoGIEk/RPeYvp7hMo2JbmLV7fUJ54NU
 cNPw==
X-Gm-Message-State: ACrzQf2IY0WpTG/fxPV/3krBEI/hi3xwGiO6RjrYM+WUlj+PGGI2l6Gg
 GtPbpUxx3I3qD38fFdtGa/2XdA==
X-Google-Smtp-Source: AMsMyM7GpuGlUY84ykYp+oEDm2ZghpfDWhH+LgsZpb9xJ2vsDcx500yy62Ye1D2zhYbdCgSKUMhbJA==
X-Received: by 2002:ac2:4c8d:0:b0:4a0:559c:d40e with SMTP id
 d13-20020ac24c8d000000b004a0559cd40emr1340565lfl.508.1665044216972; 
 Thu, 06 Oct 2022 01:16:56 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 y13-20020a19750d000000b00497a1f92a72sm2617457lfe.221.2022.10.06.01.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 01:16:56 -0700 (PDT)
Message-ID: <94c660bc-b7eb-1aea-8ae2-0ee7993091fd@linaro.org>
Date: Thu, 6 Oct 2022 10:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20221006020444.15823-1-allen.chen@ite.com.tw>
 <20221006020444.15823-2-allen.chen@ite.com.tw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006020444.15823-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/10/2022 04:04, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a..f5482a614d05 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,6 +52,16 @@ properties:
>      maxItems: 1
>      description: extcon specifier for the Power Delivery
>  
> +  ite,dp-output-data-lane-count:
> +    description: restrict the dp output data-lanes with value of 1-4

Drop "with value of 1-4" because it is redundant, but instead explain
what this property is about. "Restrict output" is not yet enough.
Restrict the number? Or choose specific lanes? Why it cannot be
data-lanes from video-interfaces?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 1, 2, 4 ]
> +
> +  ite,dp-output-max-pixel-clock-mhz:

Test your patches before sending.

Best regards,
Krzysztof

