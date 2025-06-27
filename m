Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7EFAEC22C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 23:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4DE10E0A6;
	Fri, 27 Jun 2025 21:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dN9mwFeZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CA810E0A6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 21:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB6E843A4C;
 Fri, 27 Jun 2025 21:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AF9C4CEE3;
 Fri, 27 Jun 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751060464;
 bh=3oXq16alLr2nxtGsTFfoEGRR7gxgyYoWYgqZxLOZzs4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dN9mwFeZPT7JwxGHE4dWUQZAF4GxPqyzFm6eryAnlLNFZfVVNmi5QK5zjzBA+Th5d
 g8o++TJeOe0lEoTkudPKFxP56TyZhhOZzukJM2aKk9x+DswgJkBhwdQ9B11aba7Cn/
 +u5ifsFlNcp5adThOkEIEtfjxVQzC+xR0979KalprhiA81vf09dK4ZFhQkR5+CKObq
 SIZOV0orxaK+5EfL0Moe5tQJgH41RsGfAuw6lEOlYRA4qAJYT20xMOmmaUGu6LW3rA
 RM6Zi5c1orSB3VPQCpNW7Bj5DvLK2ujsGgRYfs7KeQDDJIaa9e8HGDOV3ya1mn9BSX
 pFawy5P3w3uvw==
Date: Fri, 27 Jun 2025 16:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jonas Karlman <jonas@kwiboo.se>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
Message-ID: <175106045083.188354.11616800580280221197.robh@kernel.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
 <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
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


On Fri, 27 Jun 2025 01:09:00 +0530, Kaustabh Chakraborty wrote:
> Add compatible string for Exynos7870 DSIM bridge controller. The
> device requires four clock sources, in schema they're named as "bus",
> "pll", "byte", and "esc".
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

