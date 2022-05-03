Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4A519917
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DF010F21B;
	Wed,  4 May 2022 08:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD2A10F21B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:02:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="255159538"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="255159538"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="516922799"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:02:06 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:02:03 +0300
Resent-Message-ID: <87v8ulpvyc.fsf@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:24:38 +0300 (EEST)
Received: from orsmga001.jf.intel.com (orsmga001.jf.intel.com [10.7.209.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B43E7580808;
 Tue,  3 May 2022 02:24:26 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="598996072"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="598996072"
Received: from fmsmga105.fm.intel.com ([10.1.193.10])
 by orsmga001-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03
 May 2022 02:24:20 -0700
IronPort-SDR: N4aF8yglwXMy+EVQ820DLD0sVpVUHr/nAgFP37Yk8ZPnqazL8USjRFwYRxFNfIm4Jb23YaGbHI
 n1JLXPP5H76A==
X-IPAS-Result: =?us-ascii?q?A0GIAQA483BimLHS/INagQmBT4I9AYE8J1WEEj2JAIVmg?=
 =?us-ascii?q?j6WfIVQFIEsNRIBAQEBAQEBAQEJLBMBAgQBAQMEijQCJTUIDgECBAEBAQEDA?=
 =?us-ascii?q?gECAQEBAQEBAwEBAQICAQEBAgEBBgIBAQEBAhABAQEBAQEBAQkLCQcGDAUQD?=
 =?us-ascii?q?gUihS85DYI1BQIDGA5uSgk1AQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBARACD?=
 =?us-ascii?q?VJHAR8BAgMBAQEJFw8BDQEBBAopAQIDAQIGAQEIHAIeBAQCAgMBUxkFgniDG?=
 =?us-ascii?q?AWSFJsXeoExgQGCCAEBBoJdgyyBXAmBECyJQ4QgeicQgVVEehszgzWBU4JZZ?=
 =?us-ascii?q?oMJgmWVN4EOgkCBAqISnXk0B4NOgTsGDJ41M6hVLZY0olGET4FjAjiBWjMaI?=
 =?us-ascii?q?4M5URkPjiwWFYM7imFyAjkCBgEKAQEDCYVHAQGEYYFuAQE?=
IronPort-PHdr: A9a23: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
 FMz3brkINFLZcXA0Et4Zwwi9Lk=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:VfobIqpOvVd7t5vk8w6L3wYaV5q2eYIsimQD101hICG9vPbo3/
 xG+85rqiMc6QxhJU3I/OruBEDuewK6yXce2+Qs1ImZLULbUQeTXeRfBM7ZskXd88OXzJ8o6U
 9PG5IOfuEYJ2IK//oT2WGDYqEdKDPuytHguQ6m9QYZcegIUdAb0+4GMHf8LqSnfng7OXNjLu
 vu2iMvnVPJEhh2H6aG7zs+LpP+TvLw5djbiHU9dmAaAWe1/FeVAH+TKWno4v4ZaV0vsNQfGB
 D+4nXEDirKiYDK9vaw7QXu06g=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="353877151"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="353877151"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022
 02:24:18 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5216210F817;
 Tue,  3 May 2022 09:24:18 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013610F820
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 May 2022 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651569857; x=1683105857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fo30c48GBOW/78YLqeQZAxUs5nIpCxpLWhzdLHQfrM0=;
 b=IGGX5y4REGqDi2gcM1VHkCU9hFzI4n34EYZJ6rGW2imDRNHFaRedj+XK
 4i5bx2LsML4Lfg20xoqajcoo2T/7pP7W7AVfTf1OYyQxV8u08+thdp8bz
 4TvoyoD2PCPI8YeDJrYVBHa07ejuxLAJcKLSUS0uTxWVK300E9gpZpknz
 4X1yyIb4UA5OjKmIZUcDHaLs/7RrwsgTSNT6fvhtAOGxUWwn7rErxdDiJ
 /QlgNyJ5+B62vqdJEkPogMuMsibXBC1XCptp0URW/6t9xG8SJv1KMlloi
 On6QOW7Wne39CESswu+6uCtnnW3R7FtEIv/gcaNA88bwejFIXTwDiLL0y A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="249415475"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="249415475"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="562142053"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:24:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Tue,  3 May 2022 12:23:46 +0300
Message-Id: <2ac1c55f94a08d5e72c0b518d956a11002ec85c1.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH v2 01/20] drm/edid: reset display info in
 drm_add_edid_modes() for NULL edid
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a NULL edid gets passed to drm_add_edid_modes(), we should probably
also reset the display info.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc43e1b32092..1dea0e2f0cab 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5697,6 +5697,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	u32 quirks;
 
 	if (edid == NULL) {
+		drm_reset_display_info(connector);
 		clear_eld(connector);
 		return 0;
 	}
-- 
2.30.2

