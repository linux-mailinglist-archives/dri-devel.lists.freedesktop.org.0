Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F350E58E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 18:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4B210E42C;
	Mon, 25 Apr 2022 16:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7765B10E57C;
 Mon, 25 Apr 2022 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650903814; x=1682439814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/sbj5khoikZ+ZQyeCjOqQESTNkHlcE0dBLV3KnEpl54=;
 b=dLLVAX05cqClz8J0eRNyE6EVkyog/LBX0eHaTeKEgDPIpIiIGKrbHyc2
 MxwFM01zgclXDSOfRf2SBqhBXWLTLGeIbBMOn48XLe1Pgm9eJIWU61G/+
 SXKRMaz8XjbqsbT4wVlntqQaaen84A/Ni3yjj9ANnsVcX7IZzzuUYx+jX
 AIJR0DYMgskPo5E8M8gAttCOsa7uU97y4xRg1CRehJxpvCVzD9Wmjx7EV
 iXTbua831DT+h5Zq3GmQW4C2v5j/ev/KBRH0ofiuNW2w/Fi41M/pSrPxW
 BZuIZsegQo0bUFZFbLH5DddYdwJ/vrkeoCgw2SP7yTbMSyDtIo4uGuYJl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290434337"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="290434337"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:23:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="677290951"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:23:31 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/4] Flat-CCS eviction enhancements
Date: Mon, 25 Apr 2022 21:54:26 +0530
Message-Id: <20220425162430.28844-1-ramalingam.c@intel.com>
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

Flat-CCS eviction enhancements

v2: Correcting the memory residency requirement for flat-ccs capability
    [Thomas]

Ramalingam C (4):
  drm/i915/gt: GEM_BUG_ON unexpected NULL at scatterlist walking
  drm/i915/gt: optimize the ccs_sz calculation per chunk
  drm/i915/gt: Document the eviction of the Flat-CCS objects
  uapi/drm/i915: Document memory residency and Flat-CCS capability of
    obj

 drivers/gpu/drm/i915/gt/intel_migrate.c | 65 ++++++++++++-------------
 include/uapi/drm/i915_drm.h             | 18 +++++++
 2 files changed, 50 insertions(+), 33 deletions(-)

-- 
2.20.1

