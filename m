Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E15B32EB2
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 11:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6DA10E12F;
	Sun, 24 Aug 2025 09:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="stF7yeXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391F010E12F
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 09:21:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBEFA40BE1;
 Sun, 24 Aug 2025 09:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA99C4CEEB;
 Sun, 24 Aug 2025 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756027273;
 bh=TePubqI9AcNR0qwMPahOp4rbJX0w3i3fs/cTg7AxDBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=stF7yeXZ5mOGTtkj4CiErJFbaGQkPc6jD4ShIx/+320L7sJ+H9Z3hJUFPA8Sc/TGN
 bIsal3EESgk6YXHGWDGTU8Jy+zONb2NYcE8exzsll9WFvkJuYB+IKGkly+k08dlIZs
 7AFKxJ2spcI6mgUuo+TllH6K/847OR/WkpXvv5Rnb3KIZgPZ/HFLiPqiKdlREArlzM
 NcwjGukxzx8o7mC1hffG+cF9sHwu+97j8lKO+Yum/MqOvjcBeLjgpSY2vJjYEZGDGf
 5PJrptVmXakzz+3HboG8ntIaKWvWHM0BqrbzleAvHW/iZ9Jnh1A85s+iw+6j7xk9st
 lRo+aDUnlN/3Q==
Date: Sun, 24 Aug 2025 11:21:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Christophe Roullier <christophe.roullier@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/13] dt-bindings: display: st: add two new
 compatibles to LTDC device
Message-ID: <20250824-stimulating-herring-of-romance-df21ea@kuoka>
References: <20250822-drm-misc-next-v5-0-9c825e28f733@foss.st.com>
 <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822-drm-misc-next-v5-1-9c825e28f733@foss.st.com>
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

On Fri, Aug 22, 2025 at 04:34:10PM +0200, Raphael Gallais-Pou wrote:
> The new STMicroelectronics SoC features a display controller similar to
> the one used in previous SoCs.  Because there is additional registers,
> and different mandatory clocks it is incompatible with existing IPs.  On
> STM32MP251, the device only needs two clocks while on STM32MP255 it
> needs four.
> 
> Add the new names to the list of compatible string and handle each
> quirks accordingly.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 52 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

