Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B084B006A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01E910E629;
	Wed,  9 Feb 2022 22:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EA010E629
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:37:54 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so4170767ooo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GQ1EzJlmJd0ZHanWZ4n0qIae0fuVJzefydO25vR7qkU=;
 b=k4k8sQSb16jsuOuG/amTwo+VOpr7PRNpBFfuw1sliGQZz+r102aWkSZP5Gwnvj4ErD
 hsx2N58Hk+YJ9+ilPqFFlDi4qKmPfPB/8bE9YQFyy19jYZme2L8gCiL82CU1oj3Qs2FC
 bfOy/s1hJXRKh963Ez1D3/fkhrwteBKyiywSaq6ofjZyryjShsLfjLbrGCBF++JviEYx
 MMGsfYKELUlX13yI1kNipldcFmCOGOkbxRMoDDmB8zXhmo1wPJ+D4bW+xim2D4tdsjwj
 uV9Nf3Vc2z3Qwvu0KaSZ3I0VSDGr+8X2bxGlkfHY8e+5LPJO/xdYBnKhI3JaHhz1W/PA
 7bMQ==
X-Gm-Message-State: AOAM5326aOuJF9UXXw+0tiVkh2oL8nF6hTXxJ61N1NsSAazeO63oNY9N
 72eMis3vnW4ZnjPw9npuzQ==
X-Google-Smtp-Source: ABdhPJxT+1Zv0qJNE+ACROtN1X/wUItX4PE/QGNxPvgeCA2Yr/Tcep23vnamSkV/AfSRHRw1HzGSgg==
X-Received: by 2002:a05:6870:b146:: with SMTP id
 a6mr1663767oal.149.1644446274132; 
 Wed, 09 Feb 2022 14:37:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id ep17sm7669756oab.21.2022.02.09.14.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:37:53 -0800 (PST)
Received: (nullmailer pid 1070995 invoked by uid 1000);
 Wed, 09 Feb 2022 22:37:52 -0000
Date: Wed, 9 Feb 2022 16:37:52 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 03/10] dt-bindings: phy: samsung, exynos-hdmi-phy: convert
 to dtschema
Message-ID: <YgRCQKqYEEzGc4+N@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-4-krzysztof.kozlowski@canonical.com>
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
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 linux-phy@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022 18:18:16 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos HDMI PHY bindings to DT schema format and put them
> next to other PHYs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../display/exynos/exynos_hdmiphy.txt         | 15 -------
>  .../bindings/phy/samsung,exynos-hdmi-phy.yaml | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
> 

Applied, thanks!
