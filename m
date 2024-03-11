Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E087878673
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D19112BC4;
	Mon, 11 Mar 2024 17:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cX9H46js";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD68112BCA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 17:42:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3A35CE1252;
 Mon, 11 Mar 2024 17:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7E7C433C7;
 Mon, 11 Mar 2024 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710178949;
 bh=TOmNFqdlEX5eUciRb+hCt2fH1EdaZIZ/19dwpuQ7yR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cX9H46jsv/qMGAFYT+F0QsCE2NSRwHon+tUf7M2uQPrMLIr1ogZmBNBonbfniFje7
 chpPKgJPAaq3aQmuMhvRgtYN0515QtnDOok+WxryHtWMICoPzIqjL+ILBlBRW21wQV
 mPjKZy7aNNeYHMnLI4iGiF7WymKK6dv3UUkCqkgwyM/pTX8BR5ELnD36NvDQa0whsU
 tJwkVD3Vy+7uBdtw8rayFoGcIaUhpPg63YASuaE6/5rBzxaL0mPVF91r3PGzhFA0gB
 dgRbzk12QhjFmNyXC9ro2zcUpspESpSFfW93AujKPG3P0Lcx7Fqg292uhbX7HOkATP
 VLh6sbW3TtXTA==
Date: Mon, 11 Mar 2024 11:42:26 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Chris Healy <cphealy@gmail.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/12] dt-bindings: display: imx/ldb: drop ddc-i2c-bus
 property
Message-ID: <171017894651.1474788.10522684449729794066.robh@kernel.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
 <20240311-drm-imx-cleanup-v1-2-e104f05caa51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-drm-imx-cleanup-v1-2-e104f05caa51@linaro.org>
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


On Mon, 11 Mar 2024 13:20:10 +0200, Dmitry Baryshkov wrote:
> The in-kernel DT files do not use ddc-i2c-bus property with the iMX LVDS
> Display Bridge. If in future a need arises to support such usecase, the
> panel-simple should be used, which is able to handle the DDC bus.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/imx/ldb.txt | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

