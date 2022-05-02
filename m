Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015FF517171
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7510EA15;
	Mon,  2 May 2022 14:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2B810EA15;
 Mon,  2 May 2022 14:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651501517; x=1683037517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZiOtmQcHOa/f1CmMlZNaF+9S7wOqdgOpULtocjYhfrc=;
 b=GbOFyZwdpo7dNRlVJk7RIlt/nQrKePk09ULt989mok+pl5mtw5YJuzga
 YmSabpcwBAfzjfMcyGRyAggW7sUb2yAyxV4R2m+N43kW6eTvvb5jKmgkb
 MLh+Htp6akQmndZtEGmZ8xcpuUsUgwsV4nuZdAFipEAWPQ0IbIkN428Gd
 mKz4BFiSjs5oO0TNVRXm6mhCV7ueqYRGSOBA3h/5292DXp448C4ptKdN5
 kXhFj/0+KFfld3pQLyJGuFeX+7WS/sN0C4pga2q55CaNYAFEoyM91f6V2
 WMzWXWWVD348xF9q6Pzs+YUPrcPS/iME1ENMK4Sinfv22czCtbKJu6uJQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292403393"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="292403393"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="516111133"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:25:15 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/3] Flat-CCS eviction enhancements
Date: Mon,  2 May 2022 19:56:15 +0530
Message-Id: <20220502142618.2704-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Flat-CCS eviction enhancements

v3:
  Incorporated the review suggestions [Matt]

Ramalingam C (3):
  drm/i915/gt: BUG_ON unexpected NULL at scatterlist walking
  drm/i915/gt: optimize the ccs_sz calculation per chunk
  drm/i915/gt: Document the eviction of the Flat-CCS objects

 drivers/gpu/drm/i915/gt/intel_migrate.c | 73 ++++++++++++++-----------
 1 file changed, 40 insertions(+), 33 deletions(-)

-- 
2.20.1

