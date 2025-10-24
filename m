Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4DC072C2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD9E10EAF7;
	Fri, 24 Oct 2025 16:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HUd+wqS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C1E10EAC7;
 Fri, 24 Oct 2025 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LuroRRxeLOFwNohk0s+UBm8zjVI2tRnmlYQm2PFfDXU=; b=HUd+wqS3Z0GWYW43u7cwkhF+PK
 u4G6n9irnF9TQ04VJtQz1H72f1PLXGXGax/yplT4vThRPosGZFfyDa1Iv2s8JS8pdatwTkP0BuDYP
 RL0U7gMN5ws+sLMGXdm8sLslyrwH9NQLHfRFe+ufh2OC+D2+Xb1qGssupsl/DARJr7n6P84NjKrEA
 96cu1RKMFIzjLOeh4p6eQwxaXrXPmZ7uW/sOmUwTvZBFH4qD+GPoJ8pUJozHxdz5wCPfHpH+VsF2w
 0aSvrJKz/lCwDpQjWMYp+VslZ2B9aHbyS2skUhcFv4Q3Rwp4kYrEhHz0aY5wQg6gibXkxGzbmdKZu
 cURAwkVg==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCKKu-00Ep8p-Db; Fri, 24 Oct 2025 18:08:16 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v3 18/27] drm/imagination: Remove drm_sched_init_args->num_rqs
 usage
Date: Fri, 24 Oct 2025 17:07:51 +0100
Message-ID: <20251024160800.79836-19-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
References: <20251024160800.79836-1-tvrtko.ursulin@igalia.com>
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
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index fc415dd0d7a7..3509bea293bd 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1228,7 +1228,6 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
 	const struct drm_sched_init_args sched_args = {
 		.ops = &pvr_queue_sched_ops,
 		.submit_wq = pvr_dev->sched_wq,
-		.num_rqs = 1,
 		.credit_limit = 64 * 1024,
 		.hang_limit = 1,
 		.timeout = msecs_to_jiffies(500),
-- 
2.48.0

