Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C87B2BFA3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393DF10E5A2;
	Tue, 19 Aug 2025 11:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I6WTmdxO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D03A10E5A2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:01:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB2D35C5E17;
 Tue, 19 Aug 2025 11:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133B4C113D0;
 Tue, 19 Aug 2025 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755601274;
 bh=UGEMRjTBsqlULw3vbm/co9eRDP9gi0S0uyPX0lvQ2dA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=I6WTmdxO2ti6c+P6AFRq0hFKJeuNl1wFUwj0NCunRFIAIcpiYhbCXl39rX1uzzk8p
 oB5gYz/yLkDitbzhq+hzzS/ov6i4f6lfXYm8gfYf78Yj8YQctSATdeDNwnjk+P4Bgh
 TXZ6h0UT0zxfLzwhySiolmUo5sHRgZhl61Ty5XusA0xmFH/L8mxqO3Nh3h4lT/x+gj
 PPjGvvzqEB8eh57UahoNtdT05LPmExIqkehWo5qmkQK/wwF3EVtLCVQr50SHozv6L0
 ZLRYekP4w/pHX34fIfDMtoNHVeDAfe+c3JPOJQjACZGhjU/2TJoUNe6c1afwx2+c3o
 pRqIiEKcfDqPQ==
Date: Tue, 19 Aug 2025 06:01:13 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
Message-Id: <175560127037.3969097.6130940505156039734.robh@kernel.org>
Subject: Re: [PATCH v3 01/13] dt-bindings: display: st: add new compatible
 to LTDC device
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


On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> it is incompatible with existing IPs.
> 
> Add the new name to the list of compatible string.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

