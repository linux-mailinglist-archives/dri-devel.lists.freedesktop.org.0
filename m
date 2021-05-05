Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F7F374BAA
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 01:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAF26EC7C;
	Wed,  5 May 2021 23:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA506EC7C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 23:03:00 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 c36-20020a05683034a4b02902a5b84b1d12so3237730otu.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 16:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5gJIQptNbwhzfSNPQQCVwvZ2lAYCY0SqfJ3dG+5h4k=;
 b=PH/lEEqEP8c8sOf0XT7DUx+9Sf9i3tjMCspsjvmdfpkgAt/BY/5R2EpvNkoWRDbk1D
 H6+KjV49HpwvtV67QXlvzmlVAKA6yDShI+4kxrx3USrDgbSvb5Q2wGY2tl31hxTkvAt6
 5S9UEepSHrvz7ZvCPHapl/IstjWCrLpCyjc8ru0do1Oz2O2zvB2qU6gVOvPan/85j4lA
 nd0auLVPiylkzVQKRlPZOp+RAAHgTBLfuXL4s1a/13Wov7Hcxibv1SOP8kyz6Bl3w+w9
 Ho1LyFFm6/3iZ34rh4gd3UM6VorzyOIzwWc0rCLvyd/24uA78s/o2rn++gTvGBowWbcl
 CT5A==
X-Gm-Message-State: AOAM530oFnOestTsVwvdDpAMi7xuf7vQGqbDKYseyG+WGJjBSQ1s0ZiG
 EkKbfOkQRLKTUvqY8DEQ5Q==
X-Google-Smtp-Source: ABdhPJwnGdYO6xivVdQOTOmieNJgXZf1cUHMK+GAA2Aak1nTUeuiCm+657685gZmMaAIiSTqypesLQ==
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr895769otp.34.1620255780165; 
 Wed, 05 May 2021 16:03:00 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e67sm126328oia.5.2021.05.05.16.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 16:02:59 -0700 (PDT)
Received: (nullmailer pid 3004478 invoked by uid 1000);
 Wed, 05 May 2021 23:02:58 -0000
Date: Wed, 5 May 2021 18:02:58 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 4/5] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Message-ID: <20210505230258.GA3004449@robh.at.kernel.org>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
 <20210428222953.235280-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428222953.235280-5-sebastian.reichel@collabora.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Apr 2021 00:29:52 +0200, Sebastian Reichel wrote:
> Document the compatible for GE B1x5pv2 boards.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
