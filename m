Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026C8785744
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 13:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7172210E080;
	Wed, 23 Aug 2023 11:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C62310E080;
 Wed, 23 Aug 2023 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692791856; x=1724327856;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jfxjd/SMIv6AdnF/Wp/JRiTvqvLN4bR2Otuk4Jdf2E0=;
 b=kSI17NQ7dIQIm1zrJjJrysPT43LGgf32mxpTSwlGu9PUgRk19KK3DwXq
 K4GpQa5r8nzezri4wEvSBt+7nZL+sQtlQPrALn/o9WCNafzwIutgZmJgI
 k+9obs5O7PrOgS+czNHN38J4Qx5rRaK5pJGr4rzbSJzq3dSgQXbu1IIPo
 Yjp3eMa+TEJZQ4Hd1GGQQoxbSdafcVyr659oYauynEi1fj0z6IGkNkhJm
 h8xHDJ/GKRE+nfuK2/Kb49H86ibxLnPfGhYOWBj5SflBf/tLJHPsVnl7m
 NwFywRszmgcikRz2fBE1xp0A95EtUB87biKAsqg4LSHT9fJ7w86wiuYgY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="354472213"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="354472213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="851019785"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="851019785"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:57:34 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] eDP DSC fixes
Date: Wed, 23 Aug 2023 17:24:23 +0530
Message-Id: <20230823115425.715644-1-ankit.k.nautiyal@intel.com>
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

Ankit Nautiyal (2):
  drm/display/dp: Default 8 bpc support when DSC is supported
  drivers/drm/i915: Honor limits->max_bpp while computing DSC max input
    bpp

 drivers/gpu/drm/display/drm_dp_helper.c | 9 +++++++--
 drivers/gpu/drm/i915/display/intel_dp.c | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.40.1

