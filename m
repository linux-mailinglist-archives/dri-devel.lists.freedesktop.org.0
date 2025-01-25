Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEDA1C38B
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 14:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA79510E34B;
	Sat, 25 Jan 2025 13:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z7PbnzCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69FA10E15A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=HWjjmeHvBqbc+F
 1yzEyVbS+f2/QIx04bCBQew3BP4yI=; b=Z7PbnzCJow12cntYXjE/pJnXkacbe4
 3UbCcVHGSGgkP9NVSsSr/+vYtsn0rzZn0adiLp6L4bSDMSsJimNV7yNq/m6iE1KP
 9US/EYumlsCzD/vallmQ4Pzoy9AXp/CuqXE2My4kNqh0Smg9dZbhjo/oL0Ygu4Z8
 gzhOARfJVPSKE4VZzAG0VFEMS/9PFweUstVZCvYlBL4oiC7lRjsJpU9DpzRGQAQw
 I4aGSOABiSW3pvfiHU/iQjn2MSWjReyQSXBAc3e2VffZiIs39gayF+LAimvJfzcY
 0Ju4cPaYZ1SStSMOAGTojQSpX1fqE6xv0b8trP+MHVPEWv5C6jKoX8Bg==
Received: (qmail 3873897 invoked from network); 25 Jan 2025 13:53:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 25 Jan 2025 13:53:31 +0100
X-UD-Smtp-Session: l3s3148p1@Vy+NVIcshsYujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:53:20 +0100
Message-ID: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
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

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling in drm bridge drivers. I don't have the
hardware, so I hope I can find people willing to test here. Build bots
are happy. And for it6505, it even fixes a problem. See the patch
description there.

Looking forward to comments.

Wolfram Sang (2):
  drm/bridge: it6505: Use per-client debugfs entry
  drm/bridge: ti-sn65dsi86: Use per-client debugfs entry

 drivers/gpu/drm/bridge/ite-it6505.c   | 28 +++-----------------------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 29 +--------------------------
 2 files changed, 4 insertions(+), 53 deletions(-)

-- 
2.45.2

