Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1AD1F62FA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8316D6E89F;
	Thu, 11 Jun 2020 07:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBA36E0F3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 12:08:54 +0000 (UTC)
IronPort-SDR: m2bJJO081GJeMqUjM/Wl6OqmvA00TUng4VplSlln2mQbTjQuUsOFSa4J/mlDxo2YeMbiJpcne7
 fC1OqQ1vL3Qkcu+ry8l3jHnsNCN4ROMY3LQeBx1IbG5rjqgbFH82SY1BF3XxXz+mP7VvqHdQWa
 rZpPUdW6VnYTOsHEQtpwWk33zv0qX0FFBzh7ZrkszBIj6BXGkOO+Gpx4l6BXtuYPV+f15cQq2S
 jqdKDjB9ghcXAsbkJBrqXm9eNOhIQluyCb57h1deMGwr5eFOJ2wIAXzRPm2jb7D6yTcJYPitcm
 QOg=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636794"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 10 Jun 2020 14:01:39 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 10 Jun 2020 14:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591790499; x=1623326499;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=lMw+rRf/58xqMrWREupaSNM5TFwv5TS61riuJjhIH54=;
 b=HmixFjmkwhPz5lryNID3FzKpEglE9hpuC6NUjzzKMkXk0bqeu2WO6nyo
 b1pM3syOhAfJjqMIavqjxFu8fwPX/EjVjxQEppqes/9hT5LghplpnVNlm
 ZYO8CHk3bBGMSZcEkgdxr3ZElmRoFLw23F6jIHKyND03tyawoqNI8NSOs
 yBCbBYSgvcXnXr3sA2J9SSVO0S8x3RSVSROaFk/DRpwhH2gm524Su/4xA
 acZ8Gsu3R8JxcfdPeZc3Taudn04awZBIr5xjMF1Ihv3rulbZOqBlOfwGZ
 +d8nOE6h12jvqJWoj3g3JBuFU9kRE+GkQOKvAz4FnmE0rSHcz0PhU6LLu A==;
IronPort-SDR: JVFFcoNmeahBY+202UFETtF9BQ/kqjIl+wK3IFyUAMVEz7WgF1XTQnZMyFy+7YAtdmMKyUrSMT
 KXxGgjt/wagzSuSpz1RMDVqlVkW3Y2tgjtIJMqxGIV/N8LvsG+ged6KAkitaBQXPxJge3wN+Ds
 sXO7SlyoUvxNpi596pU5970DQoOYTYY1bSDj+8h/QwnL9izrqh6bF6JKxh5mDmxTULQB/VjA86
 mJebEjbfnvFcF5B3NnqTDLtEPZ3HuzHr+TL6oe022idVYWUcn+WSpXp44InfpR+nulrfLADEhQ
 mkg=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636793"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id CDE6F280075;
 Wed, 10 Jun 2020 14:01:39 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/4] drm/panel: simple: add CDTech S070PWS19HP-FC21 and
 S070SWV29HG-DC44
Date: Wed, 10 Jun 2020 14:01:30 +0200
Message-Id: <20200610120131.3069-4-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
Cc: devicetree@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Krummsdorf <michael.krummsdorf@tq-group.com>

Add support for the CDTech Electronics displays S070PWS19HP-FC21
(7.0" WSVGA) and S070SWV29HG-DC44 (7.0" WVGA) to panel-simple.

Signed-off-by: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 60 ++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b6ecd1552132..1673113e5a5a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1315,6 +1315,60 @@ static const struct panel_desc cdtech_s043wq26h_ct7 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+/* S070PWS19HP-FC21 2017/04/22 */
+static const struct drm_display_mode cdtech_s070pws19hp_fc21_mode = {
+	.clock = 51200,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 20,
+	.htotal = 1024 + 160 + 20 + 140,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 3,
+	.vtotal = 600 + 12 + 3 + 20,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cdtech_s070pws19hp_fc21 = {
+	.modes = &cdtech_s070pws19hp_fc21_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
+/* S070SWV29HG-DC44 2017/09/21 */
+static const struct drm_display_mode cdtech_s070swv29hg_dc44_mode = {
+	.clock = 33300,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 2,
+	.htotal = 800 + 210 + 2 + 44,
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 2,
+	.vtotal = 480 + 22 + 2 + 21,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cdtech_s070swv29hg_dc44 = {
+	.modes = &cdtech_s070swv29hg_dc44_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+};
+
 static const struct drm_display_mode cdtech_s070wv95_ct16_mode = {
 	.clock = 35000,
 	.hdisplay = 800,
@@ -3723,6 +3777,12 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
+	}, {
+		.compatible = "cdtech,s070pws19hp-fc21",
+		.data = &cdtech_s070pws19hp_fc21,
+	}, {
+		.compatible = "cdtech,s070swv29hg-dc44",
+		.data = &cdtech_s070swv29hg_dc44,
 	}, {
 		.compatible = "cdtech,s070wv95-ct16",
 		.data = &cdtech_s070wv95_ct16,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
