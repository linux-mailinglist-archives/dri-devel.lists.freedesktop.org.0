Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A3899E08
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 15:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB66113BF8;
	Fri,  5 Apr 2024 13:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JgBfZS1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68500113BF2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 13:09:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 22993CE375E;
 Fri,  5 Apr 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2615C433F1;
 Fri,  5 Apr 2024 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712322583;
 bh=v7bIaae5C/I6EIJFTJcdJOvBIkgxWyP1jUsycI59f+8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JgBfZS1EDsNnoTq60ro9de0ZIbrh2fHpnCts5KpU6pOCszcYuYFrKZ+ZNwxTb0VN+
 4q9fU8l9sFekTKY+zdDStYi/jZu/SdaxmJ4yeD9tXLI6h9nSqvKPF392lX2Ob1zMqw
 boTG21b9AfgMljRTZ3UYt9r8/oQ6PxaYoMBJmwXHdqAMifkSbR4rY0VHufsurS7skW
 Hwz90Im0NKVDpwmq7S/iyZcY93sGNpGrKWdAPjHzA6g2bWjOMRpFK02YWFg8Mpl3J3
 7Gil4ozHLUjgw0NxmBc+4LtbPSo4YwX0w3TzBedmKeUtUsSsAq9BPA/uklsOjL9Q8N
 MhHD9Y9vLXLSA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-2-afbc4a835c38@kernel.org>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <20240403-fix-dw-hdmi-kconfig-v1-2-afbc4a835c38@kernel.org>
Subject: Re: (subset) [PATCH 2/7] drm/bridge: dw-hdmi: Make DRM_DW_HDMI
 selectable
Message-Id: <171232258054.9066.6298567481555840770.b4-ty@kernel.org>
Date: Fri, 05 Apr 2024 15:09:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 03 Apr 2024 12:56:20 +0200, Maxime Ripard wrote:
> Commit c0e0f139354c ("drm: Make drivers depends on DRM_DW_HDMI") turned
> select dependencies into depends on ones. However, DRM_DW_HDMI was not
> manually selectable which resulted in no way to enable the drivers that
> were now depending on it.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

