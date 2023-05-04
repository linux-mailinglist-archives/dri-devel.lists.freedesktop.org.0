Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ABA6F6C00
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805D810E4D0;
	Thu,  4 May 2023 12:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D134210E4D0;
 Thu,  4 May 2023 12:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683203691; x=1714739691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Oru+5Bt2h11SAFH9D08/fAPU9T8j8VBBEBhLvrWDnAE=;
 b=McCQP5rUjBEkBQq23rZsLw4gy8SV7dyqf+H5hO1WGOic5Q1OtwSroHn/
 145WhMfegYXE6SlpL83jdQVkKXUjoUkCBnxhD0+9HjE10smBw13B4OYNn
 QbZ74tJamVCxlYPXfiWRe2g9lijqUvG+eJLByIiB3ksjH4ZknPrGH3XV6
 0j0APGMCodDRWHPeF6/rztNnDM/vClS9B75bJfMN1t8k5I5MkWg8kweAK
 IEcYjaV5dJzjY02GWzibJFRdmtJpqunpAjCN2+7bCkPhQMB7cLEn2v7gr
 fgDIoSju6AHO2dDUqSGkqNCHAmERDV53srtK7QFxyF42CEh8ewAYz1rcy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="328536534"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="328536534"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674529910"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674529910"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:34:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/connector: document enum drm_connector_tv_mode
 DRM_MODE_TV_MODE_MAX
Date: Thu,  4 May 2023 15:34:44 +0300
Message-Id: <20230504123444.1843795-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for the DRM_MODE_TV_MODE_MAX enumerator to fix the
kernel-doc warning:

include/drm/drm_connector.h:204: warning: Enum value 'DRM_MODE_TV_MODE_MAX' not described in enum 'drm_connector_tv_mode'

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_connector.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7b5048516185..e6478fafa6b0 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -199,6 +199,11 @@ enum drm_connector_tv_mode {
 	 */
 	DRM_MODE_TV_MODE_SECAM,
 
+	/**
+	 * @DRM_MODE_TV_MODE_MAX: Number of analog TV output modes.
+	 *
+	 * Internal implementation detail; this is not uABI.
+	 */
 	DRM_MODE_TV_MODE_MAX,
 };
 
-- 
2.39.2

