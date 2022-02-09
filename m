Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA924B00A0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F0510E63D;
	Wed,  9 Feb 2022 22:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491910E63D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:50:02 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id v67so4092263oie.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WffXTGUWmaJ7sTpJG2IxQlCthN1RWy2Bou30UXKrVTo=;
 b=TMkI+cLANEN6DtzrCAzRo253LbiCUHH0iWkYcDoUSgmq9lAVi7Pd61TKwPBNIG/YWF
 AbJyZwhWnrPWFVn0+YhzUwL+K18pTOPCbYgSiMu1SmP49tX2V4KowIcPhPGm0RVG73Ho
 BHAECFFsffqhr61z4NtmdmohaKeGBIquvkyHvdO5qsCrzpuahAh95ag2j44e2NvfnjI+
 B6UJiD1vSaKu1rC6TWUz9OCW6pw3GpbVvsMoQAXjHVq5o8l095duwq3+l5C5fkjfgtDY
 lhvXNQ8ffZQvTU+ZXAXHdv5lSPE4jKVIPIh3aluX6uspqoduKAUO298qpRsT7UV0U/qx
 DdEA==
X-Gm-Message-State: AOAM5321ZGNxKdqvgO6jf1hjv6eDWY4NtWg2iiizKG0OvN5in1QtBk6A
 Olic2CSpA7ataRInJqlhwA==
X-Google-Smtp-Source: ABdhPJx8mqDeUisKN1aZZaSd6vum38tFuwaTd5L7VHbg0gs7E9FGeM7654sTp6Au28nfs+jCy+Tauw==
X-Received: by 2002:a05:6808:d4a:: with SMTP id
 w10mr2153365oik.192.1644447001335; 
 Wed, 09 Feb 2022 14:50:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e16sm7174776otr.11.2022.02.09.14.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:50:00 -0800 (PST)
Received: (nullmailer pid 1091386 invoked by uid 1000);
 Wed, 09 Feb 2022 22:49:59 -0000
Date: Wed, 9 Feb 2022 16:49:59 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 06/10] dt-bindings: display: samsung,exynos-hdmi-ddc:
 convert to dtschema
Message-ID: <YgRFF899BNPaZE5F@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-7-krzysztof.kozlowski@canonical.com>
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
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-phy@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022 18:18:19 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos HDMI DDC bindings to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../display/exynos/exynos_hdmiddc.txt         | 15 -------
>  .../samsung/samsung,exynos-hdmi-ddc.yaml      | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml
> 

Applied, thanks!
