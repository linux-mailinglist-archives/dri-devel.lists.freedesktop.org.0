Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0412F9B041A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DB310EACF;
	Fri, 25 Oct 2024 13:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6C10E94A;
 Thu, 24 Oct 2024 13:41:28 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XZ6633brJz4f3nV0;
 Thu, 24 Oct 2024 21:22:35 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id C1B061A018D;
 Thu, 24 Oct 2024 21:22:53 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgCHusYpShpn7tb6Ew--.444S4;
 Thu, 24 Oct 2024 21:22:51 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: stable@vger.kernel.org, gregkh@linuxfoundation.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, hughd@google.com,
 willy@infradead.org, sashal@kernel.org, srinivasan.shanmugam@amd.com,
 chiahsuan.chung@amd.com, mingo@kernel.org, mgorman@techsingularity.net,
 yukuai3@huawei.com, chengming.zhou@linux.dev, zhangpeng.00@bytedance.com,
 chuck.lever@oracle.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org,
 yukuai1@huaweicloud.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: [PATCH 6.6 00/28] fix CVE-2024-46701
Date: Thu, 24 Oct 2024 21:19:41 +0800
Message-Id: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHusYpShpn7tb6Ew--.444S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy3Zr48Wr4UKF4kGw4Durg_yoW5CF13p3
 WDGr15trsrZry8Grs3Aw47Xry7W395W348Jw1DGw15Ar4UKr97XrWruFyfAay3CayxGF47
 Kr1Yqw18Ca4UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9I14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Wrv_ZF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r
 4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
 6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
 IYCTnIWIevJa73UjIFyTuYvjTRCXdbUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:49 +0000
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

From: Yu Kuai <yukuai3@huawei.com>

Fix patch is patch 27, relied patches are from:

 - patches from set [1] to add helpers to maple_tree, the last patch to
improve fork() performance is not backported;
 - patches from set [2] to change maple_tree, and follow up fixes;
 - patches from set [3] to convert offset_ctx from xarray to maple_tree;

Please notice that I'm not an expert in this area, and I'm afraid to
make manual changes. That's why patch 16 revert the commit that is
different from mainline and will cause conflict backporting new patches.
patch 28 pick the original mainline patch again.

(And this is what we did to fix the CVE in downstream kernels).

[1] https://lore.kernel.org/all/20231027033845.90608-1-zhangpeng.00@bytedance.com/
[2] https://lore.kernel.org/all/20231101171629.3612299-2-Liam.Howlett@oracle.com/T/
[3] https://lore.kernel.org/all/170820083431.6328.16233178852085891453.stgit@91.116.238.104.host.secureserver.net/

Andrew Morton (1):
  lib/maple_tree.c: fix build error due to hotfix alteration

Chuck Lever (5):
  libfs: Re-arrange locking in offset_iterate_dir()
  libfs: Define a minimum directory offset
  libfs: Add simple_offset_empty()
  maple_tree: Add mtree_alloc_cyclic()
  libfs: Convert simple directory offsets to use a Maple Tree

Liam R. Howlett (12):
  maple_tree: remove unnecessary default labels from switch statements
  maple_tree: make mas_erase() more robust
  maple_tree: move debug check to __mas_set_range()
  maple_tree: add end of node tracking to the maple state
  maple_tree: use cached node end in mas_next()
  maple_tree: use cached node end in mas_destroy()
  maple_tree: clean up inlines for some functions
  maple_tree: separate ma_state node from status
  maple_tree: remove mas_searchable()
  maple_tree: use maple state end for write operations
  maple_tree: don't find node end in mtree_lookup_walk()
  maple_tree: mtree_range_walk() clean up

Lorenzo Stoakes (1):
  maple_tree: correct tree corruption on spanning store

Peng Zhang (7):
  maple_tree: add mt_free_one() and mt_attr() helpers
  maple_tree: introduce {mtree,mas}_lock_nested()
  maple_tree: introduce interfaces __mt_dup() and mtree_dup()
  maple_tree: skip other tests when BENCH is enabled
  maple_tree: preserve the tree attributes when destroying maple tree
  maple_tree: add test for mtree_dup()
  maple_tree: avoid checking other gaps after getting the largest gap

Yu Kuai (1):
  Revert "maple_tree: correct tree corruption on spanning store"

yangerkun (1):
  libfs: fix infinite directory reads for offset dir

 fs/libfs.c                                  |  129 ++-
 include/linux/fs.h                          |    6 +-
 include/linux/maple_tree.h                  |  356 +++---
 include/linux/mm_types.h                    |    3 +-
 lib/maple_tree.c                            | 1096 +++++++++++++------
 lib/test_maple_tree.c                       |  218 ++--
 mm/internal.h                               |   10 +-
 mm/shmem.c                                  |    4 +-
 tools/include/linux/spinlock.h              |    1 +
 tools/testing/radix-tree/linux/maple_tree.h |    2 +-
 tools/testing/radix-tree/maple.c            |  390 ++++++-
 11 files changed, 1564 insertions(+), 651 deletions(-)

-- 
2.39.2

