Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B01A2A4E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D1C6E97A;
	Wed,  8 Apr 2020 20:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FB06E97A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:27:42 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MHGPA-1jZQRE3rtY-00DKmr; Wed, 08 Apr 2020 22:27:21 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>
Subject: [RFC 3/6] LiquidIO VF: add dependency for PTP_1588_CLOCK
Date: Wed,  8 Apr 2020 22:27:08 +0200
Message-Id: <20200408202711.1198966-4-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408202711.1198966-1-arnd@arndb.de>
References: <20200408202711.1198966-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5gAXVieAiTDMVgOwMbM5A19MMx9acTKbfT3cm2YOhdzeb/EYJqs
 Te4CgqXnmQtMe+2OOhCDLGzIANrnZ90bJvbRpt7xp9tPopYPK34AYq2XwYjnPbCemctGCMx
 N+rTuDxeII+rMjAK7irDB1W8ndokokIDC2krQnC8xvnrVTQvZQFWn5Hrgw71ufxQQZ9KOIb
 TP8qo/XObsotxVQ27d5RA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NRuTrC3phjI=:xaa2zTMfhPfNkIb3+uRvAz
 aOg1rZdZRmxxIc6g6+VG5HeTHmY1F7Z4l/de6QyK5vKhYfA3qz2OjA+rcwjt1nS463vOEuvHn
 f9p2Q7lWRUYsSHTXijhpB05u3xZ7R5lK+L8Ox6JCzrWJehS0UitxV6Q4qeI+GDlCr4P0a9O5B
 sr4hwwRsOkiwFhQBledXwf6Nwc28VN3epP5RXHdQWY0iFH3razZsmP7OKWbcDK+08IX6VRiEo
 De5Z1WflnClFpJVjM3e46r6H2d+8MMkk7nEA4GPWR5AJ4DGrTuSHHtfHHyNZ3V0mhzyils6QX
 0BpRfqCNgru0vdl+zDCVmFMsKTG/jQl9IgapKImPnv3eHAGYWeRow6pgXpJjrqWGL4ifzW3GQ
 jdWzggVOZMjYStPc6g9OunbziB1Oazlh97E+SSwjIxsDLLRTiJTX+tJlBrtf3yL3BAyuvbXQk
 E8MBAxGXfuuxNNhtm4715Uwce/UGLAW3xqgf8hwyfqLqy8ZntI8aoe9hbkfl+JglQQd+dBG4n
 P4dehVuWxT9noRIrrqbj2FjxpDYrvhV7FknXKtaPr/NkZoNeS9sSQ7mUUbK4B0E7frN4sWdhp
 8zrl/PiFPsrtJPqIMgWRO0ZHt7lS4fz9thQesQOYzcgXYXy6I1Ps4CHTaSlp0XrAvjRtJ7BNU
 L+HqTRIsrc62vZu+A3tCOjwHMYZBUjg7Vp/B++OdPCte8NMuxVbCKjIkcP5/AS8Lqzfm1i7au
 L9aLAOSr7a5Ra7Ih0p6IdsnwIhiwTyhYnjzScDb5J5P8LRHDaP04BDu1wrQXRZ7j3JpflN667
 ura8Or9OeUg355x6QIVnmkKTzR4Vdr0dmLd1ifBX5y0q7LS8BQ=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Saeed Mahameed <saeedm@mellanox.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'imply' keyword no longer does what it was originally
introduced for:

lio_ethtool.c:(.text+0xba8): undefined reference to `ptp_clock_index'

Use a dependency instead.

Fixes: cd7aeb1f9706 ("LiquidIO VF: s/select/imply/ for PTP_1588_CLOCK")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/cavium/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/Kconfig b/drivers/net/ethernet/cavium/Kconfig
index 52806ef20d2d..e483c3001dc6 100644
--- a/drivers/net/ethernet/cavium/Kconfig
+++ b/drivers/net/ethernet/cavium/Kconfig
@@ -66,7 +66,7 @@ config LIQUIDIO
 	tristate "Cavium LiquidIO support"
 	depends on 64BIT && PCI
 	depends on PCI
-	imply PTP_1588_CLOCK
+	depends on PTP_1588_CLOCK || !PTP_1588_CLOCK
 	select FW_LOADER
 	select LIBCRC32C
 	select NET_DEVLINK
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
