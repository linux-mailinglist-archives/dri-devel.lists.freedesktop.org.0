Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6BCD028A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3263910EFE6;
	Fri, 19 Dec 2025 13:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qZuJRZ8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137AF10EFD7;
 Fri, 19 Dec 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z5GR3zE4ZHGzaANoB7W3tWhGCtQFZfasD16ekaOJfv0=; b=qZuJRZ8SBqbbVjNq1x/r+olfF6
 XG3lw5SErX+h+WMVXO+HFkALZkN8lp9k+/QTxX+AGn6GH3YIUqJaUak+2rCMD4wAPvKfHF3I4IAKI
 5JFAlmxCTdgoI2um/HJl0UqvQ93PM/zju3RU/x9Tgz3hbeCNrdCQG93l9pWm/ZN4wbU2JBlpY6IJc
 +SPgP565MFxLonCM4p0ThzHMS/eUzkOv4IuPwCumpcxrhfOA0A46eFOF5JCLaW9+i690/vz2sITTZ
 8aHGP3/7/nULD/LjMg464qcjjwKqArZIep3mmJSA9UxVPvUToHpYHAU06snNbA0JRinHBopDYdHEy
 HmDbPPqA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vWaw2-00Eekc-Aj; Fri, 19 Dec 2025 14:54:22 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH v5 24/28] drm/panthor: Remove drm_sched_init_args->num_rqs
 usage
Date: Fri, 19 Dec 2025 13:53:46 +0000
Message-ID: <20251219135351.25880-25-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c   | 1 -
 drivers/gpu/drm/panthor/panthor_sched.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b888fff05efe..8516de201b0f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2424,7 +2424,6 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 	const struct drm_sched_init_args sched_args = {
 		.ops = &panthor_vm_bind_ops,
 		.submit_wq = ptdev->mmu->vm.wq,
-		.num_rqs = 1,
 		.credit_limit = 1,
 		/* Bind operations are synchronous for now, no timeout needed. */
 		.timeout = MAX_SCHEDULE_TIMEOUT,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ca272dbae14d..83545983c6f2 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3486,7 +3486,6 @@ group_create_queue(struct panthor_group *group,
 	struct drm_sched_init_args sched_args = {
 		.ops = &panthor_queue_sched_ops,
 		.submit_wq = group->ptdev->scheduler->wq,
-		.num_rqs = 1,
 		/*
 		 * The credit limit argument tells us the total number of
 		 * instructions across all CS slots in the ringbuffer, with
-- 
2.51.1

