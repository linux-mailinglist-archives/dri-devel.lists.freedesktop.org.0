Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11812E0AE0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F060F6E873;
	Tue, 22 Dec 2020 13:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D026E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:35:28 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3755820006;
 Tue, 22 Dec 2020 13:35:27 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/5] drm/doc: re-format drm.h file comment
Date: Tue, 22 Dec 2020 14:35:22 +0100
Message-Id: <20201222133524.160842-4-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222133524.160842-1-contact@emersion.fr>
References: <20201222133524.160842-1-contact@emersion.fr>
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

Our documentation build system chokes on \file comments:

    ./include/uapi/drm/drm.h:2: warning: Cannot understand  * \file drm.h
     on line 2 - I thought it was a doc line

Remove all of the slash-directives, and demote to a normal comment. Keep
the historical information because it predates Git.

v3: keep the comment (Daniel)

Signed-off-by: Simon Ser <contact@emersion.fr>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 5c31aea1f342..a3ee8e01c295 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1,11 +1,10 @@
-/**
- * \file drm.h
+/*
  * Header for the Direct Rendering Manager
  *
- * \author Rickard E. (Rik) Faith <faith@valinux.com>
+ * Author: Rickard E. (Rik) Faith <faith@valinux.com>
  *
- * \par Acknowledgments:
- * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic \c cmpxchg.
+ * Acknowledgments:
+ * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic cmpxchg.
  */
 
 /*
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
