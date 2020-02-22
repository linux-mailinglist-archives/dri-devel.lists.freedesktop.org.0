Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDC168F99
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1BD6E941;
	Sat, 22 Feb 2020 15:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D88C6E918
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:01:48 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 514FC1AB3;
 Sat, 22 Feb 2020 16:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383704;
 bh=77H2MdLT1ECSN0pkU5pRQ8BdRkUm/ufL5IcoYXixJcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cv9ppJE0ObpVDO0RgTRc0/SUvuwCwpSO1P+Bol25WvGn5evHb3UOioCDOIFz18Lwn
 AJpWbMgp1ZrogkEa4AD9iyF/aiRHTH2E9pXQ3oHPbHYooqfQwKMfLjcaVI8c0o7Fqx
 kQHMRIjaNNXIc+ZDfQol9wQLclnXnmopDYmf3tIo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 08/54] drm/bridge: Add interlace_allowed flag to drm_bridge
Date: Sat, 22 Feb 2020 17:00:20 +0200
Message-Id: <20200222150106.22919-9-laurent.pinchart@ideasonboard.com>
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

In preparation for a connector creation helper based on a chain of
bridges, add a flag to the drm_bridge structure to report support for
interlaced modes. This will be used to set the connector's
interlace_allowed flag.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/drm/drm_bridge.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9d5d750973e9..018e195c4808 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -721,6 +721,11 @@ struct drm_bridge {
 	 * identifies the type of connected display.
 	 */
 	int type;
+	/**
+	 * @interlace_allowed: Indicate that the bridge can handle interlaced
+	 * modes.
+	 */
+	bool interlace_allowed;
 	/**
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
