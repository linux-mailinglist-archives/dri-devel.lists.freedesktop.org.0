Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAE662E2E0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E0110E64D;
	Thu, 17 Nov 2022 17:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5910E64D;
 Thu, 17 Nov 2022 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=smL2Rmie4NiQV8CZsOPNkcR6M+ljD18RGFuWqIoGNYg=; b=h/G6IEwklW9pY5On6uKrLDOWJs
 Sxa8FqSCOBfPrIyBSn/0sK8oO552McbCLO0z/zNalJFABZ/hnVF8c+o/iYfVt7pPXQx7I9NmFmQhO
 698RdHcYytKebOyYTMIfQRjlGM8jRyYnWxm4bRJiCl/tN+e0kGdkXsVsLETlPEucmrDUhEu4W46r4
 BHDnu0wFMKbAsyw8A3EKfWjAyevpojxce1qbyUHJRV7iM2DXN8o82jdgBuPyvBeIEQNeol9QYfkjV
 WqUhSWs/+f9s5eyZ7Nz0xSktH2MKG6FBv4oygJdnLm6bnmd5B3YLWfScMUHmRsjE4v7c7p+lSCxXl
 dpiBIhfQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oviYm-001FKW-Gy; Thu, 17 Nov 2022 17:20:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/amd/display: fix kernel-doc issues in dc.h
Date: Thu, 17 Nov 2022 09:20:09 -0800
Message-Id: <20221117172009.28207-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
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
Cc: Leo Li <sunpeng.li@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix these kernel-doc complaints:

drivers/gpu/drm/amd/display/dc/dc.h:505: warning: cannot understand function prototype: 'struct dc_clocks '
dc.h:472: warning: Enum value 'MPC_SPLIT_AVOID' not described in enum 'pipe_split_policy'
dc.h:472: warning: Enum value 'MPC_SPLIT_AVOID_MULT_DISP' not described in enum 'pipe_split_policy'
dc.h:532: warning: Incorrect use of kernel-doc format:          * @fw_based_mclk_switching

Fixes: ea76895ffab1 ("drm/amd/display: Document pipe split policy")
Fixes: 1682bd1a6b5f ("drm/amd/display: Expand kernel doc for DC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dc.h |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff -- a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -458,15 +458,15 @@ enum pipe_split_policy {
 	MPC_SPLIT_DYNAMIC = 0,
 
 	/**
-	 * @MPC_SPLIT_DYNAMIC: Avoid pipe split, which means that DC will not
+	 * @MPC_SPLIT_AVOID: Avoid pipe split, which means that DC will not
 	 * try any sort of split optimization.
 	 */
 	MPC_SPLIT_AVOID = 1,
 
 	/**
-	 * @MPC_SPLIT_DYNAMIC: With this option, DC will only try to optimize
-	 * the pipe utilization when using a single display; if the user
-	 * connects to a second display, DC will avoid pipe split.
+	 * @MPC_SPLIT_AVOID_MULT_DISP: With this option, DC will only try to
+	 * optimize the pipe utilization when using a single display; if the
+	 * user connects to a second display, DC will avoid pipe split.
 	 */
 	MPC_SPLIT_AVOID_MULT_DISP = 2,
 };
@@ -497,7 +497,7 @@ enum dcn_zstate_support_state {
 };
 
 /**
- * dc_clocks - DC pipe clocks
+ * struct dc_clocks - DC pipe clocks
  *
  * For any clocks that may differ per pipe only the max is stored in this
  * structure
@@ -528,7 +528,7 @@ struct dc_clocks {
 	bool fclk_prev_p_state_change_support;
 	int num_ways;
 
-	/**
+	/*
 	 * @fw_based_mclk_switching
 	 *
 	 * DC has a mechanism that leverage the variable refresh rate to switch
