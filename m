Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9477392322
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 01:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936A6EDE7;
	Wed, 26 May 2021 23:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B336E193;
 Wed, 26 May 2021 23:16:29 +0000 (UTC)
IronPort-SDR: HrjYXKIEKC8HQH2v2/Gc7KK80vn3yC2RpbJw+wxBdhFRu1IB1FVVYM/M8msOZPY7s/sBp4L8Tj
 ctrOVqHzwlgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="288190210"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="288190210"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:16:06 -0700
IronPort-SDR: NMB+GV6IbR69Rih4K4Iih2X9AhvE7S3jPqvX4BcnSJ2GyF2/eiMmG+XlZ8M4/pq1eASj4aS0jo
 s7RA3pllhHtQ==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477184853"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:16:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 0/2] GuC submission / DRM scheduler integration plan + new
 uAPI
Date: Wed, 26 May 2021 16:33:55 -0700
Message-Id: <20210526233357.9165-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: matthew.brost@intel.com, tony.ye@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, carl.zhang@intel.com,
 jason.ekstrand@intel.com, michal.mrozek@intel.com, jon.bloomfield@intel.com,
 mesa-dev@lists.freedesktop.org, daniel.vetter@intel.com,
 christian.koenig@amd.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject and patches say it all.

v2: Address comments, patches have details of changes
v3: Address comments, patches have details of changes

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/doc/rfc: i915 GuC submission / DRM scheduler
  drm/doc/rfc: i915 new parallel submission uAPI plan

 Documentation/gpu/rfc/i915_parallel_execbuf.h | 145 ++++++++++++++++++
 Documentation/gpu/rfc/i915_scheduler.rst      | 136 ++++++++++++++++
 Documentation/gpu/rfc/index.rst               |   4 +
 3 files changed, 285 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst

-- 
2.28.0

