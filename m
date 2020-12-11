Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596152D8080
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 22:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823826ECA3;
	Fri, 11 Dec 2020 21:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAAEE6ECA3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 21:11:41 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id d189so11389061oig.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+QcwYARcq+TOO4C9gXJwXmDec1Cs70baMFzxTjYLSAY=;
 b=nYvUQi11OAzOChCRhjOjN+8NwPUpH6TRTMvMEIoCmT0kM0QadGmmcZW3+7bQicGd80
 vpmNxBmDh/kYcrY4Rza2ZsXM5KQLCSPhALXjst/llO14uCj/uPeKEC+XTzLHyngoyXYi
 CwNrK3mF2YKM2FEJkJJr78hwA6jBPxU0w6/Gvf9xtK2t0b/SkDTQ51+adjNfx1AJHmZ1
 xgMl58dbdApSXESWKXqaVKOjShKjxZGVQbRH5e+fxEHxq8fHxJJf0u/iyPUkoKEvIawI
 TiJrWjamX2b083g25p6fkxOUpNrX0FIXgmoHz2bOj30F7op99BGdpyIayi6aTLqB0wkC
 8XCg==
X-Gm-Message-State: AOAM532bBbPcXVqdmkoibWB06EwJXkF495b1fOiGtgsYeH2OiZVrHUzG
 2IIJsQ4vj2Lhd8uL8COAAg==
X-Google-Smtp-Source: ABdhPJwsNO3Sd0i4xG8R+1DDF1vPbIPz9yVwmkoU/5YeM2BQv7rSfZvpzd/Fdc8BXMhpv+Jn0EGnCQ==
X-Received: by 2002:a05:6808:3bc:: with SMTP id
 n28mr10918843oie.118.1607721101287; 
 Fri, 11 Dec 2020 13:11:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w40sm1636821ooi.41.2020.12.11.13.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 13:11:38 -0800 (PST)
Received: (nullmailer pid 947560 invoked by uid 1000);
 Fri, 11 Dec 2020 21:11:37 -0000
Date: Fri, 11 Dec 2020 15:11:37 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: phy: mixel: mipi-dsi-phy: Add Mixel
 combo PHY support for i.MX8qxp
Message-ID: <20201211211137.GA946445@robh.at.kernel.org>
References: <1607651182-12307-1-git-send-email-victor.liu@nxp.com>
 <1607651182-12307-5-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607651182-12307-5-git-send-email-victor.liu@nxp.com>
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
 martin.kepplinger@puri.sm, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, narmstrong@baylibre.com, a.hajda@samsung.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Dec 2020 09:46:21 +0800, Liu Ying wrote:
> Add support for Mixel MIPI DPHY + LVDS PHY combo IP
> as found on Freescale i.MX8qxp SoC.
> =

> Cc: Guido G=FCnther <agx@sigxcpu.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * No change.
> =

> v1->v2:
> * Add the binding for i.MX8qxp Mixel combo PHY based on the converted bin=
ding.
>   (Guido)
> =

>  .../bindings/phy/mixel,mipi-dsi-phy.yaml           | 41 ++++++++++++++++=
++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
