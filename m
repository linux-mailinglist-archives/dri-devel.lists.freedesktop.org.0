Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD38B511DB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6EC10E36D;
	Wed, 10 Sep 2025 08:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5OqBHvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2F510E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494530; x=1789030530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aqJOr9V7I6raiyEXCW1A38cVzfjSact4AOr8AQp+5xQ=;
 b=K5OqBHvV9QK3fMNUks1+pFVOYtv7FINHQ2kY1iRI6i6hQ0EzwQjsCay7
 DIbHHhh+g9KMerXjoEFac0W/lo1EMcBAp9TWjgn3p0wGPX5QTMjgkZqzv
 4+WTWgK+VvhZwqbzpveKz0/5GUHQxYF31Nbn8qzSjaqq+aC+2wKgHfg7k
 dyYC2wPUwLF2jjddy0pksYnkivKNkpo9fd0CulVQbdB+BbTe4lzV83neD
 hNmQhPsUE7eQqMbKuX6ESWnVrVt8xxTmGgHflUZeLpF6JO+1j0/5V7CCy
 wX4zmakXwhtspeEkGYoW5a9D4HTxnElEzeLIY92AEhy3ITkjS6lf6s1UC w==;
X-CSE-ConnectionGUID: tS76kLhCToSYhXWUPH7QYQ==
X-CSE-MsgGUID: GBPIXej1SieZl6xKWbZ3iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59019748"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59019748"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:55:30 -0700
X-CSE-ConnectionGUID: OANiJ8l5SWiz81Uyn6xKIg==
X-CSE-MsgGUID: EBAH9BUJSFemuHCWMGx1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173242947"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:55:28 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 maciej.falkowski@linux.intel.com, karol.wachowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Remove Jacek Lawrynowicz as intel_vpu maintainer
Date: Wed, 10 Sep 2025 10:55:25 +0200
Message-ID: <20250910085526.230458-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove myself from the intel_vpu driver maintainer list as I'm
moving to another company. Time to let someone else deal with
the NPU bugs while I pretend to know what I'm doing elsewhere!

Thanks to everyone for the great collaboration (and for putting up
with my creative interpretations of what "minor fixes" means).

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 402fe14091f15..8f8c91144cc2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7490,7 +7490,6 @@ F:	drivers/soc/ti/smartreflex.c
 F:	include/linux/power/smartreflex.h
 
 DRM ACCEL DRIVERS FOR INTEL VPU
-M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
 M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
 M:	Karol Wachowski <karol.wachowski@linux.intel.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.45.1

