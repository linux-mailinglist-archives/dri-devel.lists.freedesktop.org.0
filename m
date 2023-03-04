Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DC6AA741
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 02:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1652E10E171;
	Sat,  4 Mar 2023 01:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECC610E16F;
 Sat,  4 Mar 2023 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677893230; x=1709429230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zpVMlRPknzAhkIhegDq2M59HTSncaQzs7vrNYgMcagY=;
 b=UOkRciRRVwc6pHyu/RKNnuvY6uDbaJVTAz5CMU9crzvnl5IiR+/Oxwi2
 8SHW6ThEMFcD34JMLHGmik4xwfGLUqJ9iuG6YadqA3Ygm43WDiLrNtJjT
 udIxn7YQlmItjjkz+vk/y7Kg79ckSbkZyT+dhzh4Njs1T5Vxl9fNqMThU
 ZABKFyPkQohRjvvdBKlZn0CWOe2yaz8G4Ala9G9yfeM3scKp1liFNuzqP
 7aKuyM1MEYaNjFbVzZPBL7++WRp5KNssu8RyTfHxiarfKY9A9iUGNvs8M
 FNNVl0bN6zNuPv6OFTVBh/Yv5c1pNDORm3xldhS40ZZPU/sJS4F05J8Vp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323504927"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="323504927"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="849684687"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="849684687"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 17:27:09 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/pmu: Freq sampling: Fix requested freq fallback
Date: Fri,  3 Mar 2023 17:27:03 -0800
Message-Id: <20230304012705.70003-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of minor fixes to the PMU requested freq fallback for PMU freq
sampling.

Ashutosh Dixit (2):
  drm/i915/pmu: Use only freq bits for falling back to requested freq
  drm/i915/pmu: Use correct requested freq for SLPC

 drivers/gpu/drm/i915/i915_pmu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.38.0

