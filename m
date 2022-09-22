Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABDD5E6CD3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 22:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017D10E137;
	Thu, 22 Sep 2022 20:11:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7B810E052;
 Thu, 22 Sep 2022 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663877485; x=1695413485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3dCil1uDg8Zbf+p1bhu0QWZoNjATdjAwMwKD9jQ7NYs=;
 b=AgoFDfsDTBzEgAPgbzE7CEifPck1Mj9k6YyD7EFiBNGcbKWzpqpDkWQp
 dJpcYkwO4FpofesbGrywauw+TaznTy/RWkzrUdnYjkS0TV1yH9YS6L/lU
 mQiPxHmHVa+yXCnvlytHCC5g0MYqXxxHDwfQVk5sqM/Dpi8xhGTNSHQNs
 uoNuSVmYXGGiJfeWC039EFMb+OM7rZaY0wgSEVr6XAZApncITjbgxfywM
 BsZet61/Xu7H4DlcUANB6CZLUmoQ9H9Q1bWwosCsGKGBirEjcDroAtoUD
 NsoDJ5qA3KKDHbqNHd51rLege2cS4vScY4+ZTewt13b40bMc7YyRYeW22 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280787663"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280787663"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 13:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="795245785"
Received: from relo-linux-5.jf.intel.com ([10.165.21.188])
 by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 13:11:24 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/1] DG2 fix for CCS starvation
Date: Thu, 22 Sep 2022 13:12:08 -0700
Message-Id: <20220922201209.1446343-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
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

Enable CCS/RCS arbitration scheduling in GuC to prevent CCS starvation
on DG2.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/guc: Enable compute scheduling on DG2

 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 22 +++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 93 +++++++++++++++++++
 4 files changed, 124 insertions(+), 1 deletion(-)

-- 
2.37.3

