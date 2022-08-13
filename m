Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D04591CED
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 00:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84FB10F2B9;
	Sat, 13 Aug 2022 22:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25FA10F2B9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 22:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660428042; x=1691964042;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J2stkkYmPik2bQMds1PPTKQFWYY4K6w3/+pjsawBn4I=;
 b=HJqLse1iEyD+5ycn8xeBxUfR3BBfNyCk6Xh7fHhgFL1iIplNCsxI6FZo
 Fj1sNlfHXvd0fivsBEeIDGDpRyUpocibZ0UdSTHNmy4oyRBadNISbeboY
 nPzfoG0zOcSUn3/n+StXVaXEb0RzwGCs23jgzzsaQqHqC7ChEgHW9qq4r
 RJ05ApwRCbTPIgwiYukZhXIm2Z9INJEvXDJ5uL/VvpZ5EzvyyxKjAoWN7
 BTSDE7fyHRDiSOo544h5bB6M7OvgH9gH5hjCrJdOz9HubEhrhzRBCayVd
 MJhNAe36NHXfCZw5EQf1vZjbtmzJKJbghjdcZVZ0DV0ul/Ot5tah1ocYn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="278735227"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="278735227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 15:00:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="635047705"
Received: from tsaiyinl-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.125.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 15:00:40 -0700
From: ira.weiny@intel.com
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Subject: [PATCH] checkpatch: Add kmap and kmap_atomic to the deprecated list
Date: Sat, 13 Aug 2022 15:00:34 -0700
Message-Id: <20220813220034.806698-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: nvdimm@lists.linux.dev, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Ira Weiny <ira.weiny@intel.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 linux-csky@vger.kernel.org, iommu@lists.linux.dev,
 linux-snps-arc@lists.infradead.org,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 linux-media@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-raid@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

kmap() and kmap_atomic() are being deprecated in favor of
kmap_local_page().

There are two main problems with kmap(): (1) It comes with an overhead
as mapping space is restricted and protected by a global lock for
synchronization and (2) it also requires global TLB invalidation when
the kmap’s pool wraps and it might block when the mapping space is fully
utilized until a slot becomes available.

kmap_local_page() is safe from any context and is therefore redundant
with kmap_atomic() with the exception of any pagefault or preemption
disable requirements.  However, using kmap_atomic() for these side
effects makes the code less clear.  So any requirement for pagefault or
preemption disable should be made explicitly.

With kmap_local_page() the mappings are per thread, CPU local, can take
page faults, and can be called from any context (including interrupts).
It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
the tasks can be preempted and, when they are scheduled to run again,
the kernel virtual addresses are restored.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Suggested by credits.
	Thomas: Idea to keep from growing more kmap/kmap_atomic calls.
	Fabio: Stole some of his boiler plate commit message.

Notes on tree-wide conversions:

I've cc'ed mailing lists for subsystems which currently contains either kmap()
or kmap_atomic() calls.  As some of you already know Fabio and I have been
working through converting kmap() calls to kmap_local_page().  But there is a
lot more work to be done.  Help from the community is always welcome,
especially with kmap_atomic() conversions.  To keep from stepping on each
others toes I've created a spreadsheet of the current calls[1].  Please let me
or Fabio know if you plan on tacking one of the conversions so we can mark it
off the list.

[1] https://docs.google.com/spreadsheets/d/1i_ckZ10p90bH_CkxD2bYNi05S2Qz84E2OFPv8zq__0w/edit#gid=1679714357

---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 79e759aac543..9ff219e0a9d5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -807,6 +807,8 @@ our %deprecated_apis = (
 	"rcu_barrier_sched"			=> "rcu_barrier",
 	"get_state_synchronize_sched"		=> "get_state_synchronize_rcu",
 	"cond_synchronize_sched"		=> "cond_synchronize_rcu",
+	"kmap"					=> "kmap_local_page",
+	"kmap_atomic"				=> "kmap_local_page",
 );
 
 #Create a search pattern for all these strings to speed up a loop below

base-commit: 4a9350597aff50bbd0f4b80ccf49d2e02d1111f5
-- 
2.35.3

