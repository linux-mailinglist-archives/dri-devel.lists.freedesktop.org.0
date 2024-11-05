Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C519BCF60
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E8910E5C3;
	Tue,  5 Nov 2024 14:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XhqxTyL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B57B10E5C5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730817123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dg9BO0Q1/nEs6vwNdPbv/d00ohV0KHxJ+ggBYEXN+fc=;
 b=XhqxTyL1+N1y1N6Ru3/5e7VW06aP9KU2ZfZH1Nqk0DNypejBxmNSi4Xm/4jkZmn0su5dBK
 EzSbVDOuHW8AmzmijWUAf9jwWCkOr40509QrpBhBWNhPAXgov32psPV7MdvAOnL5iWt0X1
 QGooEbrVIGwYwvd0fHxszkiPDnUmj/A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-SSZtKxjVOQ6HkQ-L6AS5pA-1; Tue, 05 Nov 2024 09:31:59 -0500
X-MC-Unique: SSZtKxjVOQ6HkQ-L6AS5pA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7ac9b08cb77so1080399485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 06:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730817118; x=1731421918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dg9BO0Q1/nEs6vwNdPbv/d00ohV0KHxJ+ggBYEXN+fc=;
 b=OzJIpH+KvoETCQ5crkD9ryilTwtDv72+HiEXnMwr6/wHsMYuqbwBbwJaj2QDOrYhsi
 9tQ3Gk4kjWPIRUIuDdO43H+gnRF0xZ/sjHko0ol+X9e29AWDxudhdU5Vmm8SFpQbfkWU
 p8GMvv4INpgsn53lJRdAQNBLZcivYCjuTPX1lRelYWkFntT5JSwvIXeuPF13gL3265q3
 7OPXpRI9+7RhC3gOwgdporRRoyEyoPrpkMVLVWujSi5MlAuQsXAek+mSuM4DQN89sH50
 CmbS4iiFfN8qe3JPPqqzpLsVCE5rbN3T4BYLnG1IAF/xsSuEkSyrCjC/jDjowilUXgbk
 +ViQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgyIpNc/Wg6VckNoAaDu/KFXxPmvvd8W9ZJBwGgAZiQzGhkfJTgcvX9ZAXEKJukv0Dcx+oSVLLxbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6yw1fvhRKbHzrqhFFQUs0im0+s5ukURp5x3xf0t90CZ1qvaop
 wTQGIVw/dVAuHJIgkZdEmDVNwej7BUzHCe2Zhl8MJnF1226f4fP2Iyz+dBK2eDPzugTRQ5ZdXan
 Xa05donFMD4PRaLjAR08f8ZFHrXGbAh0K1cVbRpeS3JJ+2aMYin6pyXbjbZuSaKdj5A==
X-Received: by 2002:a05:620a:2444:b0:7b1:440a:fdf2 with SMTP id
 af79cd13be357-7b2f24dd30bmr3019847285a.20.1730817118000; 
 Tue, 05 Nov 2024 06:31:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEHOkartUQ0kZG50rozwCxh7PXfh3AA+n6uCFPIpb+yp8pRTKY9/YC6WDS0pWDiPw7O6nJyA==
X-Received: by 2002:a05:620a:2444:b0:7b1:440a:fdf2 with SMTP id
 af79cd13be357-7b2f24dd30bmr3019843085a.20.1730817117550; 
 Tue, 05 Nov 2024 06:31:57 -0800 (PST)
Received: from eisenberg.muc.redhat.com (nat-pool-muc-u.redhat.com.
 [149.14.88.27]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b2f39f8fffsm524903685a.29.2024.11.05.06.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:31:56 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: Improve teardown documentation
Date: Tue,  5 Nov 2024 15:31:38 +0100
Message-ID: <20241105143137.71893-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

If jobs are still enqueued in struct drm_gpu_scheduler.pending_list
when drm_sched_fini() gets called, those jobs will be leaked since that
function stops both job-submission and (automatic) job-cleanup. It is,
thus, up to the driver to take care of preventing leaks.

The related function drm_sched_wqueue_stop() also prevents automatic job
cleanup.

Those pitfals are not reflected in the documentation, currently.

Explicitly inform about the leak problem in the docstring of
drm_sched_fini().

Additionally, detail the purpose of drm_sched_wqueue_{start,stop} and
hint at the consequences for automatic cleanup.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Hi,

in our discussion about my proposed waitque-cleanup for this problem
Sima suggested [1] that we document the problems first and by doing so get
to a consenus what the problems actually are and how we could solve
them.

This is my proposal for documenting the leaks on teardown. Feedback very
welcome.

P.

[1] https://lore.kernel.org/dri-devel/ZtidJ8S9THvzkQ-6@phenom.ffwll.local/
---
 drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e97c6c60bc96..3dfa9db89484 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1333,6 +1333,19 @@ EXPORT_SYMBOL(drm_sched_init);
  * @sched: scheduler instance
  *
  * Tears down and cleans up the scheduler.
+ *
+ * This stops submission of new jobs to the hardware through
+ * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
+ * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
+ * There is no solution for this currently. Thus, it is up to the driver to make
+ * sure that
+ *  a) drm_sched_fini() is only called after for all submitted jobs
+ *     drm_sched_backend_ops.free_job() has been called or that
+ *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called
+ *     after drm_sched_fini() ran are freed manually.
+ *
+ * FIXME: Take care of the above problem and prevent this function from leaking
+ * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
@@ -1428,8 +1441,10 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
 
 /**
  * drm_sched_wqueue_stop - stop scheduler submission
- *
  * @sched: scheduler instance
+ *
+ * Stops the scheduler from pulling new jobs from entities. It also stops
+ * freeing jobs automatically through drm_sched_backend_ops.free_job().
  */
 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
 {
@@ -1441,8 +1456,12 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
 
 /**
  * drm_sched_wqueue_start - start scheduler submission
- *
  * @sched: scheduler instance
+ *
+ * Restarts the scheduler after drm_sched_wqueue_stop() has stopped it.
+ *
+ * This function is not necessary for 'conventional' startup. The scheduler is
+ * fully operational after drm_sched_init() succeeded.
  */
 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
 {
-- 
2.47.0

