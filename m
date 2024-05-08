Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5348BFA10
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 12:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCA311354E;
	Wed,  8 May 2024 10:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6236111353A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 10:02:56 +0000 (UTC)
X-AuditID: a67dfc5b-d85ff70000001748-b9-663b4a3b016a
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
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, 42.hyeyoo@gmail.com,
 chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, boqun.feng@gmail.com, longman@redhat.com,
 hdanton@sina.com, her0gyugyu@gmail.com
Subject: [PATCH v14 26/28] fs/jbd2: Use a weaker annotation in journal handling
Date: Wed,  8 May 2024 18:47:23 +0900
Message-Id: <20240508094726.35754-27-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240508094726.35754-1-byungchul@sk.com>
References: <20240508094726.35754-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxSHfd97e+9tpeamknnHnJIaNcHAxMB2nEaNRn1jQjQxMUaN2sit
 1EHFVlCMMyAVtXwEMYhAxYJYCCBoa/ymVkgZHwpViQMGRJgRG4E6tA0Vgms1/nPy5Dm/8/vr
 cJTiliSM02iPijqtKlHJyGjZWEh55Ootq9TL31aycCFnOXg/naPB1FDHgKu+FkHd7QwMbudm
 +Ns3imDqWRcFRYUuBOVDAxTcbhlE0Fh9moGXb+ZAt9fDQFthNgOZ1xoYeP5+GkP/pQIMtdY4
 6MivwODwj9BQ5GagtCgTB8Y7DH5LDQuW9MUwXF3CwvRQNLQNvpJAY98yKC7rZ+BRYxsNLfeG
 Mbx8YGJgsO6LBDpaWmlwXciVwI3xCgbe+ywUWLweFl44zBhuGgJFWR9nJPBXrgNDVuUtDN29
 DxHYz73GYK17xUCzdxSDzVpIwecqJ4LhvDEWzuT4WSjNyEOQfeYSDYb+WJiaNDHrVpLmUQ9F
 DLZjpNFnpkl7hUDulwywxGDvY4nZmkJs1RHk2iM3JuUTXgmx1pxniHWigCXGsW5Mxjs7WdJ6
 eYomb7qL8LawXbLV8WKiJlXU/bJmvyzB//SHZN/s4yNdkI4+S41Iygl8jFBve4aMiPvKHcOn
 gprhlwo9PX4qyKF8uGDLfSsJMsWPyoTKzk3B+Fx+q1DyemNQ0/xiYbCrDAdZzv8qGOs/0N/a
 Fwq1Nx1fa6QB3zsyjoKs4GOFh5klrBHJAplJTpg0t6JvBz8KT6p76HwkN6NZNUih0aYmqTSJ
 MVEJaVrN8agDh5OsKPBIlj+nd99DE67tTYjnkDJE7pj3u1ohUaXq05KakMBRylC58+xvaoU8
 XpV2QtQd3qdLSRT1TegnjlbOk6/wHYtX8AdVR8U/RDFZ1H3fYk4alo4qZ2bmP2nfK2u+u9O9
 dqHaEj2iTsm5k7rILi9op45cKY60texwnsruM4Ssi6tactez9MWCyIul/9wwhe+5ahrwLFu1
 8vGJvKgus519+qG/dPJQ/gFpQ3JWlfvn0PXRLqMvanZTRwzTe7LWqSWHsss/zRTG+q5mnP93
 e8SG68//O6u3K2l9gio6gtLpVf8DhlJlY0QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSf0zMcRgHcJ/P92eXs6/T9F0xdmOmlBrxEIYN35noP2Yzbvnmbq5wV1ET
 5fLrKGIVV5FqV6tIV5vI0UpxlTp1SyWp1kpK19K1rho6m3+evfZ+nr3/elhCdp/yYlWRUaIm
 UqGW0xJScjBY5xe8Pzg8YNy8DlJvB4Bj8gYJWaUlNFifFSMoqUjEMFy3Dz5PjSKY/dhCQEaa
 FcGTvq8EVNT3IDAXXqGhbWAR2Bx2Gixpt2jQ5ZXS8GlkDkN3+j0MxaYQaLybi6HaOURCxjAN
 mRk6PD++Y3AaixgwJqyG/kIDA3N9gWDpaaegNttCgbnLFx4+6qbhtdlCQn1lP4a2V1k09JT8
 oaCx/gMJ1tRkCp6O5dIwMmUkwOiwM9BanYPhedJ827Vfvyl4n1yN4Vp+GQZbZxWCNzd6MZhK
 2mmodYxiKDelETBTUIegP+UnA1dvOxnITExBcOtqOglJ3UEwO51F79wq1I7aCSGp/Lxgnsoh
 hYZcXnhp+MoISW+6GCHHFC2UF/oIea+HsfBkwkEJpqKbtGCauMcI+p82LIw1NzPChwezpDBg
 y8Ch3kcl206KalWMqFm/44RE6WxaenbK/cJQCySgGTc9Ylme28g39l/SIzeW5tbwHR1OwmUP
 biVfnjxIuUxwoxI+v3mv63wJd4g39O5xxSS3mu9peYRdlnKbeP2zcdJlnlvBFz+v/lfjNp93
 Do0hl2VcEF+lMzB3kSQHLShCHqrImAiFSh3krz2tjI1UXfAPOxNhQvOvYoyfS61Ek237ahDH
 IvlCqZUODpdRihhtbEQN4llC7iGtu745XCY9qYiNEzVnjmui1aK2BnmzpNxTuv+weELGnVJE
 iadF8ayo+b/FrJtXAtrrfn/JrkHlkQ1elQUjOt8HrcMDoRclg8oDmY5e8tW3vGm/c9KA3bIy
 +/LFG3807dr+Xs6/rVEb/Ffe7IwOt21ZNb7uS9CkPezURb2lJdu9I9oxk35uVhr2Ln6Zcs2m
 kMffJPEN7jsLiuQRa/WquMCYO/ZjT62e+t9dKS9CLweGNNfJSa1SEehDaLSKvyPMEcYmAwAA
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
to be placed between start_this_handle() and stop_this_handle(). So it
marks the region with rwsem_acquire_read() and rwsem_release().

However, the annotation is too strong for that purpose. We don't have to
use more than try lock annotation for that.

rwsem_acquire_read() implies:

   1. might be a waiter on contention of the lock.
   2. enter to the critical section of the lock.

All we need in here is to act 2, not 1. So trylock version of annotation
is sufficient for that purpose. Now that dept partially relies on
lockdep annotaions, dept interpets rwsem_acquire_read() as a potential
wait and might report a deadlock by the wait. So replaced it with
trylock version of annotation.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 fs/jbd2/transaction.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index cb0b8d6fc0c6..58261621da27 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -460,7 +460,7 @@ static int start_this_handle(journal_t *journal, handle_t *handle,
 	read_unlock(&journal->j_state_lock);
 	current->journal_info = handle;
 
-	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 0, _THIS_IP_);
+	rwsem_acquire_read(&journal->j_trans_commit_map, 0, 1, _THIS_IP_);
 	jbd2_journal_free_transaction(new_transaction);
 	/*
 	 * Ensure that no allocations done while the transaction is open are
-- 
2.17.1

