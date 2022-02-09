Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE54B00B5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F2010E670;
	Wed,  9 Feb 2022 22:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3410E670
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:54:21 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id s24so4131759oic.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6GbViqjX2s1KVg61FHQ0TVRuw5O1ks6inA3ssFWIfJ8=;
 b=c6Nlkm9OnUvx6yT4IIAK6omt2hKOjdcpo/bQHbYJcSZhVUTh6hKWQ5dySe04psQaXi
 7rmyaN+8P/1/4FIc2gcTa1cD31VoJc66L57z0MtXw7KK6nweFF0N9Eq4B9aAJdDOfhMp
 Hb7srJ5JSGb7WJ4IBeFg+sidfzKJ17v2R5v3hxD6uaSuNTwXvjPdM5F3m1icRNbCF817
 ESrFOmCY7kHtKXMUFtwoUBQbwfVtkMnZXEopPZ8nykSVDO6ejUh3NC1iI55ZXYfiLOgr
 SuAXEQ3FECuuWwYHoF3TwiSZRtIuKS2lFLY/sOABPYcOs1ISDi7lppFLz03wXg90OMCc
 HLmA==
X-Gm-Message-State: AOAM530uqGWup2Uy2E7BtkpbZmgj2ND0E3WG+gTjHeova2ZPpoxyH4qx
 EyKj/LsXOhB+FVfifuXFWw==
X-Google-Smtp-Source: ABdhPJxTGXgRssJw2GYnmEEUbCzvymNHxtSMoA4l0QobCAsPiTRJLeonWFEGnxjf3OjpdEJjkbBNHw==
X-Received: by 2002:a05:6808:1302:: with SMTP id
 y2mr2365158oiv.308.1644447260712; 
 Wed, 09 Feb 2022 14:54:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p11sm7699220oiv.17.2022.02.09.14.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:54:20 -0800 (PST)
Received: (nullmailer pid 1099593 invoked by uid 1000);
 Wed, 09 Feb 2022 22:54:19 -0000
Date: Wed, 9 Feb 2022 16:54:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 08/10] dt-bindings: display: samsung, exynos-hdmi: convert
 to dtschema
Message-ID: <YgRGGh6MZaTM3S9B@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-9-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-9-krzysztof.kozlowski@canonical.com>
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
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, linux-kernel@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-phy@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022 18:18:21 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos HDMI bindings to DT schema format.
> 
> The conversion includes also updates to the bindings, matching the
> current DTS and Linux driver:
> 1. Add required properties: VDD supplies, power-domains.
> 2. Add optional properties: HDMI-EN supply, ports.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/display/exynos/exynos_hdmi.txt   |  64 -----
>  .../display/samsung/samsung,exynos-hdmi.yaml  | 227 ++++++++++++++++++
>  2 files changed, 227 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi.yaml
> 

Applied, thanks!
