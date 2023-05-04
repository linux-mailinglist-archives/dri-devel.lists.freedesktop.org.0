Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27536F76EE
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 22:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A2E10E520;
	Thu,  4 May 2023 20:22:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB43310E1C0;
 Thu,  4 May 2023 20:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683231761; x=1714767761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bYw3sJEAw7ZfmuIy1AriDXKK3UXRx89+j3/IJdxtjeQ=;
 b=V/iy/N47IypPMuKnabn4+77ASjb3X6x0WBWRM9oczrZEbRBdHQ4qOst9
 OSQ1MJggl3G/adjgfgZCKi2iHmR5hi/KvXAjY/6jM0BhhpxdcmSGI9TXU
 SqfSE8hjvjUuR4P0LkRts3ffE48W+vUlbVR9A7ESFQTu0ejRRGI7/3Wp0
 pDBS+38gGxZMxYLmiaakJJgALI8ylejINmsPL5GBKNAVcXhLIHsZLIjjk
 ZRh/vYeTsgp1oLO4z1F2AiFTOwv235kzNLkRC+icJErfe+C4FxX/1Qd+Q
 C7wKDAtMRyFoCR78YiSuHAzxY48XKZ+DyaWKcoZqjtOBUB4As2OR+MnGQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="414569987"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="414569987"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 13:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="808900438"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; d="scan'208";a="808900438"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga002.fm.intel.com with ESMTP; 04 May 2023 13:22:39 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Update MTL GuC firmware
Date: Thu,  4 May 2023 13:22:50 -0700
Message-Id: <20230504202252.1104212-1-John.C.Harrison@Intel.com>
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

Update MTL to the latest GuC release and switch to using reduced
version file names. Also, pull in a patch from an earlier series that
is waiting to merge to prevent merge conflicts later.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/uc: Track patch level versions on reduced version firmware
    files
  drm/i915/mtl: Update GuC firmware version for MTL to 70.6.6

 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 32 +++++++++++++++---------
 1 file changed, 20 insertions(+), 12 deletions(-)

-- 
2.39.1

