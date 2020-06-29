Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F820CE4E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110676E0C4;
	Mon, 29 Jun 2020 11:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A206E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:42:18 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D06FD23BCA;
 Mon, 29 Jun 2020 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593430938;
 bh=GDX24qnBJDBxLSYiHWbCVfvVhzDS87MAqXvIDZ0C7oI=;
 h=Subject:To:Cc:From:Date:From;
 b=sUAfKSzUVPjBqKQ3tgoawMH3nPZooh8BMqyELXCBbtPdYR31CV2qpP9SmFXgFf8LM
 6HipXYOfqeI0Fm/v4LVrAIQ1eavfjSv1TvR8rUMDMn435yUWevhGT568pAW7c/84vP
 ZdNKjB/eKIjYuxfMi6qrD40ae6yFOdEqnXpGvz6s=
Subject: Patch "drm/panel-simple: fix connector type for LogicPD Type28
 Display" has been added to the 5.7-stable tree
To: aford173@gmail.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, sam@ravnborg.org, thierry.reding@gmail.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 13:41:33 +0200
Message-ID: <1593430893218137@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/panel-simple: fix connector type for LogicPD Type28 Display

to the 5.7-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-panel-simple-fix-connector-type-for-logicpd-type28-display.patch
and it can be found in the queue-5.7 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From efb94790852ae673b18efde1b171d284689ff333 Mon Sep 17 00:00:00 2001
From: Adam Ford <aford173@gmail.com>
Date: Mon, 15 Jun 2020 08:19:34 -0500
Subject: drm/panel-simple: fix connector type for LogicPD Type28 Display

From: Adam Ford <aford173@gmail.com>

commit efb94790852ae673b18efde1b171d284689ff333 upstream.

The LogicPD Type28 display used by several Logic PD products has not
worked since v5.6.

The connector type for the LogicPD Type 28 display is missing and
drm_panel_bridge_add() requires connector type to be set.

Signed-off-by: Adam Ford <aford173@gmail.com>
Fixes: 0d35408afbeb ("drm/panel: simple: Add Logic PD Type 28 display support")
Cc: Adam Ford <aford173@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.6+
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200615131934.12440-1-aford173@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/panel/panel-simple.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2297,6 +2297,7 @@ static const struct panel_desc logicpd_t
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
 		     DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct panel_desc mitsubishi_aa070mc01 = {


Patches currently in stable-queue which might be from aford173@gmail.com are

queue-5.7/drm-panel-simple-fix-connector-type-for-logicpd-type28-display.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
