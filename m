Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8B50B215
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1672F112202;
	Fri, 22 Apr 2022 07:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E250A112200;
 Fri, 22 Apr 2022 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650614280; x=1682150280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eyrqf2/p2gtXBzyGn33KfbsIUQGmvV0Xcwwei9MB9rg=;
 b=N+HIRT5ZEcg6jZKiBlBM86dsNKry3kjPe5DCnKgYDlD37WGNyAw+HK44
 1Al6D9/uOlIna17f0762+2MyEPZH2Ih9UJu7wxA4NkRnZcoJcGRYRleuz
 T+pZ/zPxCDt0mcEJeP0ZWTSnWxf0FLkEJyzEI+tc+cyVa/V6VfAJtGxQv
 r0im3qFjN43XThXGDG9FxH3Pr/lKnOdIypq9pzfcfFVgN2/TVJqBez2L8
 hRIOorXE4DGPPYSx9dmSlZepJr+4AEnqFyHLxjH7UmGl0PG0iyfBA5i6S
 RnZ2K6G61aCkt8I2BBrFMKOm1ZHGKVOIx37Jpz6AzE5zDNyV+jN7Ef4om g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="325062206"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="325062206"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:58:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="703447964"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:57:58 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [RFC 0/2] Attach and Set vrr_enabled property
Date: Fri, 22 Apr 2022 13:25:34 +0530
Message-Id: <20220422075536.2792833-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will add a support to attach & set the vrr_enabled property
for crtc based on the platform support and the request from userspace.
And userspace can also query to get the status of "vrr_enabled".

Test-with: 20220422075223.2792586-2-bhanuprakash.modem@intel.com

Bhanuprakash Modem (2):
  drm/vrr: Attach vrr_enabled property to the drm crtc
  drm/i915/vrr: Attach and set drm crtc vrr_enabled property

 drivers/gpu/drm/drm_crtc.c                | 44 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_crtc.c |  3 ++
 drivers/gpu/drm/i915/display/intel_vrr.c  |  7 +++-
 include/drm/drm_crtc.h                    |  4 +++
 4 files changed, 57 insertions(+), 1 deletion(-)

--
2.35.1

