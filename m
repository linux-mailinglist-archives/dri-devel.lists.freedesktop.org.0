Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4257058E887
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE349F022A;
	Wed, 10 Aug 2022 08:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDADAF01D2;
 Wed, 10 Aug 2022 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660119434; x=1691655434;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JU9YSCT7Q/8JbqS5EUVZ6Arad9vT3Bg3RVR1w9cDOqk=;
 b=MaxXujK668MUV5YGgmmh9PMol5WvMLvdOhB2mcv5vZsM8k+5GfVIX++J
 kW3Bp1uBxzH9Hw+S909fp0T7EPRJoU7XMWvPYxTQL69Hv1UXeJEJ2lhEm
 FBYTwoXSi6Dqio90fZEWFiacjMVJFsIEUIp9vvV8inqo9FH+VhlJX9H4c
 JkQ15OTSd3N5JbTC8hkKCzDFsJZbAcjDCxZiMJa7B6zGOkler+mnzrudf
 Ic2qd+rreUDX5tuGc3ROJI4ein9wFQqzvewoNULgRrtv0Vnjnav9xewcA
 Jed58SxhUHz2sm8hdB/J2wQGcjMEDgAkDbDRa7q3tjoLh3/OExP/30s3U g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316974616"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="316974616"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 01:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; d="scan'208";a="673211318"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2022 01:17:10 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Add DP MST DSC support to i915
Date: Wed, 10 Aug 2022 11:17:51 +0300
Message-Id: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.24.1.485.gad05a3d8e5
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
Cc: Stanislav.Lisovskiy@intel.com, jani.nikula@intel.com,
 manasi.d.navare@intel.com, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have only DSC support for DP SST.

Stanislav Lisovskiy (2):
  drm: Add missing DP DSC extended capability definitions.
  drm/i915: Add DSC support to MST path

 drivers/gpu/drm/i915/display/intel_dp.c     |  76 +++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 145 ++++++++++++++++++++
 include/drm/display/drm_dp.h                |  10 +-
 4 files changed, 203 insertions(+), 45 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

