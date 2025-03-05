Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB33A4FBAF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 11:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AAA10E729;
	Wed,  5 Mar 2025 10:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B5A10E729
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 10:21:13 +0000 (UTC)
Received: from jtjnmail201610.home.langchao.com
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202503051821078543;
 Wed, 05 Mar 2025 18:21:07 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 18:21:09 +0800
Received: from locahost.localdomain (10.94.12.149) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Mar 2025 18:21:08 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <mripard@kernel.org>, <dave.stevenson@raspberrypi.com>,
 <mcanal@igalia.com>, <kernel-list@raspberrypi.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Charles Han" <hanchunchao@inspur.com>
Subject: [PATCH] drm/vc4: plane: fix inconsistent indenting warning
Date: Wed, 5 Mar 2025 18:21:07 +0800
Message-ID: <20250305102107.2595-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.149]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 2025305182107940427e00671b9a07b4e530dba967011
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

Fix below inconsistent indenting smatch warning.
smatch warnings:
drivers/gpu/drm/vc4/vc4_plane.c:2083 vc6_plane_mode_set() warn: inconsistent indenting

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index c5e84d3494d2..056d344c5411 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -2080,7 +2080,7 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 			/* HPPF plane 1 */
 			vc4_dlist_write(vc4_state, kernel);
 			/* VPPF plane 1 */
-				vc4_dlist_write(vc4_state, kernel);
+			vc4_dlist_write(vc4_state, kernel);
 		}
 	}
 
-- 
2.43.0

