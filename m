Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB86832F3AE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 20:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FD96EC29;
	Fri,  5 Mar 2021 19:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8C06EC29
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:17:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614971865; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4yj4BLUjKC2+C0TFQ3euq+M9GNFyVABLQZ+Lu8m9ayY=;
 b=wib7+hXjg8ndA/MuN4oCezS8592UFqMunu/SsTBScZEeEbxSkhV8OeS39r7b6ljq+RXUW8o1
 M+gQSg+RpcUlQQ8DKY3kYcPoqIUFO3MyRa7TNcFpWyjCdgzvDvfMtJO0bBt/V8XWjMWLprPk
 bz22InBqJfGeoizDLIkHlo9rrDY=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 604283cf81003345dc928971 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 19:17:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C4BB5C433ED; Fri,  5 Mar 2021 19:17:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 66324C433CA;
 Fri,  5 Mar 2021 19:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66324C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/dp: delete unnecessary debugfs error handling
Date: Fri,  5 Mar 2021 11:17:19 -0800
Message-Id: <1614971839-2686-3-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, dan.carpenter@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the error checking logic in the dp_debug module could
pass zero to PTR_ERR and it causes the below kbot warnings:

drivers/gpu/drm/msm/dp/dp_debug.c:378 dp_debug_init()
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/msm/dp/dp_debug.c:387 dp_debug_init()
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/msm/dp/dp_debug.c:396 dp_debug_init()
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/msm/dp/dp_debug.c:405 dp_debug_init()
warn: passing zero to 'PTR_ERR'

Debugfs functions are not supposed to be checked in the normal
case so delete this code.  Also it silences the above Smatch
warnings that we're checking for NULL when these functions only
return error pointers.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 6c6998f..2f6247e 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -368,44 +368,21 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
-	struct dentry *file;
-	struct dentry *test_active;
-	struct dentry *test_data, *test_type;
 
-	file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
+	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
 			debug, &dp_debug_fops);
-	if (IS_ERR_OR_NULL(file)) {
-		rc = PTR_ERR(file);
-		DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
-	test_active = debugfs_create_file("msm_dp_test_active", 0444,
+	debugfs_create_file("msm_dp_test_active", 0444,
 			minor->debugfs_root,
 			debug, &test_active_fops);
-	if (IS_ERR_OR_NULL(test_active)) {
-		rc = PTR_ERR(test_active);
-		DRM_ERROR("[%s] debugfs test_active failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
-	test_data = debugfs_create_file("msm_dp_test_data", 0444,
+	debugfs_create_file("msm_dp_test_data", 0444,
 			minor->debugfs_root,
 			debug, &dp_test_data_fops);
-	if (IS_ERR_OR_NULL(test_data)) {
-		rc = PTR_ERR(test_data);
-		DRM_ERROR("[%s] debugfs test_data failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
-	test_type = debugfs_create_file("msm_dp_test_type", 0444,
+	debugfs_create_file("msm_dp_test_type", 0444,
 			minor->debugfs_root,
 			debug, &dp_test_type_fops);
-	if (IS_ERR_OR_NULL(test_type)) {
-		rc = PTR_ERR(test_type);
-		DRM_ERROR("[%s] debugfs test_type failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
 	debug->root = minor->debugfs_root;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
