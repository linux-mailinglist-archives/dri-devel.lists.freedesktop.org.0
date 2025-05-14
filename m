Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40344AB6EE9
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601D10E26F;
	Wed, 14 May 2025 15:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IrXsS288";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A273210E26F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 15:08:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7660F4A609;
 Wed, 14 May 2025 15:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C29C4CEE9;
 Wed, 14 May 2025 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747235280;
 bh=jMsr9BmmdCkE0Abau89NyQKZWBTl9u7x3Di10p0ErLQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=IrXsS288P1rcLWS/VkVu7VWFpLKe+W0B7IBNPDv/SlK5ZOyMzwjwRE+WH/LgbnGJX
 bQiEP8Zjc5dlI4OtebcC84iMHhVqXtBobKBa+M4jnKDyJdb2/SseMITsI2dTDfGiOU
 GFZAJtp5k367KcBV9uvsXw4IaQJhSGDrX0DUMZtWa+yMGvT+mFVUkZ4TQ3ebaWHZb0
 EwYILOpGhGitFujf2Pm9d2IR3kwGWO7nmGOGK7l+7iIKvnsCGRxn5KMpT4QXyovHuu
 oUYLTIoAqdNHEmV2yT4HL+sB65H776f8ZWtR1Sq2ML3qP4/AOZZEzOcwsuU7FNvY4J
 xsd+re7szMYgQ==
Message-ID: <e6065744c7d70b5b93bd8f9ffe720771@kernel.org>
Date: Wed, 14 May 2025 15:07:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 09/11] drm: sun4i: de33: vi_scaler: add Display
 Engine 3.3 (DE33) support
In-Reply-To: <20250511104042.24249-10-ryan@testtoast.com>
References: <20250511104042.24249-10-ryan@testtoast.com>
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

On Sun, 11 May 2025 22:31:18 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
