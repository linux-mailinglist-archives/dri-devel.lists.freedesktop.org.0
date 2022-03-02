Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE174C9F5F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D9210EB99;
	Wed,  2 Mar 2022 08:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575F410EB99
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646210273; x=1677746273;
 h=from:to:cc:subject:date:message-id;
 bh=/7nKZYgN4j2J4no4Qkbietg10J8nGMlxpLz8e4FCQeU=;
 b=blnqjAq05e7o+IL8Gb37fxlvcNVkaNdS5d5VwJyfKV3/KIoAwm90EMTV
 TTwOafjnRnxXhJ1s9RM0VYQiT9Guvkct3xHdL5ZpMtZe04mWaH+MFYywZ
 gNau0/fU3v/deasIYDCpJpHXDnajqw09CiDV8Z47iwDkZPXRDqnER94rK
 BBlSw5TAXqqhlYiOkT4Xn3/6C94/A238CRbBIM0APBeEQs2C8CuCJ6Ct/
 mCGV277p9jXh66FmKVyjnn+i/vohgJkFe5ZpLqb+x4wJHfxyoRIdThCw8
 vWmv/t43SK/H1mM31o21mVkaDjO3V185JNbueoCOaQTshs6yphqUtEZ28 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253539675"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="253539675"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 00:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="508124679"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga002.jf.intel.com with ESMTP; 02 Mar 2022 00:37:51 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v3 0/4] enhanced edid driver compatibility
Date: Wed,  2 Mar 2022 16:50:53 +0800
Message-Id: <20220302085057.27317-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to parse multiple CEA extension blocks and HF-EEODB to
extend drm edid driver's capability.

Lee Shawn C (4):
  drm/edid: seek for available CEA block from specific EDID block index
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block

 drivers/gpu/drm/drm_connector.c |   8 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 158 +++++++++++++++++++++++---------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 128 insertions(+), 47 deletions(-)

-- 
2.31.1

