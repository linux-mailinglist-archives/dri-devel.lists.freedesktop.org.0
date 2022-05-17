Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00A529AC7
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFFD10E4EF;
	Tue, 17 May 2022 07:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F28E10E5D7;
 Tue, 17 May 2022 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652772576; x=1684308576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5IGjlB8ics0nKAaZ6l+2mbhGkOY9Zn9oDTwYZaKetaE=;
 b=Jt49EBG1ddvImes22RvESwXtL+ebO4IX5q+97opajaOEkhTvdAKUBr9a
 xOLHf7o6+HfV7wy7Kc2FLzZ7zsvhjEgJ7dJU6IbU+QG+ufwXvayKb/+25
 /wibev9Mi0s0oLe1XIGvPbIBJlWacpIDfPVo8GSfYirv1ROllKTSRgvrD
 ryruNQm0Sda83cGEL8LsjKJqeJHmtvyxCnCvFsquH921xM6aPz8gSEvWz
 /qmBrO3jUi9RxwZPwBXBu9MRqdst3HQvghzFfplAnJ4C7grfVMP1u++UU
 BdDJf+wvEFJh72DotQSzw9KIgK1IG7aapqRD5B2hmxy8SVxrMFtwEuIZY w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271039311"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="271039311"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:29:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="544777171"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:29:34 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: [RFC V3 0/2] Attach and Set vrr_enabled property
Date: Tue, 17 May 2022 12:56:34 +0530
Message-Id: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
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

This series will add a support to set the vrr_enabled property for
crtc based on the platform support and the request from userspace.
And userspace can also query to get the status of "vrr_enabled".

Test-with: 20220422075223.2792586-2-bhanuprakash.modem@intel.com

Bhanuprakash Modem (2):
  drm/vrr: Attach vrr_enabled property to the drm crtc
  drm/i915/vrr: Set drm crtc vrr_enabled property

 drivers/gpu/drm/drm_crtc.c               | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c |  8 ++++++++
 include/drm/drm_crtc.h                   |  3 +++
 4 files changed, 38 insertions(+), 1 deletion(-)

--
2.35.1

