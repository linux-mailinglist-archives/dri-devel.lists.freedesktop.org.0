Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2DFAC4E5F
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265EE10E4C7;
	Tue, 27 May 2025 12:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nmxZmoM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8569410E4C1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347891;
 bh=1DuTA5HzhC4tan5w27hz1UdHQupn7FllR02MG7+gbxg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nmxZmoM1lXW1lTEq2BqXzI0nIFfMihdrRRv5Ak7Jbu0h2SBVGzvVmoNIOA/ZK0C/N
 CUfC3B0JnxoYMOeSWUugOilPudLJGSKRoFrDrmnxyGUykOd3v1QD8sjzaW/SmgHPW3
 qZWmkkUOo2BCWaRm6/Kg+k5TOJBonnpxKYfnaoRdQ9gApJQg99LxkQ0vhWXV7uSZqR
 JA1rNABoXUa2Gwysc/rs/nsguxkiWY/Uk21m6oBeGxXsZvgvg+QySoQ10pSpCHhGqN
 o1EySuEjqEqhURL6eQs/AdtEpvjcq42QxBKd5g4/KKZtjJdsG6G69YWp9+jUu1X52C
 5CKBTUItnG3Cg==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E41B917E37CF;
 Tue, 27 May 2025 14:11:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:19 +0300
Subject: [PATCH v5 11/19] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-11-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

After updating the code to make use of the new EDID setup helper,
drm_kunit_helper_connector_hdmi_init_funcs() became unused, hence drop
it.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index b8f4dc677be7c8833a2cb09aa6b44b5e9b2f5378..64037110bcaa9713999d77a254fc9377170a41bb 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -206,16 +206,6 @@ __connector_hdmi_init(struct kunit *test,
 	return priv;
 }
 
-static
-struct drm_atomic_helper_connector_hdmi_priv *
-drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
-					   unsigned int formats,
-					   unsigned int max_bpc,
-					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
-{
-	return __connector_hdmi_init(test, formats, max_bpc, hdmi_funcs, NULL, 0);
-}
-
 #define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
 	__connector_hdmi_init(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
 

-- 
2.49.0

