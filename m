Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91DA10254
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5544D10E894;
	Tue, 14 Jan 2025 08:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVtyWAIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A9310E891
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736844282; x=1768380282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eg5nn/MSO+W8f7Ra6u7c2R3KW/EKyTFD0HX57IztWII=;
 b=OVtyWAIjcNGriQHIeqSBLqxmxjtykqR+kihZn+PDxlpwa7DXikrZH2AU
 cEbaDsfg4fLXelfUzjTwKaGbIwY3pguxN71PYFLv30/TzbjFuq9GwvDim
 ZU91hPAfKjmzIP/fU8QvAzrbDAy5PYDJrNhBkPHNW7XesCkHV63Pf/qid
 R8k63pLqf2/ghoWd0mG4de5I8syFVjrLjmHqyP4OJgFXR0NfQzZ0LbJft
 jEWxtw+hXRq+fJuAHTqGjW9MUrdo9yg55/5H1+loHxXhsh4jd9M+QDF1A
 13Yc+5PQ/soxx4Gt+DoZwtbZ0UCHIC42n+rkE2Hlv7AZS/DnHrDp7r/9f g==;
X-CSE-ConnectionGUID: ZHNyC2SfTf+4kt2UKan9zQ==
X-CSE-MsgGUID: fzkt2gHIT/W0Uq2albhFIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47711152"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="47711152"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:44:41 -0800
X-CSE-ConnectionGUID: uaipeVcWTIKXwO9ATXtfGQ==
X-CSE-MsgGUID: CO+dWltcT3+ySJhJggSFhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="109748169"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:44:39 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 stanislaw.gruszka@linux.intel.com, maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Update intel_vpu maintainer list
Date: Tue, 14 Jan 2025 09:44:36 +0100
Message-ID: <20250114084436.1326127-1-jacek.lawrynowicz@linux.intel.com>
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

Slawek moved to another project and Maciej will be replacing him.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33fe500bf3ae6..8f2a266a6c404 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7054,7 +7054,7 @@ F:	include/linux/power/smartreflex.h
 
 DRM ACCEL DRIVERS FOR INTEL VPU
 M:	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
-M:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
+M:	Maciej Falkowski <maciej.falkowski@linux.intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.45.1

