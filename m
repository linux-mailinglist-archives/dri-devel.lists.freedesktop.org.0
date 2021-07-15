Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A83C9C7E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 12:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BCA6E7F1;
	Thu, 15 Jul 2021 10:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CBD6E7DD;
 Thu, 15 Jul 2021 10:16:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190198900"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="190198900"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 03:16:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="460341167"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.240.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 03:15:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Some DG1 uAPI cleanup
Date: Thu, 15 Jul 2021 11:15:32 +0100
Message-Id: <20210715101536.2606307-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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

Test-with: 20210715100932.2605648-1-matthew.auld@intel.com

Chris Wilson (1):
  drm/i915/userptr: Probe existence of backing struct pages upon
    creation

Matthew Auld (3):
  drm/i915/uapi: reject caching ioctls for discrete
  drm/i915/uapi: convert drm_i915_gem_userptr to kernel doc
  drm/i915/uapi: reject set_domain for discrete

 drivers/gpu/drm/i915/gem/i915_gem_domain.c  |   9 ++
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  40 +++++++-
 drivers/gpu/drm/i915/i915_getparam.c        |   3 +
 include/uapi/drm/i915_drm.h                 | 106 +++++++++++++++++++-
 4 files changed, 156 insertions(+), 2 deletions(-)

-- 
2.26.3

