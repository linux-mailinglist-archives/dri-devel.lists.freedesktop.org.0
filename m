Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5C68E9E6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 09:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEA210E6C9;
	Wed,  8 Feb 2023 08:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8410E045
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 08:29:37 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E872C496;
 Wed,  8 Feb 2023 09:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675844976;
 bh=MDS5IDtdqwsw5d5ooAax7OknMyhhBsxtxqY9Ap06hzg=;
 h=From:To:Cc:Subject:Date:From;
 b=N4J+27nKew8Rc7HhnA6J+LxYQ1riAT1tm1+tkN9lX/aMbX7uREzt6Wh6VB6KVgrNr
 eU+QG0wLMDnCjBhev6IeSxFmXfOuyDm09oPYsxJRcKqDea2FKaOg6/2GzJD1GV5hyz
 mGL+Rj2a3X0/xqz71gXjQbCwLeDsDlxwKrQoBGQ4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] media: Fix building pdfdocs
Date: Wed,  8 Feb 2023 10:29:16 +0200
Message-Id: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Akira Yokosawa <akiyks@gmail.com>, Dave Airlie <airlied@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
documatation for a few new RGB formats. For some reason these break the
pdfdocs build, even if the same style seems to work elsewhere in the
file.

Remove the trailing empty dash lines, which seems to fix the issue.

Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---

Note: the offending patch was merged via drm tree, so we may want to
apply the fix to the drm tree also.

 Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
index d330aeb4d3eb..ea545ed1aeaa 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
@@ -868,7 +868,6 @@ number of bits for each component.
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
-      -
     * .. _V4L2-PIX-FMT-RGBA1010102:
 
       - ``V4L2_PIX_FMT_RGBA1010102``
@@ -909,7 +908,6 @@ number of bits for each component.
       - r\ :sub:`4`
       - r\ :sub:`3`
       - r\ :sub:`2`
-      -
     * .. _V4L2-PIX-FMT-ARGB2101010:
 
       - ``V4L2_PIX_FMT_ARGB2101010``
@@ -950,7 +948,6 @@ number of bits for each component.
       - r\ :sub:`6`
       - r\ :sub:`5`
       - r\ :sub:`4`
-      -
 
 .. raw:: latex
 
-- 
2.34.1

