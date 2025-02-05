Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D986A2857B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 09:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A8E10E745;
	Wed,  5 Feb 2025 08:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ccVYXGl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6BE10E745
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 08:26:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 25C47A43244;
 Wed,  5 Feb 2025 08:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB9FC4CED1;
 Wed,  5 Feb 2025 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738743966;
 bh=NjfUcVbPp7VNLRuemltc9018TbIE6zRT+9wxD+QPcgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ccVYXGl1fnfhmzfy5jYUxykmPuVRp1vrRMmUiy/FeNS8eiZpXwZTiHOqaM0qN0FXD
 uhVWqI+wjW5ePYBt0HJzDNKb/HXxdRQcwC/tMclIEHxjH/TjD7bkdnJKpcd5L9e4ed
 t0vjoj1btr/Ci2cauV6KlKF3sx8bC+GQp+1V3GHM+h0D4eQ+PkSmGBt2JELTCGdYH4
 m3635vDlE7NdPpYTtClqRcPCX2vHBqscsriIOwvFt3KKnoZx9EnEnwiOjZQ9xYT1Uj
 3Z6ou1ZHngdvVhK35P5Zpqyp0jY1PqbSHzO8cxa3PXo7i+z8DbUivPyFGcx1rCLg1V
 E9VXlG8tf0S+w==
Date: Wed, 5 Feb 2025 09:26:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sergey Lisov <sleirsgoevy@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-midgard: add exynos7870-mali
 compatible
Message-ID: <20250205-spirited-mahogany-mammoth-286ddb@krzk-bin>
References: <20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org>
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

On Tue, Feb 04, 2025 at 02:02:55AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870 SoC uses the ARM Mali T830 GPU, document its compatible
> string with the appropriate fallback. The T830 compatible is already
> defined in the panfrost driver, but was commented out as it was unused.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> This patch series is a part of Exynos7870 upstreaming.
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

