Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2050D9C0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 08:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F5810E124;
	Mon, 25 Apr 2022 06:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A7A10E124;
 Mon, 25 Apr 2022 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650869316; x=1682405316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8/OEjwSbrZLWim/zrFvzSnaRRS6XKm9ryfXS3OB+ONI=;
 b=YZtoJtey/BwZHEtsg9AexFhIHUYQQszq0bCu6GpLHZdNLo0VwP7X97Dj
 6d2zU4JODAmafqKTTlN7r4LlswknyhSFK9cXjcKzlppr1xi5ePKuZZR92
 zF57YMNf8plGLL7/hpCwdh3Q3dgxNVuBoPUgKcRKS85KgO/bGZUz7h6bo
 ePFt6/rEtPe1Q0cDSOS/xJq1A492mpnLb9nlz52q+OH6lg+/zZvGsYtea
 +AKf+XzmBqm8RjSL/rFRLJykU4zOZaXYAz4C20a/6oZTK52vdNWPnoBoE
 10hVbkhlRL+OMOAUbPDHc53BigBclXvOkO/gCTyO0ISzGWwuCRVRyB+Qb w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265325792"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="265325792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 23:48:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="616385892"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 23:48:34 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, manasi.d.navare@intel.com
Subject: [RFC v2 0/2] Attach and Set vrr_enabled property
Date: Mon, 25 Apr 2022 12:16:10 +0530
Message-Id: <20220425064612.2993587-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series will add a support to attach & set the vrr_enabled property
for crtc based on the platform support and the request from userspace.
And userspace can also query to get the status of "vrr_enabled".

Test-with: 20220422075223.2792586-2-bhanuprakash.modem@intel.com

Bhanuprakash Modem (2):
  drm/vrr: Attach vrr_enabled property to the drm crtc
  drm/i915/vrr: Attach and set drm crtc vrr_enabled property

 drivers/gpu/drm/drm_crtc.c                | 44 +++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         |  2 +-
 drivers/gpu/drm/i915/display/intel_crtc.c |  3 ++
 drivers/gpu/drm/i915/display/intel_vrr.c  |  8 +++++
 include/drm/drm_crtc.h                    |  4 +++
 5 files changed, 60 insertions(+), 1 deletion(-)

--
2.35.1

