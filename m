Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C32DD06B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680526E303;
	Thu, 17 Dec 2020 11:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FFA6E2B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:32:26 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 62A49C0017;
 Thu, 17 Dec 2020 11:32:25 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm/doc: remove drm.h file comment
Date: Thu, 17 Dec 2020 12:32:18 +0100
Message-Id: <20201217113220.102271-8-contact@emersion.fr>
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

Our documentation build system chokes on \file comments. This comment
seems mostly historical and doesn't provide any useful information.

    ./include/uapi/drm/drm.h:2: warning: Cannot understand  * \file drm.h
     on line 2 - I thought it was a doc line

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 5c31aea1f342..783f666152a1 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1,13 +1,3 @@
-/**
- * \file drm.h
- * Header for the Direct Rendering Manager
- *
- * \author Rickard E. (Rik) Faith <faith@valinux.com>
- *
- * \par Acknowledgments:
- * Dec 1999, Richard Henderson <rth@twiddle.net>, move to generic \c cmpxchg.
- */
-
 /*
  * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
  * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
