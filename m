Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D845ACAA49
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E110E2AF;
	Mon,  2 Jun 2025 08:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="igZtv5ly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5806110E487
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 08:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9D4D5C5A4E;
 Mon,  2 Jun 2025 07:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E2AC4CEEB;
 Mon,  2 Jun 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748851213;
 bh=umrm4OPqCUR6IKXG+EjkwiowxcFgqtY7vo6Ql4O92rc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=igZtv5lycita2pdB9vUCKQn5Ot2DDWRDKERLJ/3TdR9WcUbz3l4FEY91MH2aVk7uI
 edvI/pA8tUlZMo4dAKcfrwiObxreKUQT0dGoA8oDU/N4/zwzLqIBV6A9WnOalg9qkA
 9EPR9NPgJJxm+Y6DstkM0RFi+VYklNuZlrhde3ulzBaa3/jx2DfjN4CX//Rh/1ynCQ
 QE+mm77FGxt8gapFwpn9Nnc/FjNo5aLqy45j+oZd8WS5JfZ36OolJe2nDEtG60thsD
 EqnIqofYBnHtlea6WcL0RlcQyj+Lx1WDsRxAFepYHUySKK/jjNAIBQct6ELQFmJLYM
 gTbTROOWoxawg==
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v12 0/8] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Mon,  2 Jun 2025 10:00:09 +0200
Message-ID: <174885120812.425793.9126435244511372625.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528092431.28825-1-ryan@testtoast.com>
References: <20250528092431.28825-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 28 May 2025 21:22:05 +1200, Ryan Walklin wrote:
> V12 of this patch adding Allwinner DE33 Display Engine support. Just a single change from V11 to add missing documentation for a new sun8i_mixer_cfg struct member, and add Reviewed-by tags recieved on the previous version.
> 
> Regards,
> 
> Ryan
> 
> Jernej Skrabec (7):
>   drm: sun4i: de2/de3: add mixer version enum
>   drm: sun4i: de2/de3: refactor mixer initialisation
>   drm: sun4i: de2/de3: add generic blender register reference function
>   drm: sun4i: de2/de3: use generic register reference function for layer
>     configuration
>   drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: vi_scaler: add Display Engine 3.3 (DE33) support
>   drm: sun4i: de33: mixer: add mixer configuration for the H616
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
