Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87031FD2F3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BFE6E91D;
	Wed, 17 Jun 2020 16:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942E96E91D;
 Wed, 17 Jun 2020 16:56:56 +0000 (UTC)
IronPort-SDR: BUWrs/fvy5QG2WLU0KhgWbv1MTinRW0GAfXnwmpzM0wEfP5p2WHD8g6FgcohYzWLBLdCFf1jIA
 YS7kA/PH1fow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:56:56 -0700
IronPort-SDR: dFqCGMaIpq2xwCF+QDieVsbtLmS6tYzBnknmVMdNeZzOrJwIKHz75SWvgLVvLL8NUb+UHNcTUQ
 1agitdfDbBRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="261778716"
Received: from lkp-server02.sh.intel.com (HELO cd649bb48ab3) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2020 09:56:53 -0700
Received: from kbuild by cd649bb48ab3 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jlbMq-00002Z-Tu; Wed, 17 Jun 2020 16:56:52 +0000
Date: Thu, 18 Jun 2020 00:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Boyuan Zhang <boyuan.zhang@amd.com>
Subject: [RFC PATCH linux-next] drm/amdgpu: vcn_v2_5_mc_resume_dpg_mode() can
 be static
Message-ID: <20200617165618.GA10958@961301d82108>
References: <202006180056.7SwSBIaS%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202006180056.7SwSBIaS%lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, Jane Jian <Jane.Jian@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 James Zhu <james.zhu@amd.com>, Leo Liu <leo.liu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Fixes: c422a628925d ("drm/amdgpu: rename macro for VCN2.0 2.5 and 3.0")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 vcn_v2_5.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 261afbb504bd0..ba1c4fbc19dc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -443,7 +443,7 @@ static void vcn_v2_5_mc_resume(struct amdgpu_device *adev)
 	}
 }
 
-void vcn_v2_5_mc_resume_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
+static void vcn_v2_5_mc_resume_dpg_mode(struct amdgpu_device *adev, int inst_idx, bool indirect)
 {
 	uint32_t size = AMDGPU_GPU_PAGE_ALIGN(adev->vcn.fw->size + 4);
 	uint32_t offset;
@@ -657,7 +657,7 @@ static void vcn_v2_5_disable_clock_gating(struct amdgpu_device *adev)
 	}
 }
 
-void vcn_v2_5_clock_gating_dpg_mode(struct amdgpu_device *adev,
+static void vcn_v2_5_clock_gating_dpg_mode(struct amdgpu_device *adev,
 		uint8_t sram_sel, int inst_idx, uint8_t indirect)
 {
 	uint32_t reg_data = 0;
@@ -1300,7 +1300,7 @@ static int vcn_v2_5_sriov_start(struct amdgpu_device *adev)
 	return vcn_v2_5_mmsch_start(adev, &adev->virt.mm_table);
 }
 
-int vcn_v2_5_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
+static int vcn_v2_5_stop_dpg_mode(struct amdgpu_device *adev, int inst_idx)
 {
 	int ret_code = 0;
 	uint32_t tmp;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
