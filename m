Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA67A5919
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 07:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E4210E3B6;
	Tue, 19 Sep 2023 05:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480010E3B9;
 Tue, 19 Sep 2023 05:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695099706; x=1726635706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hokkMqBWd22VPksfbisYj6lGNWQVb0bhIpXczh/+jC8=;
 b=Nc2z6/xEFhsHDU9ldXZgs3/pqOX4tKdk3At8Rdbh7SLRTLHrRqwMOVRX
 1RTJ1OpEkqZHRRduFsYpxWpFJCLm7zuCxYTFA7P3vzkd71DReQdT3vLuU
 2E8H2Mqh4PEpOY7imH3Z0HO3+xdWW3zBgRAwQL7jCWxvfotThWEXTdBuC
 DVa9xvZo7mls2oYhek9BufaXz3QdYmEt2AbVMTx/bIclWiv9FGaUDgzYG
 w64l5h4ua+qqcTnGWw1U9tV4qFhOdJwZFx6qhZtg/52JDPkHNzJs9WtZr
 H7Gxu9VWbxc2ueeeKWNlHj3LtedoVEYFwnpjA+8WFUK16i3Sq2x0RKeI6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377163532"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="377163532"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775409087"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="775409087"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 22:01:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v4 10/10] drm/sched: Update maintainers of GPU scheduler
Date: Mon, 18 Sep 2023 22:01:55 -0700
Message-Id: <20230919050155.2647172-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919050155.2647172-1-matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, lina@asahilina.net,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Matthew Brost to maintainers of GPU scheduler

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60c2d97e427b..43c51d1abee5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7134,6 +7134,7 @@ F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
 M:	Luben Tuikov <luben.tuikov@amd.com>
+M:	Matthew Brost <matthew.brost@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.34.1

