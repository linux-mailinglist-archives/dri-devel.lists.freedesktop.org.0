Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6901A67F70
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 23:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8C110E4D3;
	Tue, 18 Mar 2025 22:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lPujRcx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFF110E4D3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 22:12:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 134E45C5634;
 Tue, 18 Mar 2025 22:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763E5C4CEDD;
 Tue, 18 Mar 2025 22:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742335950;
 bh=Szgn5zvrgXbGVWttIa/7SboYv0mHq0U18NfPj4QaSyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lPujRcx7wt+IOsqcSHSwagpWIian9rJ43UJJMFZXlMDF3zerLYtehCwAxSu53aQyr
 tP+IVVbcHdoqKk/kDdjmWQ7Y9YolyKSUT5syDI+MryESl1F7wSJtbB/Sm9bfhqWd1F
 AXyoEnarwk9GpgiDbN5MKhpYmC4cm0sZhjCamLoXHcZInzzxCs/w6aw54MSCz3V2sE
 eEYHtGjpOOiZ19GLhTVckQbQRofazOXL+uSuUW7dcPwdrpJbgmNa8d2BJURBzV5mjH
 rJbIXNGErxDY8qGd43RLg8KSL/LO3TxzBUpL9pdDzDCQmcL9fFNfer27aOmKIw8/0C
 g+47m4eJSqMDQ==
Date: Tue, 18 Mar 2025 17:12:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpu: arm,mali-midgard: add
 exynos7870-mali compatible
Message-ID: <174233594629.4044838.965706425062686695.robh@kernel.org>
References: <20250318-exynos7870-gpu-v2-1-58dc2094dc7f@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-exynos7870-gpu-v2-1-58dc2094dc7f@disroot.org>
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


On Tue, 18 Mar 2025 23:01:09 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 SoC uses the ARM Mali T830 GPU, document its compatible
> string with the appropriate fallback. The T830 compatible is already
> defined in the panfrost driver, but was commented out as it was unused.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> This patch series is a part of Exynos7870 upstreaming.
> ---
> Changes in v2:
> - Reviewed-by krzk.
> - Link to v1: https://lore.kernel.org/r/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied, thanks!

