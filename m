Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365FD42CADB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 22:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC26EAD5;
	Wed, 13 Oct 2021 20:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6158D6EAD5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 20:20:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="288395139"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="288395139"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 13:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="592310291"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 13 Oct 2021 13:20:38 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1makjt-00056W-Rl; Wed, 13 Oct 2021 20:20:37 +0000
Date: Thu, 14 Oct 2021 04:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH airlied] drm/i915/display: pipe_config_mismatch can be
 static
Message-ID: <20211013202001.GA63140@759f3dc4db3c>
References: <202110140403.Vbr7MqCf-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110140403.Vbr7MqCf-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/display/intel_dump_verify.c:19:1: warning: symbol 'pipe_config_mismatch' was not declared. Should it be static?

Fixes: 678661f2ff1b ("drm/i915/display: move display dump/verify code to a separate file")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 intel_dump_verify.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dump_verify.c b/drivers/gpu/drm/i915/display/intel_dump_verify.c
index dab85805a569d..ad4448f7b0291 100644
--- a/drivers/gpu/drm/i915/display/intel_dump_verify.c
+++ b/drivers/gpu/drm/i915/display/intel_dump_verify.c
@@ -15,7 +15,7 @@
 #include "intel_snps_phy.h"
 #include "intel_vrr.h"
 
-void __printf(4, 5)
+static void __printf(4, 5)
 pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 		     const char *name, const char *format, ...)
 {
