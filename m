Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91859BCFF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 11:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBAE10E63B;
	Mon, 22 Aug 2022 09:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6251810E25D;
 Mon, 22 Aug 2022 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661161199; x=1692697199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ospM93ePcfud/lj5mtbp+UiZhWFMFJJRWTy2sraUS+4=;
 b=kJ9votHOIKLiSD/wuGoSJ3Zsmng65gfb3D/iB12qDIXTH+h5A8LiqApA
 sjRTTWwneJEcb+bbwYhSJ0+fXAyti6i5vDPPR5UTlUY5Ll1nzYXx3BBML
 bq6qkV6xubp2Ymx0aU9ij4569pp3pwO9ik4FvZYWCiQcKcRcHLugU4aic
 nXSxqtCdRo804uApxrmX2yVUumjIQ8WES8kKXnStY49FRsqQQKaSSEjsL
 q9eQVqM2kf/du5WZTYJ4YYJzxq0sXGWT6ya4xD7hEZXsM84ZqKG0lbxgq
 pcGpp5KP8h3gkcuueEXES6Mc64y1bEbzc127SvNXyiQFK3c2977IahmsV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="379661152"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="379661152"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 02:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="677147057"
Received: from unknown (HELO slisovsk-Lenovo-ideapad-720S-13IKB.fi.intel.com)
 ([10.237.72.65])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2022 02:39:51 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] Add DP MST DSC support to i915
Date: Mon, 22 Aug 2022 12:40:35 +0300
Message-Id: <20220822094037.15483-1-stanislav.lisovskiy@intel.com>
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

 drivers/gpu/drm/i915/display/intel_dp.c     |  73 ++++-----
 drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 157 ++++++++++++++++++++
 include/drm/display/drm_dp.h                |  10 +-
 4 files changed, 214 insertions(+), 43 deletions(-)

-- 
2.24.1.485.gad05a3d8e5

