Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F46A7C6F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 09:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF3F10E38E;
	Thu,  2 Mar 2023 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2E610E38E;
 Thu,  2 Mar 2023 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677745255; x=1709281255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hpb6fhHsC6I9pMZPiNy984MUjJoy1J2xsTXCyptZXFw=;
 b=RxLSFc1mjNaCOLWOCcSfKLqVNb18PD200L8e0qIWM4PFHu3ywxc2VpAK
 qGGKM8F53UXdSJBvJKgig/UlSEjpnBKuCn3a6vNUCOEPaP5ID153UDy5L
 ZzffUSgOls2GI4KC7B/gtzxT5mSA3+1nxfdgI+lTVE5EJird2sYAfG7Tc
 Oovzt5CrZQM4i+Kx30MDaArTmQYm4KztuSRtG1RJp/ktHijMr/eSui5Rl
 QmnWWhSytWsOg7/ax3SFW8I41+anh6ikL4kM6Mayf93nP+gGc0ZYOuruS
 +wC7mo/Z7Wz5B8BenDKPqDzEmohMI8xT4sMGcONEKE/0H9lr9WHH38mbP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318454992"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="318454992"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 00:20:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743757547"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="743757547"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmsmga004.fm.intel.com with ESMTP; 02 Mar 2023 00:20:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCHv3 0/2] DP2.0 SDP CRC16 for 128/132b link layer
Date: Thu,  2 Mar 2023 13:45:30 +0530
Message-Id: <20230302081532.765821-1-arun.r.murthy@intel.com>
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

