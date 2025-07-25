Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F564B124E4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 21:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E3110EA0B;
	Fri, 25 Jul 2025 19:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oxp9UEfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72810EA0B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 19:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A61C95C5EA4;
 Fri, 25 Jul 2025 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA87C4CEE7;
 Fri, 25 Jul 2025 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753473032;
 bh=6lY6UGRDx8pQqm2Sb2XSSnUUQnx59WVl3IMojaG/Ruw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oxp9UEfET5NaqA86+frV0GpYesrm5a6+Y91ObXxbH/l3ZMs8itaYumIF4kJ262fui
 f2JZ7SK43n7wt6+w7fB6MND3aDzqMst07G5/AmDUVIusijI0gwZFKPS04db+yGZ5z/
 C1Bum5jGv372JMKCMeSVyzfYbUEkIwTVbpmjB4qUM3hm1y2RSGGZjGHfkq8S8Z7IR0
 0bCYDOArJfhVtXL723YvFzRR2U32j+hXNLIRPYe02YwpnMkkaVs/P2RPcPt5DssKor
 3BPb7ZjZvWk08y9FE71kJUgyYZPR8N2AlauH73m3hFUzaRGj3q/LyLoGfJa0PPOMSj
 j1QAIkSAe23cg==
Date: Fri, 25 Jul 2025 14:50:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Will Deacon <will@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: display: st,stm32-ltdc: add
 access-controllers property
Message-ID: <175347303098.1735273.16989682825723022280.robh@kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-drm-misc-next-v1-2-a59848e62cf9@foss.st.com>
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>

