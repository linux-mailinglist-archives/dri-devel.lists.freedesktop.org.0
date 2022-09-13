Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E65B64E4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 03:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658510E17B;
	Tue, 13 Sep 2022 01:09:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1510E17B;
 Tue, 13 Sep 2022 01:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663031340; x=1694567340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=phQ5F35loAZv7FcQ1IHcxPB8sB/OOUkosXZF4U/EOhs=;
 b=kaG+fpuCfhj+59W74TSjXcbhHNqM44+6kLGotLksz8dUgtTlEHBDCaga
 x8GyhU1OUEhwd7Uo8UvE/iKZ3Xcncm7OIbLcfAsRB3OPceYZIG8aLo7ZB
 u+ASkAzxjwLost1s+sEx+zpoX3Qo3PL/9/HNUDnFEp+2SWb1XZolKRVjB
 T0I+/nyrD9C7YfgHJwd20fumrSBsxvSWgHhS8YJLIjTbbvz3zL+YSXGEP
 0ApZURB30FQGR4Gd7cn+lE9zIKt/pRFiAiltG1qHDn6DO0HnFBKAYyM54
 ktaOFVey9mdtoQ1S8SyRM8LQcTVz1/rKBTMrGPnAlJn6buqMwbZO40yhh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="298010156"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="298010156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 18:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="678341563"
Received: from relo-linux-5.jf.intel.com ([10.165.21.151])
 by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2022 18:08:59 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/1] Fix 'remove log size module parameters'
Date: Mon, 12 Sep 2022 18:09:28 -0700
Message-Id: <20220913010929.2734885-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The patch 'remove log size module parameters' broke loading the kernel
when not compiling for debug. Fix it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/guc: Fix release build bug in 'remove log size module
    parameters'

 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 25 +---------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

-- 
2.37.3

