Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E8B187A9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 21:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1732510E30F;
	Fri,  1 Aug 2025 19:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YzKhWppe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEBC10E30F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 19:22:04 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-3139c0001b5so2159968a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754076124; x=1754680924;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mNS2Q2IorOCVtYQWCNZdPG9Q8DZamyAzOMDjYDbYBsA=;
 b=YzKhWppe9PACBjlXPtPmt7eoclCtWUPxA+4yNm+4x/IE259ZD7UIljmYJ1RCF5NfZJ
 Q/ux9TfzIk2zbj9WYQSxdiGvhCB2pKp8mV/OUqCS/PQqVPDP9n0BU6UNZ9G5oJj02+OV
 T0uB2RS8hDud0y8uVpLY/mDVttJIzoNEvSA3r7sE0fmiQPOQsPc4MxUeF3tVJh3Ywj4j
 XLiA6W+k/HH2P9vUCBebGq/RU1PlVbBx+SFa+fequ8kOFun55t8dfRX30otpjDTFwDgY
 EPo8blaq3cSV022lZiwdwGXF1+WjFCcQxvCAK92tS/oQ4x9seHZEtv1X1RHSfddFgk3H
 ejrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754076124; x=1754680924;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mNS2Q2IorOCVtYQWCNZdPG9Q8DZamyAzOMDjYDbYBsA=;
 b=ONoRBec62SvQD/k1FWpgmLJIA/xhianL88iflyfSnAIEcsv6t4FHZAp2PyYQnF8LX2
 ZOyCk53/hiOU9Q2Z57Tt2ALuQEDRv62MdJiA1g+sNSIhRWwrZ0pZu4yD+ToITBEtTnL7
 SX7eznkyBy2W51tcOj8pHk8jNkaHEsgEbSnqnWackq4c1fM7DxYDe5KKjkQDrM7tTGmS
 YnDZ0VtCKpLiLewStNQx4+tWK5JB384gru1FHyyTWjfy9AlUX6GDzmMaj/B4NIROE+6p
 E4K42X45rJQLixFuBCNd8ow5FICb5bufi3bvKEzqXl218mQ6V1MAKJOEiXgRFTDi2NZf
 +lNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn0UzwmCZU5zi5G2gVsacwucwLixTalpLed2TdCOMdfxPsrv53BBA50UTvYI4tsfY1+lDo+li8+Tw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHHgAJjm5f5G7b/LXrW2DB162jMUNzDhzdjEMFWuVEO/lwsVXd
 fYxT5eTUOLd5bVL9fAEntIOHTJxShUm7nvFEME+/ZVErW9ZoD6IkPlr+KIArHMcUnaGZKexQUob
 FIKiaxMFq
X-Google-Smtp-Source: AGHT+IHAqBf/4P00GxPH9TGd4ks7immyJraYaPKAtSJjTsefHZE/ctegZQvAOdE2EzTh4JqYdZOFdCJDwMQZ
X-Received: from pjbeu13.prod.google.com ([2002:a17:90a:f94d:b0:312:e914:4548])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3b52:b0:311:9c9a:58d7
 with SMTP id 98e67ed59e1d1-321162b1060mr1309032a91.19.1754076124145; Fri, 01
 Aug 2025 12:22:04 -0700 (PDT)
Date: Fri,  1 Aug 2025 19:21:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801192157.912805-1-jstultz@google.com>
Subject: [PATCH v2] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, 
 syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Valentin Schneider <valentin.schneider@arm.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Suleiman Souhlal <suleiman@google.com>, airlied@gmail.com, mripard@kernel.org, 
 simona@ffwll.ch, tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
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

The __clear_task_blocked_on() helper added a number of sanity
checks ensuring we hold the mutex wait lock and that the task
we are clearing blocked_on pointer (if set) matches the mutex.

However, there is an edge case in the _ww_mutex_wound() logic
where we need to clear the blocked_on pointer for the task that
owns the mutex, not the task that is waiting on the mutex.

For this case the sanity checks aren't valid, so handle this
by allowing a NULL lock to skip the additional checks.

This was easier to miss, I realized, as the test-ww_mutex
driver only exercises the wait-die class of ww_mutexes.

I've got a follow up patch to extend the test so that it
will exercise both.

Fixes: a4f0b6fef4b0 ("locking/mutex: Add p->blocked_on wrappers for correctness checks")
Reported-by: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com
Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Closes: https://lore.kernel.org/lkml/68894443.a00a0220.26d0e1.0015.GAE@google.com/
Signed-off-by: John Stultz <jstultz@google.com>
---
v2:
* Rewording of "lock" to "mutex" in commit and comment for
  clarity
* Rework __clear_task_blocked_on() to use READ_ONCE and WRITE_ONCE
  so we don't trip over the WARNING if two instances race, as suggested
  by K Prateek Nayak and Maarten Lankhorst

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Suleiman Souhlal <suleiman@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: airlied@gmail.com
Cc: mripard@kernel.org
Cc: simona@ffwll.ch
Cc: tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org
Cc: kernel-team@android.com
---
 include/linux/sched.h     | 23 +++++++++++++----------
 kernel/locking/ww_mutex.h |  6 +++++-
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 40d2fa90df425..700b50d29f7fe 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2166,16 +2166,19 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
 
 static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
 {
-	WARN_ON_ONCE(!m);
-	/* Currently we serialize blocked_on under the mutex::wait_lock */
-	lockdep_assert_held_once(&m->wait_lock);
-	/*
-	 * There may be cases where we re-clear already cleared
-	 * blocked_on relationships, but make sure we are not
-	 * clearing the relationship with a different lock.
-	 */
-	WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
-	p->blocked_on = NULL;
+	if (m) {
+		struct mutex *blocked_on = READ_ONCE(p->blocked_on);
+
+		/* Currently we serialize blocked_on under the mutex::wait_lock */
+		lockdep_assert_held_once(&m->wait_lock);
+		/*
+		 * There may be cases where we re-clear already cleared
+		 * blocked_on relationships, but make sure we are not
+		 * clearing the relationship with a different lock.
+		 */
+		WARN_ON_ONCE(blocked_on && blocked_on != m);
+	}
+	WRITE_ONCE(p->blocked_on, NULL);
 }
 
 static inline void clear_task_blocked_on(struct task_struct *p, struct mutex *m)
diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
index 086fd5487ca77..31a785afee6c0 100644
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -342,8 +342,12 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
 			 * When waking up the task to wound, be sure to clear the
 			 * blocked_on pointer. Otherwise we can see circular
 			 * blocked_on relationships that can't resolve.
+			 *
+			 * NOTE: We pass NULL here instead of lock, because we
+			 * are waking the mutex owner, who may be currently
+			 * blocked on a different mutex.
 			 */
-			__clear_task_blocked_on(owner, lock);
+			__clear_task_blocked_on(owner, NULL);
 			wake_q_add(wake_q, owner);
 		}
 		return true;
-- 
2.50.1.565.gc32cd1483b-goog

