Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C6584889
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 01:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF5710F49C;
	Thu, 28 Jul 2022 23:07:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC591129B5;
 Thu, 28 Jul 2022 23:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659049644; x=1690585644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=arVW+zhOOCZ1+B0vXeUo5AUYAshiiP2cESQKeQoyGVI=;
 b=itt7kQI7biBzoQjZi39NMpQD5GwtG8t8aTFd5w1po52mXZUWT/ZovrXM
 aJwpOcFu6TOx5fAkUgz6eg+2jCSSAZl1MnwLZmc97Pe3GZj0QvJmDi1ZW
 7iZpcjMasV0URvL3xIuUzUd9XjFaUc1qP8mFV2eUxXcXVEqhzHa83h9OC
 gSE0yBRe1EdgJVgEJpC5+GzrKJhB5Nj6GNAAg4eGwDcsYt9WIzPqRQ7l7
 4qjCYoBqwM06CyGg/284mu0bMmPyoLzvd18rUDVJT5DyEE82w3/BC0G2k
 aQ+WFSl0pVYLhErsXzfJbV5qs+KMeGb97GOrpFI/hshjf3zW3+/OGGuuf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="287401898"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="287401898"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 16:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; d="scan'208";a="928521113"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2022 16:07:23 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/1] Move DG2 to GuC v70.4.1
Date: Thu, 28 Jul 2022 16:07:21 -0700
Message-Id: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
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

The latest GuC release contains a bunch of fixes for DG2. Start using
it.

Note that some of these fixes require i915 side support which will
follow in separate patches.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/dg2: Update DG2 to GuC v70.4.1

 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.37.1

