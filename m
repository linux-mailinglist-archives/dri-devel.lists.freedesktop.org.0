Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B13B11E44
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 14:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92A110E9E4;
	Fri, 25 Jul 2025 12:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tok2lSwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2913D10E207
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 12:12:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB0AB445B3;
 Fri, 25 Jul 2025 12:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B7AC4CEE7;
 Fri, 25 Jul 2025 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753445545;
 bh=1KrjuWTj/BAGpJTBOQ4VNJ8knTL5uEp25bM6bJplq4M=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=tok2lSwBDH1X8yR9/Jc4IVbBIYqpjB0vyEjB+bEiKaiiebGkT7FP9crn6eZ4iBPRe
 kdOuy8MUsvnb5CGblr7NIZtTChxBOgisYpXP/PjMTDPbaUTCuOLWNwjWbbti5GORCT
 DPJ9xpHnsUYIHIzzfmpzF0IeRK6hRvfT7IuYW35pl5Nh3QR2nNF87TjPA3iNhg0y58
 SNsRGnzVtikyWO212cXdPOFGc1acTFvcXLSlRD0c12YK65dXK/PsYUVSIXEaVoUcWC
 4GWZLyem7jzBUIAOi93jQD1SCc0j6m5h0mm1QrwpumtXI7BuFnLcV5u80+uL+Aq2KC
 PLmab2yoKcjMg==
Date: Fri, 25 Jul 2025 07:12:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Will Deacon <will@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
Message-Id: <175344554361.803254.9739669006063034292.robh@kernel.org>
Subject: Re: [PATCH 02/12] dt-bindings: display: st,stm32-ltdc: add
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


On Fri, 25 Jul 2025 12:03:54 +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then check
> the peripheral accesses before allowing its device to probe.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml:81:7: [warning] wrong indentation: expected 8 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

