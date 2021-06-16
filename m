Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8648B3A95AE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 11:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A002A899E6;
	Wed, 16 Jun 2021 09:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4F899E6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 09:13:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c84so817724wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 02:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SaggZmX/lG1HeeGQ7jaHgJkl0OaJmKdrHUxV02jnTSk=;
 b=OdCsvj+uhQdLeM2ANSQgk6juWlEkmUevIFVQlRLZ4GcS2GcoO4GIiQlhnf88dwOuCN
 pGzkdfUZDHxa7WbFHq8KvOcY3sh3tKoZ4EOWAiT4N0QI1tzFdI1Kmrx8zJEp3ISGwTj5
 WymsRX1UTyhTO5IuuOkRevzof85lAUXJnB6C2pxED8LZMsCmeVKlKZQhswfnIan/soRE
 pdh2t7Kj1vtwsssK9cSbS1zmwZjLJWgQu9ziXpOQAcDVlh1KDEMYbpAn8NNygul/IcDp
 W93lVuS6hAgqgsBMTSDt3ElH22/XpFhwriU/6lpR4kG1knQZE90gIHGjcVyutLWBQ0nK
 wOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SaggZmX/lG1HeeGQ7jaHgJkl0OaJmKdrHUxV02jnTSk=;
 b=EVQ4UZribl8UPP93bhRJ18cefFPXA9RVD/jRJ7Kyo+54NfjXls0oYkw7Ufl5OlBuc7
 NH1kXZf3vjsAqnVOqfii27g4VNFl80aS7N1YjjBLNdEMUJ9bSP3pMZoDofBcfnc4qb2j
 /ihPp1pWY2qAbSvHGjWUM8Z9KVUOy7PDNVucob4XWD3wv+AM3A2xIynD3lyspBrayGgE
 tTyAiX9UGy7YVbtENRRb9Ev3LJBuI0fDWI3hXbpSHESaLkokemZ9rCpkxA1McBvOqPqM
 xsefkbmJh9XD7kABRjvw1rl+18+2fqyR9TqCwmXUJD2QVapTTXp/GVe55hlBjhJgDQyM
 dy6w==
X-Gm-Message-State: AOAM532d4pheRJXS17B3g7oMKM52/AdzD0ullsMUaWZGHy2crcaGkhYa
 9lKjC+c6xeJvFcU9oQC4BbH4dHKcz0ilVJB9
X-Google-Smtp-Source: ABdhPJztbmuYlsz5TjlnePavUoEstq9jKdo1I+SAtvRTicDQ0YWMer9MuchlxZTuIzgXLB2HjBP3+A==
X-Received: by 2002:a7b:cf2e:: with SMTP id m14mr3946326wmg.111.1623834808933; 
 Wed, 16 Jun 2021 02:13:28 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1dbd:a958:ade:3ee6?
 ([2a01:e0a:90c:e290:1dbd:a958:ade:3ee6])
 by smtp.gmail.com with ESMTPSA id j18sm1480344wrw.30.2021.06.16.02.13.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 02:13:28 -0700 (PDT)
Subject: Re: [PATCH v8 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
 flags
To: dri-devel@lists.freedesktop.org
References: <cover.1623725300.git.xji@analogixsemi.com>
 <75faf1744b7857508fa21578e21208216561e82b.1623725300.git.xji@analogixsemi.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7d7a6260-78b8-3b84-ab66-1fc9a5cdea86@baylibre.com>
Date: Wed, 16 Jun 2021 11:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <75faf1744b7857508fa21578e21208216561e82b.1623725300.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On 16/06/2021 09:48, Xin Ji wrote:
> Add 'bus-type' and 'data-lanes' define for port0. Define DP tx lane0,
> lane1 swing register array define, and audio enable flag.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 57 ++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index ab48ab2f4240..9e604d19a3d5 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -43,6 +43,26 @@ properties:
>    vdd33-supply:
>      description: Regulator that provides the supply 3.3V power.
>  
> +  analogix,lane0-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 20
> +    description:
> +      an array of swing register setting for DP tx lane0 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,lane1-swing:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 20
> +    description:
> +      an array of swing register setting for DP tx lane1 PHY, please don't
> +      add this property, or contact vendor.
> +
> +  analogix,audio-enable:
> +    type: boolean
> +    description: let the driver enable audio HDMI codec function or not.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -50,13 +70,43 @@ properties:
>        port@0:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
> -          Video port for MIPI DSI input.
> +          MIPI DSI/DPI input.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +              bus-type: true
> +              data-lanes: true
> +
> +            required:
> +              - remote-endpoint
> +
> +        required:
> +          - endpoint
> +
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:
>            Video port for panel or connector.
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            type: object
> +            additionalProperties: false
> +
> +            properties:
> +              remote-endpoint: true
> +
> +            required:
> +              - remote-endpoint
> +
>      required:
>        - port@0
>        - port@1
> @@ -87,6 +137,9 @@ examples:
>              vdd10-supply = <&pp1000_mipibrdg>;
>              vdd18-supply = <&pp1800_mipibrdg>;
>              vdd33-supply = <&pp3300_mipibrdg>;
> +            analogix,audio-enable;
> +            analogix,lane0-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
> +            analogix,lane1-swing = <0x14 0x54 0x64 0x74 0x29 0x7b 0x77 0x5b>;
>  
>              ports {
>                  #address-cells = <1>;
> @@ -96,6 +149,8 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> +                        bus-type = <5>;
> +                        data-lanes = <0 1 2 3>;
>                      };
>                  };
>  
> 

Please split the patch in 3 between:
- analogix DP tx lane0 lane1 swing register array define
- audio enable flag
- port properties

Neil
