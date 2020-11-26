Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8BC2C56B6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 15:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256F36E8F5;
	Thu, 26 Nov 2020 14:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A4F6E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 14:12:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AQEBpGx052408;
 Thu, 26 Nov 2020 08:11:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606399911;
 bh=h8FvSlW6MYmLAlmNm/rV0XpPr72kXTVgiwM9oYW4MMM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NTOShYdv54TtN9SpqxKPn3Xk4FZdWAjP5Bt6zY9ONfBQzuyZwe0Fqjx6qP+OKvED3
 rrLec01H3eeQiUOYbyih6iP9D4dTufZYN1av9oSclUmHiESmV9iLqcBiVa68l/9YBI
 DTzdGNybvLQxRgM0tTd/qgZ4EBBbViycbrxF/aZE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AQEBpB6002918
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 26 Nov 2020 08:11:51 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 26
 Nov 2020 08:11:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 26 Nov 2020 08:11:51 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AQEBndX044966;
 Thu, 26 Nov 2020 08:11:49 -0600
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
Date: Thu, 26 Nov 2020 16:11:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
Content-Type: multipart/mixed; boundary="------------F4CB996E1B69C173202E7352"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------F4CB996E1B69C173202E7352
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Aaro, Ivaylo,

On 24/11/2020 23:03, Ivaylo Dimitrov wrote:

> Is there any progress on the issue? I tried 5.9.1 and still nothing displayed.

Can you test the attached patch?

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------F4CB996E1B69C173202E7352
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-drm-omap-sdi-fix-bridge-enable-disable.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-drm-omap-sdi-fix-bridge-enable-disable.patch"

From 97c55032ac5c44885b0ec219467699af0b6153c1 Mon Sep 17 00:00:00 2001
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Thu, 26 Nov 2020 16:04:24 +0200
Subject: [PATCH] drm/omap: sdi: fix bridge enable/disable

When the SDI output was converted to DRM bridge, the atomic versions of
enable and disable funcs were used. This was not intended, as that would
require implementing other atomic funcs too. This leads to:

WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268

and display not working.

Fix this by using the legacy enable/disable funcs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Fixes: 8bef8a6d5da81b909a190822b96805a47348146f ("drm/omap: sdi: Register a drm_bridge")
Cc: stable@vger.kernel.org #v5.7+
---
 drivers/gpu/drm/omapdrm/dss/sdi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 033fd30074b0..282e4c837cd9 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -195,8 +195,7 @@ static void sdi_bridge_mode_set(struct drm_bridge *bridge,
 	sdi->pixelclock = adjusted_mode->clock * 1000;
 }
 
-static void sdi_bridge_enable(struct drm_bridge *bridge,
-			      struct drm_bridge_state *bridge_state)
+static void sdi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 	struct dispc_clock_info dispc_cinfo;
@@ -259,8 +258,7 @@ static void sdi_bridge_enable(struct drm_bridge *bridge,
 	regulator_disable(sdi->vdds_sdi_reg);
 }
 
-static void sdi_bridge_disable(struct drm_bridge *bridge,
-			       struct drm_bridge_state *bridge_state)
+static void sdi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 
@@ -278,8 +276,8 @@ static const struct drm_bridge_funcs sdi_bridge_funcs = {
 	.mode_valid = sdi_bridge_mode_valid,
 	.mode_fixup = sdi_bridge_mode_fixup,
 	.mode_set = sdi_bridge_mode_set,
-	.atomic_enable = sdi_bridge_enable,
-	.atomic_disable = sdi_bridge_disable,
+	.enable = sdi_bridge_enable,
+	.disable = sdi_bridge_disable,
 };
 
 static void sdi_bridge_init(struct sdi_device *sdi)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--------------F4CB996E1B69C173202E7352
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------F4CB996E1B69C173202E7352--
