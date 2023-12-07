Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AA808C38
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9745A10E8E6;
	Thu,  7 Dec 2023 15:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EF610E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 15:49:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C08EB61F71;
 Thu,  7 Dec 2023 15:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8991C433C7;
 Thu,  7 Dec 2023 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701964173;
 bh=81lEe31K2YU0V4EnFq3xxesUJy/t9LyYJwWTzno5+Rg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ODlGU75K8yKtjUopqTiU4wsNotWNVWiC25d6aWYxaxOvFMqQVxZZGkEhMSpN2Snms
 cpy+aLoHA7sAdr5zqVat4bgL3nPTRSKoY/2m61W5XZs9mxPG0VkkTNoNimV37pEOmJ
 u6PxyIcDeGCsp/CEWN29NMW/Z43t17GNM/5xtp0yMuxheMBCBwpwkUZYB8yAk/XtGT
 KMEfjo6M5JUjVzSBmqpE6mOvv0anLYhgrhYQMOawvIfHFtAB/xFDNe+6uT63n7y47C
 kgxjIz4TEjOVSC0RLPbAf/aRseJcchgJaguN+kPFjiwDsiObO8UMGnLamSAhO55+YS
 qfNLz4dX2Z8tg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 07 Dec 2023 16:49:24 +0100
Subject: [PATCH v5 01/44] drm/tests: helpers: Include missing drm_drv
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-kms-hdmi-connector-state-v5-1-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=mripard@kernel.org;
 h=from:subject:message-id; bh=81lEe31K2YU0V4EnFq3xxesUJy/t9LyYJwWTzno5+Rg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmFL1sefDpxVV7F8ANfMWcRC3v5Y5/ZYiHhd3wD9yWG2
 1hVP9zbUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIn8FmdkWG16u67kAofX8UNu
 wkfucbosWZ/LwHWiWP3Gvq5Wy5fK3xgZ9jBeF/B56fZy7bpQkeq9P/R3dRXqNH97sptN0GjPz6W
 v2QA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a few functions declared in our kunit helpers header, some of
them dereferencing the struct drm_driver.

However, we don't include the drm_drv.h header file defining that
structure, leading to compilation errors if we don't include both
headers.

Fixes: d98780310719 ("drm/tests: helpers: Allow to pass a custom drm_driver")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_kunit_helpers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index ba483c87f0e7..3ae19892229d 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -3,6 +3,8 @@
 #ifndef DRM_KUNIT_HELPERS_H_
 #define DRM_KUNIT_HELPERS_H_
 
+#include <drm/drm_drv.h>
+
 #include <linux/device.h>
 
 #include <kunit/test.h>

-- 
2.43.0

