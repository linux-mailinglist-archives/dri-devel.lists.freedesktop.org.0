Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B80807A24
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 22:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E3910E0BE;
	Wed,  6 Dec 2023 21:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609DB10E0BE;
 Wed,  6 Dec 2023 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701897003; x=1733433003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oU31RW4rgebLKuVptbqRzsM8vbadGLZ1RTklbpx8O9M=;
 b=PsdLc/UZo0pwFIpevMJq/F6ulYzUfWiTpKREhJJTSl1CkyTF5V4VIKJw
 PpJtICIRj+Co1BBzz6HxAf3nQFFXY+n8jGAVg0HrMRS/DEX8XzuTmd7BM
 yxG6rEznGLtPTUtlttiTHB+4/NMR5kQ3dnDVLptLlhGZZvcngZfhrYLa8
 9pUgqt/ROYOsFJLUQYl0EPgRceXbsWNotohJ5lqr+vAXcTV4gB3T2DHq5
 UydlmVmrf3ES3TzAMjg+cdDUtJkD/q3MIftXvRt1XqIcOg5orgVs3Cymu
 MBP04uuPq9rMQEAQFy7B4kv/HhskkZ6qBQqr8f31gsJGW1mkdf7rtMW2Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458453123"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="458453123"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="805771301"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="805771301"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 13:09:59 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND AGAIN v2 0/2] Add drm_dbg_ratelimited()
Date: Wed,  6 Dec 2023 22:09:46 +0100
Message-ID: <20231206210948.106238-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the second time I am resending this series in its v2. It
has been reviewd, acked, blessed, discussed, rectified, assessed,
authorized, validated, glorified, praised, demanded, approved,
and yet, I don't understand why no one is merging it.

Thanks,
Andi

v2:
pick the right patch with the following changes:
 - add more r-b's
 - add a patch 2 where the drm_dbg_ratelimited is actually used.

Nirmoy Das (2):
  drm/print: Add drm_dbg_ratelimited
  drm/i915: Ratelimit debug log in vm_fault_ttm

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
 include/drm/drm_print.h                 | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0

