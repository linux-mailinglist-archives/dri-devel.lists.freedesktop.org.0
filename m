Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C349C044
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 01:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B101010E3C7;
	Wed, 26 Jan 2022 00:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32F210E22C;
 Wed, 26 Jan 2022 00:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643157791; x=1674693791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/ahQgZkZ1yUl4Hmzl2l5t2cQAOW43ovo0MaNg0hOZfk=;
 b=aGPvzCbVbaaAaMemWOS8r1eIoR5+ACnE4jS9PTL5RLE61r2w+qLRC0V/
 PcftBCYVcLFOjvf3O50x6XVJexqKF/Z5mBMLz55CZnpkS4hbOuetrgrCG
 6m92PKAIm1maMApp2XJV7Chn1fd+AE/e/gAc1yQidNp50PrrradK7XKB+
 Sxm+zGNwRlf0e53dEJdRsdgQYk0HGEAGpm2zOMfAw5+8UL/4CpwAygFCi
 ez4eS/q2N9L77QCHjfGmC1wgAaR2S33DjyVg09I+1Abaugz7oIJU5sxzK
 u+GzLwHJhDBC4q451KSadXAyIy6C8S0aZ9CCKr1mLunw6IQ7t84UtSQTY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309766308"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="309766308"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 16:43:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="563241474"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 16:43:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Fix header test and log spam on !x86
Date: Tue, 25 Jan 2022 16:43:42 -0800
Message-Id: <20220126004345.1137674-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some minor fixes and changes to help porting i915 to arm64, or even
anything !x86.

Lucas De Marchi (3):
  drm: Stop spamming log with drm_cache message
  drm/i915: Do not spam log with missiing arch support
  drm/i915: Fix header test for !CONFIG_X86

 drivers/gpu/drm/drm_cache.c    | 3 ---
 drivers/gpu/drm/i915/i915_mm.h | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.34.1

