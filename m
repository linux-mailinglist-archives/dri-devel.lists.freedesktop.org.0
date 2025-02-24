Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96A6A42257
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A1210E41F;
	Mon, 24 Feb 2025 14:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="fR4Mqg3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6AE10E16F;
 Mon, 24 Feb 2025 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1740387489; x=1771923489;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TehgUXQTMnMUl0FPqBaCA7g/l7jdHTIvAWt3UMFKf+8=;
 b=fR4Mqg3fOOEwW4VkmVMkNlWrTWuDnNsc09pO0OnEjRClqq4SNQJ/teOy
 a/342l+Hv/ijLe77WjHMeabDT7HNJZv07q6AW4TuIJWrQTNTokWdpn1fY
 8OzDJmYoOL75akW0VIsR4iLcGoJy8kqRXc11ThYd8Qw9AdAjU6z/YmEqx Y=;
X-IronPort-AV: E=Sophos;i="6.13,311,1732579200"; d="scan'208";a="380138562"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 08:58:06 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:25615]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.48.97:2525]
 with esmtp (Farcaster)
 id f1c2068b-ea59-453d-a8cd-3532fa8c50c3; Mon, 24 Feb 2025 08:58:05 +0000 (UTC)
X-Farcaster-Flow-ID: f1c2068b-ea59-453d-a8cd-3532fa8c50c3
Received: from EX19D002AND002.ant.amazon.com (10.37.240.241) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 24 Feb 2025 08:58:02 +0000
Received: from HND-5CG1082HRX.ant.amazon.com (10.37.244.7) by
 EX19D002AND002.ant.amazon.com (10.37.240.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 24 Feb 2025 08:57:59 +0000
From: Yuichiro Tsuji <yuichtsu@amazon.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Yuichiro Tsuji <yuichtsu@amazon.com>
Subject: [PATCH] drm/i915/gt/uc: Fix typo in a comment
Date: Mon, 24 Feb 2025 17:56:37 +0900
Message-ID: <20250224085638.3500-2-yuichtsu@amazon.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.37.244.7]
X-ClientProxiedBy: EX19D043UWC001.ant.amazon.com (10.13.139.202) To
 EX19D002AND002.ant.amazon.com (10.37.240.241)
X-Mailman-Approved-At: Mon, 24 Feb 2025 14:05:04 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix typo in a comment.

explaination -> explanation

Signed-off-by: Yuichiro Tsuji <yuichtsu@amazon.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3fce5c000144..c381e0e092ee 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3011,7 +3011,7 @@ static int __guc_context_pin(struct intel_context *ce,
 
 	/*
 	 * GuC context gets pinned in guc_request_alloc. See that function for
-	 * explaination of why.
+	 * explanation of why.
 	 */
 
 	return lrc_pin(ce, engine, vaddr);
-- 
2.43.5

