Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7536E2A0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 02:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DC86ECD1;
	Thu, 29 Apr 2021 00:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890DD6ECD0;
 Thu, 29 Apr 2021 00:34:11 +0000 (UTC)
IronPort-SDR: 57wqiUmuNC3jURa+0EnepbNlZVYhUmOQZrUDItGA54iBBzjpEY2Px3KVxsF0VSm3RhggWzcDRX
 O8Y2HJBnOB4g==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="196444287"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="196444287"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 17:34:11 -0700
IronPort-SDR: IUv+rbpbJDNYODYlUis+F60xYgqzsmOhULvp+/rkQHHJv+TOg+mz1M8IWXZD1WZx0v0S3TCRWz
 0Xevc30+9WdA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="466135260"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 17:34:10 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] Add support for querying engine cycles
Date: Wed, 28 Apr 2021 17:34:09 -0700
Message-Id: <20210429003410.69754-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, jason@jlekstrand.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just a refresh of the earlier patch along with cover letter for the IGT
testing. The query provides the engine cs cycles counter.

v2: Use GRAPHICS_VER() instead of IG_GEN()
v3: Add R-b to the patch
v4: Split cpu timestamp array into timestamp and delta for cleaner API

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Test-with: 20210429002959.69473-1-umesh.nerlige.ramappa@intel.com

Umesh Nerlige Ramappa (1):
  i915/query: Correlate engine and cpu timestamps with better accuracy

 drivers/gpu/drm/i915/i915_query.c | 148 ++++++++++++++++++++++++++++++
 include/uapi/drm/i915_drm.h       |  52 +++++++++++
 2 files changed, 200 insertions(+)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
