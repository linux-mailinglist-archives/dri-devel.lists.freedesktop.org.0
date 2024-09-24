Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51698403A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCDF10E676;
	Tue, 24 Sep 2024 08:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arSPo0CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E310E670
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165938; x=1758701938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JFLibCRzP5bEl9Tc4K9GLlzhIhX7hD25r7NbTMX6lp8=;
 b=arSPo0CL+KTLNeAc69K5ebGpX0g3SvcGbVyzLkGkHQ0tBpPAiO8mHUZX
 cG7uAXSAWNa3XG3XcumQdH+Hvq9rVgv35fzCVdcoYHg6QCQ4H+qOMZoa0
 XrN30Bp4YxQsbnc2sAhChZbU0NdMEBoSib/R4qR/kMGbKYpJ/2DBXXSVt
 c6973hVx6MyL79ro9Yj7HXvFWb7ECZOR09GBssrvfRHMj/FvPI5F1Qhuw
 XkYg80+XPTjwOyZES8bPwAPYCmVoPXp+K5femujx+ygGnItb7UonaD2Jm
 o9E4NxwpgIs7gLPcaFg6N0B3EJpa6J8oDxXRen1UtBlMLxKoOsqXm1QDY g==;
X-CSE-ConnectionGUID: DEESdLy3RaWFuCEFQoIA/Q==
X-CSE-MsgGUID: japyjq9FQIekvJMnWJhoCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37507038"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37507038"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:58 -0700
X-CSE-ConnectionGUID: 6LO/q8hkTOeihlqunUzmTQ==
X-CSE-MsgGUID: cj2INkWoThymgiWETavRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170789"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:57 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 29/29] accel/ivpu: Fix typos in ivpu_pm.c
Date: Tue, 24 Sep 2024 10:17:54 +0200
Message-ID: <20240924081754.209728-30-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

Replace "Filed" with an actual word.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 6d180c81e6df9..e567df79a6129 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -423,7 +423,7 @@ int ivpu_pm_dct_enable(struct ivpu_device *vdev, u8 active_percent)
 
 	ret = ivpu_jsm_dct_enable(vdev, active_us, inactive_us);
 	if (ret) {
-		ivpu_err_ratelimited(vdev, "Filed to enable DCT: %d\n", ret);
+		ivpu_err_ratelimited(vdev, "Failed to enable DCT: %d\n", ret);
 		return ret;
 	}
 
@@ -440,7 +440,7 @@ int ivpu_pm_dct_disable(struct ivpu_device *vdev)
 
 	ret = ivpu_jsm_dct_disable(vdev);
 	if (ret) {
-		ivpu_err_ratelimited(vdev, "Filed to disable DCT: %d\n", ret);
+		ivpu_err_ratelimited(vdev, "Failed to disable DCT: %d\n", ret);
 		return ret;
 	}
 
-- 
2.45.1

