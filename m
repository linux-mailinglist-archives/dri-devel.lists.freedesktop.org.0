Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AFB1334BF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 22:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A5C6E09A;
	Tue,  7 Jan 2020 21:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5886E09A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 21:28:05 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MGhi0-1itpwb2ZJS-00Dn1Q; Tue, 07 Jan 2020 22:27:51 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: panel: fix excessive stack usage in td028ttec1_prepare
Date: Tue,  7 Jan 2020 22:27:33 +0100
Message-Id: <20200107212747.4182515-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oXNXLfN/VIsDQFv/SJwQtBS570cMqOiIoOPgTiSj3Dsp8Mast6V
 a6nIAwxIdJ7QG8kqaKHVXD9UMVwHTrPE3j3Y3Y83ybDD2FhmplbMZohwEB70kjxFVxHmGZS
 pyNK70KcneApCD8axx8ajqRUB3eSiIPdg/sGcqYEA5Rl6QBHXZ6yOtpQvGO21SI63N0Rvrq
 2nsYRN5jI3BB6x6CtxvLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wybcYGCqFeU=:v6JPZuxuKq6KdDpZhERSQB
 IDxwXvZZ3iIThfYussrtVEboFQsYXSC7qEaAUE2XWaYfMkZWryLaflyAWfWUsATwXMg6kkTS4
 2fkNkoMGkNpx4MCKQifZ0nsPoKH47LK3qlyhSzjot+pm7dGqrUBzd3iRu8R5fefc2RZIZREic
 QWSvAKtAQWM4Ojyk1h0Cv/8n+0At0t7Wag+VUislcxZY83IZULPztI7gUxC9ZGxMgNMBZzerm
 C1FjL3xOW2Nxg609m+EefeTYjxDmVlKyYPjQgyfmSc2AJgMYU68YS05MCx13u5OZXBNWakZjl
 /KgJ+JOuDhchGWb7s+vpjoki5rPqogRFfpHTOzCH+e3z3DlaTrUMmhBWgYv4j8qnZ0dIAjChs
 4I/vpmANC2amo+pw4P/G/yZzXZS3X3vd/umZZfYB5e+bV2zPMLRhZKmYQiiaKFAbPNNpHrpKi
 gdKXp1DNdRwtC+mYFMVC9JPVQgmI8nSS6EjHfUbOFOaVjHwtkP79fOsjFMvY2ZL6aotERGia5
 qJJl0KLotFNKZuev7SN06GiCBcyLIHv04A8yRtwa5ZX1/EnLjygKqHOMtpZjmSH+RVCLfMu8F
 Qcj29MPNM33tUkq7Xj/XcC/l6vgOfoe7g11HPeEmG0uOuA4G+9PCOgjZgcoYfhdabasgvEtvG
 imdpeO5Eh/+GrUr9uEn4xRcNebjiNxHFMQtiFCb8D5OP2Vp3CdiGY4qYvlMszQWLo5vk/Mgby
 DATbiwe4fFXaHGDfofaqzQudl4XduR+bPZFgTm+Ggp36Sc1O3ogVU69gSKhZ89G4deJiSt+i5
 X+8wsPqcTE9MHwxukKoezId5n8vFNAxzQx+tEcRaHTBRmfj1FiOVfaxLtGvlOlJIvvLEGeQAk
 3guOx3RvjSFld8FR+sHQ==
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With gcc -O3, the compiler can inline very aggressively,
leading to rather large stack usage:

drivers/gpu/drm/panel/panel-tpo-td028ttec1.c: In function 'td028ttec1_prepare':
drivers/gpu/drm/panel/panel-tpo-td028ttec1.c:233:1: error: the frame size of 2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 }

Marking jbt_reg_write_1() as noinline avoids the case where
multiple instances of this function get inlined into the same
stack frame and each one adds a copy of 'tx_buf'.

Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
index cf29405a2dbe..17ee5e87141f 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td028ttec1.c
@@ -105,7 +105,7 @@ static int jbt_ret_write_0(struct td028ttec1_panel *lcd, u8 reg, int *err)
 	return ret;
 }
 
-static int jbt_reg_write_1(struct td028ttec1_panel *lcd,
+static int noinline_for_stack jbt_reg_write_1(struct td028ttec1_panel *lcd,
 			   u8 reg, u8 data, int *err)
 {
 	struct spi_device *spi = lcd->spi;
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
