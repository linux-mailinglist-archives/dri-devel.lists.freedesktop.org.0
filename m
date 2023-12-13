Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43074810921
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 05:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B68410E248;
	Wed, 13 Dec 2023 04:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D942610E248
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 04:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RiCGowda5Xfto6LB40GGFl71AURfd9D4MZ19wldqI2k=; b=eh4tqTPlpIycLY+hjCf7Be2ZVO
 dPZLSLlJ9i4EPS4Onfa+LiI+jpIEpILYerM+aynvpb/e7VZyk3IR5SvB6F0xSNBT0iev6sWGBHXvV
 ZGZ0y3FZvjquzhBS1gKT7lZyZLcUrEtHyaQ4KYvA/FdvDxkJgM+uhYtrXL2BOv7FnRXaqhzjKq0yq
 /dTBdDTsW15x+54vYO75RBgclsZv0vcry3KQsgFnJtArsbQ002ARmsctFCT4Uwq9zSsl44EdCkDVW
 /px/H2yaj01guU+1KLpA6h9qJyTrHEJmire8G3KlOlXqfjrZnHBDKuujhjEOiqUJwVoCzYmBCiw/9
 XkzA/yVw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rDGv4-00DaBy-2J; Wed, 13 Dec 2023 04:32:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/drm_modeset_helper_vtables.h: fix typos/spellos
Date: Tue, 12 Dec 2023 20:32:26 -0800
Message-ID: <20231213043226.10046-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix spelling problems as identified by codespell.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_modeset_helper_vtables.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -134,7 +134,7 @@ struct drm_crtc_helper_funcs {
 	 * Since this function is both called from the check phase of an atomic
 	 * commit, and the mode validation in the probe paths it is not allowed
 	 * to look at anything else but the passed-in mode, and validate it
-	 * against configuration-invariant hardward constraints. Any further
+	 * against configuration-invariant hardware constraints. Any further
 	 * limits which depend upon the configuration can only be checked in
 	 * @mode_fixup or @atomic_check.
 	 *
@@ -550,7 +550,7 @@ struct drm_encoder_helper_funcs {
 	 * Since this function is both called from the check phase of an atomic
 	 * commit, and the mode validation in the probe paths it is not allowed
 	 * to look at anything else but the passed-in mode, and validate it
-	 * against configuration-invariant hardward constraints. Any further
+	 * against configuration-invariant hardware constraints. Any further
 	 * limits which depend upon the configuration can only be checked in
 	 * @mode_fixup or @atomic_check.
 	 *
@@ -1474,7 +1474,7 @@ struct drm_mode_config_helper_funcs {
 	 * swapped into the various state pointers. The passed in state
 	 * therefore contains copies of the old/previous state. This hook should
 	 * commit the new state into hardware. Note that the helpers have
-	 * already waited for preceeding atomic commits and fences, but drivers
+	 * already waited for preceding atomic commits and fences, but drivers
 	 * can add more waiting calls at the start of their implementation, e.g.
 	 * to wait for driver-internal request for implicit syncing, before
 	 * starting to commit the update to the hardware.
