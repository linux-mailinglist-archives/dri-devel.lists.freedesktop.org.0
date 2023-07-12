Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EE750A2E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 15:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F3810E53B;
	Wed, 12 Jul 2023 13:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF9E10E53B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:57:58 +0000 (UTC)
Date: Wed, 12 Jul 2023 13:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689170275; x=1689429475;
 bh=kspUgoiqhSRB7PivdwVOXEGbv83P/jnlrwZxf9UMjLU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=r/zEA0r21t12FJeBav7M4VdmkQR2BH752c1M++/zrf5Zpeu+V+9XQYf6k1rYQ2qx9
 b1W2nUyq+ynAQPuyQOx0g4zNAkH5+5AiHoU5f4IMz9p0OFoS+MDIDumIl6ahIi7+/U
 iBEe980+HU3YdZSwlY7CxZAEG1HIZmVikSYmOyuVrw2mlaVNBeJ6cdLV7MqH9L0Y3Z
 ja6XC+G9ff4zsZE9Hv/DT5FmwaSiAw6+plhnt5PxWDxlPOGd3tkDGcTvGvpySwzCz4
 p/j7NwoEL2QKfCRau+JpQ9RJnrdSj1Ub/DFKQBbjBZ0dGPRFkK1xeuZQi7EBhpo9Lw
 h6fZYx9hjb9WQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 4/4] drm/doc: document front-buffer rendering
Message-ID: <20230712135723.173506-4-contact@emersion.fr>
In-Reply-To: <20230712135723.173506-1-contact@emersion.fr>
References: <20230712135723.173506-1-contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explain how to perform front-buffer rendering.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_blend.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..6c55f1da2480 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -75,6 +75,9 @@
  * =09the currently visible vertical area of the &drm_crtc.
  * FB_ID:
  * =09Mode object ID of the &drm_framebuffer this plane should scan out.
+ *
+ * =09To perform front-buffer rendering, user-space should set FB_ID to th=
e
+ * =09previous framebuffer in atomic commits.
  * CRTC_ID:
  * =09Mode object ID of the &drm_crtc this plane should be connected to.
  *
--=20
2.41.0


