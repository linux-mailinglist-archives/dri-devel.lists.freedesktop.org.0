Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47A21F7D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 19:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D656F6E966;
	Tue, 14 Jul 2020 17:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861D06E8A6;
 Tue, 14 Jul 2020 17:05:38 +0000 (UTC)
IronPort-SDR: meFsugL38YBuI0gcYpx9fQbfs6GEr6WCx0Ro91TeUPSZ67OhwILuvExTXOkmu/r8qHyHcVXbEs
 cAbaL8V6GAxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="148969073"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="148969073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 10:05:37 -0700
IronPort-SDR: sBQjsKdXldgUzTz4tE232k6dSJ2KZdeQwIvKJvnXDMvGze1Oeo8d9SGGlbPZModN4c4FKnjvWW
 oLdz4AlVILLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="268703278"
Received: from lkp-server02.sh.intel.com (HELO 393d9bdf0d5c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jul 2020 10:05:35 -0700
Received: from kbuild by 393d9bdf0d5c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jvON4-0000D3-SL; Tue, 14 Jul 2020 17:05:34 +0000
Date: Wed, 15 Jul 2020 01:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Karthik B S <karthik.b.s@intel.com>, intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH] drm/i915: g4x_get_flip_counter() can be static
Message-ID: <20200714170448.GA60632@f43cbbe531e7>
References: <20200714012725.18383-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714012725.18383-2-karthik.b.s@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, paulo.r.zanoni@intel.com,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 i915_irq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 9812a8051c5ea..79a3118f918a1 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -697,7 +697,7 @@ u32 i915_get_vblank_counter(struct drm_crtc *crtc)
 	return (((high1 << 8) | low) + (pixel >= vbl_start)) & 0xffffff;
 }
 
-u32 g4x_get_flip_counter(struct drm_crtc *crtc)
+static u32 g4x_get_flip_counter(struct drm_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->dev);
 	enum pipe pipe = to_intel_crtc(crtc)->pipe;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
