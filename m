Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237235018A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 15:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BA76EAA1;
	Wed, 31 Mar 2021 13:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD246EAA1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 13:41:09 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so18926668otb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=Ysq2futYM+aXUbEnhYTDLe/Ns9IPCloyqMjrGa/P5Hs=;
 b=r9mmESBU0gYL4Hn1grRUzXTwgh+MZfNdX0FW07t3022/MaG+jpjByVMX6nP4OImTRY
 3y+oTiSBnMmbtDcfwPkEcKy4tksJZu2bO8nFxo5k3BJ0RnK/+Y2SHaVBXRIPtlhWr3Ze
 qrc6lqkNqBDRL5aopc8s13lSIJ2CnHljJAZ1oZSS0weR21W7JGaRaQQvG6d+hsTzNGLe
 sT59tXOxn0HQttxBNd98TrpPRVf8kuGIc/OHMxV5IAdYbbgEeGP4EAwR8qz11UBBNwh+
 62wheIwWETfot9v01QymA1mYKIfk+RhEbgo/gyXrNTvB2nKShO6kVO3oSDzHIeNaHMg7
 EwOg==
X-Gm-Message-State: AOAM530EesSpY5tbAaNX+8MULpEtlItGqjypFiNK3hbu4Nln0STuS8pb
 BE0KtbRPbSQVZad7BDfRhg==
X-Google-Smtp-Source: ABdhPJzTBBb/qkQn5k2zhMOHhTWR+p65BoV9tJQb6+MMqLy1cPlSH5hPasP869gBKLq+qYaQeEzuHA==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr2738828otj.351.1617198068778; 
 Wed, 31 Mar 2021 06:41:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 38sm468460oth.14.2021.03.31.06.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 06:41:07 -0700 (PDT)
Received: (nullmailer pid 2074861 invoked by uid 1000);
 Wed, 31 Mar 2021 13:40:59 -0000
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
 <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
Subject: Re: [PATCH v7 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Date: Wed, 31 Mar 2021 08:40:59 -0500
Message-Id: <1617198059.605916.2074860.nullmailer@robh.at.kernel.org>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, lee.jones@linaro.org,
 kishon@ti.com, marcel.ziswiler@toradex.com, linux-imx@nxp.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, vkoul@kernel.org,
 kernel@pengutronix.de, shawnguo@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Mar 2021 14:33:18 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v6->v7:
> * Add Rob's R-b tag.
> 
> v5->v6:
> * Drop 'select' schema. (Rob)
> 
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/pxl2dpi: failed to match any schema with compatible: ['fsl,imx8qxp-pxl2dpi']
Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/syscon@56221000/ldb: failed to match any schema with compatible: ['fsl,imx8qxp-ldb']
Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.example.dt.yaml:0:0: /example-0/phy@56228300: failed to match any schema with compatible: ['fsl,imx8qxp-mipi-dphy']

See https://patchwork.ozlabs.org/patch/1460356

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
