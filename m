Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2B16BC53
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAB86EA32;
	Tue, 25 Feb 2020 08:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs56.siol.net [185.57.226.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D216E81A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 17:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 4ED395236B9;
 Mon, 24 Feb 2020 18:39:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ffxPlucRGbIH; Mon, 24 Feb 2020 18:39:09 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 03FBE5236BE;
 Mon, 24 Feb 2020 18:39:09 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 689AB5236B9;
 Mon, 24 Feb 2020 18:39:07 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 0/7] drm/sun4i: de2/de3 format fixes and updates
Date: Mon, 24 Feb 2020 18:38:54 +0100
Message-Id: <20200224173901.174016-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: jernej.skrabec@siol.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently VI layer code reported wrong formats for DE2 and DE3. First
three patches are fixes. Next two patches do code refactoring to remove
redundant information, which is already included elsewhere. Last two
patches are more cosmetic.

Note: It can be argued if patch 2 is really a fix. Consider that if only
patch 1 and 3 go into stable, wrong formats will be reported for DE3 VI
layers.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (7):
  drm/sun4i: de2/de3: Remove unsupported VI layer formats
  drm/sun4i: Add separate DE3 VI layer formats
  drm/sun4i: Fix DE2 VI layer format support
  drm/sun4i: de2: rgb field in de2 format struct is redundant
  drm/sun4i: de2: csc_mode in de2 format struct is mostly redundant
  drm/sun4i: de2: Don't return de2_fmt_info struct
  drm/sun4i: Sort includes in VI and UI layer code

 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 159 ++++++++++++-------------
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  21 ++--
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  14 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 106 ++++++++++++++---
 4 files changed, 183 insertions(+), 117 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
