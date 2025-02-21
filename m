Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1309A403A0
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 00:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923A910E19B;
	Fri, 21 Feb 2025 23:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qUAOYy+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333810E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 23:43:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E345E68349;
 Fri, 21 Feb 2025 23:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2AAC4CED6;
 Fri, 21 Feb 2025 23:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740181415;
 bh=GigKIqugzG3RnBUJxgRg750/c4rFtzjUiyDG9IUNwbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qUAOYy+/YJy7QI9SjZaPQFB33Job5VD8SqGBh5+UJAK7Fh1/SYsbAEjVu94E40ZIP
 1G2zYt5QKpK09qUmMWzl2nUbiPFq+oz4cKl33uDY6h5UmvRL4JqcZIB2IRTdYMn60f
 VMtAUlH+CYQs3lnMjfaI5Hy/zg8G8rP79DfOEnfvzzj4ivsU1FCx7GMyA1nAUObN+7
 DXba4FJo3HIbqQQhT3HMvPjLklpHh+qId5Xl32iS1Oxlkb/xyDt/PsvAD9JqRWZ3To
 tXKN9NObT19kEXAxLKrKtkw2uzgUzFVMSNyZXniFs3yCNxEVO1XraqooJS/EBhyegr
 nsN43cCRgsIVg==
Date: Fri, 21 Feb 2025 17:43:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>, Samuel Holland <samuel@sholland.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
Message-ID: <174018141298.394778.13629046631332003048.robh@kernel.org>
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221005802.11001-2-andre.przywara@arm.com>
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


On Fri, 21 Feb 2025 00:57:58 +0000, Andre Przywara wrote:
> The Allwinner H6 and some later SoCs contain some bits in the PRCM (Power
> Reset Clock Management) block that control some power domains.
> Those power domains include the one for the GPU, the PLLs and some
> analogue circuits.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../power/allwinner,sun50i-h6-prcm-ppu.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

