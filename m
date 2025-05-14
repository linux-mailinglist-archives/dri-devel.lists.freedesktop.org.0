Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C3AB6EE8
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DA910E03F;
	Wed, 14 May 2025 15:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KAVtp2mj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEE510E03F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:07:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E063CA4DDE7;
 Wed, 14 May 2025 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76F3C4CEE3;
 Wed, 14 May 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235272;
 bh=Je7z9K7ymRrYfxtdg0xKNmBIQNr0pJcc9qkLjyd7sDI=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=KAVtp2mj5jVTvUPkfQvXVYs5GBS/tfo0+4jmu/du+cJOJe816t7PMik1ZpRyi68aX
 o2aZMaDoLKyhncXAMp8odvjJpLxnlc7yVwYcZm20rtV/QCKI7zfhlM2ts5xzsy0ccq
 dYUi4qYrvP1WSsgqUZ4cWYiKQZZ4L0T9+jVtMUTy3XYYhWo/U2nTN6qBi5VnJWCq3j
 Vq0RX9/KG/qagXke2tspF1B42xo0ONN0DqFXBn6N0YXFc2FQCoTCdU/U4Yhej1HOEo
 qST+5BBXFrMOBCymjT6Xftdn959wvPiEqbXZDn6B3AmslVQkL/ENE5hjtXLIn0QD/K
 Sj9GWsgrKK7rA==
Message-ID: <4d4c8f0ec82bba6bea02dd2ec5f2dc39@kernel.org>
Date: Wed, 14 May 2025 15:07:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 11/11] drm: sun4i: de33: mixer: add mixer
 configuration for the H616
In-Reply-To: <20250511104042.24249-12-ryan@testtoast.com>
References: <20250511104042.24249-12-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>,
 "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Sun, 11 May 2025 22:31:20 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
