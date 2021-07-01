Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A63B9465
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 17:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AB56EB4B;
	Thu,  1 Jul 2021 15:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4159A6EB46;
 Thu,  1 Jul 2021 15:56:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="294194385"
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="294194385"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 08:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,314,1616482800"; d="scan'208";a="455635570"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 01 Jul 2021 08:56:02 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.146.9])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 161Fu0L7001058; Thu, 1 Jul 2021 16:56:01 +0100
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915/guc: Improve CTB error handling
Date: Thu,  1 Jul 2021 17:55:09 +0200
Message-Id: <20210701155513.2024-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was a gap in handling MMIO result from CTB (de)registration
and while fixing it improve some other error reports.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Michal Wajdeczko (4):
  drm/i915/guc: Verify result from CTB (de)register action
  drm/i915/guc: Print error name on CTB (de)registration failure
  drm/i915/guc: Print error name on CTB send failure
  drm/i915/guc: Move and improve error message for missed CTB reply

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 30 ++++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

-- 
2.25.1

