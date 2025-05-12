Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC9AB3D15
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 18:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFBE10E44C;
	Mon, 12 May 2025 16:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934C510E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 16:12:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B6D15C4947;
 Mon, 12 May 2025 16:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DF8C4CEEE;
 Mon, 12 May 2025 16:11:55 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
 by wens.tw (Postfix) with ESMTP id 6C9195FCCA;
 Tue, 13 May 2025 00:11:53 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, 
 Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Philippe Simons <simons.philippe@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250511104042.24249-1-ryan@testtoast.com>
References: <20250511104042.24249-1-ryan@testtoast.com>
Subject: Re: (subset) [PATCH v10 00/11] drm: sun4i: add Display Engine 3.3
 (DE33) support
Message-Id: <174706631341.3565911.17660791573528353464.b4-ty@csie.org>
Date: Tue, 13 May 2025 00:11:53 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Sun, 11 May 2025 22:31:09 +1200, Ryan Walklin wrote:
> v10 of this patch series adding support for the Allwinner DE33 display engine. This version is largely based on the previous v8 patch, with Chris's changes to the mixer bindings in particular from v9 to add names for the new register blocks. As discussed, the H616 LCD support patchset (which are largely device-tree now that the clock/reset binding definitions from v9 have been taken as a subset) will be sent separately with the rest of Chris' updates.
> 
> As noted previously the new YUV support in the DE3/DE33 and RCQ/DMA shadowing in the DE33 requires more work and discussion, so that support was removed from v8 and this patch supports RGB output only.
> 
> Regards,
> 
> Ryan
> 
> [...]

Applied to sunxi/clk-for-6.16 in local tree, thanks!

[06/11] dt-bindings: allwinner: add H616 DE33 clock binding
        commit: ab1a94b504b6f19c294786b5920574fb374fb5cc
[08/11] clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support
        commit: be0e9a3727872783bad0752dc82e0857f4776049

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

