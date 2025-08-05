Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83BB1ABA5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 02:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9A110E5CD;
	Tue,  5 Aug 2025 00:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cWvO3Htv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
 [209.85.214.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D94610E053
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 00:10:31 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-23fd831def4so37851035ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 17:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754352630; x=1754957430;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZIeS0C86+abrJEjDYhOjEa8sLe9goDqWWWMSzD9uDgo=;
 b=cWvO3HtvMUkKXd6wWgDGrpkljO/dNV02M6XuBq/F+xpY7HUn4KxFbkHrg6AIgkveEN
 qgKKfdgxdNHKVochOy/cx+1GclIuMLj64tjF3Bzff+T6t6SlKSSjC0Uz8BAbgRb0rLRZ
 6865rw85883BPpFopKdYJ6YA6R1B9pN9uSyjPHPHznmc/l41zEohpp+qMxvdt1XM2F9Z
 68LLWa5foZe1mjcodhGNEIDcWQXaDiFApMyA8JHKYkY3Rdz72W/Ww8v0ZOqCojSn7pbV
 x1mwlq9Y0nUwteZMZEEzsUYSI0sObASdB4kYxrcloxfK8RA2EB4LMCV2dHqNb+ZynErU
 qB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754352630; x=1754957430;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZIeS0C86+abrJEjDYhOjEa8sLe9goDqWWWMSzD9uDgo=;
 b=M4giRJLYkZ2HHh8v/6J9KNWFZ1pBpQmVtAnp019wjox+9ryyUYj+LgGuJcK3SOhu6G
 i/9zKL+UvHGJmRhq1+yBULlpNgv+EK6ADaijTASOQSNJVJA/SNqtgVGEqejQttSvPlw5
 IsfsPTZFFTIbv/l88j9sNeyX8ujtyt78W6hKAwnrZixI6kDJAwt5gRCl1BwbTpBTi3bg
 vTvB+xOegZmKpiyHZxotI9yRQtCKK21sKGvjmySKirQS3Pn/TyF9/6FDlPQ4qzo+vpsu
 RXfniK/UULF4Qxlc5QJD0OpXpoWwJVGdywDP13h6jb3wpgrFS/2ijuOzTGodWkb1hSIe
 1dlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdCe0Q8IdizjYx1W3ujy+/1mLW0wbfDnAFyLj3oBJFSpeFLUrHflGXFjq3Flv14AGgrg0xEXVJBuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqh68fmnLBt56TarUfZTuS/WBW2LFf5qVk796ibJHZKFIUM4fU
 OeP7DDE06oiLPilyQA2ZAdjjWC4QMQYS87t7STaipO29jCS+Xl+lnuQeZMOuYeSwKrNZBhUWASO
 W9hbiIKxN
X-Google-Smtp-Source: AGHT+IG57F4Brzc5sr0W+8K7HS/j3yikskwfNYoUZxNpX7sjROjP6clJgUBVPCKDU27gbA1f4v+ue2l/EzTX
X-Received: from plki15.prod.google.com ([2002:a17:903:1a0f:b0:23f:e59c:8c1f])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d094:b0:240:2eae:aecb
 with SMTP id d9443c01a7336-2424700627emr107448005ad.43.1754352630531; Mon, 04
 Aug 2025 17:10:30 -0700 (PDT)
Date: Tue,  5 Aug 2025 00:10:02 +0000
In-Reply-To: <20250801192157.912805-1-jstultz@google.com>
Mime-Version: 1.0
References: <20250801192157.912805-1-jstultz@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805001026.2247040-1-jstultz@google.com>
Subject: [PATCH v3] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, 
 syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, airlied@gmail.com, 
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, kernel-team@android.com
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

K Prateek Nayak and Maarten Lankhorst also pointed out that in
this case where we don't hold the owner's mutex wait_lock, we
need to be a bit more careful using READ_ONCE/WRITE_ONCE in both
the __clear_task_blocked_on() and __set_task_blocked_on()
implementations to avoid accidentally tripping WARN_ONs if two
instances race. So do that here as well.

This issue was easier to miss, I realized, as the test-ww_mutex
driver only exercises the wait-die class of ww_mutexes. I've
sent a patch[1] to address this so the logic will be easier to
test.

[1]: https://lore.kernel.org/lkml/20250801023358.562525-2-jstultz@google.com/

Fixes: a4f0b6fef4b0 ("locking/mutex: Add p->blocked_on wrappers for correctness checks")
Reported-by: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com
Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Closes: https://lore.kernel.org/lkml/68894443.a00a0220.26d0e1.0015.GAE@google.com/
Signed-off-by: John Stultz <jstultz@google.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
v2:
* Rewording of "lock" to "mutex" in commit and comment for
  clarity
* Rework __clear_task_blocked_on() to use READ_ONCE and WRITE_ONCE
  so we don't trip over the WARNING if two instances race, as suggested
  by K Prateek Nayak and Maarten Lankhorst
v3:
* Add READ_ONCE and WRITE_ONCE to __set_task_blocked_on(), to avoid
  tripping similar warnings as suggested by K Prateek Nayak

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
 include/linux/sched.h     | 29 +++++++++++++++++------------
 kernel/locking/ww_mutex.h |  6 +++++-
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 40d2fa90df425..62103dd6a48e0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2144,6 +2144,8 @@ static inline struct mutex *__get_task_blocked_on(struct task_struct *p)
 
 static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
 {
+	struct mutex *blocked_on = READ_ONCE(p->blocked_on);
+
 	WARN_ON_ONCE(!m);
 	/* The task should only be setting itself as blocked */
 	WARN_ON_ONCE(p != current);
@@ -2154,8 +2156,8 @@ static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
 	 * with a different mutex. Note, setting it to the same
 	 * lock repeatedly is ok.
 	 */
-	WARN_ON_ONCE(p->blocked_on && p->blocked_on != m);
-	p->blocked_on = m;
+	WARN_ON_ONCE(blocked_on && blocked_on != m);
+	WRITE_ONCE(p->blocked_on, m);
 }
 
 static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
@@ -2166,16 +2168,19 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
 
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

