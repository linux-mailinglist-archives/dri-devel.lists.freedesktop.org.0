Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1F78688F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97BA10E4A0;
	Thu, 24 Aug 2023 07:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF3010E498
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:37:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A1A465936;
 Thu, 24 Aug 2023 07:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450BDC433CB;
 Thu, 24 Aug 2023 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862673;
 bh=U79uOFgK1bj6OBPdyCVW/Y7lNsxketkReBm6q4ZUwCk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JmDzg8On00UB4Q0g8nYLzgcTFG+0jmSIk+AItEutJcS9zfCGrEHl1Egwwtk45sm9M
 08caRBSAaufQjsHXGJHS+LhNj+FeSpaLQgv9Ao7eXBheuBy+xTaj3y+06wYxXZReuZ
 RECrvC6TsMRAAmVfagdJ6HwxZCVdar/o/7wIsnNthArxO2rtzuyqzid4ek8egFK37e
 UQDPau2EcOY1cUPyLjDtYIldPt00bOhbTTOImRCXsS+6eIncUkQsZmE0/M3+/8WGF7
 k0mTLR+G8d1WWAUOTuM25MeyjBo/tJPNqiYwa8T2gKV01GP9Ob1gKAW6rt66lLxnrH
 4zs/NXCLrYa4Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 10/20] drm/scheduler/sched_main: Provide short description of
 missing param 'result'
Date: Thu, 24 Aug 2023 08:36:55 +0100
Message-ID: <20230824073710.2677348-11-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/scheduler/sched_main.c:266: warning: Function parameter or member 'result' not described in 'drm_sched_job_done'

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 506371c427451..1ef558cda60ce 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -259,6 +259,7 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
+ * @result: fence error to forward and set
  *
  * Finish the job's fence and wake up the worker thread.
  */
-- 
2.42.0.rc1.204.g551eb34607-goog

