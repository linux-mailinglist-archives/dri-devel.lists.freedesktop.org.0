Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA232A992
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 19:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEACF6E270;
	Tue,  2 Mar 2021 18:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89406E270
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 18:44:33 +0000 (UTC)
IronPort-SDR: xv2Ev2uG5ccjjB8o+hLpxtvhpBmTq642d1U8OEH6qXgcEvugA1YAH7orN1CJO4h/xkOWdTKeQ6
 4jSVaL6RtbcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166825730"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="166825730"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 10:44:33 -0800
IronPort-SDR: 3N54j6u+UKv5F+srWXLLffW/0ZKqth39sscGFOlihFfeYmvEQZXtys7AY/YUwUU7eCq72anj1p
 HgnIUcYKwcoA==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="406855356"
Received: from gbain-mobl.ger.corp.intel.com (HELO delly.intel.com)
 ([10.252.45.167])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 10:44:31 -0800
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: fix drm_mode_create_blob comment
Date: Tue,  2 Mar 2021 20:44:27 +0200
Message-Id: <20210302184427.1301264-1-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.30.1
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
Cc: Ben Widawsky <ben@bwidawsk.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a silly mistake

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Suggested-by: Ben Widawsky <ben@bwidawsk.net>
---
 include/uapi/drm/drm_mode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index b49fbf2bdc408..93b494f704b91 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -993,7 +993,7 @@ struct drm_format_modifier {
 };
 
 /**
- * struct drm_mode_create_blob - Create New block property
+ * struct drm_mode_create_blob - Create New blob property
  *
  * Create a new 'blob' data property, copying length bytes from data pointer,
  * and returning new blob ID.
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
