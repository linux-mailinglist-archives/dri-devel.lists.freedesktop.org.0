Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582B5EF0BA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792E410E3AD;
	Thu, 29 Sep 2022 08:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBF510E3AD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:40:17 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h7so1002070wru.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:reply-to:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date;
 bh=9yCHudwWTs8iGGjOW2yzGpZ+XsTes14RKtIMcMyggXE=;
 b=YFayQv5zccBSzwC1ZnIbDUZbLsM5Aw0c4lFGDl4BO08Fpc4xl1cSeF9XXRqN5P5wBe
 rUvsdp0+jezwGpqFcH1QtaHdcASZqq7taW1fiJdA9oSjTXpvHWhdwa/CoOO9UXMZBZ7w
 577un9+SStHkbJq2UtdLIG+55k8dJPgURuKlXUvVybFvIDYQnf5aWia3bF5ivDeCRVsW
 YV0IeKrGlCWORDAyaSR278Awgf8LrUJyhCdsMhgZcEpy0rUK5tEf5qaGZAdddCm9czVw
 645Ecj0rvYLRyzmy5GTcIB6sEWkKytHF34Tikwf4yGojhiBUIuOUewdrRPhOibhw8imB
 hxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:reply-to:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=9yCHudwWTs8iGGjOW2yzGpZ+XsTes14RKtIMcMyggXE=;
 b=BXENNSBp4ft8DXAGFaImwbkNS0Be4XhAO+PMALZeX+Zkh4vgu4PcFQxeQS+K0WDsmw
 3zFLf15ljpw3ltfUMHjw3J3bB175/cS/GFiNyljNhH+j7yUprHj02A21noEU/Ij3hgu+
 OmD0zA5bBab3gSo1luc41GbBgMIlrgKiw2TGFuBLr6x1OEJjEl6fhINa1uE2+ztSN+8S
 nTPZpOC3zEoDxueUaIBITgW0JtfyCM8FhRZNbK/Ls5hl8GW05rurZViclpFIUqyT1y/g
 3mzac0eCAyzmvIFw33RdsBGWpKLcN9yuKg5D2VQMTYusPcY5yeZKiQ6wNtWzkkJjeKUo
 Rhsw==
X-Gm-Message-State: ACrzQf1eKbHqRbmUVrrPmsAJVDeh7jSIJGwJ4B8X23bvW0H8gRSSQgnX
 TlVHtIhg3UFIe7+BhbvDo0KxHQ==
X-Google-Smtp-Source: AMsMyM6dwuUJdxC7BENyYXPsQCOd+CranHMYc70MqG9BZMnC1YgoC1MsI3vRIn9cBDMtsz0FCbVOkg==
X-Received: by 2002:a05:6000:98b:b0:22c:c3b1:3f2a with SMTP id
 by11-20020a056000098b00b0022cc3b13f2amr1359248wrb.11.1664440815789; 
 Thu, 29 Sep 2022 01:40:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff?
 ([2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm3963146wmh.23.2022.09.29.01.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 01:40:15 -0700 (PDT)
Message-ID: <aaf68eff-17da-3f27-c8dc-48b9659e7b50@linaro.org>
Date: Thu, 29 Sep 2022 10:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20220929014456.30077-1-allen.chen@ite.com.tw>
 <20220929014456.30077-2-allen.chen@ite.com.tw>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220929014456.30077-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 29/09/2022 03:44, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>   .../devicetree/bindings/display/bridge/ite,it6505.yaml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index 833d11b2303a..62b9f2192202 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -52,6 +52,14 @@ properties:
>       maxItems: 1
>       description: extcon specifier for the Power Delivery
>   
> +  data-lanes:
> +    maxItems: 1
> +    description: restrict the dp output data-lanes with value of 1-4

Can't you use the data-lanes property in the first port endpoint ?

Look at Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml

> +
> +  max-pixel-clock-khz:
> +    maxItems: 1
> +    description: restrict max pixel clock

New vendor specific properties should have the ite, prefix.

> +
>     port:
>       $ref: /schemas/graph.yaml#/properties/port
>       description: A port node pointing to DPI host port node
> @@ -84,6 +92,8 @@ examples:
>               pwr18-supply = <&it6505_pp18_reg>;
>               reset-gpios = <&pio 179 1>;
>               extcon = <&usbc_extcon>;
> +            data-lanes = <2>;
> +            max-pixel-clock-khz = <150000>;
>   
>               port {
>                   it6505_in: endpoint {

Thanks,
Neil
