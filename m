Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3DA9C568
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB3E10E940;
	Fri, 25 Apr 2025 10:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P4AwPH4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9848C10E929
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576907;
 bh=4lg+tZhIc+oaFlZ18h7Sr9PgPxrUHhP/ALL5+NI4Jyw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=P4AwPH4PNP5xKBEwfNCTd9U+rJZFZoIr9bvKx0s8P4BNFM3vWRJ3eKIyCzET3FYoU
 xe5GEf9gEVEsAHiQ8oCwV3SvueR8u4qM04vGepvywnB1FhjjAybMsLXriGdg87K6LA
 wVH/qY81lHF0nbST8asPVa8lAN/w+IQOk4rgWL8MctONcvdmC/ONjnXVvF2nNVP8Uj
 yCuZDb5qPvv4lsE/uzfiF6NdfJXBVj91hwr9vCw2dE5n9s54/kE/kQEVZ1tcRHWspV
 LNgfkHsmexdqUANf2PVkRhREDrM57mq5tPTrV1EBtPA853RLh/E+bf2+muCveRcEJB
 Y4fdHPXkOMj3w==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 0C43517E36BD;
 Fri, 25 Apr 2025 12:28:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:27:01 +0300
Subject: [PATCH v4 10/23] drm/tests: hdmi: Drop unused
 drm_kunit_helper_connector_hdmi_init_funcs()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-10-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
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

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 921afb732797f1530d3857ea6d951c5df79d42b4..6b4000aea2f2eff373c803d95c3304281c879176 100644
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

