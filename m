Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC4AF7C77
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEAC10E890;
	Thu,  3 Jul 2025 15:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECA710E890
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:37:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1207561450;
 Thu,  3 Jul 2025 15:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B848C4CEEE;
 Thu,  3 Jul 2025 15:37:40 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
 by wens.tw (Postfix) with ESMTP id 418D15FA91;
 Thu,  3 Jul 2025 23:37:38 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Icenowy Zheng <icenowy@aosc.xyz>, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
Subject: Re: (subset) [PATCH 0/5] sunxi: Various minor V3s clock/pinctrl fixes
Message-Id: <175155705824.1106539.17200783567865554543.b4-ty@csie.org>
Date: Thu, 03 Jul 2025 23:37:38 +0800
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

On Tue, 01 Jul 2025 22:11:19 +0200, Paul Kocialkowski wrote:
> This is a mixed-bag of minor fixes for V3s clocks and pinctrl.
> 
> The last patch is a weak attempt at accomodating using both the display
> engine and tcon along with the camera subsystem. The main issue is that
> the tcon and de need to have the same clock parent, which may not be
> the case depending on the pixel rate. Bringing the de block to the same
> clock rate as the csi block helps in some cases.
> 
> [...]

Applied to sunxi/clk-fixes-for-6.16 in local tree, thanks!

[2/5] clk: sunxi-ng: v3s: Fix CSI SCLK clock name
      commit: f45b2949b1a235881255132a119b8cc8c3738bd5
[3/5] clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
      commit: 2b73328629396d32e41ca1f023653b07abf2b42f
[4/5] clk: sunxi-ng: v3s: Fix TCON clock parents
      commit: 01fdcbc7e5a56c9cba521e0f237cb5c3fd162432

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

