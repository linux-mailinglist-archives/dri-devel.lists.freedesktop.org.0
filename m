Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A165BA9EF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 12:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722510E31D;
	Fri, 16 Sep 2022 10:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3035E10E187;
 Fri, 16 Sep 2022 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663322757; x=1694858757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWbYudRp1Xo1uVit3l11vjN7wCusY45iB/PX0BiylIQ=;
 b=aAxYXVmawvg+1/VuL/uAKLtvy7eRrVhNw9PUElXVf8OeMewM/UtUB0JE
 LlczSNxMtlkX6VQin8YPH3QJxlEP4vFbQkF2bmcCYeJRvb4E7SFnE4kwP
 RWIYN34f5bGVgQbfb4GhJP5//Ouydvc1XN8GIVzBegisk9IVPDy9J7+Hf
 edeUErcAlpIT3BmIN/p4y4K1rG3gcCyl4gBs74WN33tqPfrZxHC7r+bdn
 u+XD2nTiQr/IhHYy/wdotXWj0BbjJGMaMmeNv1YgMyBQ7kCSv1zyfLP5Q
 v82QYlvzfhtQl7H3vkZ6fF7X2MaFdzHZdAizgqEx7nheKkpcg6SF6lMYP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="360698674"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360698674"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:05:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="793051682"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:05:54 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] Fix HFVSDB parsing
Date: Fri, 16 Sep 2022 15:35:47 +0530
Message-Id: <20220916100551.2531750-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: swati2.sharma@intel.com, intel-gfx@lists.freedesktop.org,
 uma.shankar@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix issues in HFVSDB parsing for DSC support.
Also minor refactoring in Logging.

Split from original patch into a new series.
https://patchwork.freedesktop.org/patch/495193/

v2: Minor styling fixes.

Ankit Nautiyal (4):
  drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
  drm/edid: Split DSC parsing into separate function
  drm/edid: Refactor HFVSDB parsing for DSC1.2
  drm/edid: Avoid multiple log lines for HFVSDB parsing

 drivers/gpu/drm/drm_edid.c | 153 +++++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 66 deletions(-)

-- 
2.25.1

