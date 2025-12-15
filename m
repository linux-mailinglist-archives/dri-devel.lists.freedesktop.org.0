Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95515CBE879
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7373510E5B3;
	Mon, 15 Dec 2025 15:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QLz5AU9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D62D10E5B9;
 Mon, 15 Dec 2025 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6XteYEIbtoFCGOI6KyeEWPkivFlpasbQELYBfBjTTxs=; b=QLz5AU9/2hmUj0tk5yBY/VCsmp
 xqqMsNhHeUrDhP8Ziny38VyPsjDkPhavUFe5+7GKNSlO6adMFImP7pb0+WT4mLLRLLxlkFJVqCguP
 nN2gOItbXFNh3TTITpr0ev7GYP+zHoCg/1ExMCeiY5lmf/k7rIZ0R98CgkXEG6K2jJI6+ICXcG1mT
 0binqY8maQ71Y9HHCZdiL0xoJahTfw64wxAyv+99leNmSvKtqBp3tznfda3FG4nTHW2c6u4qEg2GR
 uWrcxzZjoOJbzBjkEZSetVxvSnR98WH5KLPVOMM6mtAreoXFHLUL6/1OunrFlSVHM5iLxwZ8HzaGB
 G2U8/Cpw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVABk-00CzCP-PM; Mon, 15 Dec 2025 16:08:40 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.or, intel-xe@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v4 22/28] drm/nouveau: Remove drm_sched_init_args->num_rqs
 usage
Date: Mon, 15 Dec 2025 15:08:01 +0000
Message-ID: <20251215150807.58819-23-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
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
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index a7bf539e5d86..dce8c5c9bec6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -407,7 +407,6 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	struct drm_sched_entity *entity = &sched->entity;
 	struct drm_sched_init_args args = {
 		.ops = &nouveau_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = credit_limit,
 		.timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
 		.name = "nouveau_sched",
-- 
2.51.1

