Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD1CD6DB4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 18:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551AD10E587;
	Mon, 22 Dec 2025 17:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2vFj2xR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8909F10E570;
 Mon, 22 Dec 2025 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766425822; x=1797961822;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A+urTnsZISeMX9fbCyfpHDKSpHH1vfWqehI+xozlj7g=;
 b=d2vFj2xRJF864RYEhXPt1MxriDiUM15MUfyOPBDOh092WKhBWHio3IXv
 2VKjZbY7ife8hCQQqMyQYeZO/LMX7d7KQRYsfg66ofW/l5kWUXv6/4NCz
 XvIVir8PNdGaE+x1zASjJyuNjejsKP1k5Pn43RPIvuFFaigYwMvX+q4Xt
 aVembctk8P4YTrd9PzPPF8OtS8aatrPXsTNXs6g+e1y4KKPWwG4dLN+/4
 98Ue3JRvlM9o0Z9f+FCW5Njhwh7A65rU7DXy2P0gPyhqCLSe1v6RtMQz+
 ILJs4yniH0w61uVSOaBWOg/aPhaj5bFaGD+gLcIZx0r/m8cVqKaQC8OXf A==;
X-CSE-ConnectionGUID: Dd96/odGRimHlbuBO0T9Vw==
X-CSE-MsgGUID: hxduKldiR8avkyDKPKOuzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90943517"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="90943517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 09:50:21 -0800
X-CSE-ConnectionGUID: W9YjjJaXQfSBdRsDCo9wlQ==
X-CSE-MsgGUID: i532KkfSSNGpjYZyqkF6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="203706032"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 09:50:18 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 0/2] drm/xe/configs: Fix build breaks
Date: Mon, 22 Dec 2025 18:50:04 +0100
Message-ID: <20251222175006.9706-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is another approach to fix build errors reported by the test robot
that were found when Xe is built-in but configfs is defined as a module.

See discussion here [1].

[1] https://patchwork.freedesktop.org/series/159265/#rev1

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>

Michal Wajdeczko (2):
  drm/xe/configfs: Fix 'parameter name omitted' errors
  drm/xe/configfs: Fix 'undefined reference to xe_configfs_...' errors

 drivers/gpu/drm/xe/xe_configfs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.47.1

