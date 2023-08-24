Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95978689D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E66210E4AB;
	Thu, 24 Aug 2023 07:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D02E10E4A7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:38:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82A6C65D05;
 Thu, 24 Aug 2023 07:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFE5C433C8;
 Thu, 24 Aug 2023 07:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862691;
 bh=yLSSSBHYD8WZeL0Wfaq/t90nMXiRlFnq7zlyLNlax8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LMwWtL3rVjYSTgwJ1CI0v1o/Q48mMwbRMOlcDYwq+A+OS+R5v+eaFm+4HqPX1uOJC
 gEas7dKEasmD1CfTvMY/YVSpCQK2Hq+jpszRL2zJ/84p8ikOahpk0/oRlilDY59sIt
 TVBE1sKHZF+r5UGdG4k3EUgcqNYn2/K4DiXZfRWDNT0CkF/2wxgfvOlJvlbklxoC0G
 as99N1n4vmCf5pPfskYATjzCpN1aHB30TkDase584bKcopT2ziVrT9AxueUBAhpUzi
 0ERnmGyM2YL0mMown++64XtrIKXoW2Gv8o6Z0j+wifwPuX1yA7raQd8FFsaCU10uqy
 8Y2pcg+zymOfg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 16/20] drm/drm_connector: Provide short description of param
 'supported_colorspaces'
Date: Thu, 24 Aug 2023 08:37:01 +0100
Message-ID: <20230824073710.2677348-17-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/drm_connector.c:2215: warning: Function parameter or member 'supported_colorspaces' not described in 'drm_mode_create_hdmi_colorspace_property'
 drivers/gpu/drm/drm_connector.c:2239: warning: Function parameter or member 'supported_colorspaces' not described in 'drm_mode_create_dp_colorspace_property'

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bf8371dc2a612..c44d5bcf12847 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2203,6 +2203,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 /**
  * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: bitmap of supported color spaces
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * HDMI connectors.
@@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 /**
  * drm_mode_create_dp_colorspace_property - create dp colorspace property
  * @connector: connector to create the Colorspace property on.
+ * @supported_colorspaces: bitmap of supported color spaces
  *
  * Called by a driver the first time it's needed, must be attached to desired
  * DP connectors.
-- 
2.42.0.rc1.204.g551eb34607-goog

