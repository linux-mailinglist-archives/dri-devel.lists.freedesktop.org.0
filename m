Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79012DD064
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:32:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7268A6E2D7;
	Thu, 17 Dec 2020 11:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04236E233
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:32:24 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3CA36C0015;
 Thu, 17 Dec 2020 11:32:23 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/doc: fix reference to drm_format_modifier_blob
Date: Thu, 17 Dec 2020 12:32:14 +0100
Message-Id: <20201217113220.102271-4-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217113220.102271-1-contact@emersion.fr>
References: <20201217113220.102271-1-contact@emersion.fr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation build system recognizes "struct XXX" references and
generates links for them.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 4c1a45ac18e6..4a66374dc355 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -68,9 +68,9 @@
  *
  * IN_FORMATS:
  *     Blob property which contains the set of buffer format and modifier
- *     pairs supported by this plane. The blob is a drm_format_modifier_blob
- *     struct. Without this property the plane doesn't support buffers with
- *     modifiers. Userspace cannot change this property.
+ *     pairs supported by this plane. The blob is a struct
+ *     drm_format_modifier_blob. Without this property the plane doesn't
+ *     support buffers with modifiers. Userspace cannot change this property.
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
