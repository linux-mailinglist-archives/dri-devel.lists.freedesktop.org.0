Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964B488A9C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 17:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BA910F1A5;
	Sun,  9 Jan 2022 16:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC1710F1A5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 16:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 18ACB1F40359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641746230;
 bh=Bpd8xUWxmA4RJkcYDjsNYwzlEV49TfkepVOznECnw28=;
 h=From:To:Cc:Subject:Date:From;
 b=IwHI5SxXa6IK50lOAd01j8xpiNxe9ME6gjZKJB7s+Gdoy5w01gG4TLecGFhBPh5BR
 5qGULy+bAlSoDWMPiV9/5eg+24Crk383DkbJpUn5e/90KFSZc/ywIeZSbFOppZEOm7
 X7GdEapzd72VqfOVLPMM7JsTugxLnzZ7GdBtbsA7Bd2Gf3pJCRS617EzIfVQ5z3CSq
 DirQdnwO6Xb+2Avs51HpdkemVEjgvuOgeECjeHcdA/Swiijy13ww4Kj5Th3GzVK/ww
 QDZdqgv+GgbiFpPejtfUDvCeX1c+7R18LtzGdZoQ28yP7pvxfsw3JIJ5PxUnNFsbq6
 6YG8u/c/VT9fA==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Update create_bo flags comment
Date: Sun,  9 Jan 2022 11:37:04 -0500
Message-Id: <20220109163704.2564-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update a comment stating create_bo took no flags, since it now takes a
bit mask of optional flags NOEXEC and HEAP.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 include/uapi/drm/panfrost_drm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 061e700dd06c..9e40277d8185 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -84,14 +84,14 @@ struct drm_panfrost_wait_bo {
 	__s64 timeout_ns;	/* absolute */
 };
 
+/* Valid flags to pass to drm_panfrost_create_bo */
 #define PANFROST_BO_NOEXEC	1
 #define PANFROST_BO_HEAP	2
 
 /**
  * struct drm_panfrost_create_bo - ioctl argument for creating Panfrost BOs.
  *
- * There are currently no values for the flags argument, but it may be
- * used in a future extension.
+ * The flags argument is a bit mask of PANFROST_BO_* flags.
  */
 struct drm_panfrost_create_bo {
 	__u32 size;
-- 
2.34.1

