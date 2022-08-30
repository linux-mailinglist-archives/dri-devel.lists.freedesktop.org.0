Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E029E5A6A73
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE46B10E2DC;
	Tue, 30 Aug 2022 17:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5B310E2D2;
 Tue, 30 Aug 2022 17:29:31 +0000 (UTC)
Date: Tue, 30 Aug 2022 17:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661880569; x=1662139769;
 bh=7/DDxIV1Fo8yTklcn2N9EElotUVSHrvK4wKYJ/Ui2ig=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=OTP5EeLBDiuCLg8enDNackduqRExDN0gZYBd4/+lrA/MXG88aKGEhfc/2SIfmWJvo
 HPCSN4IaIPXztp6iD5HDk0FV0sYYM51IKn1xfeihqYswjGz1d1WGN8gGttTcwUt3sI
 N1j13/eRQPw/hLbi4UHNu/7kjXEESOQL1GNK4qEnXljiQu+AheTDFlNfxHI9bl4A+X
 KgjrpQYiWVws1Mi00evRheDeF2P+KKU1nQ4scTJkJniq8Kov6g9yeyA7PGxQQm3bZk
 YCe1nPyu9JwHNjaoJrESudFkKvp48yfP7lOXp7EQ/DLbFT6yMCE+jMmdmSVqBTQm11
 S+mvWrPEDEUQg==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/6] drm: document DRM_MODE_PAGE_FLIP_ASYNC
Message-ID: <20220830172851.269402-3-contact@emersion.fr>
In-Reply-To: <20220830172851.269402-1-contact@emersion.fr>
References: <20220830172851.269402-1-contact@emersion.fr>
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
Reply-To: Simon Ser <contact@emersion.fr>
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
2.37.2


