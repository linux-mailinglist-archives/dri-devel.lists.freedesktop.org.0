Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364476BE96F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D14E10E366;
	Fri, 17 Mar 2023 12:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4427510E366
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:38:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x13so19849659edd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679056693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ieazCt2VSnmnZGU95p6J0fsPaC9JLJVb1N3OVs1/cl0=;
 b=wWm92anBEh5LJKqIt11EWk8LOC6uQMCTPlNDhESr9AByn7qv7i10LEhfT2+27ABv4X
 oVhyfgQFosdO3SGAKXDB4xLIbhIp1DAXDFNu9+vDlKHisyMVe/MVX4wlteE21O4IdHyF
 2MaDQ6NoVjZVSvDAJEuinunyBkf9JCEqu1L4rUiO55egC0EqoUrH+jwa2T9YsSOmyxM6
 e6egpVHFb57LQ2q/8w1CPNPJYjwIQBBTI5FuVR7YR+y3o9XEigW32n/pgJPj3J8TdZ6+
 4/1fY4SXxgu4fwsN93Jee/F6x/S2n78zutVYPRUvmp9MJ6qNvaYPvYAk/iv6orVy0Wg9
 tJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679056693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ieazCt2VSnmnZGU95p6J0fsPaC9JLJVb1N3OVs1/cl0=;
 b=0L0DpOA1W+KI7yf1MJUSh9F3CL2h+CW6iXNJ9L3M/c0lxt2HDf9rJTaq9jMX/54Wa8
 zhCjlPN/jDVvixFqq+GjJqIYYOGusGeLf4PbldANzg8FGcXz2KMT92fYYO5us9zf2rom
 Zjud+OurjgrK6qNZfMtU7nRp/mGtJSZdhnt3I0KA169OaZ++nXEK5jJ+AxX3zDu+gkNt
 3w5WZbcy7CKXHtD2QOG0c7+bMZ7wT9gHIsd/Grq++cuZVYsynp9seH4t6h4hCWxORK9n
 iRdVa5CeDLXJJtflSwiyBEA2tGuNdmDqGM/9btlw0f0mDCTQyn16sgFoJ6yl9+KZ+d0k
 a48A==
X-Gm-Message-State: AO0yUKVhhg82DHguGRAsF9Kqmk16XbewTgF8PPu8eE+h97LRRFvXA5Fq
 eLb7wUFUA2CFyzDgYW+gsvBWLg==
X-Google-Smtp-Source: AK7set+1PvvGYbX0zTdWZ0gf0CuuqjXnelxeVybKsKLfgomNgbJ0antRXviNxYHV7QkozPwqUu1Hsg==
X-Received: by 2002:a17:907:c304:b0:8ae:e724:ea15 with SMTP id
 tl4-20020a170907c30400b008aee724ea15mr13960431ejc.76.1679056693686; 
 Fri, 17 Mar 2023 05:38:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d013:3eeb:7658:cec?
 ([2a02:810d:15c0:828:d013:3eeb:7658:cec])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a170906b00600b0091f58083a15sm936500ejy.175.2023.03.17.05.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:38:12 -0700 (PDT)
Message-ID: <dbc43c09-f8ec-f877-598a-adff47d44b0e@linaro.org>
Date: Fri, 17 Mar 2023 13:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add no-hpd property
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316140823.234263-1-j-choudhary@ti.com>
 <20230316140823.234263-2-j-choudhary@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316140823.234263-2-j-choudhary@ti.com>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, jani.nikula@intel.com,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 alexander.deucher@amd.com, yamonkar@cadence.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com, tzimmermann@suse.de, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2023 15:08, Jayesh Choudhary wrote:
> From: Rahul T R <r-ravikumar@ti.com>
> 
> Add no-hpd property to the bindings, to disable
> hpd when not connected or unusable
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index b2e8bc6da9d0..69d381195218 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -57,6 +57,12 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  cdns,no-hpd:

There is already no-hpd property.

> +    type: boolean
> +    description:
> +      Set if the HPD line on the bridge isn't hooked up to anything or is
> +      otherwise unusable.

It's the property of the panel, not bridge. Unless you want to say that
bridge physically does not have HPD? Does it follow the standard in such
case?

Best regards,
Krzysztof

