Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C788528B6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A9910E0E7;
	Tue, 13 Feb 2024 06:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="I9rIdyy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F11110E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 06:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=lmdufnX+T5nbFIZ3R27CSUmXLak9xsi6nzCl+pa5IdY=; b=I9rIdyy28QphTvIkWUG5aw1E9o
 Ty5bODu4ezasLaMp7SNJZb/JCl07HEs89l2U01C+HWp+LPqv2a+Ug8gwiY57/r37pVQ63jUDadlLS
 qRzfFWH/Z6ulCqEehEl7p2rYpH5meqarFRjRVAlsOQtCi4eHbXTynWVn+xQ55tsDe5VsZO9WKz1JR
 x2MfbIExRFldrMpkA2byVBTpBrV1Vc8uBSdMXtaK0mZVoczmRY9hKXyqAJ/sHBjFtgebcWJcxX3d7
 yHSOvwmhrLjfNM62IressxC6l+OcZrLJ+8ZZoMSWKDtDpqn0f5DqW/3XFB7h3vxiSQHWiDXInm3Sf
 IQvc+Nig==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rZm6o-000000086WR-0Qm8; Tue, 13 Feb 2024 06:17:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Alex Deucher <alexdeucher@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3] drm: drm_crtc: correct some comments
Date: Mon, 12 Feb 2024 22:17:33 -0800
Message-ID: <20240213061733.8068-1-rdunlap@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix some typos and punctuation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
v2: s/instances/instance/ (Alex)
v3: rebase and resend;
    add more Cc:s

 drivers/gpu/drm/drm_crtc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -- a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -61,13 +61,13 @@
  * to one or more &drm_encoder, which are then each connected to one
  * &drm_connector.
  *
- * To create a CRTC, a KMS drivers allocates and zeroes an instances of
+ * To create a CRTC, a KMS driver allocates and zeroes an instance of
  * &struct drm_crtc (possibly as part of a larger structure) and registers it
  * with a call to drm_crtc_init_with_planes().
  *
- * The CRTC is also the entry point for legacy modeset operations, see
- * &drm_crtc_funcs.set_config, legacy plane operations, see
- * &drm_crtc_funcs.page_flip and &drm_crtc_funcs.cursor_set2, and other legacy
+ * The CRTC is also the entry point for legacy modeset operations (see
+ * &drm_crtc_funcs.set_config), legacy plane operations (see
+ * &drm_crtc_funcs.page_flip and &drm_crtc_funcs.cursor_set2), and other legacy
  * operations like &drm_crtc_funcs.gamma_set. For atomic drivers all these
  * features are controlled through &drm_property and
  * &drm_mode_config_funcs.atomic_check.
