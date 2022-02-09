Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3AB4B00AA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7950F10E64A;
	Wed,  9 Feb 2022 22:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A81810E64A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:52:06 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 4so4095524oil.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=81LsmVmsIyFRiRR0GZyYCY+f6XNSwVWGjlc1C5pOq40=;
 b=kDbv+m2i50RhXqOQwMQ5efqaZHucoiEj6n4xZsKM2B0pRzcybPFB+ozRpp8kZjc17w
 mUA+Hd++IwLT0MXeCezAEED3HIC3+lAnVOgW9T/h/0kdcsfm0sjH6+pEKGVxKi0F0NGX
 k8QEpWItcbVTiZ3ggnoDkFR46m/d0bmScSe4ksNDlMyhq0XzH8W51/bqOj0sjw+0I3GZ
 zCu76IcrsaVUN5tYNboXEvJpEBz+FKx8FqhmzNCpex8JbrfJ7sABJjdRxUitHncOOUlp
 uwDpkzCV24IAld46tvj/1yZ+275rJW6en3SVUPUax/pGKF5o+inL576NkFw3I+z3XXC/
 KmRg==
X-Gm-Message-State: AOAM531Kp4lKDjHvvjKBAT0fC+pTsqsxmaEws8U1uUDz5Jma4km0F9Rj
 xlXtQMR3RrP2nYLdEiOiEw==
X-Google-Smtp-Source: ABdhPJxhDG37kNewELAxYMxYsCIOApDp892YsjkBS8cWBqFp2a6lGLrKakiPXdho3A+kprdu+INhvA==
X-Received: by 2002:a05:6808:1154:: with SMTP id
 u20mr2513366oiu.169.1644447125325; 
 Wed, 09 Feb 2022 14:52:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 100sm7174314oth.75.2022.02.09.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:52:04 -0800 (PST)
Received: (nullmailer pid 1095802 invoked by uid 1000);
 Wed, 09 Feb 2022 22:52:03 -0000
Date: Wed, 9 Feb 2022 16:52:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 07/10] dt-bindings: display: samsung,exynos-mixer:
 convert to dtschema
Message-ID: <YgRFk12N+lLo0WL/@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-8-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-8-krzysztof.kozlowski@canonical.com>
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

On Tue, 08 Feb 2022 18:18:20 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos Mixer bindings to DT schema format.
> 
> The conversion includes also updates to the bindings, matching the
> current DTS and Linux driver:
> 1. Add clocks required on Exynos4210 and Exynos4212 types of Mixer.
> 2. Add second memory range on Exynos4210 and Exynos4212.
> 3. Add interconnects, iommus and power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/display/exynos/exynos_mixer.txt  |  26 ----
>  .../display/samsung/samsung,exynos-mixer.yaml | 143 ++++++++++++++++++
>  2 files changed, 143 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_mixer.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
> 

Applied, thanks!
