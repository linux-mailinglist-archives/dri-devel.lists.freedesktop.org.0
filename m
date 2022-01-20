Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D4494D17
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792D310E4BD;
	Thu, 20 Jan 2022 11:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EC310E4BD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:36:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8808212C3;
 Thu, 20 Jan 2022 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642678610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rbFzMIpHMmLhR9rjKAnqrorT6YSiuu9GMbaKBJG4usk=;
 b=S69P3Al6u8JIaef3DJQMvTD9hXvEMl5pOGicMdpA3QISJYfIUFJ09FJbbTSvCKkhtxZlVG
 w92tmWT5wrMEsxN7+MNZb4JBOdlP2UfvyftqPdGXKWjQjyZ3Ehcxh+E8NxgeoC6mjImZjg
 ZeQagmKBq/FJgUmKB++xgh0S/i6TXlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642678610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rbFzMIpHMmLhR9rjKAnqrorT6YSiuu9GMbaKBJG4usk=;
 b=kHaBZVPN0diL/xqyJeUH5GFrBCJrj7ohntHY7uPsGb8Qw1yg6cWL/iIJtq368rym0QP1X9
 sJwo9BjFwnhdPwCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A81EE13E46;
 Thu, 20 Jan 2022 11:36:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p8YHKFJJ6WGuRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Jan 2022 11:36:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH] drm: Update docs after moving DisplayPort helpers around
Date: Thu, 20 Jan 2022 12:36:47 +0100
Message-Id: <20220120113647.22484-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM's DisplayPort helpers moved into the subdirectory dp/. Change
the documentation accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 Documentation/gpu/drm-kms-helpers.rst | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 5bb55ec1b9b5..c3ce91eecbc1 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -232,34 +232,34 @@ HDCP Helper Functions Reference
 Display Port Helper Functions Reference
 =======================================
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_helper.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp.c
    :doc: dp helpers
 
-.. kernel-doc:: include/drm/drm_dp_helper.h
+.. kernel-doc:: include/drm/dp/drm_dp_helper.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_helper.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp.c
    :export:
 
 Display Port CEC Helper Functions Reference
 ===========================================
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_cec.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_cec.c
    :doc: dp cec helpers
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_cec.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_cec.c
    :export:
 
 Display Port Dual Mode Adaptor Helper Functions Reference
 =========================================================
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_dual_mode_helper.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
    :doc: dp dual mode helpers
 
-.. kernel-doc:: include/drm/drm_dp_dual_mode_helper.h
+.. kernel-doc:: include/drm/dp/drm_dp_dual_mode_helper.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_dual_mode_helper.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
    :export:
 
 Display Port MST Helpers
@@ -268,19 +268,19 @@ Display Port MST Helpers
 Overview
 --------
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
    :doc: dp mst helper
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
    :doc: Branch device and port refcounting
 
 Functions Reference
 -------------------
 
-.. kernel-doc:: include/drm/drm_dp_mst_helper.h
+.. kernel-doc:: include/drm/dp/drm_dp_mst_helper.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
    :export:
 
 Topology Lifetime Internals
@@ -289,7 +289,7 @@ Topology Lifetime Internals
 These functions aren't exported to drivers, but are documented here to help make
 the MST topology helpers easier to understand
 
-.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
+.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
    :functions: drm_dp_mst_topology_try_get_mstb drm_dp_mst_topology_get_mstb
                drm_dp_mst_topology_put_mstb
                drm_dp_mst_topology_try_get_port drm_dp_mst_topology_get_port
-- 
2.34.1

