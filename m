Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C988BDE0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 10:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800A10EE1F;
	Tue, 26 Mar 2024 09:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZxW8acTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D95010EE1F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711445457;
 bh=ahfBlUfWRsy1cAiaDo2NbcbzpUG7EXvxnAKC6rk4E8c=;
 h=From:To:Cc:Subject:Date:From;
 b=ZxW8acTlqJdjXCwizP/M1dTHGTdEeIJgyaE0WJ3xpIbtHUHjSU8w6nurhAPcLnSKN
 B0iditcUvdajHn/rLkTkkXxdPEnYnXVhd7fAlaZQOlT4LwiHx/+GwNZ/Az7PaXEAVk
 IBxJSOc5HpWr6649Nu4FBKdkJFO+zDE8YPkBIDwduqXeiU1gAglVuPtRHmxdp+w/Dh
 JEvKgKOsE+XTnolFWATHTySmEQPvMYlMN6jptNrfOZD7Kb9tH8MQQB8q5CrtkxO3Ks
 QwMNVJg6MM7F963R7hUBx+jqxHrbWd2J9KMTDS8X2bCZ4nCsn7RVjWNdvXgR2bcgUf
 /GQiV6h4AtEtQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 307F237813E1;
 Tue, 26 Mar 2024 09:30:57 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/panthor: Fix wrong kernel-doc format in the uAPI header
Date: Tue, 26 Mar 2024 10:30:55 +0100
Message-ID: <20240326093055.411932-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
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

The kernel doc prefix is /** not /*.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/uapi/drm/panthor_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 373df80f41ed..dadb05ab1235 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -336,10 +336,10 @@ struct drm_panthor_gpu_info {
 	/** @tiler_present: Bitmask encoding the tiler units exposed by the GPU. */
 	__u64 tiler_present;
 
-	/* @core_features: Used to discriminate core variants when they exist. */
+	/** @core_features: Used to discriminate core variants when they exist. */
 	__u32 core_features;
 
-	/* @pad: MBZ. */
+	/** @pad: MBZ. */
 	__u32 pad;
 };
 
-- 
2.44.0

