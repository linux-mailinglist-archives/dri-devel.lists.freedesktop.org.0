Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95BC1F3AE1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 14:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E212E6E29D;
	Tue,  9 Jun 2020 12:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4336F6E29D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 12:46:36 +0000 (UTC)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net
 [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FA7631F;
 Tue,  9 Jun 2020 14:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591706793;
 bh=m/oYp7me1NruD0GAf/abMULsiM+tiK5uhnzcpuktL+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MrjGAS0t6AF2+NkuMA8jJzexW9whsEhCW26zQuvRhW6eQ2/1Xaxsc3rXA7yqta95x
 cRvsheZNPNrfJj909v36JqRU6FoYJmOCp8OAD8J5AUWAtYlhWlygdzAoJXH1HuSTlp
 hBwC3qJHYwJzXxD7r5LAN37UQ9wXwjDbyGYuFcj4=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 08/17] drivers: gpu: drm: Fix trivial spelling
Date: Tue,  9 Jun 2020 13:46:01 +0100
Message-Id: <20200609124610.3445662-9-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jiri Kosina <trivial@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 include/drm/drm_dp_helper.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 19c99dddcb99..8f1b329df16d 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1365,7 +1365,7 @@ EXPORT_SYMBOL(drm_dp_get_edid_quirks);
 /**
  * drm_dp_read_desc - read sink/branch descriptor from DPCD
  * @aux: DisplayPort AUX channel
- * @desc: Device decriptor to fill from DPCD
+ * @desc: Device descriptor to fill from DPCD
  * @is_branch: true for branch devices, false for sink devices
  *
  * Read DPCD 0x400 (sink) or 0x500 (branch) into @desc. Also debug log the
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 2035ac44afde..1165ec105638 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1701,7 +1701,7 @@ enum drm_dp_quirk {
 
 /**
  * drm_dp_has_quirk() - does the DP device have a specific quirk
- * @desc: Device decriptor filled by drm_dp_read_desc()
+ * @desc: Device descriptor filled by drm_dp_read_desc()
  * @edid_quirks: Optional quirk bitmask filled by drm_dp_get_edid_quirks()
  * @quirk: Quirk to query for
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
