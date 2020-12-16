Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700A82DC7C9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 21:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7002D89A88;
	Wed, 16 Dec 2020 20:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB118995F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:33:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 591A73AA33D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:23:00 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 30581240008;
 Wed, 16 Dec 2020 20:22:38 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/doc: move damage tracking functions to new section
Date: Wed, 16 Dec 2020 21:22:17 +0100
Message-Id: <20201216202222.48146-4-contact@emersion.fr>
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

Move drm_damage_helper function reference from the KMS properties
section to the plane abstraction section. This makes the KMS
properties section more readable for user-space developers.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 Documentation/gpu/drm-kms.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 3f92d4eb224b..e6329e7e638e 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -376,6 +376,15 @@ Plane Composition Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_blend.c
    :export:
 
+Plane Damage Tracking Functions Reference
+-----------------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_damage_helper.c
+   :export:
+
+.. kernel-doc:: include/drm/drm_damage_helper.h
+   :internal:
+
 Display Modes Function Reference
 ================================
 
@@ -484,12 +493,6 @@ Damage Tracking Properties
 .. kernel-doc:: drivers/gpu/drm/drm_damage_helper.c
    :doc: overview
 
-.. kernel-doc:: drivers/gpu/drm/drm_damage_helper.c
-   :export:
-
-.. kernel-doc:: include/drm/drm_damage_helper.h
-   :internal:
-
 Color Management Properties
 ---------------------------
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
