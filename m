Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE22674D4E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 07:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840C710EA56;
	Fri, 20 Jan 2023 06:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FC710EA52;
 Fri, 20 Jan 2023 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674195705; x=1705731705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hpb6fhHsC6I9pMZPiNy984MUjJoy1J2xsTXCyptZXFw=;
 b=VP7jUMD7/9ejhbLZLa9jsOiKI4rsx/ugJh3IOdpMrzh5rqOy/63KdCOW
 R4eBk1Holn2P4GLarZ/gtGZUYlTMcpXWvAi54EMHLWqg/qio5DKxo0DzS
 s2yW2c4L7f4XIWD6QyWGwfCQMdlzeMZAT+4CyU67bQuRx1yvFmnJuiftv
 TXTwZqfCzU0mf5PfHEDVBwhUjR8Z5VCLRUSFH/9JPysgt63yT1H6mpwhW
 E5md0BfcLv+82lp7o/kS9gxwjnUbPd2/VfEfmNYufi8/WLUpnn2PUSVE+
 A3ONvm43HI3sJoA9nyKEDav7tN77ZjGn/jhmth4n3MaGbn6sNz/VrPleP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="390030160"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="390030160"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 22:21:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="729021167"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="729021167"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 22:21:30 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv2 0/2] DP2.0 SDP CRC16 for 128/132b link layer
Date: Fri, 20 Jan 2023 11:45:58 +0530
Message-Id: <20230120061600.1451088-1-arun.r.murthy@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

*** BLURB HERE ***

Arun R Murthy (2):
  drm: Add SDP Error Detection Configuration Register
  i915/display/dp: SDP CRC16 for 128b132b link layer

 .../gpu/drm/i915/display/intel_dp_link_training.c    | 12 ++++++++++++
 include/drm/display/drm_dp.h                         |  3 +++
 2 files changed, 15 insertions(+)

-- 
2.25.1

