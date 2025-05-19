Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CA4ABB88F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 11:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DDE10E356;
	Mon, 19 May 2025 09:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4504710E28C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 09:18:49 +0000 (UTC)
X-AuditID: a67dfc5b-681ff7000002311f-aa-682af7708138
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, mingo@redhat.com,
 peterz@infradead.org, will@kernel.org, tglx@linutronix.de,
 rostedt@goodmis.org, joel@joelfernandes.org, sashal@kernel.org,
 daniel.vetter@ffwll.ch, duyuyang@gmail.com, johannes.berg@intel.com,
 tj@kernel.org, tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
 amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
 linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com,
 sj@kernel.org, jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
 penberg@kernel.org, rientjes@google.com, vbabka@suse.cz, ngupta@vflare.org,
 linux-block@vger.kernel.org, josef@toxicpanda.com,
 linux-fsdevel@vger.kernel.org, jack@suse.cz, jlayton@kernel.org,
 dan.j.williams@intel.com, hch@infradead.org, djwong@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, harry.yoo@oracle.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 yskelg@gmail.com, yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 netdev@vger.kernel.org, matthew.brost@intel.com, her0gyugyu@gmail.com
Subject: [PATCH v16 30/42] fs/jbd2: use a weaker annotation in journal handling
Date: Mon, 19 May 2025 18:18:14 +0900
Message-Id: <20250519091826.19752-31-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
References: <20250519091826.19752-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfVDLcRzHfX+P2zR+Nw/9xOFGh5yHkPtwiCN+/zhP/8Vhpx/bqeyWUpy7
 poRWCT1cD5tVTLcW2dzJw5J2pkSGWQ8q6Tqnq+kubT2ssHL++dz7Pu97vT7/fAS4pJ4MEihi
 z/KqWFm0lBIRIndAySrlcIh8rbl6DniGrhJQ/MBEgeN+BQLTIzUGva/2QLO3H4Hv3Xsc8nMd
 CEq+deDwyN6JwFp+iYJPPTPA6RmgoCFXQ0FK2QMKPvSNY9CedxODCvNe+Gr4TkBjdikG+b0U
 FOWnYP7xA4NRg5EGQ3IwdJcX0jD+LRQaOl0kWNtWQoGunYLn1gYC7NXdGHx6WkxBp+kPCY32
 egK8WfPBcSOThMqfpRT0eQ04GDwDNHys1WNg18+FqlS/MO3XbxJeZ9ZikHbnIQbO1mcIaq52
 YWA2uSiwefoxsJhzcRi79wpBd5abhssZozQUqbMQaC7nEZDaHga+Ef9l7VAoqG9XEVA54ULb
 t3ImnQlxtv4BnEu1nOPGPJ8pzurVE9ybUpZ7UthBc6k1bTSnN8dzlvIQrux5L8aVDHpIzmy8
 RnHmwZs0l+52YtzPpiZ6/4JI0ZYoPlqRwKvWbDsukmucBZhyZHqi9noTSkbDwnQkFLDMBnbE
 VUD9zwa9mp7MFLOMbWkZxSfzbGYxa8n8TqYjkQBnXNPZZm0rmixmMftY291bUzDBBLOfy1Km
 YDGzkbV9sZP/pIvYiqraKZHQv2/T2KZYCRPGOit0xKSUZfKFbFGRG/0D5rEvy1uIbCTWo2lG
 JFHEJsTIFNEbVsuTYhWJq0+ciTEj/38ZLo4frkaDjkN1iBEgaYC4yrpCLiFlCXFJMXWIFeDS
 2WKjZblcIo6SJZ3nVWeOqeKj+bg6NF9ASAPF67znoiTMKdlZ/jTPK3nV/xYTCIOSUfHBx2+Q
 8q16FNdf2aRxBy2pFy1JrF0HkqGeI1927f7wokt7Mrsy3NjlXtU3FqG55NuREam1f81b1PM7
 40ikL1gXYc8IW3hvYdmBzTkBD5tTjnb7wpUdhojSxm0XdK0TNbNOXPDFzwx0z5h4u5Nfej8t
 J3D9MJOnd4Rv5hdHaXN4KREnl4WG4Ko42V+wLt0OWwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa2yLcRTG/d9rWzpvauGNu8bCtrjUjMPELcHfbUgkEiI09kYbuzQts0mw
 6SysNkam1Dq1UtN1Nq3FXCrLmpW5zFgVM6MLYrFZsM42c+kmvpz8cp48v/PliEiZnR4tUifv
 FrTJykQ5I6Ek8XH6aZofUaqZRhOCYNcRCgrLHQw0XC1F4LieSUBb7Qp40d2O4OfjJyQYCxoQ
 XAi8IeG6twWBu+QQA43vw8AX7GSgrsDAgN5azsDTz/0ENJ8+SUCpcy28tX2k4OGJYgKMbQyc
 M+qJ0PhEQK/NzoItIwJaS0ws9AcUUNfip8FjrqPB3RQNZ4uaGbjjrqPAW9VKQOOtQgZaHH9o
 eOi9T0F33hhoyM+loexLMQOfu20k2IKdLDyrthDgtYyEiqyQNfv7bxru5VYTkH3xGgG+V7cR
 3D3yjgCnw8+AJ9hOgMtZQELf5VoErXkdLBw+1svCucw8BIbDpynIao6Fnz2hy+YuBWSer6Cg
 7JcfLV6IHUUOhD3tnSTOcu3FfcHnDHZ3Wyj8oJjHN01vWJx1t4nFFuce7CqJwtY7bQS+8C1I
 Y6f9KIOd306yOKfDR+Av9fXs+nGbJQsShER1qqCdsXC7RGXwnSU0PUPTzMfrUQb6Ic5BYhHP
 zeZtlkx2gBluCv/yZS85wOHcRN6V+5HOQRIRyfmH8i/Mr9BAMIJbx3sunWIGmOIi+OdW/WBZ
 ys3hPa+99D/pBL60onpQJA7tmwyewa6Mi+V9pUXUCSSxoCF2FK5OTk1SqhNjp+t2qdKT1WnT
 d6QkOVHog2z7+/OrUFfjihrEiZB8mLTCHamS0cpUXXpSDeJFpDxcandNVcmkCcr0fYI2ZZt2
 T6Kgq0FjRJR8lHTVJmG7jNup3C3sEgSNoP2fEiLx6Aykiig0tj26X2u6MT8gObY8Hy/23ypc
 NLY1Ol9cvnLucSYu+rHEHplS1qxWfM0eFh/TEzN364E18yrDzqSNOxS25coG6+39ZYaYSZM0
 Vcv+jC+eVcmFjVyScLFjtiF2Y8H3QKDpw2qr5qDeMGSReZZx3gTT5IRRBxUPhnsqy+P6Kocv
 WSqndCqlIorU6pR/AZU0VWc9AwAA
X-CFilter-Loop: Reflected
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

jbd2 journal handling code doesn't want jbd2_might_wait_for_commit()
to be placed between start_this_handle() and stop_this_handle().  So it
marks the region with rwsem_acquire_read() and rwsem_release().

However, the annotation is too strong for that purpose.  We don't have
to use more than try lock annotation for that.

rwsem_acquire_read() implies:

   1. might be a waiter on contention of the lock.
   2. enter to the critical section of the lock.

All we need in here is to act 2, not 1.  So trylock version of
annotation is sufficient for that purpose.  Now that dept partially
relies on lockdep annotaions, dept interpets rwsem_acquire_read() as a
potential wait and might report a deadlock by the wait.

Replace it with trylock version of annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 fs/jbd2/transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index cbc4785462f5..7de227a2a6f8 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -441,7 +441,7 @@ static int start_this_handle(journal_t *journal, handle_t *handle,
 	read_unlock(&journal->j_state_lock);
 	current->journal_info = handle;
 
-	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 0, _THIS_IP_);
+	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 1, _THIS_IP_);
 	jbd2_journal_free_transaction(new_transaction);
 	/*
 	 * Ensure that no allocations done while the transaction is open are
-- 
2.17.1

