Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0960D5F51ED
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 11:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A738A10E48C;
	Wed,  5 Oct 2022 09:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BC010E57C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 11:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664884635;
 bh=Or/aPh7eogqATn+tg8HPfzVN9jidrWUhMOxQ+7Utp4I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gpPh9IMFYslGBUYRM6oUbtHoA+YYmf52RVy6mq70cRv80+czlMIsKMwCFPvYH7Yfw
 5zbd89NFfIqrJXTLSu3OGT5vBvLJDTbnP9sRedU38nr/sSy6JFvTLN+r0XYx4092+A
 UzmsWmn9dfHbpaIdIFPApslNAm12SdVmUzQ+Rd0s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ubuntu.localdomain ([77.246.119.226]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhU5R-1pBQOO2PDP-00ebhW; Tue, 04
 Oct 2022 13:57:15 +0200
From: estl@gmx.net
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 1/1] drm/bridge: ti-sn65dsi83: Remove burst mode
Date: Tue,  4 Oct 2022 13:57:10 +0200
Message-Id: <20221004115710.1553357-2-estl@gmx.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004115710.1553357-1-estl@gmx.net>
References: <20221004115710.1553357-1-estl@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:chooaKQ7x68BT3WVfihh70QmB1+7cr7osCTqjmEA1lWkuuKZSJG
 YVwG2LyS7MtNcx+LwBBJZokrvnDH0Cnx9Wz4EbwHgkYSpyZQ13MAUTdGUVwUK/ja/fITlqZ
 G1vn4FqJIbE9BwU51Z1n43H57IE5aWPasstnVIlUuMzLo3Xae0lSkZkdtt9Wx67TPeKrxcE
 u+vZCTSlKTFfjMK8yQPfA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GGVFFDK8ATM=:m0eBGSKjgC4Ohr8jLbaae7
 ELt9dqECLleRc4WLlHL3FJ6A8VmGr44iIACqlyzLTrEdEaAVBVMrXONeYNeCH5+V8qQCi1yZO
 f0/McuFqyLnAS29gCWaXbf+a+aXzHr833o9ui6RxmOQRlUnNdrnN1nWco9rGZoApsKwS1zPnx
 dJPZJH9tuEou8mCmJpJP+Ph4nYRpSnhqcCcYkCzYGq/Jxstu8cY42MtIbGCqhAWh8LWZ6fz4k
 +EdhxhTDfg0KiWE58r2GXooh+eXmZhf2fn3zJL1YKcAN6B6jHsVZkx/8Vrck1Vw1EVigVI2VV
 VBPo/JBLSpzJ5DtdSKbaJ4RBCvzbJYkTlaS4Wu1MgJdUTe6ayufZvF1eiyp/6KhH1fRg6MLU/
 RxnX3NWBO7lYS/JQRZg/NypRcTJamOj0bC6/XHHVeKnUXqot+tvImqAr4iX1CmUjx4TD8EkjL
 72AmBr5VtOqAxmD1DO9SZxVQUy3x7UEkRQud/ZGYzyffqtkbzSOcdxjjcQDwYtNfFEdM5blm0
 x3dpnN3SZOFJTJusm6pmnrNva91OFEMKPD79TcgKWzXt+Vl/TzJaTZ9ggdWIjdthkfnWUnUkX
 C6YALZ7EXhMIHtltcMXWSXXIxZPJvihqrKQDYnh7W4KoF6r/Xv73D+83TvAjEA2mVOmnc835L
 a4sJm7grUS/bV1D7eVe1dlLXMiz6KilSGyfdYgRvODobCYHfhgJzg/XDRsGAcRqW1RHb9+oc2
 XMjtKqiKA4FC2JjD3oIUZ0KxPV5L9IdupWwqs4+fCFJDQ+XpuDkw5JIawkiBZLP7rd5DC0Xv1
 1GGew2o5qkbxqA+U7YTHVh4XN4fW8H0jUtuky76CavjXSgJNBVCdh0/4nupC4Pzhwg/CzWQy6
 TnxDNBEJcqoeD/1BLcR25DG9DlVVThMG3o3z+0GV7XxuUbGy3yyrwV3KuSYuaaIwkoVaqxG6+
 n6u4tBwCHzJ8NU5nbPAmL/CLIJgrjS3ATSBCi9Zi8oPDEWVgjXWtoRYiXsVvvJ23Rsf+atRtM
 BXO3aM3oVRhzmyfCpqIrPCExyHErC0BTf3KQp+U+yEDh1bXiUVoYVSk4F994qchefmx44Qkr4
 aVbGE1FAZTDEBge4rO5m4pTo3q466RUcfb2tu07uEOVTXpKZb0GFc+/Y62KulJYNn2Q3YpBPu
 d5YMxqznOWWRD6AReB172pBdWW
X-Mailman-Approved-At: Wed, 05 Oct 2022 09:45:02 +0000
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
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 Eberhard Stoll <eberhard.stoll@kontron.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Remove LVDS panel overclocking for some configurations by disabling
burst mode for this chip

With burst mode enabled, some DSI controllers increase their DSI lane
clock beyond the clock which is needed to transfer all pixel data.

But this driver operates with a pixel clock derived from the DSI lane
clock by a fixed prescaler. So, every increase of the DSI clock also
increases the LVDS pixel clock. In this case, the LVDS pixel clock is
overclocked.

This is the case e.g. for synopsys stm DSI bridge
(drm/stm/dw_mipi_dsi-stm.c). With burst mode the DSI clock is
increased by 20% and therefore also for the LVDS panel.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
=2D--
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridg=
e/ti-sn65dsi83.c
index c901c0e1a3b0..ffc39208536e 100644
=2D-- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -272,7 +272,7 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,

 	dsi->lanes =3D ctx->dsi_lanes;
 	dsi->format =3D MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
+	dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO;

 	ret =3D mipi_dsi_attach(dsi);
 	if (ret < 0) {
=2D-
2.25.1

