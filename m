Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CB750C07
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9C710E565;
	Wed, 12 Jul 2023 15:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D378B10E54C;
 Wed, 12 Jul 2023 14:45:25 +0000 (UTC)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R1KgR32ywzMqVk;
 Wed, 12 Jul 2023 22:21:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 12 Jul 2023 22:25:11 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/5] mm: convert to vma_is_heap/stack()
Date: Wed, 12 Jul 2023 22:38:26 +0800
Message-ID: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 12 Jul 2023 15:14:33 +0000
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, selinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vma_is_stack() and vma_is_heap() helper and use them to
simplify code.

Kefeng Wang (5):
  mm: introduce vma_is_stack() and vma_is_heap()
  mm: use vma_is_stack() and vma_is_heap()
  drm/amdkfd: use vma_is_stack() and vma_is_heap()
  selinux: use vma_is_stack() and vma_is_heap()
  perf/core: use vma_is_stack() and vma_is_heap()

 drivers/gpu/drm/amd/amdkfd/kfd_svm.c |  5 +----
 fs/proc/task_mmu.c                   | 24 ++++--------------------
 fs/proc/task_nommu.c                 | 15 +--------------
 include/linux/mm.h                   | 12 ++++++++++++
 kernel/events/core.c                 | 22 +++++++---------------
 security/selinux/hooks.c             |  7 ++-----
 6 files changed, 27 insertions(+), 58 deletions(-)

-- 
2.41.0

