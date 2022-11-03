Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258C6617BC4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 12:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10910E27B;
	Thu,  3 Nov 2022 11:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 769C110E27B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 11:41:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F5A01FB;
 Thu,  3 Nov 2022 04:41:10 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBF233F703;
 Thu,  3 Nov 2022 04:41:02 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH] drm/panfrost: Remove type name from internal struct again
Date: Thu,  3 Nov 2022 11:40:36 +0000
Message-Id: <20221103114036.1581854-1-steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 72655fb942c1 ("drm/panfrost: replace endian-specific types with
native ones") accidentally reverted part of the parent commit
7228d9d79248 ("drm/panfrost: Remove type name from internal structs")
leading to the situation that the Panfrost UAPI header still doesn't
compile correctly in C++.

Revert the accidental revert and pass me a brown paper bag.

Reported-by: Alyssa Rosenzweig <alyssa@collabora.com>
Fixes: 72655fb942c1 ("drm/panfrost: replace endian-specific types with native ones")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 include/uapi/drm/panfrost_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 6f93c915cc88..9f231d40a146 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -254,7 +254,7 @@ struct panfrost_dump_object_header {
 			__u64 nbos;
 		} reghdr;
 
-		struct pan_bomap_hdr {
+		struct {
 			__u32 valid;
 			__u64 iova;
 			__u32 data[2];
-- 
2.34.1

