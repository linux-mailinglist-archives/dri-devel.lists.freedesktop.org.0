Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E162DC7CC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 21:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC7389A92;
	Wed, 16 Dec 2020 20:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CD08995F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:33:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C24BC3AA2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:22:59 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A1AF6240003;
 Wed, 16 Dec 2020 20:22:37 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/doc: move composition function docs to new section
Date: Wed, 16 Dec 2020 21:22:16 +0100
Message-Id: <20201216202222.48146-3-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216202222.48146-1-contact@emersion.fr>
References: <20201216202222.48146-1-contact@emersion.fr>
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

Move drm_blend.c function reference from the KMS properties section to
the plane abstraction section. This makes the KMS properties section
more readable for user-space developers.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 Documentation/gpu/drm-kms.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 76cf6acc23a5..3f92d4eb224b 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -370,6 +370,12 @@ Plane Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_plane.c
    :export:
 
+Plane Composition Functions Reference
+-------------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_blend.c
+   :export:
+
 Display Modes Function Reference
 ================================
 
@@ -472,9 +478,6 @@ Plane Composition Properties
 .. kernel-doc:: drivers/gpu/drm/drm_blend.c
    :doc: overview
 
-.. kernel-doc:: drivers/gpu/drm/drm_blend.c
-   :export:
-
 Damage Tracking Properties
 --------------------------
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
