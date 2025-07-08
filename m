Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402E5AFC630
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 10:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECE210E16C;
	Tue,  8 Jul 2025 08:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hQVpBAOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF7610E167
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 08:52:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C29B25C632F;
 Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F71BC4AF09;
 Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751964740;
 bh=LKFf/zGyLqNzojJhAHw+kv8fYXSumZx4S7DH83BWnk8=;
 h=From:To:Cc:Subject:Date:From;
 b=hQVpBAOtXe2Ftl4fyf22qUArzX/GT6xR4VDo2wX8IK++1rRkgFtg0+GQIG+YnlDgI
 4d5SMPSsxqUIlbtVTD11TtMeNA3Y+TRY5c/b3JJTGN16U1GpGUO+fSBMUtx9bO6KUf
 aUT735vo1iLyw0LYpdR5MjvMC8W1xfy8gh2x4Mf7t8cP8T6HMB87EozpZrXOy83s4s
 FGm1BCoqhzEAA4IiTG32oWJ4HZ2MTFhGthqcsokcHxz8jNTw7cTDfH0E0YbLOl5+aS
 1w0hw8u/vGUF+pkZbN9urer2IGQLbpwHr9Di/BjxLmAXXNm8kzsRIC354LiTmt8su4
 0vEco7d2TxnmA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1uZ43g-0000000042E-1Ju7;
 Tue, 08 Jul 2025 10:52:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] drm/bridge: fix OF node leaks
Date: Tue,  8 Jul 2025 10:51:22 +0200
Message-ID: <20250708085124.15445-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

Make sure to drop the OF node references taken when creating bridge
device when the devices are later released.

Johan


Johan Hovold (2):
  drm/bridge: fix OF node leak
  drm/bridge: ti-sn65dsi86: fix OF node leak

 drivers/gpu/drm/bridge/aux-bridge.c   | 2 ++
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.49.0

