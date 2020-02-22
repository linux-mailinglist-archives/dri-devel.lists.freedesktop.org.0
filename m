Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD9168F76
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238FA6E918;
	Sat, 22 Feb 2020 15:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B2E6E0F0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:01:44 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E7DEB27;
 Sat, 22 Feb 2020 16:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383702;
 bh=VDvUM+wFn6BNetMicrjmZzXJj/oLRXpKzf9whx2RQ8w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NfSO5GrnuMiyrAy5fYICpGpov0w9AhMAknwxlLh2x/QsfnrQpm/5RZin3UII/0xW6
 GJGHSPe+Nx0Foe0aMlys0/VUgmBMC9D6gAXIpX3VGoQxOHhF4NYyA8p5RSYlBuWbFt
 eDqQzcVjeBz3LhFvWMJK3+HG4FMy2kEE9qczltXU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 04/54] drm/bridge: Document the drm_encoder.bridge_chain
 field as private
Date: Sat, 22 Feb 2020 17:00:16 +0200
Message-Id: <20200222150106.22919-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_encoder.bridge_chain is not meant to be touched manually by
drivers. Make this clear in the documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/drm/drm_encoder.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 5623994b6e9e..4370e039c015 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -174,7 +174,8 @@ struct drm_encoder {
 	struct drm_crtc *crtc;
 
 	/**
-	 * @bridge_chain: Bridges attached to this encoder.
+	 * @bridge_chain: Bridges attached to this encoder. Drivers shall not
+	 * access this field directly.
 	 */
 	struct list_head bridge_chain;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
