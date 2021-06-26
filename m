Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4B3B4BA9
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 02:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3796E986;
	Sat, 26 Jun 2021 00:45:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C926E12B;
 Sat, 26 Jun 2021 00:45:22 +0000 (UTC)
IronPort-SDR: TLgJSN9dgeJ5U5gCV7c/R/jrvjozprwaaHrs8hf//3mjB7AmerJRwZnEqTnMVjb74Wo6oiwhUk
 A/YKGfXPeb/A==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="293394463"
X-IronPort-AV: E=Sophos;i="5.83,300,1616482800"; d="scan'208";a="293394463"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 17:45:22 -0700
IronPort-SDR: LNyye9NmYgkKNLNVn5noDK5X0z29gwfQj7e0XmEWRkonj5vPS2q9ebzReBSisMCurSi9WBTxtW
 Ey8tj/oKlZSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,300,1616482800"; d="scan'208";a="445806991"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga007.jf.intel.com with ESMTP; 25 Jun 2021 17:45:22 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Update to new HuC for TGL+ and enable GuC/HuC on ADL-P
Date: Fri, 25 Jun 2021 17:45:20 -0700
Message-Id: <20210626004522.1699509-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

There is a new HuC version available for TGL and compatible platforms,
so switch to using it. Also, there is now a GuC and HuC for ADL-P, so
use those too.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/huc: Update TGL and friends to HuC 7.9.3
  drm/i915/adlp: Add ADL-P GuC/HuC firmware files

 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1

