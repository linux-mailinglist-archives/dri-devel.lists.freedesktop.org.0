Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FAB2BFAD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DEE10E5AB;
	Tue, 19 Aug 2025 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cp5P3C4I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF410E5A6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:01:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFF2846258;
 Tue, 19 Aug 2025 11:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A42EC19423;
 Tue, 19 Aug 2025 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755601278;
 bh=RSjFfaJWxUYQblpzPRCwMN+MZXg/TH5y7U62UV8jFM8=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=cp5P3C4IVS6iImCXa6xcb0aPNk5MNB5mhhBh10d62W9vpZ3DmjcPwhOt5bGtPU1H+
 BNVWxQMnikIbNxmGUlor/Amk9Q02NvfgtdSv4gR2otc8I0dUD/qv6wPBG2FafHzbkF
 DqJ36yLq5vqz8ev9x8//SIt/8yknzeJOdYFZ/TvTxpUSMnoxGy6y5elLzShe2Bl7j+
 3Kx5JFTSjJ89Kmau6tYlg2TC081JeLmkmI7XuhgHspo/JqseGEpWtiJzvixKrhNpQv
 fRlDv0wXKLpN2OtT18gOESyulrv/YKsr1H12SrdmI5qW4MBNXQ+P30s6nQU3REeTFl
 9NMUlIKWhPTcg==
Date: Tue, 19 Aug 2025 06:01:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-4-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-4-04153978ebdb@foss.st.com>
Message-Id: <175560127211.3969200.8967459930007695197.robh@kernel.org>
Subject: Re: [PATCH v3 04/13] dt-bindings: display: st,stm32mp25-lvds: add
 access-controllers property
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


On Tue, 19 Aug 2025 11:15:57 +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then
> check the peripheral accesses before allowing its device to probe.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-4-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

