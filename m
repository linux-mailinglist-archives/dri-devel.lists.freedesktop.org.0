Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891F3B176F7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CBC10E7D5;
	Thu, 31 Jul 2025 20:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BoAK8pLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C90A10E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:13:45 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-76bca6c73f3so1621931b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753992825; x=1754597625;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2zswepRFFz227agqCXRGzgOWhu/4sdsUIZ8Cp8ysb8k=;
 b=BoAK8pLFxXZzUn4jTNXB/1Cy3ODUavJmrrX0S4DRHch/ct2xtg/CYIrqyi53W8JSUQ
 wYQQ9zmEvPxAXrHxkMK3Nyi3qhkZyLthpBwVTkJI04zvCSJPC5fJB2JTGSwKD9goEJMs
 0pQGkEmmheaP3D6WXaP+x9SJjWYn/8JE1IbHOqqdQfJj6e1JgHvt6Q0boSwaE2e1PW3q
 48IRIZLcfG/aZZ81zSrb15kwIkS7FwT4aychjQnsY71ecA4nFAB3VG+QyskT9ijQOtbu
 hz2no6FZDfRs0btGiSQ+61gQQLMw/3M16Fc/W/IcAM9f3b9dF4mwocCIybqCTq17eJMR
 IbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753992825; x=1754597625;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2zswepRFFz227agqCXRGzgOWhu/4sdsUIZ8Cp8ysb8k=;
 b=lmoMJeoicli4MId0MKZcJtUugO2GTG5To89tpJptGBWn3AczKhGD7EQo5OdH0lbu57
 utEW5q8TT4/an8dLk3VI1m1RbmWQfq7pe5sQYgUcOosgHBVtYMkWB/UNmd/ZLxEWM24k
 8hCKppGetdAifk1NLV1q7VX9Z/+uDrX4ChsRZWCn9vr63CSO0qMrG16OjPpxAWSImODa
 mIHcHjT5GI+FcoRfaSt5i0ZmTtji88bYChrgwDi0rS1VQuwtDshgi77XbXfzSEFSXIGZ
 XVrNpKL/hdVuWsfX67TQSd++KZfYK6joH5syarilXUgcowQGp1fntKDIRu88W26tp9oz
 7iuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4TC5RBGTl0JWm+AYeOrZMfrBTN2iKzBM5evyk0DqCzCsJBk68jSWIBzy/0SQxcVEc7HM5xo+bGJc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPzWZeo7HpkeYxHKWZ5frpLcTQkeiFcXOScZ01mTb9Dbgo4ajD
 w0S72rJvsRoVHjn+O0veDg+WwTqJ5SfplIxvL7toVMDgcaI4ORfQInYP9uiYxinbKh7FeQEbIkz
 EvLU8X2mF
X-Google-Smtp-Source: AGHT+IFukKL05Gp9jYzgv5oyV5cwTY1GN2KA2iuySkXlUVu2GZZPBul1LGcVGKhaqbxIm2U++oARmjdB2P5T
X-Received: from pfbhj3.prod.google.com ([2002:a05:6a00:8703:b0:746:2a27:3025])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:9287:b0:748:3385:a4a
 with SMTP id d2e1a72fcca58-76bdcf23bc0mr174909b3a.23.1753992824659; Thu, 31
 Jul 2025 13:13:44 -0700 (PDT)
Date: Thu, 31 Jul 2025 20:13:22 +0000
In-Reply-To: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
Mime-Version: 1.0
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731201337.274382-1-jstultz@google.com>
Subject: [RFC][PATCH] locking: Fix __clear_task_blocked_on() warning from
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
checks ensuring we hold the lock and that the task we are
clearing blocked_on pointer (if set) matches the lock.

However, there is an edge case in the _ww_mutex_wound() logic
where we need to clear the blocked_on pointer for the task that
owns the lock, not the task that is waiting on the lock.

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
 include/linux/sched.h     | 19 ++++++++++---------
 kernel/locking/ww_mutex.h |  6 +++++-
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 40d2fa90df425..a9a78f51f7f57 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2166,15 +2166,16 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
 
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
+	if (m) {
+		/* Currently we serialize blocked_on under the mutex::wait_lock */
+		lockdep_assert_held_once(&m->wait_lock);
+		/*
+		 * There may be cases where we re-clear already cleared
+		 * blocked_on relationships, but make sure we are not
+		 * clearing the relationship with a different lock.
+		 */
+		WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
+	}
 	p->blocked_on = NULL;
 }
 
diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
index 086fd5487ca77..ef8ef3c28592c 100644
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -342,8 +342,12 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
 			 * When waking up the task to wound, be sure to clear the
 			 * blocked_on pointer. Otherwise we can see circular
 			 * blocked_on relationships that can't resolve.
+			 *
+			 * NOTE: We pass NULL here instead of lock, because we
+			 * are waking the lock owner, who may be currently blocked
+			 * on a different lock.
 			 */
-			__clear_task_blocked_on(owner, lock);
+			__clear_task_blocked_on(owner, NULL);
 			wake_q_add(wake_q, owner);
 		}
 		return true;
-- 
2.50.1.565.gc32cd1483b-goog

