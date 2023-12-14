Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A7A812C83
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097B010E911;
	Thu, 14 Dec 2023 10:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFB110E8F9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:09:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9C4D7B82162;
 Thu, 14 Dec 2023 10:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27BCC433C7;
 Thu, 14 Dec 2023 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702548564;
 bh=w1/ZociL3T5z/9/6oO486hoe6cFIwDEgcc0EjhXmKLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pa2wfRPT3GKRPpyOLUuYO3gC7CPUWMu7xvCoTIANhnV0J8gTycBvPzA7qQzOuJG29
 oAqIsgT6KvwxSQswSVkqYHxyD8y/0/t/f4DzwIpg7T/mUDyHwylDtYWhxkOCSAEfTv
 nE4v/1v2s7/TO+IFVyY345mMi5X7S8z7dCxBdoVkMr3U9hxcCqNbnRM0d8YkgLNt31
 KY9g3zNaPyicrMUG+zTXKaCfAVczYqOHAGSTlrxOYICUDjwGUmL4Mm5/Y1pA5d5erP
 2B3o+lYtEw3dXQvmeZrINuy5g4wVrshRkC9/b1Wyta4XNHyoXRtEK+7ffgL6krRbI6
 Ct8Zj3qMFAzmw==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 2/5] drm/atomic: Remove inexistent reference
Date: Thu, 14 Dec 2023 11:09:13 +0100
Message-ID: <20231214100917.277842-2-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214100917.277842-1-mripard@kernel.org>
References: <20231214100917.277842-1-mripard@kernel.org>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 63e83c1dba54 ("drm: Consolidate connector arrays in
drm_atomic_state") removed the connector_states field but didn't remove
its mention in the num_connectors documentation.

Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 2a08030fcd75..13cecdc1257d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -413,7 +413,7 @@ struct drm_atomic_state {
 	struct __drm_crtcs_state *crtcs;
 
 	/**
-	 * @num_connector: size of the @connectors and @connector_states arrays
+	 * @num_connector: size of the @connectors array
 	 */
 	int num_connector;
 
-- 
2.43.0

