Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA01125C60
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EB76EABD;
	Thu, 19 Dec 2019 08:11:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30B26E0D9;
 Wed, 18 Dec 2019 18:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcUODtuWFJIeb21xOHgr+7keNcLJefPUbHzA3wCYPzy6ljD6t5oTDv3QQqusy60e4KmDpjuWVHY4GZXsiQ+0PdxgKQ4uwuJLLxc/mIUKncuKsd0EajYh9Q9eE1Mn3mDwLzFxkPPUZi2mVPmKho/+WpMsTzN3m0ELxELyu63Je5gfw4gZrY5G+LI+UiGJrnhPze7mEZiMNOus7hUirFsybOYmTMqUNTQlRNtQKSO8NFp/8lmIDES3Ia/mAu39vFI1Slc83f+YVs3Hez6qL8KkGOPIMquh5EwBQesl56oESntQivcc4IZ476Ypmr8FLfqUOEFpy9sLFt7wkSh8DuFMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXPVWAdRNWcuMVnPdyffocE7lgq659HE8T82ksvwAVY=;
 b=FV4tVGfbRgXsSbq8UDOYUCfxJlywSCZM7UHeWlq8m1KTMYjJFMKytK4TUX5uHq7/H5YvVfQR6sg7ZWIpIth9br8/I2fAYqWLpnFzmPxtaRTj1qQITbhMqlj5EynSraL+rjx+YMyNUllMgOKFRRgep/chKi3x1UecoXkvdHcXN97WN04BHvnghnaxZG25q/qfUbfuPs3sNHoW6+Sq4CunmPyu+MfUEAQMcTD1KcEf8Ypltb6sVPEQJ7TYKy6LWbm7+bvLvrUUZAfOEwgyRXs6W4Unzs2LPu7L2b3yuvfRwuhgTAUcE2i/PQUjMoLk7Q43AF5mtXkqM2V1IGC2nvC39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXPVWAdRNWcuMVnPdyffocE7lgq659HE8T82ksvwAVY=;
 b=rh/jKxTFAkgkP+ehPE+BSETsbWA6H4AcHp1w98jby4qQY0mhQAGD9RvOQT0umq/GfbiRdqQyXLwYNI7XWgqCFeXvUJezKoSA2cvF4VBJhVPpwLMPldPR7iXuP2AZW547dVUEWFlxUnJSdun52fExKf65washTvM3kkLqXV+MSwo=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5021.eurprd05.prod.outlook.com (20.177.50.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Wed, 18 Dec 2019 18:37:09 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::18df:a0fe:18eb:a96b%6]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 18:37:09 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull hmm changes
Thread-Topic: [GIT PULL] Please pull hmm changes
Thread-Index: AQHVo9Dog/MtwM8aJU6I/7345tJKuKekCWkAgAAFfoCAA6/3AIAEBIsAgAnhkICAAlDwAIAIKeCAgAAf0YCAAB0NAA==
Date: Wed, 18 Dec 2019 18:37:09 +0000
Message-ID: <20191218183704.GT16762@mellanox.com>
References: <20191125204248.GA2485@ziepe.ca>
 <CAHk-=wiqguF5NakpL4L9XCmmYr4wY0wk__+6+wHVReF2sVVZhA@mail.gmail.com>
 <CAHk-=wiQtTsZfgTwLYgfV8Gr_0JJiboZOzVUTAgJ2xTdf5bMiw@mail.gmail.com>
 <20191203024206.GC5795@mellanox.com> <20191205160324.GB5819@redhat.com>
 <20191211225703.GE3434@mellanox.com>
 <20191213101916.GD624164@phenom.ffwll.local>
 <20191218145913.GO16762@mellanox.com>
 <CAHk-=wgR7OSE9Bn2+MbOYDbiu7n1RQaQhdc6gkEywXL9rMFcpw@mail.gmail.com>
In-Reply-To: <CAHk-=wgR7OSE9Bn2+MbOYDbiu7n1RQaQhdc6gkEywXL9rMFcpw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:208:d4::18) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9383fd1d-91ea-4b12-2017-08d783e949ee
x-ms-traffictypediagnostic: VI1PR05MB5021:
x-microsoft-antispam-prvs: <VI1PR05MB50219E4BBE0D5DE5F7EBF3AFCF530@VI1PR05MB5021.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(189003)(199004)(66946007)(54906003)(4326008)(52116002)(30864003)(2616005)(26005)(6506007)(186003)(66446008)(1076003)(81166006)(71200400001)(6512007)(316002)(53546011)(7416002)(6916009)(5660300002)(86362001)(2906002)(478600001)(36756003)(64756008)(33656002)(6486002)(66476007)(66556008)(8936002)(8676002)(81156014)(559001)(579004)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5021;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fq+2nChqGnzAS9USQUnDPC0lUYo+lMizAxDM8L0/RG+AsULCOmjV3QYdlTqhEwRAga2alnUHA0zw1crQUVsoVddAP8hST5Qg1QLmdOPV4IzJHABH6WNsM/EMmf7XV7Pm4y7OgE9mgw/d17eTqmNJe9JsaU4ZDtF9tCxZxZbR/AJzqsQV8vlOlMNMHcLtx3HxOXdPgLxcS3tJAuJDuzNJ9/jt8uyLvR6hPuKDjsThp5Tw28RKK1ULc8H7cXgI+DSxTKM5WckwXYKVklr5ha/1tnbHRiu/yo8WO4FwAkMX0J41tvY+s9zaRmc/J2r3mY4MA6zeTBwhKijMczKiIStGdLWtxd/8LDo0ES460UKAuwB8Z1hYZrXIq+HAWHTPh9Q/6texSDeU/Pp8xw+wgM4ouFi7OaWGE9vs63rEhiq4bKGCthAQhvFQuwjglNHfykOg5t5OSNkviOwrEKqco1e4VCALp0L/eW8+uACZi6x5Bho=
x-ms-exchange-transport-forked: True
Content-ID: <50A340D800CA714FBD972BE1842F0DD2@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9383fd1d-91ea-4b12-2017-08d783e949ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 18:37:09.6290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7/eiXVub1KGDiiNGxKXJuuOreLDgnXg8T9VRwYt3NCUFm7MsFMvE1NZ8sL3QJr3d53+K+CJ+IjYZEm7G7ht3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5021
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 18, 2019 at 08:53:05AM -0800, Linus Torvalds wrote:
> On Wed, Dec 18, 2019 at 6:59 AM Jason Gunthorpe <jgg@mellanox.com> wrote:

> Yes, global function names need to be unique, and if they aren't
> really core, they want some prefix that explains the context, because
> global functions are called from _outside_ the context that explains
> them.

Yes, in this thread I have mostly talked about changing the global
struct names, and for that mmn_ is the context explaining prefix.

> But if it's a "struct mmu_interval_notifier" pointer, and it's inside
> a file that is all about these pointers, it shouldn't be called
> "mmn_xyz".  That's not a name. That's line noise.
> 
> So call it a "notifier". Maybe even an "interval_notifier" if you
> don't mind the typing. Name it by something _descriptive_. And if you
> want.
> 
> And "subscriptions" is a lovely name. What does the "mmn" buy you?

To be clear, I was proposing this as the struct name:

  'struct mmu_notifier_mm' becomes 'struct mmn_subscriptions'

(and similar for other mmu_notifier_x* and mmu_x_notifier patterns)

From there we now have a natural and readable local variable name like
'subscriptions' within mm/mmu_notifier.c

I've just started looking at this in detail, but it seems sticking
with 'mmu_notifier_' as the global prefix will avoid a fair amount of
churn. So lets not try to shorten it to mmn_ as the global prefix.

> Just to clarify: the names I really hated were the local variable
> names (and the argument names) that were all entirely within the
> context of mm/mmu_notifier.c. Calling something "mmn_mm" is a random
> jumble of letters that looks more like you're humming than you're
> speaking.

Yes, I understood - I've approached trying to have good names for the
variables via having good names for their struct's.

Below is what I'm suggesting for the first patch. I am intending a
patch series to make the naming better across mmu_notifier.h, this
would be the first.

Next patches would probably replace 'mn' with 'list_sub' (struct
mmu_notifier_subscription) and 'mni' with 'range_sub' (struct
mmu_notifier_range_subscription).

Thus we have code working on a 'list_sub/range_sub' and storing it in
a 'subscriptions'. 

I think this is what you are looking for?

From c656d0862dedcc2f5f4beda129a2ac51c892be7e Mon Sep 17 00:00:00 2001
From: Jason Gunthorpe <jgg@mellanox.com>
Date: Wed, 18 Dec 2019 13:40:35 -0400
Subject: [PATCH] mm/mmu_notifier: Rename struct mmu_notifier_mm to
 mmu_notifier_subscriptions

The name mmu_notifier_mm implies that the thing is a mm_struct pointer,
and is difficult to abbreviate. The struct is actually holding the
interval tree and hlist containing the notifiers subscribed to a mm.

Use 'subscriptions' as the variable name for this struct instead of the
really terrible and misleading 'mmn_mm'.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 include/linux/mm_types.h     |   2 +-
 include/linux/mmu_notifier.h |  18 +-
 kernel/fork.c                |   4 +-
 mm/debug.c                   |   4 +-
 mm/mmu_notifier.c            | 322 ++++++++++++++++++-----------------
 5 files changed, 182 insertions(+), 168 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 270aa8fd2800b4..e87bb864bdb29a 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -490,7 +490,7 @@ struct mm_struct {
 		/* store ref to file /proc/<pid>/exe symlink points to */
 		struct file __rcu *exe_file;
 #ifdef CONFIG_MMU_NOTIFIER
-		struct mmu_notifier_mm *mmu_notifier_mm;
+		struct mmu_notifier_subscriptions *notifier_subscriptions;
 #endif
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
 		pgtable_t pmd_huge_pte; /* protected by page_table_lock */
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 9e6caa8ecd1938..a302925fbc6177 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -8,7 +8,7 @@
 #include <linux/srcu.h>
 #include <linux/interval_tree.h>
 
-struct mmu_notifier_mm;
+struct mmu_notifier_subscriptions;
 struct mmu_notifier;
 struct mmu_notifier_range;
 struct mmu_interval_notifier;
@@ -265,7 +265,7 @@ struct mmu_notifier_range {
 
 static inline int mm_has_notifiers(struct mm_struct *mm)
 {
-	return unlikely(mm->mmu_notifier_mm);
+	return unlikely(mm->notifier_subscriptions);
 }
 
 struct mmu_notifier *mmu_notifier_get_locked(const struct mmu_notifier_ops *ops,
@@ -364,7 +364,7 @@ static inline bool mmu_interval_check_retry(struct mmu_interval_notifier *mni,
 	return READ_ONCE(mni->invalidate_seq) != seq;
 }
 
-extern void __mmu_notifier_mm_destroy(struct mm_struct *mm);
+extern void __mmu_notifier_subscriptions_destroy(struct mm_struct *mm);
 extern void __mmu_notifier_release(struct mm_struct *mm);
 extern int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 					  unsigned long start,
@@ -480,15 +480,15 @@ static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
 		__mmu_notifier_invalidate_range(mm, start, end);
 }
 
-static inline void mmu_notifier_mm_init(struct mm_struct *mm)
+static inline void mmu_notifier_subscriptions_init(struct mm_struct *mm)
 {
-	mm->mmu_notifier_mm = NULL;
+	mm->notifier_subscriptions = NULL;
 }
 
-static inline void mmu_notifier_mm_destroy(struct mm_struct *mm)
+static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 {
 	if (mm_has_notifiers(mm))
-		__mmu_notifier_mm_destroy(mm);
+		__mmu_notifier_subscriptions_destroy(mm);
 }
 
 
@@ -692,11 +692,11 @@ static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
 {
 }
 
-static inline void mmu_notifier_mm_init(struct mm_struct *mm)
+static inline void mmu_notifier_subscriptions_init(struct mm_struct *mm)
 {
 }
 
-static inline void mmu_notifier_mm_destroy(struct mm_struct *mm)
+static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 {
 }
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 2508a4f238a3f3..047865086cdf74 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -692,7 +692,7 @@ void __mmdrop(struct mm_struct *mm)
 	WARN_ON_ONCE(mm == current->active_mm);
 	mm_free_pgd(mm);
 	destroy_context(mm);
-	mmu_notifier_mm_destroy(mm);
+	mmu_notifier_subscriptions_destroy(mm);
 	check_mm(mm);
 	put_user_ns(mm->user_ns);
 	free_mm(mm);
@@ -1025,7 +1025,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
 	mm_init_aio(mm);
 	mm_init_owner(mm, p);
 	RCU_INIT_POINTER(mm->exe_file, NULL);
-	mmu_notifier_mm_init(mm);
+	mmu_notifier_subscriptions_init(mm);
 	init_tlb_flush_pending(mm);
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
 	mm->pmd_huge_pte = NULL;
diff --git a/mm/debug.c b/mm/debug.c
index 0461df1207cb09..74ee73cf7079a5 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -153,7 +153,7 @@ void dump_mm(const struct mm_struct *mm)
 #endif
 		"exe_file %px\n"
 #ifdef CONFIG_MMU_NOTIFIER
-		"mmu_notifier_mm %px\n"
+		"notifier_subscriptions %px\n"
 #endif
 #ifdef CONFIG_NUMA_BALANCING
 		"numa_next_scan %lu numa_scan_offset %lu numa_scan_seq %d\n"
@@ -185,7 +185,7 @@ void dump_mm(const struct mm_struct *mm)
 #endif
 		mm->exe_file,
 #ifdef CONFIG_MMU_NOTIFIER
-		mm->mmu_notifier_mm,
+		mm->notifier_subscriptions,
 #endif
 #ifdef CONFIG_NUMA_BALANCING
 		mm->numa_next_scan, mm->numa_scan_offset, mm->numa_scan_seq,
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index f76ea05b1cb011..02de878964a787 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -29,12 +29,12 @@ struct lockdep_map __mmu_notifier_invalidate_range_start_map = {
 #endif
 
 /*
- * The mmu notifier_mm structure is allocated and installed in
- * mm->mmu_notifier_mm inside the mm_take_all_locks() protected
+ * The mmu_notifier_subscriptions structure is allocated and installed in
+ * mm->notifier_subscriptions inside the mm_take_all_locks() protected
  * critical section and it's released only when mm_count reaches zero
  * in mmdrop().
  */
-struct mmu_notifier_mm {
+struct mmu_notifier_subscriptions {
 	/* all mmu notifiers registered in this mm are queued in this list */
 	struct hlist_head list;
 	bool has_itree;
@@ -75,7 +75,7 @@ struct mmu_notifier_mm {
  *  - some range on the mm_struct is being invalidated
  *  - the itree is allowed to change
  *
- * Operations on mmu_notifier_mm->invalidate_seq (under spinlock):
+ * Operations on notifier_subscriptions->invalidate_seq (under spinlock):
  *    seq |= 1  # Begin writing
  *    seq++     # Release the writing state
  *    seq & 1   # True if a writer exists
@@ -83,32 +83,33 @@ struct mmu_notifier_mm {
  * The later state avoids some expensive work on inv_end in the common case of
  * no mni monitoring the VA.
  */
-static bool mn_itree_is_invalidating(struct mmu_notifier_mm *mmn_mm)
+static bool
+mn_itree_is_invalidating(struct mmu_notifier_subscriptions *subscriptions)
 {
-	lockdep_assert_held(&mmn_mm->lock);
-	return mmn_mm->invalidate_seq & 1;
+	lockdep_assert_held(&subscriptions->lock);
+	return subscriptions->invalidate_seq & 1;
 }
 
 static struct mmu_interval_notifier *
-mn_itree_inv_start_range(struct mmu_notifier_mm *mmn_mm,
+mn_itree_inv_start_range(struct mmu_notifier_subscriptions *subscriptions,
 			 const struct mmu_notifier_range *range,
 			 unsigned long *seq)
 {
 	struct interval_tree_node *node;
 	struct mmu_interval_notifier *res = NULL;
 
-	spin_lock(&mmn_mm->lock);
-	mmn_mm->active_invalidate_ranges++;
-	node = interval_tree_iter_first(&mmn_mm->itree, range->start,
+	spin_lock(&subscriptions->lock);
+	subscriptions->active_invalidate_ranges++;
+	node = interval_tree_iter_first(&subscriptions->itree, range->start,
 					range->end - 1);
 	if (node) {
-		mmn_mm->invalidate_seq |= 1;
+		subscriptions->invalidate_seq |= 1;
 		res = container_of(node, struct mmu_interval_notifier,
 				   interval_tree);
 	}
 
-	*seq = mmn_mm->invalidate_seq;
-	spin_unlock(&mmn_mm->lock);
+	*seq = subscriptions->invalidate_seq;
+	spin_unlock(&subscriptions->lock);
 	return res;
 }
 
@@ -125,20 +126,20 @@ mn_itree_inv_next(struct mmu_interval_notifier *mni,
 	return container_of(node, struct mmu_interval_notifier, interval_tree);
 }
 
-static void mn_itree_inv_end(struct mmu_notifier_mm *mmn_mm)
+static void mn_itree_inv_end(struct mmu_notifier_subscriptions *subscriptions)
 {
 	struct mmu_interval_notifier *mni;
 	struct hlist_node *next;
 
-	spin_lock(&mmn_mm->lock);
-	if (--mmn_mm->active_invalidate_ranges ||
-	    !mn_itree_is_invalidating(mmn_mm)) {
-		spin_unlock(&mmn_mm->lock);
+	spin_lock(&subscriptions->lock);
+	if (--subscriptions->active_invalidate_ranges ||
+	    !mn_itree_is_invalidating(subscriptions)) {
+		spin_unlock(&subscriptions->lock);
 		return;
 	}
 
 	/* Make invalidate_seq even */
-	mmn_mm->invalidate_seq++;
+	subscriptions->invalidate_seq++;
 
 	/*
 	 * The inv_end incorporates a deferred mechanism like rtnl_unlock().
@@ -146,19 +147,19 @@ static void mn_itree_inv_end(struct mmu_notifier_mm *mmn_mm)
 	 * they are progressed. This arrangement for tree updates is used to
 	 * avoid using a blocking lock during invalidate_range_start.
 	 */
-	hlist_for_each_entry_safe(mni, next, &mmn_mm->deferred_list,
+	hlist_for_each_entry_safe(mni, next, &subscriptions->deferred_list,
 				  deferred_item) {
 		if (RB_EMPTY_NODE(&mni->interval_tree.rb))
 			interval_tree_insert(&mni->interval_tree,
-					     &mmn_mm->itree);
+					     &subscriptions->itree);
 		else
 			interval_tree_remove(&mni->interval_tree,
-					     &mmn_mm->itree);
+					     &subscriptions->itree);
 		hlist_del(&mni->deferred_item);
 	}
-	spin_unlock(&mmn_mm->lock);
+	spin_unlock(&subscriptions->lock);
 
-	wake_up_all(&mmn_mm->wq);
+	wake_up_all(&subscriptions->wq);
 }
 
 /**
@@ -182,7 +183,8 @@ static void mn_itree_inv_end(struct mmu_notifier_mm *mmn_mm)
  */
 unsigned long mmu_interval_read_begin(struct mmu_interval_notifier *mni)
 {
-	struct mmu_notifier_mm *mmn_mm = mni->mm->mmu_notifier_mm;
+	struct mmu_notifier_subscriptions *subscriptions =
+		mni->mm->notifier_subscriptions;
 	unsigned long seq;
 	bool is_invalidating;
 
@@ -190,17 +192,18 @@ unsigned long mmu_interval_read_begin(struct mmu_interval_notifier *mni)
 	 * If the mni has a different seq value under the user_lock than we
 	 * started with then it has collided.
 	 *
-	 * If the mni currently has the same seq value as the mmn_mm seq, then
-	 * it is currently between invalidate_start/end and is colliding.
+	 * If the mni currently has the same seq value as the subscriptions
+	 * seq, then it is currently between invalidate_start/end and is
+	 * colliding.
 	 *
 	 * The locking looks broadly like this:
 	 *   mn_tree_invalidate_start():          mmu_interval_read_begin():
 	 *                                         spin_lock
 	 *                                          seq = READ_ONCE(mni->invalidate_seq);
-	 *                                          seq == mmn_mm->invalidate_seq
+	 *                                          seq == subs->invalidate_seq
 	 *                                         spin_unlock
 	 *    spin_lock
-	 *     seq = ++mmn_mm->invalidate_seq
+	 *     seq = ++subscriptions->invalidate_seq
 	 *    spin_unlock
 	 *     op->invalidate_range():
 	 *       user_lock
@@ -212,7 +215,7 @@ unsigned long mmu_interval_read_begin(struct mmu_interval_notifier *mni)
 	 *
 	 *   mn_itree_inv_end():
 	 *    spin_lock
-	 *     seq = ++mmn_mm->invalidate_seq
+	 *     seq = ++subscriptions->invalidate_seq
 	 *    spin_unlock
 	 *
 	 *                                        user_lock
@@ -224,24 +227,24 @@ unsigned long mmu_interval_read_begin(struct mmu_interval_notifier *mni)
 	 * eventual mmu_interval_read_retry(), which provides a barrier via the
 	 * user_lock.
 	 */
-	spin_lock(&mmn_mm->lock);
+	spin_lock(&subscriptions->lock);
 	/* Pairs with the WRITE_ONCE in mmu_interval_set_seq() */
 	seq = READ_ONCE(mni->invalidate_seq);
-	is_invalidating = seq == mmn_mm->invalidate_seq;
-	spin_unlock(&mmn_mm->lock);
+	is_invalidating = seq == subscriptions->invalidate_seq;
+	spin_unlock(&subscriptions->lock);
 
 	/*
 	 * mni->invalidate_seq must always be set to an odd value via
 	 * mmu_interval_set_seq() using the provided cur_seq from
 	 * mn_itree_inv_start_range(). This ensures that if seq does wrap we
 	 * will always clear the below sleep in some reasonable time as
-	 * mmn_mm->invalidate_seq is even in the idle state.
+	 * subscriptions->invalidate_seq is even in the idle state.
 	 */
 	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
 	if (is_invalidating)
-		wait_event(mmn_mm->wq,
-			   READ_ONCE(mmn_mm->invalidate_seq) != seq);
+		wait_event(subscriptions->wq,
+			   READ_ONCE(subscriptions->invalidate_seq) != seq);
 
 	/*
 	 * Notice that mmu_interval_read_retry() can already be true at this
@@ -253,7 +256,7 @@ unsigned long mmu_interval_read_begin(struct mmu_interval_notifier *mni)
 }
 EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
 
-static void mn_itree_release(struct mmu_notifier_mm *mmn_mm,
+static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
 			     struct mm_struct *mm)
 {
 	struct mmu_notifier_range range = {
@@ -267,13 +270,13 @@ static void mn_itree_release(struct mmu_notifier_mm *mmn_mm,
 	unsigned long cur_seq;
 	bool ret;
 
-	for (mni = mn_itree_inv_start_range(mmn_mm, &range, &cur_seq); mni;
-	     mni = mn_itree_inv_next(mni, &range)) {
+	for (mni = mn_itree_inv_start_range(subscriptions, &range, &cur_seq);
+	     mni; mni = mn_itree_inv_next(mni, &range)) {
 		ret = mni->ops->invalidate(mni, &range, cur_seq);
 		WARN_ON(!ret);
 	}
 
-	mn_itree_inv_end(mmn_mm);
+	mn_itree_inv_end(subscriptions);
 }
 
 /*
@@ -283,12 +286,12 @@ static void mn_itree_release(struct mmu_notifier_mm *mmn_mm,
  * in parallel despite there being no task using this mm any more,
  * through the vmas outside of the exit_mmap context, such as with
  * vmtruncate. This serializes against mmu_notifier_unregister with
- * the mmu_notifier_mm->lock in addition to SRCU and it serializes
- * against the other mmu notifiers with SRCU. struct mmu_notifier_mm
+ * the notifier_subscriptions->lock in addition to SRCU and it serializes
+ * against the other mmu notifiers with SRCU. struct mmu_notifier_subscriptions
  * can't go away from under us as exit_mmap holds an mm_count pin
  * itself.
  */
-static void mn_hlist_release(struct mmu_notifier_mm *mmn_mm,
+static void mn_hlist_release(struct mmu_notifier_subscriptions *subscriptions,
 			     struct mm_struct *mm)
 {
 	struct mmu_notifier *mn;
@@ -299,7 +302,7 @@ static void mn_hlist_release(struct mmu_notifier_mm *mmn_mm,
 	 * ->release returns.
 	 */
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mmn_mm->list, hlist)
+	hlist_for_each_entry_rcu(mn, &subscriptions->list, hlist)
 		/*
 		 * If ->release runs before mmu_notifier_unregister it must be
 		 * handled, as it's the only way for the driver to flush all
@@ -309,9 +312,9 @@ static void mn_hlist_release(struct mmu_notifier_mm *mmn_mm,
 		if (mn->ops->release)
 			mn->ops->release(mn, mm);
 
-	spin_lock(&mmn_mm->lock);
-	while (unlikely(!hlist_empty(&mmn_mm->list))) {
-		mn = hlist_entry(mmn_mm->list.first, struct mmu_notifier,
+	spin_lock(&subscriptions->lock);
+	while (unlikely(!hlist_empty(&subscriptions->list))) {
+		mn = hlist_entry(subscriptions->list.first, struct mmu_notifier,
 				 hlist);
 		/*
 		 * We arrived before mmu_notifier_unregister so
@@ -321,7 +324,7 @@ static void mn_hlist_release(struct mmu_notifier_mm *mmn_mm,
 		 */
 		hlist_del_init_rcu(&mn->hlist);
 	}
-	spin_unlock(&mmn_mm->lock);
+	spin_unlock(&subscriptions->lock);
 	srcu_read_unlock(&srcu, id);
 
 	/*
@@ -330,21 +333,22 @@ static void mn_hlist_release(struct mmu_notifier_mm *mmn_mm,
 	 * until the ->release method returns, if it was invoked by
 	 * mmu_notifier_unregister.
 	 *
-	 * The mmu_notifier_mm can't go away from under us because one mm_count
-	 * is held by exit_mmap.
+	 * The notifier_subscriptions can't go away from under us because
+	 * one mm_count is held by exit_mmap.
 	 */
 	synchronize_srcu(&srcu);
 }
 
 void __mmu_notifier_release(struct mm_struct *mm)
 {
-	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
+	struct mmu_notifier_subscriptions *subscriptions =
+		mm->notifier_subscriptions;
 
-	if (mmn_mm->has_itree)
-		mn_itree_release(mmn_mm, mm);
+	if (subscriptions->has_itree)
+		mn_itree_release(subscriptions, mm);
 
-	if (!hlist_empty(&mmn_mm->list))
-		mn_hlist_release(mmn_mm, mm);
+	if (!hlist_empty(&subscriptions->list))
+		mn_hlist_release(subscriptions, mm);
 }
 
 /*
@@ -360,7 +364,7 @@ int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	int young = 0, id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mm->mmu_notifier_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &mm->notifier_subscriptions->list, hlist) {
 		if (mn->ops->clear_flush_young)
 			young |= mn->ops->clear_flush_young(mn, mm, start, end);
 	}
@@ -377,7 +381,7 @@ int __mmu_notifier_clear_young(struct mm_struct *mm,
 	int young = 0, id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mm->mmu_notifier_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &mm->notifier_subscriptions->list, hlist) {
 		if (mn->ops->clear_young)
 			young |= mn->ops->clear_young(mn, mm, start, end);
 	}
@@ -393,7 +397,7 @@ int __mmu_notifier_test_young(struct mm_struct *mm,
 	int young = 0, id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mm->mmu_notifier_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &mm->notifier_subscriptions->list, hlist) {
 		if (mn->ops->test_young) {
 			young = mn->ops->test_young(mn, mm, address);
 			if (young)
@@ -412,21 +416,22 @@ void __mmu_notifier_change_pte(struct mm_struct *mm, unsigned long address,
 	int id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mm->mmu_notifier_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &mm->notifier_subscriptions->list,
+				 hlist) {
 		if (mn->ops->change_pte)
 			mn->ops->change_pte(mn, mm, address, pte);
 	}
 	srcu_read_unlock(&srcu, id);
 }
 
-static int mn_itree_invalidate(struct mmu_notifier_mm *mmn_mm,
+static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 			       const struct mmu_notifier_range *range)
 {
 	struct mmu_interval_notifier *mni;
 	unsigned long cur_seq;
 
-	for (mni = mn_itree_inv_start_range(mmn_mm, range, &cur_seq); mni;
-	     mni = mn_itree_inv_next(mni, range)) {
+	for (mni = mn_itree_inv_start_range(subscriptions, range, &cur_seq);
+	     mni; mni = mn_itree_inv_next(mni, range)) {
 		bool ret;
 
 		ret = mni->ops->invalidate(mni, range, cur_seq);
@@ -443,19 +448,20 @@ static int mn_itree_invalidate(struct mmu_notifier_mm *mmn_mm,
 	 * On -EAGAIN the non-blocking caller is not allowed to call
 	 * invalidate_range_end()
 	 */
-	mn_itree_inv_end(mmn_mm);
+	mn_itree_inv_end(subscriptions);
 	return -EAGAIN;
 }
 
-static int mn_hlist_invalidate_range_start(struct mmu_notifier_mm *mmn_mm,
-					   struct mmu_notifier_range *range)
+static int mn_hlist_invalidate_range_start(
+	struct mmu_notifier_subscriptions *subscriptions,
+	struct mmu_notifier_range *range)
 {
 	struct mmu_notifier *mn;
 	int ret = 0;
 	int id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mmn_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &subscriptions->list, hlist) {
 		if (mn->ops->invalidate_range_start) {
 			int _ret;
 
@@ -481,28 +487,29 @@ static int mn_hlist_invalidate_range_start(struct mmu_notifier_mm *mmn_mm,
 
 int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
-	struct mmu_notifier_mm *mmn_mm = range->mm->mmu_notifier_mm;
+	struct mmu_notifier_subscriptions *subscriptions =
+		range->mm->notifier_subscriptions;
 	int ret;
 
-	if (mmn_mm->has_itree) {
-		ret = mn_itree_invalidate(mmn_mm, range);
+	if (subscriptions->has_itree) {
+		ret = mn_itree_invalidate(subscriptions, range);
 		if (ret)
 			return ret;
 	}
-	if (!hlist_empty(&mmn_mm->list))
-		return mn_hlist_invalidate_range_start(mmn_mm, range);
+	if (!hlist_empty(&subscriptions->list))
+		return mn_hlist_invalidate_range_start(subscriptions, range);
 	return 0;
 }
 
-static void mn_hlist_invalidate_end(struct mmu_notifier_mm *mmn_mm,
-				    struct mmu_notifier_range *range,
-				    bool only_end)
+static void
+mn_hlist_invalidate_end(struct mmu_notifier_subscriptions *subscriptions,
+			struct mmu_notifier_range *range, bool only_end)
 {
 	struct mmu_notifier *mn;
 	int id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mmn_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &subscriptions->list, hlist) {
 		/*
 		 * Call invalidate_range here too to avoid the need for the
 		 * subsystem of having to register an invalidate_range_end
@@ -534,14 +541,15 @@ static void mn_hlist_invalidate_end(struct mmu_notifier_mm *mmn_mm,
 void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range,
 					 bool only_end)
 {
-	struct mmu_notifier_mm *mmn_mm = range->mm->mmu_notifier_mm;
+	struct mmu_notifier_subscriptions *subscriptions =
+		range->mm->notifier_subscriptions;
 
 	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
-	if (mmn_mm->has_itree)
-		mn_itree_inv_end(mmn_mm);
+	if (subscriptions->has_itree)
+		mn_itree_inv_end(subscriptions);
 
-	if (!hlist_empty(&mmn_mm->list))
-		mn_hlist_invalidate_end(mmn_mm, range, only_end);
+	if (!hlist_empty(&subscriptions->list))
+		mn_hlist_invalidate_end(subscriptions, range, only_end);
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
 }
 
@@ -552,7 +560,7 @@ void __mmu_notifier_invalidate_range(struct mm_struct *mm,
 	int id;
 
 	id = srcu_read_lock(&srcu);
-	hlist_for_each_entry_rcu(mn, &mm->mmu_notifier_mm->list, hlist) {
+	hlist_for_each_entry_rcu(mn, &mm->notifier_subscriptions->list, hlist) {
 		if (mn->ops->invalidate_range)
 			mn->ops->invalidate_range(mn, mm, start, end);
 	}
@@ -566,7 +574,7 @@ void __mmu_notifier_invalidate_range(struct mm_struct *mm,
  */
 int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 {
-	struct mmu_notifier_mm *mmu_notifier_mm = NULL;
+	struct mmu_notifier_subscriptions *subscriptions = NULL;
 	int ret;
 
 	lockdep_assert_held_write(&mm->mmap_sem);
@@ -579,23 +587,23 @@ int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 		fs_reclaim_release(GFP_KERNEL);
 	}
 
-	if (!mm->mmu_notifier_mm) {
+	if (!mm->notifier_subscriptions) {
 		/*
 		 * kmalloc cannot be called under mm_take_all_locks(), but we
-		 * know that mm->mmu_notifier_mm can't change while we hold
-		 * the write side of the mmap_sem.
+		 * know that mm->notifier_subscriptions can't change while we
+		 * hold the write side of the mmap_sem.
 		 */
-		mmu_notifier_mm =
-			kzalloc(sizeof(struct mmu_notifier_mm), GFP_KERNEL);
-		if (!mmu_notifier_mm)
+		subscriptions = kzalloc(
+			sizeof(struct mmu_notifier_subscriptions), GFP_KERNEL);
+		if (!subscriptions)
 			return -ENOMEM;
 
-		INIT_HLIST_HEAD(&mmu_notifier_mm->list);
-		spin_lock_init(&mmu_notifier_mm->lock);
-		mmu_notifier_mm->invalidate_seq = 2;
-		mmu_notifier_mm->itree = RB_ROOT_CACHED;
-		init_waitqueue_head(&mmu_notifier_mm->wq);
-		INIT_HLIST_HEAD(&mmu_notifier_mm->deferred_list);
+		INIT_HLIST_HEAD(&subscriptions->list);
+		spin_lock_init(&subscriptions->lock);
+		subscriptions->invalidate_seq = 2;
+		subscriptions->itree = RB_ROOT_CACHED;
+		init_waitqueue_head(&subscriptions->wq);
+		INIT_HLIST_HEAD(&subscriptions->deferred_list);
 	}
 
 	ret = mm_take_all_locks(mm);
@@ -610,15 +618,16 @@ int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 	 * We can't race against any other mmu notifier method either
 	 * thanks to mm_take_all_locks().
 	 *
-	 * release semantics on the initialization of the mmu_notifier_mm's
-	 * contents are provided for unlocked readers.  acquire can only be
-	 * used while holding the mmgrab or mmget, and is safe because once
-	 * created the mmu_notififer_mm is not freed until the mm is
-	 * destroyed.  As above, users holding the mmap_sem or one of the
+	 * release semantics on the initialization of the
+	 * mmu_notifier_subscriptions's contents are provided for unlocked
+	 * readers.  acquire can only be used while holding the mmgrab or
+	 * mmget, and is safe because once created the
+	 * mmu_notifier_subscriptions is not freed until the mm is destroyed.
+	 * As above, users holding the mmap_sem or one of the
 	 * mm_take_all_locks() do not need to use acquire semantics.
 	 */
-	if (mmu_notifier_mm)
-		smp_store_release(&mm->mmu_notifier_mm, mmu_notifier_mm);
+	if (subscriptions)
+		smp_store_release(&mm->notifier_subscriptions, subscriptions);
 
 	if (mn) {
 		/* Pairs with the mmdrop in mmu_notifier_unregister_* */
@@ -626,18 +635,19 @@ int __mmu_notifier_register(struct mmu_notifier *mn, struct mm_struct *mm)
 		mn->mm = mm;
 		mn->users = 1;
 
-		spin_lock(&mm->mmu_notifier_mm->lock);
-		hlist_add_head_rcu(&mn->hlist, &mm->mmu_notifier_mm->list);
-		spin_unlock(&mm->mmu_notifier_mm->lock);
+		spin_lock(&mm->notifier_subscriptions->lock);
+		hlist_add_head_rcu(&mn->hlist,
+				   &mm->notifier_subscriptions->list);
+		spin_unlock(&mm->notifier_subscriptions->lock);
 	} else
-		mm->mmu_notifier_mm->has_itree = true;
+		mm->notifier_subscriptions->has_itree = true;
 
 	mm_drop_all_locks(mm);
 	BUG_ON(atomic_read(&mm->mm_users) <= 0);
 	return 0;
 
 out_clean:
-	kfree(mmu_notifier_mm);
+	kfree(subscriptions);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(__mmu_notifier_register);
@@ -677,8 +687,9 @@ find_get_mmu_notifier(struct mm_struct *mm, const struct mmu_notifier_ops *ops)
 {
 	struct mmu_notifier *mn;
 
-	spin_lock(&mm->mmu_notifier_mm->lock);
-	hlist_for_each_entry_rcu (mn, &mm->mmu_notifier_mm->list, hlist) {
+	spin_lock(&mm->notifier_subscriptions->lock);
+	hlist_for_each_entry_rcu(mn, &mm->notifier_subscriptions->list,
+				 hlist) {
 		if (mn->ops != ops)
 			continue;
 
@@ -686,10 +697,10 @@ find_get_mmu_notifier(struct mm_struct *mm, const struct mmu_notifier_ops *ops)
 			mn->users++;
 		else
 			mn = ERR_PTR(-EOVERFLOW);
-		spin_unlock(&mm->mmu_notifier_mm->lock);
+		spin_unlock(&mm->notifier_subscriptions->lock);
 		return mn;
 	}
-	spin_unlock(&mm->mmu_notifier_mm->lock);
+	spin_unlock(&mm->notifier_subscriptions->lock);
 	return NULL;
 }
 
@@ -718,7 +729,7 @@ struct mmu_notifier *mmu_notifier_get_locked(const struct mmu_notifier_ops *ops,
 
 	lockdep_assert_held_write(&mm->mmap_sem);
 
-	if (mm->mmu_notifier_mm) {
+	if (mm->notifier_subscriptions) {
 		mn = find_get_mmu_notifier(mm, ops);
 		if (mn)
 			return mn;
@@ -739,11 +750,11 @@ struct mmu_notifier *mmu_notifier_get_locked(const struct mmu_notifier_ops *ops,
 EXPORT_SYMBOL_GPL(mmu_notifier_get_locked);
 
 /* this is called after the last mmu_notifier_unregister() returned */
-void __mmu_notifier_mm_destroy(struct mm_struct *mm)
+void __mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
 {
-	BUG_ON(!hlist_empty(&mm->mmu_notifier_mm->list));
-	kfree(mm->mmu_notifier_mm);
-	mm->mmu_notifier_mm = LIST_POISON1; /* debug */
+	BUG_ON(!hlist_empty(&mm->notifier_subscriptions->list));
+	kfree(mm->notifier_subscriptions);
+	mm->notifier_subscriptions = LIST_POISON1; /* debug */
 }
 
 /*
@@ -776,13 +787,13 @@ void mmu_notifier_unregister(struct mmu_notifier *mn, struct mm_struct *mm)
 			mn->ops->release(mn, mm);
 		srcu_read_unlock(&srcu, id);
 
-		spin_lock(&mm->mmu_notifier_mm->lock);
+		spin_lock(&mm->notifier_subscriptions->lock);
 		/*
 		 * Can not use list_del_rcu() since __mmu_notifier_release
 		 * can delete it before we hold the lock.
 		 */
 		hlist_del_init_rcu(&mn->hlist);
-		spin_unlock(&mm->mmu_notifier_mm->lock);
+		spin_unlock(&mm->notifier_subscriptions->lock);
 	}
 
 	/*
@@ -833,23 +844,23 @@ void mmu_notifier_put(struct mmu_notifier *mn)
 {
 	struct mm_struct *mm = mn->mm;
 
-	spin_lock(&mm->mmu_notifier_mm->lock);
+	spin_lock(&mm->notifier_subscriptions->lock);
 	if (WARN_ON(!mn->users) || --mn->users)
 		goto out_unlock;
 	hlist_del_init_rcu(&mn->hlist);
-	spin_unlock(&mm->mmu_notifier_mm->lock);
+	spin_unlock(&mm->notifier_subscriptions->lock);
 
 	call_srcu(&srcu, &mn->rcu, mmu_notifier_free_rcu);
 	return;
 
 out_unlock:
-	spin_unlock(&mm->mmu_notifier_mm->lock);
+	spin_unlock(&mm->notifier_subscriptions->lock);
 }
 EXPORT_SYMBOL_GPL(mmu_notifier_put);
 
 static int __mmu_interval_notifier_insert(
 	struct mmu_interval_notifier *mni, struct mm_struct *mm,
-	struct mmu_notifier_mm *mmn_mm, unsigned long start,
+	struct mmu_notifier_subscriptions *subscriptions, unsigned long start,
 	unsigned long length, const struct mmu_interval_notifier_ops *ops)
 {
 	mni->mm = mm;
@@ -884,29 +895,30 @@ static int __mmu_interval_notifier_insert(
 	 * In all cases the value for the mni->invalidate_seq should be
 	 * odd, see mmu_interval_read_begin()
 	 */
-	spin_lock(&mmn_mm->lock);
-	if (mmn_mm->active_invalidate_ranges) {
-		if (mn_itree_is_invalidating(mmn_mm))
+	spin_lock(&subscriptions->lock);
+	if (subscriptions->active_invalidate_ranges) {
+		if (mn_itree_is_invalidating(subscriptions))
 			hlist_add_head(&mni->deferred_item,
-				       &mmn_mm->deferred_list);
+				       &subscriptions->deferred_list);
 		else {
-			mmn_mm->invalidate_seq |= 1;
+			subscriptions->invalidate_seq |= 1;
 			interval_tree_insert(&mni->interval_tree,
-					     &mmn_mm->itree);
+					     &subscriptions->itree);
 		}
-		mni->invalidate_seq = mmn_mm->invalidate_seq;
+		mni->invalidate_seq = subscriptions->invalidate_seq;
 	} else {
-		WARN_ON(mn_itree_is_invalidating(mmn_mm));
+		WARN_ON(mn_itree_is_invalidating(subscriptions));
 		/*
 		 * The starting seq for a mni not under invalidation should be
 		 * odd, not equal to the current invalidate_seq and
 		 * invalidate_seq should not 'wrap' to the new seq any time
 		 * soon.
 		 */
-		mni->invalidate_seq = mmn_mm->invalidate_seq - 1;
-		interval_tree_insert(&mni->interval_tree, &mmn_mm->itree);
+		mni->invalidate_seq = subscriptions->invalidate_seq - 1;
+		interval_tree_insert(&mni->interval_tree,
+				     &subscriptions->itree);
 	}
-	spin_unlock(&mmn_mm->lock);
+	spin_unlock(&subscriptions->lock);
 	return 0;
 }
 
@@ -930,20 +942,20 @@ int mmu_interval_notifier_insert(struct mmu_interval_notifier *mni,
 				 unsigned long length,
 				 const struct mmu_interval_notifier_ops *ops)
 {
-	struct mmu_notifier_mm *mmn_mm;
+	struct mmu_notifier_subscriptions *subscriptions;
 	int ret;
 
 	might_lock(&mm->mmap_sem);
 
-	mmn_mm = smp_load_acquire(&mm->mmu_notifier_mm);
-	if (!mmn_mm || !mmn_mm->has_itree) {
+	subscriptions = smp_load_acquire(&mm->notifier_subscriptions);
+	if (!subscriptions || !subscriptions->has_itree) {
 		ret = mmu_notifier_register(NULL, mm);
 		if (ret)
 			return ret;
-		mmn_mm = mm->mmu_notifier_mm;
+		subscriptions = mm->notifier_subscriptions;
 	}
-	return __mmu_interval_notifier_insert(mni, mm, mmn_mm, start, length,
-					      ops);
+	return __mmu_interval_notifier_insert(mni, mm, subscriptions, start,
+					      length, ops);
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert);
 
@@ -952,20 +964,20 @@ int mmu_interval_notifier_insert_locked(
 	unsigned long start, unsigned long length,
 	const struct mmu_interval_notifier_ops *ops)
 {
-	struct mmu_notifier_mm *mmn_mm;
+	struct mmu_notifier_subscriptions *subscriptions =
+		mm->notifier_subscriptions;
 	int ret;
 
 	lockdep_assert_held_write(&mm->mmap_sem);
 
-	mmn_mm = mm->mmu_notifier_mm;
-	if (!mmn_mm || !mmn_mm->has_itree) {
+	if (!subscriptions || !subscriptions->has_itree) {
 		ret = __mmu_notifier_register(NULL, mm);
 		if (ret)
 			return ret;
-		mmn_mm = mm->mmu_notifier_mm;
+		subscriptions = mm->notifier_subscriptions;
 	}
-	return __mmu_interval_notifier_insert(mni, mm, mmn_mm, start, length,
-					      ops);
+	return __mmu_interval_notifier_insert(mni, mm, subscriptions, start,
+					      length, ops);
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert_locked);
 
@@ -982,13 +994,14 @@ EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert_locked);
 void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni)
 {
 	struct mm_struct *mm = mni->mm;
-	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
+	struct mmu_notifier_subscriptions *subscriptions =
+		mm->notifier_subscriptions;
 	unsigned long seq = 0;
 
 	might_sleep();
 
-	spin_lock(&mmn_mm->lock);
-	if (mn_itree_is_invalidating(mmn_mm)) {
+	spin_lock(&subscriptions->lock);
+	if (mn_itree_is_invalidating(subscriptions)) {
 		/*
 		 * remove is being called after insert put this on the
 		 * deferred list, but before the deferred list was processed.
@@ -997,14 +1010,15 @@ void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni)
 			hlist_del(&mni->deferred_item);
 		} else {
 			hlist_add_head(&mni->deferred_item,
-				       &mmn_mm->deferred_list);
-			seq = mmn_mm->invalidate_seq;
+				       &subscriptions->deferred_list);
+			seq = subscriptions->invalidate_seq;
 		}
 	} else {
 		WARN_ON(RB_EMPTY_NODE(&mni->interval_tree.rb));
-		interval_tree_remove(&mni->interval_tree, &mmn_mm->itree);
+		interval_tree_remove(&mni->interval_tree,
+				     &subscriptions->itree);
 	}
-	spin_unlock(&mmn_mm->lock);
+	spin_unlock(&subscriptions->lock);
 
 	/*
 	 * The possible sleep on progress in the invalidation requires the
@@ -1013,8 +1027,8 @@ void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni)
 	lock_map_acquire(&__mmu_notifier_invalidate_range_start_map);
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
 	if (seq)
-		wait_event(mmn_mm->wq,
-			   READ_ONCE(mmn_mm->invalidate_seq) != seq);
+		wait_event(subscriptions->wq,
+			   READ_ONCE(subscriptions->invalidate_seq) != seq);
 
 	/* pairs with mmgrab in mmu_interval_notifier_insert() */
 	mmdrop(mm);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
