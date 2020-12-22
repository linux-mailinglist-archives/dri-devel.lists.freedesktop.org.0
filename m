Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B12E0ABC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374F56E868;
	Tue, 22 Dec 2020 13:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260086E85F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:31:51 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 770A22000F;
 Tue, 22 Dec 2020 13:31:49 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/doc: render drm.h uapi docs
Date: Tue, 22 Dec 2020 14:31:45 +0100
Message-Id: <20201222133145.159583-6-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222133145.159583-1-contact@emersion.fr>
References: <20201222133145.159583-1-contact@emersion.fr>
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

It doesn't seem like drm.h docs are included anywhere. Render them next
to drm_mode.h, under the "Userspace API Structures" section.

This also allows references to e.g. DRM_CAP_* to be properly linkified
elsewhere in our docs.

Signed-off-by: Simon Ser <contact@emersion.fr>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 7dce175f6d75..04bdc7a91d53 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -457,5 +457,8 @@ Userspace API Structures
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :doc: overview
 
+.. kernel-doc:: include/uapi/drm/drm.h
+   :internal:
+
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :internal:
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
