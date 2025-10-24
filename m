Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D102BC072E3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C35410EAF5;
	Fri, 24 Oct 2025 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EzADfOUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859EC10EAF5;
 Fri, 24 Oct 2025 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DJtB5KdqWSBifkD54pBDxfP+tJlfpZuiFAXlyzQHUxQ=; b=EzADfOUHD9ExB0/bjEz5s3sgy7
 tUsoRveu2k6m6XaCJP7ieG4HmvUmuEzD5VnQv+ow3rV8b6oloj20aqu8/wshNciQaSMNICxtONvW8
 CdFZ18OZelIlFTFGF4Sag1qeUdU/YWu8qKdS1Dhb3bMHkpDVXA8CroqfaaZvIn1K7SHvSS+SUVRn4
 tb6SJMBX7JwENYp8ewXL2+OGn+UGqgtXPlnQZcNpBWa16S5aIfA6xAzAGoUPlhNgPn7fd/SPIie7e
 0UovGFhcAvuNdDhSYvUM84u2pP7TVg2yBSY6fX8yaa6XiB5Ds4QP2MYdWrJhyE79Rfb1hGzo7gl8u
 vmVonX8Q==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCKKy-00EpAg-Pe; Fri, 24 Oct 2025 18:08:20 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH v3 24/27] drm/sched: Remove drm_sched_init_args->num_rqs usage
Date: Fri, 24 Oct 2025 17:07:57 +0100
Message-ID: <20251024160800.79836-25-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
References: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index 8e9ae7d980eb..14403a762335 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -290,7 +290,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
 {
 	struct drm_sched_init_args args = {
 		.ops		= &drm_mock_scheduler_ops,
-		.num_rqs	= DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit	= U32_MAX,
 		.hang_limit	= 1,
 		.timeout	= timeout,
-- 
2.48.0

