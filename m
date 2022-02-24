Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D804C2DCF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 15:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9036A10E20C;
	Thu, 24 Feb 2022 14:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE0F10E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645711467; x=1677247467;
 h=from:to:cc:subject:date:message-id;
 bh=iZOFtM60DlhldiI6WQKF0qtAkSL9leJAjEUy1XjJP40=;
 b=ZrOGkR4Ym63VAkEKwnB+kQS8FU3cRzKjSB+MOO007D1xwGu4rltYnEAp
 Pzgxp8NHbpYOaBxWHpqqPD0yAEwY6fB+o7zC3hyeFO14+kGSFhwTtxk5o
 yKQVoROTqEGnssQQO9+3i4JYR0Q77eqQeur1477gqoYwKziVWMlmuU0yw
 84hltVZjT0BjdrN+awsuwHIhVQfV5AqeH44OANG+/w84VHIXxWJPzAkZT
 vOEOs2uRTQybNnAcW6Kga58T13M0KSlTQFGK3eyOBC+iaCyY8pnAeHC8h
 Hshvs0+sr616PReNu1OqOXbD/CsnSKzxEUKH6w2FT+IMjUaMiDYKQqbtx Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338676169"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="338676169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 06:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="628479288"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2022 06:03:59 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] enhanced edid driver compatibility
Date: Thu, 24 Feb 2022 22:16:22 +0800
Message-Id: <20220224141625.19070-1-shawn.c.lee@intel.com>
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to parse multiple CEA extension blocks and HF-EEODB to
extend drm edid driver's capability.

Lee Shawn C (3):
  drm/edid: parse multiple CEA extension block
  drm/edid: read HF-EEODB ext block
  drm/edid: parse HF-EEODB CEA extension block

 drivers/gpu/drm/drm_connector.c |   5 +-
 drivers/gpu/drm/drm_displayid.c |   5 +-
 drivers/gpu/drm/drm_edid.c      | 200 ++++++++++++++++++++++----------
 include/drm/drm_edid.h          |   4 +-
 4 files changed, 151 insertions(+), 63 deletions(-)

-- 
2.17.1

