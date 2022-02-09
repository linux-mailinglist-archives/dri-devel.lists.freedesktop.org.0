Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0384B006F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9710E638;
	Wed,  9 Feb 2022 22:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA80B10E638
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:38:47 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id i5so4127937oih.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o7EbDM3Sg4dJqZKRFYlRADRzkTEFhskqXnPZDWtN3zo=;
 b=QDxG3rq6ha/P4bDyu+NMADt0Mv9SlJmwdxih0/9DvR5NfGaKUBqn5UThXIkhiTHKG6
 6119h0UrUjYaCe9F3vJMNK0PGpNQKqNTjfXrH14DRk4W/hY9047jLlTe/UVn01aAYY68
 MKJekbXVo92kREyr+I5nMjqgiXmqcy8CmR5UgM2SaXSiIEbAMDTypjGC4eSQS6d300qw
 XjBH92BI8zkiJxE8YmDP4n/uBHCf+d5BDxizLH2c0kxIQXlYcC9g0nOGMWZ5F2XTTVNg
 nzlX+/PhBlcmmSw9mH5cZD660MM+rqRecs7tkKm+8rjgPi/SIfTkBomZ6ZXoTdIs+EDM
 SIdA==
X-Gm-Message-State: AOAM531Z5znMjiO+KiJhGfjwsKVCCshxpAGVIwksDTWiI+yv5jirnLGi
 g18tQPtSCrXl1MxdJ6kUgw==
X-Google-Smtp-Source: ABdhPJyC00fwTEI84ZbvpKeVOvCbdh3+1qBMumfSSXhULHlVqUVf+3trh4gQ4rQ7UzAVMaA66zNkDw==
X-Received: by 2002:a05:6808:2011:: with SMTP id
 q17mr2512976oiw.199.1644446326809; 
 Wed, 09 Feb 2022 14:38:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a10sm6994619otb.58.2022.02.09.14.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:38:46 -0800 (PST)
Received: (nullmailer pid 1072549 invoked by uid 1000);
 Wed, 09 Feb 2022 22:38:45 -0000
Date: Wed, 9 Feb 2022 16:38:45 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 04/10] dt-bindings: display: samsung,exynos5433-decon:
 convert to dtschema
Message-ID: <YgRCdVy5RJr7acnI@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-5-krzysztof.kozlowski@canonical.com>
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
 David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-phy@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022 18:18:17 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos5433 DECON display controller bindings to DT schema
> format.
> 
> The conversion includes also updates to the bindings, matching the
> current DTS and Linux driver:
> 1. Require "fifo" interrupt.
> 2. Add "dsd" as a last clock.
> 3. Document "power-domains" and "iommus" properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../display/exynos/exynos5433-decon.txt       |  60 -------
>  .../samsung/samsung,exynos5433-decon.yaml     | 148 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 149 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-decon.yaml
> 

Applied, thanks!
