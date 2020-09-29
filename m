Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31D27D617
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 20:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92546E159;
	Tue, 29 Sep 2020 18:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A01A6E159
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 18:49:57 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w16so6621351oia.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QzGixWh04bg9LIh/RPGhJkv1YbsDDv3/7NrNdVV4KFw=;
 b=orDmNhHZbpl83YF0QNScAE3i2WaPIioYG34Ht0r/KXz7TJUxEqvSz+WUjbP+QeRn2l
 CN2O2FWzGV2ObXCP8RAymYUPs5glSRjlKA2nPwIS/hQOJgfWcZM+baHg2ongNc70kVgX
 GCwiWndrIu2PN5k9/RQZX524vtEichlP3MyjMqJILW6VFg1E34vVeutLHLJRkCOyRpFE
 lRDs4+18NvFdgnb+FjmrM4MR+Kq2YYZgZT4rkAg5+wpBjmQAqGfK0RyBIMacMQJNyXIE
 GMk9IIj3gItQy3/pD9aiE0IkcWZy6Hk44Zb227SWuGRCgiMSxOxBs/0TbX7VodfAMegs
 wpMw==
X-Gm-Message-State: AOAM533dhoJ/zzarT5mW8/gE3+/NBc5LNQmhMCVSI5QagS1gRGiAsRKa
 ajItf039HGiQHcebMzkkyQ==
X-Google-Smtp-Source: ABdhPJzRzmq51UtIoGy+jdfsj6vD1zCP8EqSEp5YN2DhPjux2qDgaYvnyNQ+F0zeoNRGnc7fGPrIHg==
X-Received: by 2002:aca:c313:: with SMTP id t19mr3483322oif.65.1601405396635; 
 Tue, 29 Sep 2020 11:49:56 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm1264421oib.18.2020.09.29.11.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:49:55 -0700 (PDT)
Received: (nullmailer pid 950170 invoked by uid 1000);
 Tue, 29 Sep 2020 18:49:55 -0000
Date: Tue, 29 Sep 2020 13:49:55 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: gpu: samsung-rotator: Add missing
 properties
Message-ID: <20200929184955.GA950113@bogus>
References: <20200923150339.12497-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923150339.12497-1-krzk@kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Sep 2020 17:03:39 +0200, Krzysztof Kozlowski wrote:
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
> Changes since v2:
> 1. Add maxItems to power domains and iommus
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/gpu/samsung-rotator.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
