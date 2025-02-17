Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CAA3847B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 14:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A752510E322;
	Mon, 17 Feb 2025 13:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kUdldsRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42F010E322
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 13:23:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 29B57A41232;
 Mon, 17 Feb 2025 13:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83DDC4CEE4;
 Mon, 17 Feb 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739798597;
 bh=aclQdcwtWEymwa3JymB/vRVU50riI1PPEXXl5xwIVW8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kUdldsRNmYdIe91OYvCI+anteaEdcRxo7YFXtpaNVmA5H5ngmuG74JOn70px/1DoF
 EEhmVBnn2a+1IYpXZCM2h0etA/QUX2cZGfokF77dxasqgVCsy4+92kaMbqG/R54lXl
 PLjuYx+wwR6VbTxfGJzyim0TAJAqK39QVsOyXCuO+EZddpvay+kTSYglJ5275A6izH
 gc68O21W9NHG9ZJ6m93kurh5GXBMeJM3C1tydpoL3c0a5ndrRfv/wPQCvf8vGMKT7p
 tk04iCQpEtTqLmys4zzUMbcXc2/CwVu1CBeF6hxGnJ2LnI9SN4sFgN7lOdiyKeSKhd
 nDnDG7p60uVmQ==
From: Robert Foss <rfoss@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250214-drm-assorted-cleanups-v7-0-88ca5827d7af@bootlin.com>
References: <20250214-drm-assorted-cleanups-v7-0-88ca5827d7af@bootlin.com>
Subject: Re: [PATCH v7 0/5] drm: small cleanups and improvements
Message-Id: <173979858540.712245.13173359514923904651.b4-ty@kernel.org>
Date: Mon, 17 Feb 2025 14:23:05 +0100
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

On Fri, 14 Feb 2025 13:57:39 +0100, Luca Ceresoli wrote:
> This series collects some minor improvements and fixes previously part of
> [0], hence the "v7" version number.
> 
> All of these patches already have some Review/Ack tags.
> 
> [0] https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/
> 
> [...]

Applied, thanks!

[1/5] drm/debugfs: fix printk format for bridge index
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72443c730b7a
[2/5] drm: of: drm_of_find_panel_or_bridge: move misplaced comment
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9d60cf4e8cf7
[3/5] drm/bridge: panel: use drm_bridge_is_panel() instead of open code
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cc46371e3d32
[4/5] drm/bridge: panel: drm_panel_bridge_remove: warn when called on non-panel bridge
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/77053ef7207a
[5/5] drm/bridge: panel: forbid initializing a panel with unknown connector type
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b296955b3a74



Rob


