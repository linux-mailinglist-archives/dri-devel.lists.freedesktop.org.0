Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574F9DBF05
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 05:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901DD10ED94;
	Fri, 29 Nov 2024 04:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URzILDjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2716210ED94;
 Fri, 29 Nov 2024 04:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732854399; x=1764390399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wji6YjIlnqf6O8bWabr5lR8AcVZ13iQ7V74zkDuDvts=;
 b=URzILDjO7cwwatlmsJEMjKGvxrSb7hQJFqoa6NYZqvE9Vd8XJ20ng0ym
 j6Xpkdc/8/E7MvNmvTJzoFVjmbpb+3EO5RBJnxt0aPLVfG6MQnfwbiW5b
 3Sg1kNr39kCdAWKj6/bBIxGjgorT1/8er2uPLX52uGOXQ9oj7NvGSqSWW
 WYFr3VJt6anFdc6x6f9m3AOCYNh+KQYMhrZmPzFkUZOD8DagME+qzh+F7
 fnCwgIvRBIwRCsCC/KNh53oCtlm+4nx+Jf33HTPcLXRd+fB1hwN1TSiWb
 PYU/PDfvlx5Lm7GslZdCdYlXoCknzWnRjkZAhxJsNJHJ8AmiYSdxXP4nJ g==;
X-CSE-ConnectionGUID: 3lAQFvAlQhCBFVlH80GdAA==
X-CSE-MsgGUID: Q9mllJGtQ4anVSwkNQ2QlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33028021"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="33028021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 20:26:39 -0800
X-CSE-ConnectionGUID: TEDfzqKDS2iSEsNmY6AuUQ==
X-CSE-MsgGUID: C1bjbqXhRTGF/Fy0ApUm0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="92567177"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 28 Nov 2024 20:26:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Nov 2024 06:26:36 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/modes: Fix drm_mode_vrefres() docs
Date: Fri, 29 Nov 2024 06:26:29 +0200
Message-ID: <20241129042629.18280-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
References: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We no longer store a cache vrefresh value in the mode.
Remove the stale information from drm_vrefresh() docs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modes.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 71573b85d924..e72f855fc495 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1282,8 +1282,7 @@ EXPORT_SYMBOL(drm_mode_set_name);
  * @mode: mode
  *
  * Returns:
- * @modes's vrefresh rate in Hz, rounded to the nearest integer. Calculates the
- * value first if it is not yet set.
+ * @modes's vrefresh rate in Hz, rounded to the nearest integer.
  */
 int drm_mode_vrefresh(const struct drm_display_mode *mode)
 {
-- 
2.45.2

