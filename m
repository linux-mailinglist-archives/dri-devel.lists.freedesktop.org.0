Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30B688C4E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 02:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5602010E6DC;
	Fri,  3 Feb 2023 01:10:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A2A10E6D2;
 Fri,  3 Feb 2023 01:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675386640; x=1706922640;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FRDKYPZTGd3Dxnu++PTkw/ux0YbzTRWCY4QK2QnONOg=;
 b=XCbvqt76C7/TMxWZc6y/NdFDq3ICHfdsdlWahXEhSCTnGGwVAYailcm6
 kvulQGyip8KoJwY8MwyEkfzMRFp87kzqY0sHfoVvbIbFU1dOogaeTBBoG
 pQAatGWvv5FhObBtQ1lI9lvYGbWdosqGRU9ef+AwOf3mjujDnyConvt9q
 obljCb2YTXlp3s7Ek91gPUksq95xqBef89Cv5hbyifTHGcq+KMAE1oG5O
 40p1bDFPr7jOjaEMEM7L9gwAmjoR711dO1QtG3BbCl5Fq2HCRdBVlFtwB
 RnfyIKxLEOSOrRw/veFnaxu//S5Bsld0B9GxSz21hJVH4YUAskhoWpJAZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="391021622"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="391021622"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 17:10:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665528225"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="665528225"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2023 17:10:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] More error capture improvements
Date: Thu,  2 Feb 2023 17:10:40 -0800
Message-Id: <20230203011043.3427096-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
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

Ecodes got lost with the switch to GuC based register lists. Put them
back.

Seqno values got lost with the switch to per context timelines. Put
hose back too.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915/guc: Fix missing ecodes
  drm/i915/guc: Clean up of register capture search
  drm/i915: Include timelines in error capture

 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 27 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_gpu_error.c         |  3 +++
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.39.1

