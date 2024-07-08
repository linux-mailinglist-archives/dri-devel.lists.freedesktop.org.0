Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F892A791
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 18:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433ED10E0AC;
	Mon,  8 Jul 2024 16:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D3d6P2iJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F1310E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 16:47:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D9B0B60EAA;
 Mon,  8 Jul 2024 16:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C90C116B1;
 Mon,  8 Jul 2024 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720457259;
 bh=VHvm2D3xsSEmwhh+btt7E0FxJz3widPba7++CMSHLQE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=D3d6P2iJU/gosDUr6HODB+GG4Cc7+yOYSEC4NwlKdiNkou68LahgTgitDx/mff8qs
 IL/Yj7XLzrMrxD4q1APndxB8mAqE7U5aKw1KvCVRyiAZqiQZ2Xd8rhxNcu9Blmmldh
 scF/wUab8KNLcKuz78/taVhnsPXU8Ngn5nJaw1ZMy1Wqj4rqTEgHxMJb1zs0touTRp
 CaIW6HQYT62OFvXoTM8QEtbTie7fTxkcxR23mVhaUQLgLKn6RsqyfmhS9zhjUD0SAU
 P3FQaPx8XqU7/uUeCW++FURI73QKLhuh+x29smXSBrJlfpdQ2Ym1RLvGy5ReoadrAS
 K6n3UagFqsY8w==
Date: Mon, 08 Jul 2024 10:47:37 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: stefano.radaelli21@gmail.com
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, "Noah J . Rosa" <noahj.rosa@gmail.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
References: <20240708151857.40538-1-stefano.radaelli21@gmail.com>
Message-Id: <172045725750.3389992.15451403448241421795.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: ti,sn65dsi83: add
 burst-mode-disabled
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


On Mon, 08 Jul 2024 17:18:56 +0200, stefano.radaelli21@gmail.com wrote:
> From: Stefano Radaelli <stefano.radaelli21@gmail.com>
> 
> It allows to disable Burst video mode
> 
> Co-developed-by: Noah J. Rosa <noahj.rosa@gmail.com>
> Signed-off-by: Noah J. Rosa <noahj.rosa@gmail.com>
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml: burst-mode-disabled: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240708151857.40538-1-stefano.radaelli21@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

