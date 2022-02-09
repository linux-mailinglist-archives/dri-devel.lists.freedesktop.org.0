Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26034B0075
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14A710E5BA;
	Wed,  9 Feb 2022 22:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6F410E5BA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:39:58 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 i10-20020a4aab0a000000b002fccf890d5fso4226466oon.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9LTj9g9v9fEplqwzV7DqYmU2pd1A3USTNnaU4aUzRKI=;
 b=Wogbktm9nb1CGsGOQooUQrNgp8n/09Gj6XqvsE/f0FUZe1BYtFy4qJvteyasCTS9Ae
 0pgBDzdD03aY6LaO2Ui7ls99c+lC1wnK8h/wxddu5BDCBVCraYm45DyFUDeM9IRi5AVC
 R1NERmFAYuditlSUkscwHTELcuqWSmOAqjWMgB1lUapWuhCaltLW5fwTInLfzOTOP1TO
 CpOlP8b1tUPlMn1qah2DdO4lDPkgTc0T+VP5tb5KnvhdQw62aTeLQboL04ab5f7Ngr49
 YV8ztv8VV8/fAZ48uqL5sbbPI3kyS8dGOJeUmzELU8tt4vhQ5sq3oF9Jb0iTqpnlgvmU
 OIIQ==
X-Gm-Message-State: AOAM530z/9uT5/NIdl5Vfk1CLDuZRVwgrdKW0MqJBMds6lNGbFiQlSYV
 CVA7BYVQSJmhSE8NaFxGkg==
X-Google-Smtp-Source: ABdhPJwA3fufMa0ThKPBXJGk56i5UtdHUNSFdzuPQv1ozVU8rJvBLQ8Uhfgheg5jwu54rD2fDfP8nQ==
X-Received: by 2002:a05:6870:44c2:: with SMTP id
 t2mr1742372oai.287.1644446397906; 
 Wed, 09 Feb 2022 14:39:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d1sm5282504otk.70.2022.02.09.14.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:39:57 -0800 (PST)
Received: (nullmailer pid 1074568 invoked by uid 1000);
 Wed, 09 Feb 2022 22:39:55 -0000
Date: Wed, 9 Feb 2022 16:39:55 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 05/10] dt-bindings: display: samsung,exynos7-decon:
 convert to dtschema
Message-ID: <YgRCu8I7VqMCiJtF@robh.at.kernel.org>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208171823.226211-6-krzysztof.kozlowski@canonical.com>
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

On Tue, 08 Feb 2022 18:18:18 +0100, Krzysztof Kozlowski wrote:
> Convert the Exynos7 DECON display controller bindings to DT schema
> format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/display/exynos/exynos7-decon.txt |  65 ----------
>  .../samsung/samsung,exynos7-decon.yaml        | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 65 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos7-decon.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> 

Applied, thanks!
