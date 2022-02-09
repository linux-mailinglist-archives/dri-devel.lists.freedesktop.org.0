Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F04B00D3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1B410E671;
	Wed,  9 Feb 2022 22:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDEC10E677
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:59:36 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id s24so4144436oic.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PS01IT7f00fD8ocmfo6l7+3uWA7i08pGf7Cni3oWefw=;
 b=sYBQpHv9elqF5q0rtS3+VKoSf/XL9UB50cVCBHD5DGmW1y7dN7udie9DvCdKvZ8+SV
 o9hpRe8jVUQ0M8iMMEAEidYEHzomxkUFVCiIsh5or2GG0fVw34L3hafEBdKj0EjHLkeb
 L73yDd9dn/4XF3tCn1LvCZ1+a6KbKjwKEaoxhFye0OpcLta9C4yLEcn5VXtNsbnYM/ZW
 eDRU5PHugfh3bYPfb0/uj4M/7smg3nG9mbWeXPPa9rZkMDjepeAY94abwDSGqWpdy3QF
 a31eU6Sz1KWiZwm3LWRSFPoKXcWeIBloHz7MJIweNwa8iINWqyyKciUDra56uvZ+oPPB
 kbcA==
X-Gm-Message-State: AOAM5324trfFJkOKvthM7oJT1G2ntFW6MK8wYbyWLNGHmp6wofbbhsx/
 6X1BujAn4YXGk8wbK/gUSw==
X-Google-Smtp-Source: ABdhPJwffIJTZ9p2vpY4Y+kXCCTdGMwKen87G0RMQMlsFMD0Ah/wmDmiZu3aRdaHDHjct16QO26o8g==
X-Received: by 2002:a05:6808:1903:: with SMTP id
 bf3mr2586558oib.18.1644447575874; 
 Wed, 09 Feb 2022 14:59:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e26sm7532250oiy.16.2022.02.09.14.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:59:35 -0800 (PST)
Received: (nullmailer pid 1107859 invoked by uid 1000);
 Wed, 09 Feb 2022 22:59:34 -0000
Date: Wed, 9 Feb 2022 16:59:34 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 09/10] dt-bindings: display: samsung,exynos5433-mic:
 convert to dtschema
Message-ID: <YgRHVpZ7WNgg4QXg@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-10-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-10-krzysztof.kozlowski@canonical.com>
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
 Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-phy@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022 18:18:22 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos5433 MIC bindings to DT schema format.
> 
> The conversion includes also updates to the bindings, matching the
> current DTS and Linux driver: adding optional power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/display/exynos/exynos-mic.txt    | 51 ----------
>  .../samsung/samsung,exynos5433-mic.yaml       | 95 +++++++++++++++++++
>  2 files changed, 95 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos-mic.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-mic.yaml
> 

Applied, thanks!
