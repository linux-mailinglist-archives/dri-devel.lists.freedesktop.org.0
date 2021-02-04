Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743430FBA2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ACD6EE33;
	Thu,  4 Feb 2021 18:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722946E09A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:35:59 +0000 (UTC)
IronPort-SDR: CP7Xib3d42wW50CEGqeKctqzOKJ5b32VuGhRIky80QVEIyXCHs+cabqGl2B/BQ7NgI763dfChr
 kEiJZeyA399w==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="180528982"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="180528982"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 10:35:58 -0800
IronPort-SDR: nn6HvKHl8/Jk0QPNFAoSRd+UBNokiCtW1QxfYBeUnRciVoOQ+sxhAr9ci0qDIBGcZsrJS5J2MX
 Gu2NlEdWe3SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="580383228"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga006.fm.intel.com with ESMTP; 04 Feb 2021 10:35:58 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core 0/3] Dma-buf related fixes
Date: Thu,  4 Feb 2021 10:50:48 -0800
Message-Id: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gal Pressman <galpress@amazon.com>,
 Ali Alnubani <alialnu@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes a few issues related to the dma-buf support. It consists
of three patches. The first patch fixes a compilation warning for 32-bit
builds. Patch 2 renames a function parameter and expands an abbreviation.
Patch 3 adds check for DRM headers.

Pull request at github: https://github.com/linux-rdma/rdma-core/pull/942

Jianxin Xiong (3):
  verbs: Fix gcc warnings when building for 32bit systems
  pyverbs,tests: Cosmetic improvements for dma-buf allocation routines
  configure: Add check for the presence of DRM headers

 CMakeLists.txt         |  7 +++++
 buildlib/Finddrm.cmake | 19 ++++++++++++
 buildlib/config.h.in   |  2 ++
 libibverbs/cmd_mr.c    |  2 +-
 libibverbs/verbs.c     |  2 +-
 pyverbs/dmabuf.pyx     | 12 ++++----
 pyverbs/dmabuf_alloc.c | 59 +++++++++++++++++++++++++++++++-------
 pyverbs/dmabuf_alloc.h |  2 +-
 pyverbs/mr.pyx         |  6 ++--
 tests/test_mr.py       | 78 +++++++++++++++++++++++++-------------------------
 10 files changed, 127 insertions(+), 62 deletions(-)
 create mode 100644 buildlib/Finddrm.cmake

-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
