Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F24A4C99
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B97510E168;
	Mon, 31 Jan 2022 16:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EDE10E168;
 Mon, 31 Jan 2022 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643648339; x=1675184339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U/LIkl/D1gt+EKUx7JSY4igyh4qD19xaMhI769G6x3U=;
 b=HcAOA1PS8rMIZZX2axF8XHUs9VkKUOAPNzGhJfQeGl4+jSbAWY0ceP5U
 ZdvflT8GiXj1dCzTSRuPEzXU2bd9Cy6CzYr+zMv719sr58NaSV2QQdQpc
 D8huqY3t58yJkgWthCXTngqSTWl2xJq4IWnT6hAx6L9hxYxraXqBZ/JXB
 XCsHVlCi2GKepdc9dqEqDwjy3maeUuV+vnVsy3wl7zzkhNnyYgv3Alvuo
 EkiPokFHo5H2vm4/QLPLDkGT3vQIihr0IViblqm3veFH13fLiRqBNlSUk
 2Ico1EKtxnGJtnlg5AAgDUbmBOxN73TblzxYRPbA3+IoTQgfYMhwombta A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247275431"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="247275431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="496986477"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/i915: Fix header test and log spam on !x86
Date: Mon, 31 Jan 2022 08:59:23 -0800
Message-Id: <20220131165926.3230642-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
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

v3: No changes, just submit to the right mailing list.

Lucas De Marchi (3):
  drm: Stop spamming log with drm_cache message
  drm/i915: Fix header test for !CONFIG_X86
  drm/i915: Do not spam log with missing arch support

 drivers/gpu/drm/drm_cache.c    | 9 +++------
 drivers/gpu/drm/i915/i915_mm.h | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.35.0

