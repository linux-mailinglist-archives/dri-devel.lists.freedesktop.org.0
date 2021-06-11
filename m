Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698B3A4B27
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 01:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523C66F3F1;
	Fri, 11 Jun 2021 23:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B726F3E4;
 Fri, 11 Jun 2021 23:22:54 +0000 (UTC)
IronPort-SDR: efd1RreefynMiJY2hj89y8lJnzZXy+M0Y/bnbbFul6fS9VAWOt6uqUYFA+v95zlCvf4+1E9AD7
 O8/6zCR1SC5g==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="203796915"
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="203796915"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 16:22:53 -0700
IronPort-SDR: /XAZUI8d8EbOUR5qng54mpcOC+m4EHfjIENr/uLtwXer/Zs982iO2q0B4qeO8mVwH2GeItEnpc
 o66MEdkiC1TQ==
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="638843374"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 16:22:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] GuC submission / DRM scheduler integration plan + new uAPI
Date: Fri, 11 Jun 2021 16:40:42 -0700
Message-Id: <20210611234044.853-1-matthew.brost@intel.com>
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
v4: Address comments, patches have details of changes

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/doc/rfc: i915 GuC submission / DRM scheduler
  drm/doc/rfc: i915 new parallel submission uAPI plan

 Documentation/gpu/rfc/i915_parallel_execbuf.h | 117 ++++++++++++++
 Documentation/gpu/rfc/i915_scheduler.rst      | 148 ++++++++++++++++++
 Documentation/gpu/rfc/index.rst               |   4 +
 3 files changed, 269 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst

-- 
2.28.0

