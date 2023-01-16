Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57766BDB0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5422110E3E7;
	Mon, 16 Jan 2023 12:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA33510E3E7;
 Mon, 16 Jan 2023 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673871543; x=1705407543;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=39CPAZaqtTB2Lpi30cMk7MCvV0CL8VEFJz+PXZpiAy0=;
 b=QTrAmmUBuonySsHYVNxEiey6UIuU7Nphp12KelDQpylNR6yQhEEurBFg
 SAFWohKHXqFqOhmKmYp32LeQuO0CBO+uqdjEN7+BMgfciY497XctBUN3W
 r2rr6tnOcuvXhYp8LjQexQoCHjAlbDpBzwssPintyqdMtdpmpdby6wRtd
 aoVoH0lDomfsoLl7iToWXjazphNIfiP11Cr7AWG1qoZKLJGTI7AdIDSTU
 MoHbVfBeDdoCSfKfN+7pmSkiykIKPbEWxbLcN/ZNsYPbfRV3jz1iXdBue
 9Y7fyhTa5csSQXEJbJu723hgo0+IcsCapVC9h8WrTSOmzfYKHdb9QdTqE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="312302666"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="312302666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:18:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="832822549"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; d="scan'208";a="832822549"
Received: from amakarev-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.13.137])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:18:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Use designated initializers for struct
 pci_device_id init
Date: Mon, 16 Jan 2023 14:18:18 +0200
Message-Id: <cover.1673871359.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use designated initializers for struct pci_device_id init.

Jani Nikula (3):
  drm/i915/pciids: add common INTEL_VGA_DEVICE_INIT macro
  drm/i915/pciids: use designated initializers for struct pci_device_id
  drm/i915: define INTEL_VGA_DEVICE_INIT() for subplatform init

 drivers/gpu/drm/i915/intel_device_info.c |  4 +--
 include/drm/i915_pciids.h                | 43 +++++++++++++-----------
 2 files changed, 26 insertions(+), 21 deletions(-)

-- 
2.34.1

