Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57B4B631B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 06:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7516010E253;
	Tue, 15 Feb 2022 05:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D31410E193;
 Tue, 15 Feb 2022 05:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644904303; x=1676440303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8QHoZNm/E9WjXmpjpR/lOxRLGzparTARU1gUTq5Ht7I=;
 b=jX5DZ/WXBatLY68FQ8JY3b3Jt42NJvB4LoK875/F37+uPJTQVM2mvTMF
 VvFKOw2INSzAXv9nJUWYHk9rRiMT3oTZnE9iyo9rbo4R1g20BbKj2HB7I
 gCtnB8SiViKuGUrTbUbwEPOo6TzTrYR/PyP9eMDlB6OUvEE1r6gjuNau3
 mHfmriuPfWshMCkmItsLeWp3ALos7o83ojLVqqtgmDaLYOWb3P9zH56aG
 VHmYltnJi6Px8Wa2m3KpInj8lM/3OCcU/GMOiizwD5OspF4Wr6kMFmLK1
 T5gLGG13QZmn2gtjQyySMcPnjGq+H/zEfQB7tzd7c68LymHxE2R9BE/jY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="233802212"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="233802212"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 21:51:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="544109262"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 21:51:40 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] drm/i915/dg2: 5th Display output
Date: Tue, 15 Feb 2022 11:21:51 +0530
Message-Id: <20220215055154.15363-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Shankar Uma <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixing the 5th Display output for DG2.

Jouni Högander (1):
  drm/i915: Fix for PHY_MISC_TC1 offset

Matt Roper (2):
  drm/i915/dg2: Enable 5th display
  drm/i915/dg2: Drop 38.4 MHz MPLLB tables

 drivers/gpu/drm/i915/display/intel_gmbus.c    |  16 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c | 210 +-----------------
 drivers/gpu/drm/i915/i915_irq.c               |   5 +-
 drivers/gpu/drm/i915/i915_reg.h               |   7 +-
 4 files changed, 25 insertions(+), 213 deletions(-)

-- 
2.20.1

