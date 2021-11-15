Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97C4501AE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8B6EC13;
	Mon, 15 Nov 2021 09:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686A86EC05;
 Mon, 15 Nov 2021 09:50:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="232133757"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
 d="scan'208,223";a="232133757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; 
 d="scan'208,223";a="535446914"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 01:50:19 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [i-g-t 00/14] Add IGT support for plane color management
Date: Mon, 15 Nov 2021 15:17:45 +0530
Message-Id: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From the Plane Color Management feature design, userspace can
take the smart blending decisions based on hardware supported
plane color features to obtain an accurate color profile.

These IGT patches extend the existing pipe color management
tests to the plane level.

Kernel implementation:
https://patchwork.freedesktop.org/series/90825/

Bhanuprakash Modem (11):
  HAX: Get uapi headers to compile the IGT
  lib/igt_kms: Add plane color mgmt properties
  kms_color_helper: Add helper functions for plane color mgmt
  tests/kms_color: New subtests for Plane gamma
  tests/kms_color: New subtests for Plane degamma
  tests/kms_color: New subtests for Plane CTM
  tests/kms_color: New negative tests for plane level color mgmt
  tests/kms_color_chamelium: New subtests for Plane gamma
  tests/kms_color_chamelium: New subtests for Plane degamma
  tests/kms_color_chamelium: New subtests for Plane CTM
  tests/kms_color_chamelium: Extended IGT tests to support logarithmic
    gamma mode

Mukunda Pramodh Kumar (3):
  lib/igt_kms: Add pipe color mgmt properties
  kms_color_helper: Add helper functions to support logarithmic gamma
    mode
  tests/kms_color: Extended IGT tests to support logarithmic gamma mode

 include/drm-uapi/drm.h      |  10 +
 include/drm-uapi/drm_mode.h |  28 ++
 lib/igt_kms.c               |   6 +
 lib/igt_kms.h               |   6 +
 tests/kms_color.c           | 674 +++++++++++++++++++++++++++++++++++-
 tests/kms_color_chamelium.c | 588 ++++++++++++++++++++++++++++++-
 tests/kms_color_helper.c    | 300 ++++++++++++++++
 tests/kms_color_helper.h    |  45 +++
 8 files changed, 1648 insertions(+), 9 deletions(-)

--
2.32.0

