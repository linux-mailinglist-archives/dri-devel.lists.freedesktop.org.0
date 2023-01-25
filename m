Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6467B51F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837DD10E104;
	Wed, 25 Jan 2023 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A290010E104
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 14:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674658338; x=1706194338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5CHTXALbsHXiaZounAUuzYlhTvfSwhvvRYOHo9rDuck=;
 b=CkmCAxBDgRjlZVPa0z1n3Jiw1oqeMsHfcqj3FtBuGuKtBWjRfUTzA6FY
 QEaXv2fWsKwi3vTihCIiwrWdPMLFUBXq01ccbT4UvDq47t1JWDZZJ0sMx
 M00yz7ZRMugsb9YZFxnKBrsKIIM8++JV1Zk7c8vGTEWT8z3ljYDfm+VUc
 m2fxPDkXYSAufuPawA9de48KkQcpMkJrDtTc7v1IRF4kJeEOqoQb5QbSY
 55e/o8plBsqdQLp15PE5KID45nxAPKQP+Qs3A6Oup+DU8AwO21tOs4edu
 00Y4aWgGGBNBmUZDQYtx39wcEM8/AuPV5NSM7xml+h45A1CpL5O+XXDiW g==;
X-IronPort-AV: E=Sophos;i="5.97,245,1669071600"; d="scan'208";a="28651681"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 25 Jan 2023 15:52:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 25 Jan 2023 15:52:16 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 25 Jan 2023 15:52:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674658336; x=1706194336;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5CHTXALbsHXiaZounAUuzYlhTvfSwhvvRYOHo9rDuck=;
 b=Iu+kmZXQH7OfXvUx9GEXsXPDRoKr/4+07mp3C2cZtb+xkj5TZcN3Mj2V
 Gu9D/s1dauCLTPrDuY+X464DlSIzTCFuH8ZcNlWKkqWR/4bbGbWyz47F6
 IY3pgpPkJT5d7sdMqJKaI2In8UA78WWXpXtiLMnplTRXmNX+JBQ93UQOx
 4U9z8WJ0TtnHpgwowwQ5aqJnhgUWZ0ETMpKD3z/lAqvKqCb2OEQXKXpdR
 euPZ3V7ZYGrDHRJZxt1WLcba9Y1XR5rq59tlF5pq5s8IQP1ZgbNmfd4ex
 vO28LvME67uKiQ3M60AcfSL47Hdf/+Xk5T4DP2M4nfiQ5Vgtuveybl3bz g==;
X-IronPort-AV: E=Sophos;i="5.97,245,1669071600"; d="scan'208";a="28651680"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 25 Jan 2023 15:52:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 98DD1280056;
 Wed, 25 Jan 2023 15:52:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm: panel-simple: add missing bus flags for Tianma
 tm070jvhg[30/33]
Date: Wed, 25 Jan 2023 15:52:15 +0100
Message-Id: <20230125145215.3631071-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The DE signal is active high on this display, fill in the missing
bus_flags. This aligns panel_desc with its display_timing.

Fixes: 9a2654c0f62a ("drm/panel: Add and fill drm_panel type field")
Fixes: b3bfcdf8a3b6 ("drm/panel: simple: add Tianma TM070JVHG33")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..fbccaf1cb6f2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3598,6 +3598,7 @@ static const struct panel_desc tianma_tm070jdhg30 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
 static const struct panel_desc tianma_tm070jvhg33 = {
@@ -3610,6 +3611,7 @@ static const struct panel_desc tianma_tm070jvhg33 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
 static const struct display_timing tianma_tm070rvhg71_timing = {
-- 
2.34.1

