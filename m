Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA631D8CC
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 12:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F406E4E8;
	Wed, 17 Feb 2021 11:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAD86E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 11:50:22 +0000 (UTC)
IronPort-SDR: 2nQRZYkw5zW4+SAONGQhJYH8VWc6+Ctaqva/TL1CE4OLhc0pHU2vwLQg1nIl4CmoN624POIHPf
 YODYkXfGDbCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170307963"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="170307963"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 03:50:21 -0800
IronPort-SDR: ZoQSwzxVJi90BWr8Es2Stsfh7ytWz0/QaWASJ18FnfQYNHMpgZ4rbyY+ZSGBoV86Ul90mv7otD
 TIbj5gTXxl9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="419072414"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2021 03:50:20 -0800
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 0/2] Update i915_pciids.h and support ADLS
Date: Wed, 17 Feb 2021 17:10:03 +0530
Message-Id: <20210217114005.11888-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds :
1. sync up of i915_pciids.h with kernel
2. Support for ADLS platform

Tejas Upadhyay (2):
  intel: sync i915_pciids.h with kernel
  intel: add INTEL_ADLS_IDS to the pciids list

 intel/i915_pciids.h   | 177 ++++++++++++++++++++++++------------------
 intel/intel_chipset.c |   1 +
 2 files changed, 102 insertions(+), 76 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
