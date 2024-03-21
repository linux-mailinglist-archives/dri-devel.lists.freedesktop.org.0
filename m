Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008488570A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 11:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A90910E563;
	Thu, 21 Mar 2024 10:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXKj56xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086D10E563;
 Thu, 21 Mar 2024 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015530; x=1742551530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+HQS0s1YxBdiJOlTvFxsbvI9Au+Y7hOU5u8pjBmPvRo=;
 b=fXKj56xg7s7XWnmFhuuR9flePOh5EU7T3vXZJo/Ne2OK+q8jJU8HQHUq
 cU0ARE/tHOhsTQyC8/7+rDXO+E0gdwKGHr4uhAl9ncFDy3UR0Awp5fEwT
 dKuROHX/r+srzXa+2HxSHe/HLii9Y89vJhJf7Z+MYJY5VzgI+rPENfPWj
 kyHlWWlA2VYzKr6ELlDwlSjv3sx6j+FHAjJrNwapIsgU2xL29Jee641CV
 qkTMCSldSya5fD5mlcxez9HpA49pzPUNxZDJSdzf98skuYoeTIH8xfcWJ
 kdE/to1KRX5TXISNDwmryODUeBSXNNtconQ7qXkfJgr+XKYbSXhQs/FAl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="8945020"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="8945020"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19155096"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 0/4] drm/edid & drm/i915: vendor and product id logging
 improvements
Date: Thu, 21 Mar 2024 12:05:08 +0200
Message-Id: <cover.1711015462.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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


Jani Nikula (4):
  drm/edid: add drm_edid_get_product_id()
  drm/edid: add drm_edid_print_product_id()
  drm/i915/bios: switch to struct drm_edid and struct
    drm_edid_product_id
  drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()

 drivers/gpu/drm/drm_edid.c                | 50 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.c | 49 ++++++++++------------
 include/drm/drm_edid.h                    | 28 ++++++++++---
 3 files changed, 94 insertions(+), 33 deletions(-)

-- 
2.39.2

