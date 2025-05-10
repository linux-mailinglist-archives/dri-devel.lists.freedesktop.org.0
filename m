Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9702FAB20F2
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 04:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DD810E00A;
	Sat, 10 May 2025 02:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D761210E00A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 May 2025 02:01:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62BE55C6EFA;
 Sat, 10 May 2025 01:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBFDC4CEE4;
 Sat, 10 May 2025 02:01:44 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
 by wens.tw (Postfix) with ESMTP id EAC495FA73;
 Sat, 10 May 2025 10:01:41 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de, 
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org, 
 jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V9 00/24] drm: sun4i: add Display Engine 3.3
 (DE33) support
Message-Id: <174684250193.2454659.15468367756832902378.b4-ty@csie.org>
Date: Sat, 10 May 2025 10:01:41 +0800
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

On Wed, 07 May 2025 15:19:19 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> I've spoken with Ryan and he agreed to let me take over this series to
> get the display engine working on the Allwinner H616. I've taken his
> previous patch series for Display Engine 3.3 and combined it with the
> LCD controller patch series. I've also fixed a few additional bugs and
> made some changes to the device tree bindings.
> 
> [...]

Applied to sunxi/clk-for-6.16 in local tree, thanks!

[01/24] dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
        commit: 20fb4ac9cda06527cf60c5ec7dda7c463c9c81be
[02/24] clk: sunxi-ng: h616: Add LVDS reset for LCD TCON
        commit: 390e4cfe87cb99c80614235cbc4651c3b315a9c9

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

