Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9053B06478
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6079010E219;
	Tue, 15 Jul 2025 16:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E255F10E219
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 16:38:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9EC2D5C5BDB;
 Tue, 15 Jul 2025 16:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF71C4CEE3;
 Tue, 15 Jul 2025 16:38:55 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
 by wens.tw (Postfix) with ESMTP id E6B9C5FD47;
 Wed, 16 Jul 2025 00:38:51 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.or>, iuncuim <iuncuim@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: sunxi: a523: Enable Mali GPU
Message-Id: <175259753193.2390274.13790626107731920728.b4-ty@csie.org>
Date: Wed, 16 Jul 2025 00:38:51 +0800
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

On Fri, 11 Jul 2025 11:57:26 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> This patch adds gpu support on devices with a523 processor.
> 
> $ dmesg | grep panfrost
> [    3.826968] panfrost 1800000.gpu: clock rate = 432000000
> [    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
> [    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
>                status 0x0
> [    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
>                00000001,80000400
> [    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
>                Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
> [    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[2/3] arm64: dts: allwinner: a523: add Mali GPU node
      commit: 3d99e0dc888727a21b45ca64ff7b0cddbd17dd16
[3/3] arm64: dts: allwinner: a523: enable Mali GPU for all boards
      commit: d96d9ac8d2f197f31ea3de931dde1a217950f4ad

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

