Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A53EB430
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 12:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F826E5B6;
	Fri, 13 Aug 2021 10:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B8E6E5B4;
 Fri, 13 Aug 2021 10:43:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="195126053"
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="195126053"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:43:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,318,1620716400"; d="scan'208";a="517985169"
Received: from cgearing-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.226])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2021 03:43:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/4] drm/dp: add some defines and prep for DP 2.0
Date: Fri, 13 Aug 2021 13:43:18 +0300
Message-Id: <cover.1628851334.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'll probably want to merge these to drm-intel-next and drm-misc-next
via a topic branch.

Jani Nikula (4):
  drm/dp: add DP 2.0 UHBR link rate and bw code conversions
  drm/dp: use more of the extended receiver cap
  drm/dp: add LTTPR DP 2.0 DPCD addresses
  drm/dp: add helper for extracting adjust 128b/132b TX FFE preset

 drivers/gpu/drm/drm_dp_helper.c | 42 +++++++++++++++++++++++++++++----
 include/drm/drm_dp_helper.h     |  6 +++++
 2 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.20.1

