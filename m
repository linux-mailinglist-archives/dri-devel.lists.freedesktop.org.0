Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058BD666896
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A0510E2D6;
	Thu, 12 Jan 2023 01:55:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4159110E2D6;
 Thu, 12 Jan 2023 01:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673488520; x=1705024520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e75Bm9XvoOJ3T0yR+p61IhIt1VJorL1u1jJFUMNRD1Y=;
 b=QvdhC2ashYkxT4x5a9Svqwv4KsSXc+9am3enCkxs5ZAZex0nbJapesS+
 hIBje9ahXz7F9rKyHDS/w+Gk2j3aYbnjZJOKukksRRhx9So+tZKP6RpC4
 BizTHQIAIxYYTvS8uBvfb6mcRoScRzWz6OtxUsnurM1hrdavPegO+HH3d
 fOIVqMGpuOoiV9RPr5KDfUNm4pqG1ce07SYMI2e5cvv06lcNLKD09NQ+W
 Z/VB0xR0zCQm0fyqdW9bJ612VueDGd8e1+zaAICx6QskBjRZT5+7/S6lU
 lfY0Xv+9AD4RjNvpQ4heRoPqH/Jv5tGoMGJej5nGcHshVcJV4Npa8pVHO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303961739"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303961739"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 17:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635197344"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635197344"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 17:55:18 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Clean up some GuC related failure paths
Date: Wed, 11 Jan 2023 17:54:45 -0800
Message-Id: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
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

Improve failure code handling during GuC intialisation.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/guc: Improve clean up of busyness stats worker
  drm/i915/guc: Fix missing return code checks in submission init

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 113 +++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   7 +-
 3 files changed, 89 insertions(+), 33 deletions(-)

-- 
2.39.0

