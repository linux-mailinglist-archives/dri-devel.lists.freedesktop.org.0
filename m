Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9769E79C291
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0848510E377;
	Tue, 12 Sep 2023 02:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6E510E30C;
 Tue, 12 Sep 2023 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485042; x=1726021042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=poWUoVtZTpgHeWd6vbfRADoJQVDWuAqRhWq3UUJ/dxc=;
 b=CZ8YIB+bKP+ys3mlwhRlFWO8k0o8l1rbxyyO9dvaKRxRkFHDX8cFA2Bp
 jUJm3w/6V7x3mEdiJOXK1wr5P4IIES2jRveEnGmyCLOsM/6PzvTEsL8a1
 8Wozc32ohN+MUUgx3GqrfgrR9Mj6p+mFRH5Ts6yGjzT++RksWCXaIoJ4Z
 8XBNe+7bPYrV7dEMzt4ZuqdQGkdOV2l2iPj04xnNRjowUtUEOz9AF1n4H
 lFlNRy15L4Z+DzFcVkztGqZnxde2/ibHGXkjaO5Lz5TQd/OHjb3geoLhK
 O8Tjx5Qa9v2z9Olx9z6JEnC17EIaZV01foHelYiLLCmYv/P/4wazS2lzf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172615"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255593"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255593"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 13/13] drm/sched: Update maintainers of GPU scheduler
Date: Mon, 11 Sep 2023 19:16:15 -0700
Message-Id: <20230912021615.2086698-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
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
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Matthew Brost to maintainers of GPU scheduler

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1035fdcaa97..38d96077b35d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7131,6 +7131,7 @@ F:	drivers/gpu/drm/xlnx/
 
 DRM GPU SCHEDULER
 M:	Luben Tuikov <luben.tuikov@amd.com>
+M:	Matthew Brost <matthew.brost@intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.34.1

