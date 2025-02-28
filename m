Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD6A49556
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E4810EC3A;
	Fri, 28 Feb 2025 09:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq3TrLgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3D110EC32;
 Fri, 28 Feb 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735510; x=1772271510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8ZwSycnAAoeXxYSgP+PpFQhMnGYeSM0+zplG6RLrtc=;
 b=Lq3TrLgr5KTXJEHZL3qR4Sfy6MdSmVgTMUFl3OIwqlmNniJBFpmaIs3E
 m4Gu/OXmKOtrniBWqiERof9q+Dfu1K13QIIT9HRvc+X5wQC/3Up1CRIoa
 r8P2COtAtA6EVvAs5fgrtv0XI7PEow/6NaPvHdj0a+ReOolpE5djCeuLQ
 otnyRf8tC8Q7upeOAQcgdYWn9fc97m9zl58xJzqK/vVXfft+xerppCTCa
 fTbL1RJYjeEl7vkGmJdTHZQZZkFE73sm1GG6C8dB/cCa5bSvO0v67+12h
 5Hmb7nHJIBAgrl1kb7VO+q9ltQBdXzhx7F3pMcPxiUx++Bh76xecKEtDy A==;
X-CSE-ConnectionGUID: csrg9xp7Qxq+JMOnG9l8KQ==
X-CSE-MsgGUID: syxU5Kc1Qy+yPrH1zyQUqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293054"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:25 -0800
X-CSE-ConnectionGUID: Zl5u2pKYSkieTxUiEcp41w==
X-CSE-MsgGUID: VpgWzHQPR7SwFBzh1cSRRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466399"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:23 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 1/9] drm/i915/fbc: remove one duplicate forward declaration
Date: Fri, 28 Feb 2025 11:37:54 +0200
Message-ID: <20250228093802.27091-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Remove the duplicate "intel_display"declaration from intel_fbc.h

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index df20e63d6102..2e1dd7e8a18f 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -13,7 +13,6 @@ struct intel_atomic_state;
 struct intel_crtc;
 struct intel_crtc_state;
 struct intel_display;
-struct intel_display;
 struct intel_fbc;
 struct intel_plane;
 struct intel_plane_state;
-- 
2.43.0

