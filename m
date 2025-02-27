Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8465DA487F1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 19:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D7710EB5F;
	Thu, 27 Feb 2025 18:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FGbhO7gH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCF810EB5C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2EBA55C638C;
 Thu, 27 Feb 2025 18:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763AFC4CEE6;
 Thu, 27 Feb 2025 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740681525;
 bh=ZEh0HdUPc37gEQdO1Yx/0m4K8N8QNoJ4XE94JSmyAUQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=FGbhO7gHJzXUFnJvil2Z/hNik5CP824c9iXnrwFxeS6bvvm065zFRSAUXn2XGChVw
 vMDYP2iEXww5CDxkLwLFmG+QVX81Zqpvf7e6oQiSmVW+Doop55Vft930CC47G2ZmAE
 XeRvCl8LlRixsPk7hr8j22yXmhrKOFMmFuMy16LmjdFPtFosmE+dYxjmkFNA6Mwkoe
 JHoUtXwxQWwAmyu+YYLKK3pnV0rbXwh152+IMJdXzuaZ4I08OvokN/a7EOp3TNT9/l
 MxoUt9KXcQPRyUlyAERV4Nwp4JT/vYyrqce4Cv4oiJId+0qUnlleaiN3LprxnmZ0gL
 p/FLINMGKEUYA==
Date: Thu, 27 Feb 2025 12:38:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Liviu Dudau <liviu.dudau@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Maxime Ripard <mripard@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20250227170012.124768-4-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-4-marex@denx.de>
Message-Id: <174068152031.3906478.5706475681847116220.robh@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-valhall-csf: Document
 optional reset
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


On Thu, 27 Feb 2025 17:58:03 +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for one optional reset.
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
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-4-marex@denx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

