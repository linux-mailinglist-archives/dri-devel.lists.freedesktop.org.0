Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B742AF5A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 23:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D116E9E8;
	Tue, 12 Oct 2021 21:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279A6E57A;
 Tue, 12 Oct 2021 21:52:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="288152671"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="288152671"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 14:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="659280302"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 12 Oct 2021 14:52:51 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1maPha-0003wK-Vh; Tue, 12 Oct 2021 21:52:50 +0000
Date: Wed, 13 Oct 2021 05:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kasan-dev@googlegroups.com,
 Vlastimil Babka <vbabka@suse.cz>,
 Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>,
 Vijayanand Jitta <vjitta@codeaurora.org>
Subject: [RFC PATCH] lib/stackdepot: stack_depot_init_mutex can be static
Message-ID: <20211012215233.GA41525@800d2291961c>
References: <20211012090621.1357-1-vbabka@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012090621.1357-1-vbabka@suse.cz>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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

lib/stackdepot.c:150:1: warning: symbol 'stack_depot_init_mutex' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 stackdepot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 9bb5333bf02f61..89b67aef9b320b 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -147,7 +147,7 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
 #define STACK_HASH_MASK (STACK_HASH_SIZE - 1)
 #define STACK_HASH_SEED 0x9747b28c
 
-DEFINE_MUTEX(stack_depot_init_mutex);
+static DEFINE_MUTEX(stack_depot_init_mutex);
 static bool stack_depot_disable;
 static struct stack_record **stack_table;
 
