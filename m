Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE45B7E0D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 02:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A63E10E79B;
	Wed, 14 Sep 2022 00:57:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0983C10E795;
 Wed, 14 Sep 2022 00:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663117071; x=1694653071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9eAeu/VmhOPawwOAZiRO8qBVIUzQgUQ12rFkknN4c+M=;
 b=dQZHtTtXAkIUejnigTzjWSchKdwVazv0V+jwQFk4H3AOZjIUwXQMCUCj
 UQHyFQ7kGhWACClilmVmsNTIPFqCiFsDQok3IqP1YYGwkcwSkByTI0Ha4
 Zm7Fa0FA/1XjpDnSClPC91jmbEie77QfCVErP57AbOz4j+Us18Yd6jIDM
 qE+LKO+4cLuslRCbsCCYyC5ylx4SzqbTBKU08lWSA6ULC6ZKxMMrkOsUn
 CKpDP6jOnUGx8hDrS50r57FVG99rqLHROA1Edf9L1X+n8RkIuZOujrnK8
 aCavL+wL9rhQSqBbRP1CEAAvbt+JJKleSQiJu8mwEBPXJOLC9sD6OBI17 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="384592447"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="384592447"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 17:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="792137898"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by orsmga005.jf.intel.com with ESMTP; 13 Sep 2022 17:57:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/1] Fix bug in version reduced firmware update
Date: Tue, 13 Sep 2022 17:58:20 -0700
Message-Id: <20220914005821.3702446-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The earlier patch to support firmware files with reduced versioning
introduced an issue with the firmware override module parameter. So
fix that.

v2: Also remove ANSI colour codes that accidentally got left in an
error message in the original patch.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/uc: Fix issues with overriding firmware files

 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

-- 
2.37.3

