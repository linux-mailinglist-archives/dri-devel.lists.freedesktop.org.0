Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAE33E185
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 23:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4A96E44C;
	Tue, 16 Mar 2021 22:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE736E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 22:40:23 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id w11so13216012iol.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 15:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/145PC5Hg1ww6ygBvR/0VABqWnQ0iriNEFn+CsJB+Ek=;
 b=k0mvNxsht59HKItarvCTGnV7kq4sAqNdHTEQ6T9ObZquGKIDV8CTb6Y4/DisInroGf
 2Dtx7hbZk89369pU81KDxmQExAugYAexVbfiNV6x26cq6nK4PHyzkV01f6kFeB1Ux+hj
 Jcg9RIxUzmADYrW65mHXYWp24VAngOblWLv85C5R9rO7g2a5ailDFV3BG+ypU8qM3Y15
 8cj7NYxPb7/i+hhLz64tBHuMXERwpQpt2hB+jLCdA4gBrRZ0j3WaNUjqyeskUqrt5KT4
 mpJHEvs1k2XeOh+eZ/Gev0vEkaub8Ssj3CLLGF9MMyluYPFfg7CN9FOo3U56DoiqGawr
 3X7Q==
X-Gm-Message-State: AOAM533iy94vRXfF91wJ9sWNriSZ3FCi7lRBosYWwgSAm9nr5ONA7U8p
 kJj283SYBM435/LLMFSsdw==
X-Google-Smtp-Source: ABdhPJykYzwpF/s31VOMoMQtq8It7OKYmAJNheq5ayDxQj1CfG2uZLMm4OLqHvdgxQ3LvSglP1l6vw==
X-Received: by 2002:a6b:1415:: with SMTP id 21mr5083540iou.147.1615934422755; 
 Tue, 16 Mar 2021 15:40:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id a15sm10111499iln.87.2021.03.16.15.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:40:22 -0700 (PDT)
Received: (nullmailer pid 3817711 invoked by uid 1000);
 Tue, 16 Mar 2021 22:40:20 -0000
Date: Tue, 16 Mar 2021 16:40:20 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v5 08/14] dt-bindings: display: bridge: Add i.MX8qxp
 pixel link to DPI binding
Message-ID: <20210316224020.GA3817676@robh.at.kernel.org>
References: <1615370138-5673-1-git-send-email-victor.liu@nxp.com>
 <1615370138-5673-9-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615370138-5673-9-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 linux-media@vger.kernel.org, narmstrong@baylibre.com, airlied@linux.ie,
 lee.jones@linaro.org, s.hauer@pengutronix.de, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kishon@ti.com,
 a.hajda@samsung.com, vkoul@kernel.org, robh+dt@kernel.org,
 robert.foss@linaro.org, kernel@pengutronix.de, linux-imx@nxp.com,
 mchehab@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Mar 2021 17:55:32 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp pixel link to DPI(PXL2DPI).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4->v5:
> * No change.
> 
> v3->v4:
> * Add 'fsl,sc-resource' property. (Rob)
> 
> v2->v3:
> * Drop 'fsl,syscon' property. (Rob)
> * Mention the CSR module controls PXL2DPI.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> 
>  .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
