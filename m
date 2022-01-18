Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71450493153
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DD710E2CB;
	Tue, 18 Jan 2022 23:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jan 2022 17:07:31 UTC
Received: from forward107o.mail.yandex.net (forward107o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644310E1C9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 17:07:31 +0000 (UTC)
Received: from myt6-8f57f8b29865.qloud-c.yandex.net
 (myt6-8f57f8b29865.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2c81:0:640:8f57:f8b2])
 by forward107o.mail.yandex.net (Yandex) with ESMTP id 4E7156AF9BBF;
 Tue, 18 Jan 2022 20:00:48 +0300 (MSK)
Received: from myt6-9bdf92ffd111.qloud-c.yandex.net
 (myt6-9bdf92ffd111.qloud-c.yandex.net [2a02:6b8:c12:468a:0:640:9bdf:92ff])
 by myt6-8f57f8b29865.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 TIqon8tWko-0leG8KHX; Tue, 18 Jan 2022 20:00:48 +0300
Authentication-Results: myt6-8f57f8b29865.qloud-c.yandex.net; dkim=pass
Received: by myt6-9bdf92ffd111.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 5awJUD2gQt-0kPeBMo5; Tue, 18 Jan 2022 20:00:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Yaroslav Bolyukin <iam@lach.pw>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Add Vive Pro 2 to non-desktop list
Date: Tue, 18 Jan 2022 20:00:37 +0300
Message-Id: <20220118170037.14584-1-iam@lach.pw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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
Cc: Yaroslav Bolyukin <iam@lach.pw>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be..fdb8f0a6f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -200,9 +200,10 @@ static const struct edid_quirk {
 	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
 
-	/* HTC Vive and Vive Pro VR Headsets */
+	/* HTC Vive, Vive Pro and Vive Pro 2 VR Headsets */
 	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
 	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('H', 'V', 'R', 0xaa04, EDID_QUIRK_NON_DESKTOP),
 
 	/* Oculus Rift DK1, DK2, CV1 and Rift S VR Headsets */
 	EDID_QUIRK('O', 'V', 'R', 0x0001, EDID_QUIRK_NON_DESKTOP),

base-commit: 99613159ad749543621da8238acf1a122880144e
-- 
2.34.1

