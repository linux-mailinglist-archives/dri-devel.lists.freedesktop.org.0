Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B281509EB1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838A410EA76;
	Thu, 21 Apr 2022 11:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F86110EA76;
 Thu, 21 Apr 2022 11:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650541038; x=1682077038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JiaQJu2b93LmGiZxk4M0rgVskgXq00oLWSnXX+NeXAE=;
 b=fZWoyHJjNL9qScHnH4EDUWsyCcSodCY6VVpLZ6ph+ZOafR6da8gVc55B
 YQ/M0lafrq29Ge585Vj3YS4aBqowOkibQleLoFOTfbwLbS+/uS782JafC
 +yXMA1qCHv1L1izE1mGQ/xTOrSja4UM5tJ6oQYRT5KZBDApgIS56rpYlQ
 H9R4JMK46zPMZWnMeWH1n7lzrEQEEC5pvCYhW4wg6BVVMZAa6MC1lKWYA
 xQ2KpfHxuAwh5AULNtD3ebTnYq4/B4QwQqirwofgoZwgwnRzc2uBDfZQ0
 PqTIXehlOQJ96ZlxcPKq3F7ExqvGxs2vFue18a+9pGUGE1vUX4jvdPo4e g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324766771"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324766771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="670543564"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:01 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] Flat-CCS eviction enhancements
Date: Thu, 21 Apr 2022 17:07:57 +0530
Message-Id: <20220421113757.30745-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flat-CCS eviction enhancements.

Ramalingam C (4):
  drm/i915/gt: GEM_BUG_ON unexpected NULL at scatterlist walking
  drm/i915/gt: optimize the ccs_sz calculation per chunk
  drm/i915/gt: Extend doc on Flat-CCS obj eviction
  uapi/drm/i915: Update the placement list impact on obj residency

 drivers/gpu/drm/i915/gt/intel_migrate.c | 78 ++++++++++++++-----------
 include/uapi/drm/i915_drm.h             | 14 +++++
 2 files changed, 59 insertions(+), 33 deletions(-)

-- 
2.20.1

