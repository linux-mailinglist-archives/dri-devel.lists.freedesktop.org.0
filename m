Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484522C6CA2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 21:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BAE6F3A0;
	Fri, 27 Nov 2020 20:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FD26EE8F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:41:46 +0000 (UTC)
IronPort-SDR: iSh8H7aAom8Tn8XoIZ9CMC5iTmYwnTCsGFH//BHFtQ5E7gu68T/WxqvFJ7HaVQQZL6A9yNiJS/
 noKTQUTts/Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9818"; a="172587548"
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="172587548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 12:41:44 -0800
IronPort-SDR: UqoYZdYmpj1R8d9OydrrhdGjSrN41asyjvdUpV0NFqK4vIZRGho4NrKteWr1gVbOMC+VPPGEIY
 dkmWNyH8GGlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,375,1599548400"; d="scan'208";a="537737680"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga005.fm.intel.com with ESMTP; 27 Nov 2020 12:41:44 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v3 1/6] Update kernel headers
Date: Fri, 27 Nov 2020 12:55:38 -0800
Message-Id: <1606510543-45567-2-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To commit 2eef437c4669 ("RDMA/uverbs: Add uverbs command for dma-buf based
MR registration").

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 kernel-headers/rdma/ib_user_ioctl_cmds.h | 14 ++++++++++++++
 kernel-headers/rdma/ib_user_verbs.h      | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/kernel-headers/rdma/ib_user_ioctl_cmds.h b/kernel-headers/rdma/ib_user_ioctl_cmds.h
index 7968a18..dafc7eb 100644
--- a/kernel-headers/rdma/ib_user_ioctl_cmds.h
+++ b/kernel-headers/rdma/ib_user_ioctl_cmds.h
@@ -1,5 +1,6 @@
 /*
  * Copyright (c) 2018, Mellanox Technologies inc.  All rights reserved.
+ * Copyright (c) 2020, Intel Corporation. All rights reserved.
  *
  * This software is available to you under a choice of one of two
  * licenses.  You may choose to be licensed under the terms of the GNU
@@ -251,6 +252,7 @@ enum uverbs_methods_mr {
 	UVERBS_METHOD_MR_DESTROY,
 	UVERBS_METHOD_ADVISE_MR,
 	UVERBS_METHOD_QUERY_MR,
+	UVERBS_METHOD_REG_DMABUF_MR,
 };
 
 enum uverbs_attrs_mr_destroy_ids {
@@ -272,6 +274,18 @@ enum uverbs_attrs_query_mr_cmd_attr_ids {
 	UVERBS_ATTR_QUERY_MR_RESP_IOVA,
 };
 
+enum uverbs_attrs_reg_dmabuf_mr_cmd_attr_ids {
+	UVERBS_ATTR_REG_DMABUF_MR_HANDLE,
+	UVERBS_ATTR_REG_DMABUF_MR_PD_HANDLE,
+	UVERBS_ATTR_REG_DMABUF_MR_OFFSET,
+	UVERBS_ATTR_REG_DMABUF_MR_LENGTH,
+	UVERBS_ATTR_REG_DMABUF_MR_IOVA,
+	UVERBS_ATTR_REG_DMABUF_MR_FD,
+	UVERBS_ATTR_REG_DMABUF_MR_ACCESS_FLAGS,
+	UVERBS_ATTR_REG_DMABUF_MR_RESP_LKEY,
+	UVERBS_ATTR_REG_DMABUF_MR_RESP_RKEY,
+};
+
 enum uverbs_attrs_create_counters_cmd_attr_ids {
 	UVERBS_ATTR_CREATE_COUNTERS_HANDLE,
 };
diff --git a/kernel-headers/rdma/ib_user_verbs.h b/kernel-headers/rdma/ib_user_verbs.h
index 456438c..7ee73a0 100644
--- a/kernel-headers/rdma/ib_user_verbs.h
+++ b/kernel-headers/rdma/ib_user_verbs.h
@@ -596,20 +596,6 @@ enum {
 	IB_UVERBS_CREATE_QP_SUP_COMP_MASK = IB_UVERBS_CREATE_QP_MASK_IND_TABLE,
 };
 
-enum {
-	/*
-	 * This value is equal to IB_QP_DEST_QPN.
-	 */
-	IB_USER_LEGACY_LAST_QP_ATTR_MASK = 1ULL << 20,
-};
-
-enum {
-	/*
-	 * This value is equal to IB_QP_RATE_LIMIT.
-	 */
-	IB_USER_LAST_QP_ATTR_MASK = 1ULL << 25,
-};
-
 struct ib_uverbs_ex_create_qp {
 	__aligned_u64 user_handle;
 	__u32 pd_handle;
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
