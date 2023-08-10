Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC73777924
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 15:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709BA10E527;
	Thu, 10 Aug 2023 13:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81D110E51E;
 Thu, 10 Aug 2023 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691672892; x=1723208892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZDpziXS55fkPW8/Lk3XB5sRKOlWwSYLK0uhQ54LeYWw=;
 b=EPxdP9+xgzUxRIAwUNYaZ1tV3BSP1NshZYr8dwrZFEkO5AYdUd4GudXN
 0cQ9X9UPN/6w71aJ0Drg7jKXvGF+g1obe7QonRzkxkL9n/pFhOCyftGFa
 lbfIG1f25IATJQJJHw7Qqap+GWM6sUgggblebTi32PTGJC5fKMrwiJbP9
 fx+8Dc2pkRVWeh7zwKuyVe2/U1zVa3vYAxW+oqSvDun8lEsrz3yoOLcZ8
 f4P1BKuEakwF7M8iD4l5MJpmc7kZOS7pFNxkv4nT7NunjplxyeH2Wk5Jo
 xJCt4uOu9QOg8Mfupw93MOBKJecE0k6IzkA10LIa3J6SY0AZuxoWv6QD1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356358562"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="356358562"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="709143169"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="709143169"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 06:06:55 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/20] drm/i915/dp: Remove extra logs for printing DSC info
Date: Thu, 10 Aug 2023 18:33:06 +0530
Message-Id: <20230810130319.3708392-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC compressed bpp and slice counts are already getting printed at the
end of dsc compute config. Remove extra logs.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fc08fc85d665..6bded67d986d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1782,9 +1782,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
-		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
-			    pipe_config->dsc.compressed_bpp,
-			    pipe_config->dsc.slice_count);
 	}
 	/*
 	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
-- 
2.40.1

