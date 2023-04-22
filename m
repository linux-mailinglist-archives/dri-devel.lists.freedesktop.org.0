Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F226EBB78
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 23:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B125710E24B;
	Sat, 22 Apr 2023 21:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A9510E24B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 21:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1682198667; i=deller@gmx.de;
 bh=+EVDx9za0KENCzQp3YBzKgAvaI3bQIEgyxTHg/MTi7U=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Q+Ch0RVBKGdjaTbiJ7Ssdz07LPV9cSySLe2dfudq8fYvhCEiBftOob2teyxPwSqzo
 eVFF0/vePRHMlXApaLvxeaUWCJtY/6s/gRW9eLlRV/120tKnx8gNpLRRQQeSS/jXxL
 NLgIs6DZitQ3SM7HWwxmFbySxy0sFO6xZZIJUP0S5gX/GFOCZwu+4lg2Sr3pwjH12X
 ZchLFYu4pBpXtk1mYTiP/PBMUWp5q06be4Bb7R2Cio7wnospVuT0G6K6r3ES2n6Ir3
 WKmoZj24Z5HAcgu+biEq1BjfECsuM0XzYQfNEUnQ55QOkyeuk66PHH8myTNzPhoizq
 4Q3w+HouduGKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.157.94]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1qShjk1wi3-00cPQZ; Sat, 22
 Apr 2023 23:24:27 +0200
Date: Sat, 22 Apr 2023 23:24:26 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: modedb: Add a 1920x1080 at 60 Hz video mode
Message-ID: <ZERQiub7tuTxHCUy@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:+TyjcFg1WdgaxwYMniyfWtzIeDL6B25BRVvQ5QI9uQ5CSdt9QJW
 Ibipd/e6snnVhi4+jv98VrszI3tOzL4rV2AmmNnbber8gqCyupcOL0tLhS0S9OWE29eggpY
 +yxYhG83Pzxu4gn+rhuJzQuW+ykPb7UtU/SlmKV6wAtwUjbrIP7L/gFoyITWcpnMeRYP+nn
 uNTKMPAictADNcNqXZNsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LqlKzxsQJbM=;b01QMWU3U2/EdhOoff5I7z3Plba
 ciE14hHY7c7mTYgQjSJjdycOlGEV/FweWeTly8s+nx1Otaxt/vl+0p1wbc1s4xuYI3MzFbziG
 qfCxMLOzYv5H3LgyNPoFwrT8Q4Z6qsZEx7bdxpPdtd01Aia9B1KIYzcCSWm3QFF39cGnw47PN
 Z+Fag2SAbeAk9Vn2hI+bV/ALQgsMSWX28T4MjzeKLXYqi6ZxcwU1HiHwVxwXFPWtBQZyRZSJX
 aqorahl771p3NTI7Av0TIPhRr6EVFNSBrhNK969ZFqxmBJKt1EK2PaFU3QmMywm5Ul0MTOxJt
 HNHCS8T3XNW1QkDRDo2K2leq/152w2hNeHlQ3AV4js8zkSYWAj0JDUvlH5x79EDZ5oCvbQ7W3
 k+MNNQM2HaFLe7b7IbhStvSMM7ym/kLJW7IJbjuLFUX8Fkkx3dPdeQpU6PCs9B22RumBiu6QD
 wYsEBhjuJ9Km5KdjGnlo7+5lJu8aMiFwTGwMOgCjwRwFze43Hwhsu+4FhNONU2jqILf7v/I3u
 noivdXytbgQ/ZiNFcjIg9gHeXqqS88Pnmo8W/xe0Ti1lJAZzC72bx6bIcyi+coPTSkN3oppN8
 SamW0GJt6+3tSHY3QbPvhNB0cds+9d2c8YCR/XokzBNmNLkRmXcbDWVe6HISMow2x2YKZG7+z
 By7F2Kf6lC9BUtXxDGZJc7HzQxvlHqnKybKnBfrmKz6F+tb9KiQBvlvk84p3jbdf+GsSaQuPV
 8BGzrdtYv+nNhVtmg2vbQikrFSlSxQ5RyQvSpZPd9YAe8bNONLEQY/l3Gm3D1x1qlIZaZiWir
 0fuRLNP6K8ZAjb+IqcIUPN72VhEJMIZXa42+lwy8nRrQ2TMA6EOyh6h7aeRppX592ULRozvi3
 2Mt0a8Rr/bSvtA/h9QZS52909gTbFDfdCDkC2z7DIoZUqiRI/+atneD/uCbfqx/ATUQy70i1P
 NHa27w==
Content-Transfer-Encoding: quoted-printable
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

Add typical resolution for Full-HD monitors.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/=
modedb.c
index 6473e0dfe146..90915a4caac6 100644
=2D-- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -257,6 +257,10 @@ static const struct fb_videomode modedb[] =3D {
 	{ NULL, 72, 480, 300, 33386, 40, 24, 11, 19, 80, 3, 0,
 		FB_VMODE_DOUBLE },

+	/* 1920x1080 @ 60 Hz, 67.3 kHz hsync */
+	{ NULL, 60, 1920, 1080, 6734, 148, 88, 63, 4, 44, 5, 0,
+		FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT },
+
 	/* 1920x1200 @ 60 Hz, 74.5 Khz hsync */
 	{ NULL, 60, 1920, 1200, 5177, 128, 336, 1, 38, 208, 3,
 		FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,
