Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8897038833A
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 01:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F736E0EB;
	Tue, 18 May 2021 23:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E6A6E064;
 Tue, 18 May 2021 23:40:40 +0000 (UTC)
IronPort-SDR: 36YgmpwQQaNFoxoMQO/xCB2EqjcUjDd2Bm+xyLnh8gN4zudsy1cAoL/4TBZ2SQpoCKRJeMj7nM
 ojpPViATBRqw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="286378179"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="286378179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 16:40:39 -0700
IronPort-SDR: 6n32raLQPA/jXBS9N69oJs7YdZj/VfhmaKbrskMRgD0L1eHJN4pLSoNy3wjja8re12uO6od8Eh
 HwDdGTeVQNRg==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439698310"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 16:40:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC 0/2] GuC submission / DRM scheduler integration plan + new uAPI
Date: Tue, 18 May 2021 16:58:28 -0700
Message-Id: <20210518235830.133834-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tony.ye@intel.com,
	tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
	jason.ekstrand@intel.com, michal.mrozek@intel.com,
	jon.bloomfield@intel.com, karl@freedesktop.org,
	mesa-dev@lists.freedesktop.org, daniel.vetter@intel.com,
	christian.koenig@amd.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Subject and patches say it all.

v2: Address comments, patches has details of changes

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/doc/rfc: i915 GuC submission / DRM scheduler
  drm/doc/rfc: i915 new parallel submission uAPI plan

 Documentation/gpu/rfc/i915_parallel_execbuf.h | 144 ++++++++++++++++++
 Documentation/gpu/rfc/i915_scheduler.rst      | 136 +++++++++++++++++
 Documentation/gpu/rfc/index.rst               |   4 +
 3 files changed, 284 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_parallel_execbuf.h
 create mode 100644 Documentation/gpu/rfc/i915_scheduler.rst

-- 
2.28.0

