Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C044EEEFA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9473B10E36B;
	Fri,  1 Apr 2022 14:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7BC10E345;
 Fri,  1 Apr 2022 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648822329; x=1680358329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iMoWD9PpxsfTL+AaZhJu30qI0uulXaqHodL3nlsCGsQ=;
 b=DTP74xC8515Pja8SKeUFq1ZBq6cgTUBpCRrCZDchrkQzCV2qi8QG+Fww
 0e0SnyJLk7c3jYNfAS380PqVYMpaDzsKGiP5zokTYMQOERIReF1W+Un76
 dsS+tB/ITjLiiSjLL5kH2Q6UtjsXMJ2e9OMZWwUraDhmJD1sNSjLTCv2L
 Y/a3vk59vQlt4W7HZyBLOawbHu2DBWKyPqHdKUiJcAUgqiJHFW0wwx9NO
 Y/FkpYHAvLqf4VGWBDW3K2XXZyBozmN/jUjgnAD/BJerSGJKoZudNC5yp
 oJQzC/W5uE4sl0uYCiaPQYEiSdh+fKUYu1w30NPcBfxuanaJT0v3LhSE3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="320832818"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="320832818"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:12:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="586864877"
Received: from ewanhaye-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.217.32])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:12:07 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Per client GPU utilisation
Date: Fri,  1 Apr 2022 15:11:52 +0100
Message-Id: <20220401141155.3122817-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Only first three patches for review purposes (first stage) - adding the test and
intel_gpu_top support.

Tvrtko Ursulin (3):
  lib: Helper library for parsing i915 fdinfo output
  tests/i915/drm_fdinfo: Basic and functional tests for GPU busyness
    exported via fdinfo
  intel-gpu-top: Add support for per client stats

 lib/igt_drm_fdinfo.c    | 188 ++++++++++
 lib/igt_drm_fdinfo.h    |  69 ++++
 lib/meson.build         |   7 +
 man/intel_gpu_top.rst   |   4 +
 tests/i915/drm_fdinfo.c | 557 +++++++++++++++++++++++++++
 tests/meson.build       |   8 +
 tools/intel_gpu_top.c   | 806 +++++++++++++++++++++++++++++++++++++++-
 tools/meson.build       |   2 +-
 8 files changed, 1638 insertions(+), 3 deletions(-)
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h
 create mode 100644 tests/i915/drm_fdinfo.c

-- 
2.32.0

