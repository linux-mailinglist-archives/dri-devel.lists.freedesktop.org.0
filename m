Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A71F269704
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 22:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFE86E58E;
	Mon, 14 Sep 2020 20:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927196E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:51:08 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j2so1635343ioj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HRDfI8tEIuTikQ6QH9FCFwWrHIhHqqKR/Ofl5jSpDVo=;
 b=eMKTjHqon4WEHXj/VlJ3Epl2w70/E22r5+WFUMUpnF5vA8NJl31bDJxkuZhc7YKNRZ
 dP+Sizx5mTjr2WVl/ptHObyfvT4vMNEn0CW2pbzZZoDqmETEmeuvXL5oVAYC+RwUwDay
 iq8NKrrczkD3dZ09ckCRuAVLIte91gmNvOtbzdA4GozTdwm54824jDVVNXs+to13i75H
 5NDsvouB8yXS+neL9RcHvdxt/NbdNqH6QGJiXPYtz8SF/8g6Rln7em+YkTQLrQxe/Bib
 oxCaMxURoNICp6SMsxoihXlotdH5uqQHf02d1BM8UeV1Q/fDnAdZ8RbPAGP6rJ2HO7a2
 KyDA==
X-Gm-Message-State: AOAM532FxWKqPWf0xAUTPlujFVAOeKsiMM9XQjqT+rUnC2+cmrVZmxkD
 D6lS0PKW3c4V2GfybY5hsw==
X-Google-Smtp-Source: ABdhPJya5++YS3k9G7XvhrjF9A2/hADUPddalWHaT6EsdIdHB3yr90uv2no/O2qsYqOxXvHHUz7HIA==
X-Received: by 2002:a5e:9911:: with SMTP id t17mr12761154ioj.58.1600116667734; 
 Mon, 14 Sep 2020 13:51:07 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z4sm6290316iol.52.2020.09.14.13.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:51:07 -0700 (PDT)
Received: (nullmailer pid 223447 invoked by uid 1000);
 Mon, 14 Sep 2020 20:51:05 -0000
Date: Mon, 14 Sep 2020 14:51:05 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: gpu: samsung-rotator: Add missing
 properties
Message-ID: <20200914205105.GA220369@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-4-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 09:14:36PM +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (iommus, power-domains) to fix
> dtbs_check warnings like:
> 
>   arch/arm/boot/dts/exynos4210-i9100.dt.yaml: rotator@12810000:
>     'iommus', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/gpu/samsung-rotator.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> index 665c6e3b31d3..f480174fe0d3 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> @@ -22,6 +22,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  iommus: true
> +  power-domains: true

These need to define how many. I assume 1, so 'maxItems: 1'.

> +
>    clocks:
>      maxItems: 1
>  
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
