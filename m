Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C73477A2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132D76E9D7;
	Wed, 24 Mar 2021 11:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760FC6E1E0;
 Wed, 24 Mar 2021 11:47:03 +0000 (UTC)
IronPort-SDR: S4bhsyZsaMwKFe5moHes0vcUQBEBtondP9ApDZBkt9ddUmGEgG3Q9LUbN0FxYA3mvuQJESUN9K
 RH+vx34wnnjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190714444"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190714444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:47:02 -0700
IronPort-SDR: 76afI7hrV4Ky4SaAbeVEM7plSN//Lnu1txliq+tf80VUNscKtB2bVqAzyQUaPJlHS+KTU6Xe6p
 C/YRSqnu4+2Q==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="442937995"
Received: from unknown (HELO genxfsim-desktop.iind.intel.com) ([10.223.74.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 04:47:00 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] HDCP 2.2 DP errata
Date: Wed, 24 Mar 2021 17:00:10 +0530
Message-Id: <20210324113012.7564-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, ankit.k.nautiyal@intel.com,
 maarten.lankhorst@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HDCP DP 2.2 errata is part of HDCP DP 2.3 specs
as well. 

Anshuman Gupta (2):
  drm/i915/hdcp: Add DP HDCP2.2 timeout to read entire msg
  drm/hdcp: DP HDCP2.2 errata LC_Send_L_Prime=16

 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 45 ++++++++++++++------
 include/drm/drm_hdcp.h                       |  5 ++-
 2 files changed, 36 insertions(+), 14 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
