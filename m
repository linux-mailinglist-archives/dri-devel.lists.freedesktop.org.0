Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E7B0848D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132E210E306;
	Thu, 17 Jul 2025 06:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QJv9PjuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694A710E306
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:06:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D0484435D8;
 Thu, 17 Jul 2025 06:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EC7C4CEE3;
 Thu, 17 Jul 2025 06:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752732378;
 bh=aRmxuhY9GAZYFHxeCY4Tp5sAKwcjqyUUVaNe8cqXdQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QJv9PjuQQKhcIFCprZLhdBWaKSP53HtIDzPb8pikdcw64kglRVhnuMOQ7JiHNX6W0
 rNVfhSLsr0+dVE6SEBPJemnI3KtXbAMRwfmtu/PsL58Q5QRF+Ti+G63PiD4sQZewbU
 nTrfDrn9d2Oh6PmMy81k/I8IJ3oyaTwiBT5EYZeT4tOvoXouZm/QBGxe3tFraKM6/r
 xC+V/X2iaJyCjpbr/1dYS5bqNliB9p9svZ5MmjfD1VRpG73i8NHOZ4uBD8SXOv9I+g
 1qahO3XxUgLLqA4JdrH+ngGQv9f9jV1FMQeQEC/VlSvxfh2GddHSZzy4gBoAMlvVyq
 zFKbw6KL/7LHQ==
Date: Thu, 17 Jul 2025 08:06:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, 
 Frank Li <frank.li@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Message-ID: <20250717-expert-seahorse-from-neptune-78e5f9@kuoka>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-4-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-4-laurentiu.palcu@oss.nxp.com>
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

On Wed, Jul 16, 2025 at 11:15:07AM +0300, Laurentiu Palcu wrote:
> i.MX94 has a single LVDS port and share similar LDB and LVDS control
> registers as i.MX8MP and i.MX93.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

