Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D52DB954
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 03:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C558989BFC;
	Wed, 16 Dec 2020 02:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953BA89BAE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 02:44:14 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06008BBE;
 Wed, 16 Dec 2020 03:44:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608086651;
 bh=YdRs++jv5RiqND6olA+Ax8kQoOw4+SkdrsXpyRc2WpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JPz5QIgYI1wimpXK+UOV49B9gEtY4ooS3jehf1b1GNbaR3eYfwHyDdIOxnnMyp/iD
 5XwrkpFVV9NEsrtsXIE3O3ve0qkxNdOmSgXlLWZHKSS7OKpeMIM9KPhGPs/sPCwreQ
 Rq5MNpxNUSfGvMw/mtAkIIoTpy9J1t2Co+hi6dN4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/10] drm: uapi: nouveau: Use SPDX in DRM drivers uAPI
 headers
Date: Wed, 16 Dec 2020 04:43:54 +0200
Message-Id: <20201216024359.12995-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Nouveau DRM driver uAPI header is licensed under the MIT license,
and carries a copy of the license with slight variations. Replace it
with an SPDX header.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/uapi/drm/nouveau_drm.h | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 853a327433d3..555283b49080 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -1,25 +1,7 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright 2005 Stephane Marchesin.
  * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef __NOUVEAU_DRM_H__
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
