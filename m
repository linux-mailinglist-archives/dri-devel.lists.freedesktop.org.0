Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692674B17C5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 22:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E2310E2D9;
	Thu, 10 Feb 2022 21:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9861710E2D9;
 Thu, 10 Feb 2022 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644529341; x=1676065341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mBzSTrRMrVFhDj0QXaYZ2rNVjY1h6iZq27oJNWxJhr0=;
 b=KBtfzXNtgd1eRboaG7gamYdhyhz1aFkeg21MkCXaiqMf/fqITGZ/MKcY
 lYcdPdQL8RFik/VEyLDcp8SMJjdI5JtFmPUzLiabWKJluZ3grYUssRHH3
 rug+nC0As2mFflV6BhANQU1nuEhJLw5SF3/RMe+xIHmwnnL+a2R+n0nvk
 u+LgIzoAx8jNweaDgxVhaM5VWCQqcl5wVWmDlwMKa6SvLWDwYpxN3M2SO
 cx5pq94y1V9e8Ij5QC/+rxR9ejDZt2npOVCsjJztXYDFizZptLO1y7kH1
 jxCKXc8Pqxsl3jCohIBd6DF0bwFKXLQ2HnR4MOJMW1EITRj+ltO3mdQ5H w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249547366"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249547366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 13:42:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="485949866"
Received: from lmoua-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.169.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 13:42:20 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 0/1] Move #define wbvind_on_all_cpus 
Date: Thu, 10 Feb 2022 13:42:15 -0800
Message-Id: <20220210214216.1227694-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves the #define wbvind_on_all_cpus logic to intel_gt.h. This way
all calls to wbvind_on_all_cpus benefit from the logic, and fixes compile 
errors on non-x86 platforms.

Michael Cheng (1):
  drm/i915/gt: Move wbvind_on_all_cpus #define

 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 -------
 drivers/gpu/drm/i915/gt/intel_gt.h     | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

