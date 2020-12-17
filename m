Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EB2DD068
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDD06E2C7;
	Thu, 17 Dec 2020 11:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9139D6E2B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:32:26 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D3016C0006;
 Thu, 17 Dec 2020 11:32:24 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/doc: atomic implicitly enables other caps
Date: Thu, 17 Dec 2020 12:32:17 +0100
Message-Id: <20201217113220.102271-7-contact@emersion.fr>
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

Document that enabling atomic also enables universal planes and aspect
ratio modes.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..5c31aea1f342 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -678,7 +678,9 @@ struct drm_get_cap {
 /**
  * DRM_CLIENT_CAP_ATOMIC
  *
- * If set to 1, the DRM core will expose atomic properties to userspace
+ * If set to 1, the DRM core will expose atomic properties to userspace. This
+ * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
+ * &DRM_CLIENT_CAP_ASPECT_RATIO.
  */
 #define DRM_CLIENT_CAP_ATOMIC	3
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
