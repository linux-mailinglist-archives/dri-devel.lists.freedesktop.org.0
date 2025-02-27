Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBF9A487F0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 19:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D489B10EB6F;
	Thu, 27 Feb 2025 18:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K0dFvaV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9006510EB5C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:38:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4821A61F45;
 Thu, 27 Feb 2025 18:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333F6C4CEDD;
 Thu, 27 Feb 2025 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740681527;
 bh=Z+caVF3WAY2knsCtcAjSC7EXLJEDrKmetnCISZqADto=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=K0dFvaV768MG9I4/TmzvJjYmxtETOpnaffL7ns6oEJdi9HKOEQhS2q1IUraAj8j01
 0JghJJYNPVjxMmyMwljsL/Md1nqoABcOmYcB5BoCHyAfkoaXYOHycTOtiTZKXlKdav
 /F3bwBTVyEzTIvkC16xSMH1yDWfricDLqixMLDW0b3nTxyyS11BznZMoOJ+Zu/UIgg
 gMJ2SBNeHE+K32sVE9vQqTny0c1g2+ROndctN6sogrT4ha7JVb7HOiz3KvyKYhdS7E
 chcUldFeBAS6npmMbclOBoILZHrMLz6TFlYRUd1F9S8LBPJqjxe0In/+s27POxoCfm
 F6x2H4O24GVxw==
Date: Thu, 27 Feb 2025 12:38:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-8-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
Message-Id: <174068152164.3906545.6393185343383919273.robh@kernel.org>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX95 support
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, document support for this variant.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

