Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC82A04E2A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 01:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3DC10E419;
	Wed,  8 Jan 2025 00:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linbit-com.20230601.gappssmtp.com header.i=@linbit-com.20230601.gappssmtp.com header.b="cs8frGHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8A10E316
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:04:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so143523701fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 06:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1736258579; x=1736863379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3xFXzN3XB56uGdpTaZfx8hAMErjpZa4pNklIejZ9Zg4=;
 b=cs8frGHqfHS/un7B0MstJDRmrmRFYWchndkMgTSgLbgYuj796wFAneRbuKK/df5YiG
 v3VDH+REksH8bDPbcYCzv42KnZZQnfw9rOoMHMKI51YTzSREfUhMZuEUKoLoBfKWNmlo
 OiP7d5RaXBCkTPIEtbXMZ2E6yVxbd1r7R38qViRhBea5e9NMwhMJ5qPIMCxmHqrb5MHf
 CDTmNV37d8aQFNBRVnpEhLKN3upR3mBPstGWRFaMQhgPe/3FCuAQ1WS/wjTqM6k1g8D3
 bJ62EIyPTPtLtjsneQ/V6460idqfEsWnb4BxAfv0/hg6QgNUHk491f3lEUSRpc0Fphcr
 wL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736258579; x=1736863379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xFXzN3XB56uGdpTaZfx8hAMErjpZa4pNklIejZ9Zg4=;
 b=tDiIrgbq4fW3k/hglQzT0eflGPyr4QJ2ZcMyqG5oZsNUuCCKsx9rBfsCxlyksIc2O6
 SH8g9eshovf7AV/hKuInUVscfbi3cUv6l4S8dhVwC9qSuVqVn6n7BirjJpsb0/2Dr4OC
 +H+SUHhW8aoh7dURERxD0n6X4yY+Zps4ca2NWmQk4Rn2XakZHWPq1SyyIGGg+HgFM3eX
 akSvwG/RFCCcU0B9IlF2wzhmT3vC4EWh51U0KT7q2/zRSPuex1+CKiQ/D/Hm5tzJkUyw
 g+7HBYZUruMa0Cuy9/9Fr9+mJeAf+ZaGrxibj3CCH5SswpaLZ70ozY2lTcqCVzNwDZMe
 EYlQ==
X-Gm-Message-State: AOJu0YxzkJxx6AsWMm53gQN9PQpvy6uDhwEpwWb7GtKQ6epZ4DZ5jUoM
 +WIv+MNa+EsULa3cwRFvsTXOg51R/Ol0qh/K5SE4ZycYYEfBk3LegqPK9ZJGI/V+OBsLArYO2vP
 m
X-Gm-Gg: ASbGncvCtCQOtLZJ9oowoLLVnXQolW8oJRU0gaQHrZrcFPY0U1praYJiAiiJbgzE9xV
 w/EeXRjyj/bbZNCnkudQWuYrpJlNkAseQaSziM2Z2rkspzfTMtrb8nN23DiqN6tgO4b0G+nO3M0
 ShZbEtUXJ6NIESgYp9wAuMtYEptv2U09AqVEwXCzjlY97fJlH86XW+xRizkXHIKv2IVpsQ/6GFe
 Az9sbvHOZSYbS3etYU0UmIYhECUAKjs5H9AS46YDX0MVOIby6i85nrSaHfb6JJfaBvbNSZvlHMd
 /BysUpGpszhC/0HR4xPQpEjVKK7yER9U
X-Google-Smtp-Source: AGHT+IFMc9pDfzFjAJiP3oI7iKkxIT5q0OsY1QwakVQCq8Upd6xmvz2HkbBYMMaLcYaOOnyvgTPYNg==
X-Received: by 2002:a05:651c:b12:b0:302:34d6:f047 with SMTP id
 38308e7fff4ca-3046851f88amr184215771fa.5.1736258578164; 
 Tue, 07 Jan 2025 06:02:58 -0800 (PST)
Received: from ryzen9.home (193-81-174-222.hdsl.highway.telekom.at.
 [193.81.174.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aaf57c2e24esm1081145766b.205.2025.01.07.06.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 06:02:57 -0800 (PST)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Reisner <philipp.reisner@linbit.com>
Subject: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
Date: Tue,  7 Jan 2025 15:02:40 +0100
Message-ID: <20250107140240.325899-1-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jan 2025 00:34:40 +0000
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

The following OOPS plagues me on about every 10th suspend and resume:

[160640.791304] BUG: kernel NULL pointer dereference, address: 0000000000000008
[160640.791309] #PF: supervisor read access in kernel mode
[160640.791311] #PF: error_code(0x0000) - not-present page
[160640.791313] PGD 0 P4D 0
[160640.791316] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[160640.791320] CPU: 12 UID: 1001 PID: 648526 Comm: kscreenloc:cs0 Tainted: G           OE      6.11.7-300.fc41.x86_64 #1
[160640.791324] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[160640.791325] Hardware name: Micro-Star International Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.B0 02/03/2021
[160640.791327] RIP: 0010:drm_sched_job_arm+0x23/0x60 [gpu_sched]
[160640.791337] Code: 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 53 48 8b 6f 60 48 85 ed 74 3f 48 89 fb 48 89 ef e8 31 39 00 00 48 8b 45 10 <48> 8b 50 08 48 89 53 18 8b 45 24 89 43 5c b8 01 00 00 00 f0 48 0f
[160640.791340] RSP: 0018:ffffb2ef5e6cb9b8 EFLAGS: 00010206
[160640.791342] RAX: 0000000000000000 RBX: ffff9d804cc62800 RCX: ffff9d784020f0d0
[160640.791344] RDX: 0000000000000000 RSI: ffff9d784d3b9cd0 RDI: ffff9d784020f638
[160640.791345] RBP: ffff9d784020f610 R08: ffff9d78414e4268 R09: 2072656c75646568
[160640.791346] R10: 686373205d6d7264 R11: 632072656c756465 R12: 0000000000000000
[160640.791347] R13: 0000000000000001 R14: ffffb2ef5e6cba38 R15: 0000000000000000
[160640.791349] FS:  00007f8f30aca6c0(0000) GS:ffff9d873ec00000(0000) knlGS:0000000000000000
[160640.791351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[160640.791352] CR2: 0000000000000008 CR3: 000000069de82000 CR4: 0000000000350ef0
[160640.791354] Call Trace:
[160640.791357]  <TASK>
[160640.791360]  ? __die_body.cold+0x19/0x27
[160640.791367]  ? page_fault_oops+0x15a/0x2f0
[160640.791372]  ? exc_page_fault+0x7e/0x180
[160640.791376]  ? asm_exc_page_fault+0x26/0x30
[160640.791380]  ? drm_sched_job_arm+0x23/0x60 [gpu_sched]
[160640.791384]  ? drm_sched_job_arm+0x1f/0x60 [gpu_sched]
[160640.791390]  amdgpu_cs_ioctl+0x170c/0x1e40 [amdgpu]
[160640.792011]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
[160640.792341]  drm_ioctl_kernel+0xb0/0x100
[160640.792346]  drm_ioctl+0x28b/0x540
[160640.792349]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
[160640.792673]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[160640.792994]  __x64_sys_ioctl+0x94/0xd0
[160640.792999]  do_syscall_64+0x82/0x160
[160640.793006]  ? __count_memcg_events+0x75/0x130
[160640.793009]  ? count_memcg_events.constprop.0+0x1a/0x30
[160640.793014]  ? handle_mm_fault+0x21b/0x330
[160640.793016]  ? do_user_addr_fault+0x55a/0x7b0
[160640.793020]  ? exc_page_fault+0x7e/0x180
[160640.793023]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

The OOPS happens because the rq member of entity is NULL in
drm_sched_job_arm() after the call to drm_sched_entity_select_rq().

In drm_sched_entity_select_rq(), the code considers that
drb_sched_pick_best() might return a NULL value. When NULL, it assigns
NULL to entity->rq even if it had a non-NULL value before.

drm_sched_job_arm() does not deal with entities having a rq of NULL.

Fix this by leaving the entity on the engine it was instead of
assigning a NULL to its run queue member.

Link: https://retrace.fedoraproject.org/faf/reports/1038619/
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3746
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a75eede8bf8d..495bc087588b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -557,10 +557,12 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->rq_lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->sched_rq[entity->priority] : NULL;
-	if (rq != entity->rq) {
-		drm_sched_rq_remove_entity(entity->rq, entity);
-		entity->rq = rq;
+	if (sched) {
+		rq = sched->sched_rq[entity->priority];
+		if (rq != entity->rq) {
+			drm_sched_rq_remove_entity(entity->rq, entity);
+			entity->rq = rq;
+		}
 	}
 	spin_unlock(&entity->rq_lock);
 
-- 
2.47.1

