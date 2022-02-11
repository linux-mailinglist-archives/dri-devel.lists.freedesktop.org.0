Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB624B2456
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 12:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789BE10E5AA;
	Fri, 11 Feb 2022 11:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425410E5AA;
 Fri, 11 Feb 2022 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644579288; x=1676115288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=19j4CU6gM/pSBaKhoxGfB/ddMAItGV1TCkkzA3NYdV4=;
 b=LXhiOP3hvGo43Tb4qTTiTvb1Y83Or4LbNwVAc70A5fJSuoq80lbLgtw+
 QF7HFArvc+/6lrCWg4PdhtR/rbUwiIj7H/2IMys6DwK6Uw4qGzjM+bHL8
 ECsZbu3ja5bm1fOmGG05YDMT3JhCKk/evaIf3ocw+ezS5UZkNzXtgEDbI
 a3F5FkhOqt9J4lanIy6gdDdTT2UyVT959TKGf3/ml06/+rVZUk9Rzq+E3
 hum2edKpqnw73a+fWZrloeZsGhk3bb/Bl6I6nuQabkwzZqkTq8JsmKpOV
 zYn1Fo0+c8fV9THGUbtcmG8dTuYUccqqjt34Xab5kLiZRSvpj51Aknibs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248548219"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248548219"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="602354941"
Received: from pogara-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 03:34:46 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/15] Initial support for small BAR recovery
Date: Fri, 11 Feb 2022 11:34:22 +0000
Message-Id: <20220211113437.874691-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from DG2 we will have resizable BAR support for device local-memory,
but in some cases the final BAR size might still be smaller than the total
local-memory size. In such cases only part of local-memory will be CPU
accessible, while the remainder is only accessible via the GPU. This series adds
the basic enablers needed to ensure that the entire local-memory range is
usable.

Needs to be applied on top of Arun' in-progress series[1].

[1] https://patchwork.freedesktop.org/series/99430/

v2:
  - Various improvements and fixes as suggested by Thomas.
v3:
  - Add some more a-b and r-b. Also tweak patch 12 slightly, as suggested by
    Thomas.

-- 
2.34.1

