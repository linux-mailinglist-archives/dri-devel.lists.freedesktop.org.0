Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A739F1DC763
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 09:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7496E907;
	Thu, 21 May 2020 07:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE606E907;
 Thu, 21 May 2020 07:11:53 +0000 (UTC)
IronPort-SDR: XuUQMDhlt3g0AgdJH2DIgbOL7KtoR/nC++FgeMzWezEQ56ojJ2LrzcUL4kvGhQWZGTLLdaPAhr
 NBnowl77vKCQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 00:11:53 -0700
IronPort-SDR: z7c0s6E/XsKg6S11eV0hFFqcwljSpul7VUxWd+FplJFBN88A21CKiBuf6ns6T90R9x0GcCoDe/
 ZgBKGsJO3syg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="412297601"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 21 May 2020 00:11:50 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jbfMp-0003QD-8G; Thu, 21 May 2020 15:11:47 +0800
Date: Thu, 21 May 2020 15:11:13 +0800
From: kbuild test robot <lkp@intel.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: [RFC PATCH linux-next] drm/msm/dpu: dpu_setup_dspp_pcc() can be static
Message-ID: <20200521071112.GA92825@f61f8b3f25ca>
References: <202005211507.nm5LmztD%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202005211507.nm5LmztD%lkp@intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dpu_hw_dspp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index b5189cece3c66..a7a24539921f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -22,7 +22,7 @@
 #define PCC_BLUE_G_OFF 0x24
 #define PCC_BLUE_B_OFF 0x30
 
-void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
+static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 		struct dpu_hw_pcc_cfg *cfg)
 {
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
