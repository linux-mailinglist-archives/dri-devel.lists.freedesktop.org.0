Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6788A064
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BF610E86D;
	Mon, 25 Mar 2024 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mj00bVqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFAB10E866
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:52:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4289760FAD;
 Mon, 25 Mar 2024 12:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962CDC43390;
 Mon, 25 Mar 2024 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711371170;
 bh=ILiO5I4XiExK/CyXHQs8jf1CGT9QtVXqsKsOXWst4oY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mj00bVqdKOgOwgs3aNwYBdoyG3z+qdnP7kkQa+PTFRZy9lwobsxixjKvQAc2Swptz
 KtdEF92EgqePD4ijra+IA0yS7PkRUIBxlT28zwkpBxqvxwqG/YGD7kyYEv/jCS9YBz
 ctprYrOyuQ0hbfO4Ag+IyaPoOZ9Sn8nv6IqQu4clvQYWmuZ5Dxo3fIgeNI+OZzPjiQ
 KxQYkFcpNyPU3EsflQ94q8gNs9uY4J9CVkXawWJbkFPS3VJL2RdKEu2TduGFGkpssk
 JFZrUtqJRyKJW9YOonCVPfgVetOLq+FKxN1gflaA7IFrhGGm6OT4a+SiPD/dd4Wyhd
 WWHcae5ivG2eA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 25 Mar 2024 13:52:14 +0100
Subject: [PATCH 12/12] drm/bridge: it6505: Remove useless select
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-kms-kconfig-helpers-v1-12-bfec6949d9c3@kernel.org>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
In-Reply-To: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=760; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ILiO5I4XiExK/CyXHQs8jf1CGT9QtVXqsKsOXWst4oY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGmMxTWCc0ryuNYeVme0Z/3m98jlyMNVcxvEOE+npXTsf
 PVOMFa1YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk8mTGhlk3C3XvPLvWX7du
 gUT7rJIDEvWV968fFglxq9i8x0830V3o1PYftq/+1Zx91vgh9J7gd8b6WjsWxnPn5/xgFDZRSxf
 m3C3YvOrkgVVXJRX9t+9qYL8fFvaEOf/9spS74hMyCwI2eggAAA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT6505 bridge Kconfig symbol selects a Kconfig symbol that doesn't
exist. Remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 6e6ec300ab16..d1fbf8796fea 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -96,11 +96,10 @@ config DRM_ITE_IT6505
 	depends on DRM_DISPLAY_DP_HELPER
 	depends on DRM_DISPLAY_HDCP_HELPER
 	depends on DRM_DISPLAY_HELPER
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_DP_HELPER
 	select EXTCON
 	select CRYPTO
 	select CRYPTO_HASH
 	help
 	  ITE IT6505 DisplayPort bridge chip driver.

-- 
2.44.0

