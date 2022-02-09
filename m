Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA064B00DA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 00:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3396C10E677;
	Wed,  9 Feb 2022 23:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E0010E677
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 23:00:21 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so4226296ooo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 15:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fpdeZ4kmn6qEAES9MKaD0qo3YztLrmDh8hg9/+KfbMk=;
 b=p3k2UoYJyj41mI+eU6QKaMBaeh8WKElmgi4jBmsk05VXAyZNRoiXlPs2bLWLP0z7rK
 vvQj5ORpa5fyNRANQbbN/wfnOBeonq88mHA0zVhPx32ergLWrA6epP4T7ljwdLaOIOIT
 IYPywWRBkOWQEtc6ZVV/3k5KNVLAHoEujeKFl94sfWqO13rjEiEsf3HrYiXak3ko0VxL
 F8lkcj22Nm/tLQRyHAf1P4gUb52KO746Tc9HqyHTWr0BtxK8w4xZJuOmj/5cwnr0fZO/
 t8ifKgG3D04YureNNdU+0pufA76qcd+eXYes3+Cw+w8JpDnqbC569krgXBhl9ETvU9x1
 wDJg==
X-Gm-Message-State: AOAM531iSumbb3gK7/4mn/+r5uGD36CDoevX6s1rrC83djVOZ5ofztv3
 +GGW/XulCBO9aqmEwpIIUQ==
X-Google-Smtp-Source: ABdhPJyg/5tdFrGfYkHvpfJSK0OiHLVN85JRmS8cSUjQqBh7r5T+P6F/NMofLOrJYz4+0vWdYal59Q==
X-Received: by 2002:a05:6870:d4c5:: with SMTP id
 l5mr1742617oai.168.1644447620747; 
 Wed, 09 Feb 2022 15:00:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v26sm7168237ooq.20.2022.02.09.15.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 15:00:20 -0800 (PST)
Received: (nullmailer pid 1109186 invoked by uid 1000);
 Wed, 09 Feb 2022 23:00:18 -0000
Date: Wed, 9 Feb 2022 17:00:18 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 10/10] dt-bindings: display: samsung, exynos-fimd: convert
 to dtschema
Message-ID: <YgRHgg6TNjBzMBY6@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-11-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-11-krzysztof.kozlowski@canonical.com>
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
 Sylwester Nawrocki <snawrocki@kernel.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-phy@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022 18:18:23 +0100, Krzysztof Kozlowski wrote:
> Convert the S3C/S5P/Exynos FIMD bindings to DT schema format.
> 
> The conversion includes also updates to the bindings, matching the
> current DTS and Linux driver: adding optional iommus and power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/display/exynos/samsung-fimd.txt  | 107 ----------
>  .../display/samsung/samsung,fimd.yaml         | 198 ++++++++++++++++++
>  2 files changed, 198 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/samsung-fimd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
> 

Applied, thanks!
