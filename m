Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63876786FB7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 14:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACA810E547;
	Thu, 24 Aug 2023 12:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E105310E545;
 Thu, 24 Aug 2023 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692881671; x=1724417671;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YOJ5taDuGrqSHf+2u9nm8R/E9awi42EJDloQMxBA+BM=;
 b=dQrMRcxsqBOlczglHqiFVpThB9DatA67Q3CvCZn2EjsFKyrngRhKRiN+
 xYDiqpsVcAFC+FPYmzPvzlPUmkmnkPpGGGQb5fra7k8vzSFPe8cVxrQ4h
 UnSHoz9tIcNxdBMqAidu8R/lycYe4bNBDgUvKiqUBDZ3iSPGlREB8ioTB
 GLOBHo4nS7ZEZr3hlIW2it3dJQwkb0o5X6FA0GNHZIicgr2JN0MLQK6H0
 p0DnQ0W80ZBC19wAow+8gEjBmubNKrY29R/3run8GKoDwH4vq96tG5UTS
 3e07/MLvL8RTJVKjiuSQ+mWrYE57XgLzLy6WJYjBOB2uviCTm1hKiVF7e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="377160107"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="377160107"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860688635"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="860688635"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 05:54:29 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] eDP DSC fixes
Date: Thu, 24 Aug 2023 18:21:19 +0530
Message-Id: <20230824125121.840298-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
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

Assume 8bpc is supported if Sink claims DSC support.
Also consider bpc constraint coming from EDID while computing
input BPC for DSC.

Rev2: Fix check for dsc support.
Rev3: Minor styling and typos fix.

Ankit Nautiyal (2):
  drm/display/dp: Assume 8 bpc support when DSC is supported
  drivers/drm/i915: Honor limits->max_bpp while computing DSC max input
    bpp

 drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
 drivers/gpu/drm/i915/display/intel_dp.c | 5 +++--
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.40.1

