Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4027A960
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 10:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A4189FD9;
	Mon, 28 Sep 2020 08:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D52489FD4;
 Mon, 28 Sep 2020 08:17:33 +0000 (UTC)
IronPort-SDR: h8zdU7T/gj6tuCTwAzUtdVoZdLpkQ9M3ozpPdPFH2nHRz/jBqDzGI07opOGnShQuzTs/aKlvFh
 SqDdezgI20fA==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="226107871"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="226107871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 01:17:32 -0700
IronPort-SDR: kYVQuW7GLVYq8nQNU0100Q5LUSITzTOIv2n1EBlMuB0tCSFs9CJsSedOtPseZB7nTnMeSmfqbo
 WBfRdvrTHKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="414908891"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2020 01:17:28 -0700
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, james.ausmus@intel.com,
 matthew.d.roper@intel.com, jose.souza@intel.com,
 ville.syrjala@linux.intel.com, lucas.demarchi@intel.com,
 hariom.pandey@intel.com
Subject: [PATCH 0/2] drm/i915/jsl: Update JasperLake Voltage swing table
Date: Mon, 28 Sep 2020 13:39:29 +0530
Message-Id: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.28.0
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

Patch series covers following things:

1. Split and differentiate between EhlkhartLake and
   JasperLake platfrom
2. Update voltage swing table for eDP on JasperLake platform
BSpec: 21257

Tejas Upadhyay (2):
  drm/i915/jsl: Split EHL/JSL platform info and PCI ids
  drm/i915/edp/jsl: Update vswing table for HBR and HBR2

 drivers/gpu/drm/i915/display/intel_ddi.c | 67 ++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_drv.h          |  4 +-
 drivers/gpu/drm/i915/i915_pci.c          |  9 ++++
 drivers/gpu/drm/i915/intel_device_info.c |  1 +
 drivers/gpu/drm/i915/intel_device_info.h |  1 +
 include/drm/i915_pciids.h                |  9 ++--
 6 files changed, 84 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
