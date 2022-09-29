Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DD35EFD42
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C910EC06;
	Thu, 29 Sep 2022 18:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F4010EC07
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:43:38 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664477016; x=1664736216;
 bh=BR8dcRN/30748oMVqNcsjVy9fKrzKbrYW6bhbE7FruQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=KiqVS0R4Y8J3e2tSl6rhgly26EuubGBwKgzVq9IzRN1VytvC85txpHZNVTXr30G8W
 n7pQ33VCmbHVvaPyVD6H3DwRVPYAOoLEYrPTCugRAGz8jTWiDruU4EFtbLuWoV+AIF
 2YKJiIRNlo+o27vfNo/TnKfomcipM3ERHfKxmmSNK3FN1o1iTwV8aLVX7abBTYO8yN
 cUiElzyaNaSA7BQ8zTHDQoASmhkOMPynd9A+NPnad8USY1J8X5SgAq/fkIiUvZ+rft
 GfO3YTwB+EQhTiKYkHWGHD3BzbSi4u1vi3e0eUbCB9jCYNSESGUhxtv7wcMxc1JTNH
 PX56zirk57iXw==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3 1/6] drm: document DRM_MODE_PAGE_FLIP_ASYNC
Message-ID: <20220929184307.258331-2-contact@emersion.fr>
In-Reply-To: <20220929184307.258331-1-contact@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch, mwen@igalia.com,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a subset of [1], included here because a subsequent patch
needs to document the behavior of this flag under the atomic uAPI.

v2: new patch

[1]: https://patchwork.freedesktop.org/patch/500177/

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 include/uapi/drm/drm_mode.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index fa953309d9ce..86a292c3185a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -936,6 +936,13 @@ struct hdr_output_metadata {
 };
=20
 #define DRM_MODE_PAGE_FLIP_EVENT 0x01
+/**
+ * DRM_MODE_PAGE_FLIP_ASYNC
+ *
+ * Request that the page-flip is performed as soon as possible, ie. with n=
o
+ * delay due to waiting for vblank. This may cause tearing to be visible o=
n
+ * the screen.
+ */
 #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
 #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
 #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
--=20
2.37.3


