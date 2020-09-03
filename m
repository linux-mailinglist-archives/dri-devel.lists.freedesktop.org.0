Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299CF25C763
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717DF6E1F1;
	Thu,  3 Sep 2020 16:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C730A6E1F1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:48:01 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id b17so3336635ilh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=91c9OrdX8+HmEgzIn/3VaO9IW3UnvjWcIpdy1+QI8PU=;
 b=OKUYY64+alSKDn6KTaBiqu3geKuWZJjGzrtA9tUKJUKPa6aplWs/d1ezjTpYOTsCYL
 RpUPsJhXnen4/N8yNTmoWcdAUnMIG0MPZt8+1J2RvajcHkFSDFlm35aSLmwd6fZuDfz/
 YrRW974MI6R4HC1HP1FKGReZ9VrM1NiHm7JyCVILsaZ3iIBbDQZdf1K2PR/GPymeyn1D
 HHJ1cm0G3GjJMOJnMCdPKgBRMtT+Ht0OklWOP/dMxeFGr4EEQ7c54kn/UbegFaOdPlDI
 Ge7t0UwwzV6zhT0aPdWdugFZ3D4KVqOoiucPwjwBzBQa4xcxeJ74ieE6a2wR/wFbRVep
 7n4A==
X-Gm-Message-State: AOAM5334m1/32T4V+BQ0vTl2ilvD4gV4qa+/88QX9K38k/pnsqYqcgvb
 AMzb+9JPHd+O3DU67mJmhg==
X-Google-Smtp-Source: ABdhPJzu8GKf6yafl/5GKeQPTiAeHvCLs2/CscMiEjp4LSMoVeMlrK0a5PKntlu3sOnYPcZxA1bTGg==
X-Received: by 2002:a05:6e02:13aa:: with SMTP id
 h10mr3896481ilo.212.1599151679716; 
 Thu, 03 Sep 2020 09:47:59 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id y10sm1518577ioy.25.2020.09.03.09.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:47:59 -0700 (PDT)
Received: (nullmailer pid 2931914 invoked by uid 1000);
 Thu, 03 Sep 2020 16:47:58 -0000
Date: Thu, 3 Sep 2020 10:47:58 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpu: samsung-rotator: Use
 unevaluatedProperties
Message-ID: <20200903164758.GA2931633@bogus>
References: <20200830113002.7080-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200830113002.7080-1-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 30, 2020 at 01:30:02PM +0200, Krzysztof Kozlowski wrote:
> Additional properties or nodes actually might appear (e.g. power
> domains) so use unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm/boot/dts/exynos4210-i9100.dt.yaml: rotator@12810000:
>     'iommus', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/samsung-rotator.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
