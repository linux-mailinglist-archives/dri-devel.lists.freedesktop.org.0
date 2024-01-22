Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864E3836AB5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B351110F55A;
	Mon, 22 Jan 2024 16:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0AD10F55A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:32:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1705941147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=55MO4bPOLn4/UwKC6DUmQGXwkP8oJde1RTnFz7waoW0=;
 b=OwoFS+Tv+QnDTE88hzBMy10Sa2dIpGUtwE1YWdITuK3CNzjJHDgU/GzZ7injIechmLQABF
 Yn87xa9HI8FduHUtyySYrIOZlaq4rCBOiIACBtCbATM77lW2GuLybKY/qef3x6YrHxqj4l
 vuzv2ZCgaZyuJ5+4s1KZs56wGBWuvbw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 0/5] drm/bridge: Allow using fwnode API to get the next bridge
Date: Tue, 23 Jan 2024 00:32:15 +0800
Message-Id: <20240122163220.110788-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it possible to use drm-bridge drivers on non-DT based systems.

Sui Jingfeng (5):
  drm/bridge: Add drm_bridge_find_by_fwnode() helper
  drm/bridge: simple-bridge: Extend match support for non-DT based
    systems
  drm/bridge: simple-bridge: Allow acquiring the next bridge with fwnode
    API
  drm/bridge: display-connector: Extend match support for non-DT based
    systems
  drm-bridge: display-connector: Switch to use fwnode API

 drivers/gpu/drm/bridge/display-connector.c | 46 +++++++++----
 drivers/gpu/drm/bridge/simple-bridge.c     | 75 +++++++++++++++++++---
 drivers/gpu/drm/drm_bridge.c               | 33 ++++++++++
 include/drm/drm_bridge.h                   |  4 ++
 4 files changed, 139 insertions(+), 19 deletions(-)

-- 
2.25.1

