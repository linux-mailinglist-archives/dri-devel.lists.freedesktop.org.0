Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E4726FC8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F736E3F0;
	Fri, 18 Sep 2020 12:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FF26E3F0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:33:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IBb2So026497; Fri, 18 Sep 2020 13:47:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=rmJS0meRUI8CXFHeXh9SHVzF08iyGAdFpDY9lNupxkc=;
 b=sCal9eFhz1PRK3+T9uBF7MgFkIODmDI+9vYkhO3B15S8l42xFdhk50FXJhn6aX9zlXZH
 tfaKDZrelIMFwcbSOAyZ+mOKYPNZJ0f3AUIzgmXAaoSMqdVGuD1pLky0ZphYJGDN21wx
 70JOOxjusO6UMxXeOimykCOwMMmgex+WCMHirfeEPdmNLjpqhd0feM5rNkgLvfQE6UXm
 eZuVBwmwQC/jBu3tI2SrZm8GWWt6sg4JwHdPfo4HhP2R7ykYP1kyEDiVwGjbyy0I53Jt
 VJxY5hyzVenKenBvj+e4j5mUdq01glbGsZgn9b37LLYoLwfuKp2ntoTi7hZMMTpZtscN KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k67c0s95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 13:47:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 940DC10002A;
 Fri, 18 Sep 2020 13:47:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81AA9222CE8;
 Fri, 18 Sep 2020 13:47:20 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 18 Sep 2020 13:47:19 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Antonio Borneo <antonio.borneo@st.com>, Thierry
 Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David
 Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/panel: otm8009a: remove hack to force commands in HS
Date: Fri, 18 Sep 2020 13:47:18 +0200
Message-ID: <20200918114718.11106-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Antonio Borneo <antonio.borneo@st.com>

The panel is able to receive commands in LP. The current hack to
force backlight commands in HS was due to workaround an incorrect
settings on DSI controller that prevents sending LP commands while
video out was active.

Remove the hack that forces HS commands.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c   | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 6ac1accade80..f80b44a8a700 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -99,20 +99,6 @@ static void otm8009a_dcs_write_buf(struct otm8009a *ctx, const void *data,
 		dev_warn(ctx->dev, "mipi dsi dcs write buffer failed\n");
 }
 
-static void otm8009a_dcs_write_buf_hs(struct otm8009a *ctx, const void *data,
-				      size_t len)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-
-	/* data will be sent in dsi hs mode (ie. no lpm) */
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	otm8009a_dcs_write_buf(ctx, data, len);
-
-	/* restore back the dsi lpm mode */
-	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
-}
-
 #define dcs_write_seq(ctx, seq...)			\
 ({							\
 	static const u8 d[] = { seq };			\
@@ -400,7 +386,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 		 */
 		data[0] = MIPI_DCS_SET_DISPLAY_BRIGHTNESS;
 		data[1] = bd->props.brightness;
-		otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
+		otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
 
 		/* set Brightness Control & Backlight on */
 		data[1] = 0x24;
@@ -412,7 +398,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 
 	/* Update Brightness Control & Backlight */
 	data[0] = MIPI_DCS_WRITE_CONTROL_DISPLAY;
-	otm8009a_dcs_write_buf_hs(ctx, data, ARRAY_SIZE(data));
+	otm8009a_dcs_write_buf(ctx, data, ARRAY_SIZE(data));
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
