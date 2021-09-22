Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91804143E2
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DDB6EB10;
	Wed, 22 Sep 2021 08:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAAE6EB10;
 Wed, 22 Sep 2021 08:38:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210784053"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="210784053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:38:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="613315534"
Received: from vkubarev-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:38:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com
Subject: [PATCH 0/3] DG1 Lockdep warning fixes
Date: Wed, 22 Sep 2021 10:38:04 +0200
Message-Id: <20210922083807.888206-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of recent commits introduced lockdep warnings, breaking some
DG1 BAT tests.

Two fixes for those and one HAX patch making CI behave better.

Kai Vehmanen (1):
  HAX: component: do not leave master devres group open after bind

Thomas Hellström (2):
  drm/i915/gem: Fix a lockdep warning the __i915_gem_is_lmem() function
  drm/i915/ttm: Fix lockdep warning in __i915_gem_free_object()

 drivers/base/component.c                 | 5 +++--
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c  | 4 ++++
 3 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.31.1

