Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEA56BFDE2
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 00:58:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8257110E4F4;
	Sat, 18 Mar 2023 23:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5F210E4F4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 23:58:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNw-00041d-SJ; Sun, 19 Mar 2023 00:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNk-0056ZL-On; Sun, 19 Mar 2023 00:54:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pdgNj-005zTb-Tl; Sun, 19 Mar 2023 00:54:39 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>, Yihao Han <hanyihao@vivo.com>,
 Jaya Kumar <jayalk@intworks.biz>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Alexander Shiyan <shc_work@mail.ru>, Dongliang Mu <dzm91@hust.edu.cn>,
 Peter Jones <pjones@redhat.com>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Timur Tabi <timur@kernel.org>, Xuezhi Zhang <zhangxuezhi1@coolpad.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Stephen Kitt <steve@sk2.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Yu Zhe <yuzhe@nfschina.com>, Xu Panda <xu.panda@zte.com.cn>,
 Zhang Qilong <zhangqilong3@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "wangkailong@jari.cn" <wangkailong@jari.cn>, Wang Qing <wangqing@vivo.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans de Goede <hdegoede@redhat.com>, Michal Januszewski <spock@gentoo.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Zeng Heng <zengheng4@huawei.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 00/51] video: fbdev: Convert to platform remove callback
 returning void
Date: Sun, 19 Mar 2023 00:53:37 +0100
Message-Id: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8788;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=r47GeEUiKhIRzd604LzE9SshHsY8vNnwnEndN4rcgxc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFk6mxH5O1X401TvHV16mfKARbclG2lGu0mDau
 CJO8k3/v2OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBZOpgAKCRCPgPtYfRL+
 TiILB/9v221lowIpze5yRsKWMaPaDBN5v7zuzOfbGY25vvPp5y4fEPqf4VPkHbmyM4Pxi7OtHzZ
 taKGS0g8hkYNITGL0Bz7dy3aL05quBqg2zJ0WgsSJy6EcrqY7sGYyGia+CPaY10UYWhTzHpQL8z
 YzAGm2w/A1buoJmfqWBLZRsh3nHYhI9P00kVviTm8ARg8LyR7KHiTeL4nADHSHjMnweVR5dst+e
 RIaE3K9zHVguN+cE6ywzVgY4J7OWN9d5Ax46X9HWgkIAI9fGLl37kbq+wWivvDxIeaWc4NbxMtz
 vXEOxaVbR2k/0gEOYFUUeyuXCC+aXpEJTCnzZVCUq5QhZ2+W
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this series adapts the platform drivers below drivers/video/fbdev to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

The first patch simplifies the remove callback of one driver to obviously
always return zero. After that all drivers are converted trivially to
.remove_new().

Best regards
Uwe

Uwe Kleine-König (51):
  video: fbdev: au1100fb: Drop if with an always false condition
  video: fbdev: arcfb: Convert to platform remove callback returning
    void
  video: fbdev: au1100fb: Convert to platform remove callback returning
    void
  video: fbdev: au1200fb: Convert to platform remove callback returning
    void
  video: fbdev: broadsheetfb: Convert to platform remove callback
    returning void
  video: fbdev: bw2: Convert to platform remove callback returning void
  video: fbdev: cg14: Convert to platform remove callback returning void
  video: fbdev: cg3: Convert to platform remove callback returning void
  video: fbdev: cg6: Convert to platform remove callback returning void
  video: fbdev: clps711x-fb: Convert to platform remove callback
    returning void
  video: fbdev: cobalt_lcdfb: Convert to platform remove callback
    returning void
  video: fbdev: da8xx-fb: Convert to platform remove callback returning
    void
  video: fbdev: efifb: Convert to platform remove callback returning
    void
  video: fbdev: ep93xx-fb: Convert to platform remove callback returning
    void
  video: fbdev: ffb: Convert to platform remove callback returning void
  video: fbdev: fsl-diu-fb: Convert to platform remove callback
    returning void
  video: fbdev: gbefb: Convert to platform remove callback returning
    void
  video: fbdev: goldfishfb: Convert to platform remove callback
    returning void
  video: fbdev: grvga: Convert to platform remove callback returning
    void
  video: fbdev: hecubafb: Convert to platform remove callback returning
    void
  video: fbdev: hgafb: Convert to platform remove callback returning
    void
  video: fbdev: hitfb: Convert to platform remove callback returning
    void
  video: fbdev: imxfb: Convert to platform remove callback returning
    void
  video: fbdev: leo: Convert to platform remove callback returning void
  video: fbdev: mb862xx: Convert to platform remove callback returning
    void
  video: fbdev: metronomefb: Convert to platform remove callback
    returning void
  video: fbdev: mx3fb: Convert to platform remove callback returning
    void
  video: fbdev: ocfb: Convert to platform remove callback returning void
  video: fbdev: offb: Convert to platform remove callback returning void
  video: fbdev: omapfb: Convert to platform remove callback returning
    void
  video: fbdev: p9100: Convert to platform remove callback returning
    void
  video: fbdev: platinumfb: Convert to platform remove callback
    returning void
  video: fbdev: pxa168fb: Convert to platform remove callback returning
    void
  video: fbdev: pxa3xx-gcu: Convert to platform remove callback
    returning void
  video: fbdev: pxafb: Convert to platform remove callback returning
    void
  video: fbdev: s1d13xxxfb: Convert to platform remove callback
    returning void
  video: fbdev: s3c-fb: Convert to platform remove callback returning
    void
  video: fbdev: sh7760fb: Convert to platform remove callback returning
    void
  video: fbdev: sh_mobile_lcdcfb: Convert to platform remove callback
    returning void
  video: fbdev: simplefb: Convert to platform remove callback returning
    void
  video: fbdev: sm501fb: Convert to platform remove callback returning
    void
  video: fbdev: tcx: Convert to platform remove callback returning void
  video: fbdev: uvesafb: Convert to platform remove callback returning
    void
  video: fbdev: vesafb: Convert to platform remove callback returning
    void
  video: fbdev: vfb: Convert to platform remove callback returning void
  video: fbdev: vga16fb: Convert to platform remove callback returning
    void
  video: fbdev: via: Convert to platform remove callback returning void
  video: fbdev: vt8500lcdfb: Convert to platform remove callback
    returning void
  video: fbdev: wm8505fb: Convert to platform remove callback returning
    void
  video: fbdev: wmt_ge_rops: Convert to platform remove callback
    returning void
  video: fbdev: xilinxfb: Convert to platform remove callback returning
    void

 drivers/video/fbdev/arcfb.c                    |  5 ++---
 drivers/video/fbdev/au1100fb.c                 | 11 +++--------
 drivers/video/fbdev/au1200fb.c                 |  6 ++----
 drivers/video/fbdev/broadsheetfb.c             |  5 ++---
 drivers/video/fbdev/bw2.c                      |  6 ++----
 drivers/video/fbdev/cg14.c                     |  6 ++----
 drivers/video/fbdev/cg3.c                      |  6 ++----
 drivers/video/fbdev/cg6.c                      |  6 ++----
 drivers/video/fbdev/clps711x-fb.c              |  6 ++----
 drivers/video/fbdev/cobalt_lcdfb.c             |  6 ++----
 drivers/video/fbdev/da8xx-fb.c                 |  6 ++----
 drivers/video/fbdev/efifb.c                    |  6 ++----
 drivers/video/fbdev/ep93xx-fb.c                |  6 ++----
 drivers/video/fbdev/ffb.c                      |  6 ++----
 drivers/video/fbdev/fsl-diu-fb.c               |  6 ++----
 drivers/video/fbdev/gbefb.c                    |  6 ++----
 drivers/video/fbdev/goldfishfb.c               |  5 ++---
 drivers/video/fbdev/grvga.c                    |  6 ++----
 drivers/video/fbdev/hecubafb.c                 |  5 ++---
 drivers/video/fbdev/hgafb.c                    |  6 ++----
 drivers/video/fbdev/hitfb.c                    |  6 ++----
 drivers/video/fbdev/imxfb.c                    |  6 ++----
 drivers/video/fbdev/leo.c                      |  6 ++----
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c     |  5 ++---
 drivers/video/fbdev/metronomefb.c              |  5 ++---
 drivers/video/fbdev/mx3fb.c                    |  5 ++---
 drivers/video/fbdev/ocfb.c                     |  6 ++----
 drivers/video/fbdev/offb.c                     |  8 +++-----
 drivers/video/fbdev/omap/omapfb_main.c         |  6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/core.c    |  6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c   |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c     |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c     |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c   |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c   |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c     |  5 ++---
 drivers/video/fbdev/omap2/omapfb/dss/venc.c    |  5 ++---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c |  6 ++----
 drivers/video/fbdev/p9100.c                    |  6 ++----
 drivers/video/fbdev/platinumfb.c               |  6 ++----
 drivers/video/fbdev/pxa168fb.c                 |  8 +++-----
 drivers/video/fbdev/pxa3xx-gcu.c               |  6 ++----
 drivers/video/fbdev/pxafb.c                    |  8 +++-----
 drivers/video/fbdev/s1d13xxxfb.c               |  5 ++---
 drivers/video/fbdev/s3c-fb.c                   |  6 ++----
 drivers/video/fbdev/sh7760fb.c                 |  6 ++----
 drivers/video/fbdev/sh_mobile_lcdcfb.c         |  5 ++---
 drivers/video/fbdev/simplefb.c                 |  6 ++----
 drivers/video/fbdev/sm501fb.c                  |  6 ++----
 drivers/video/fbdev/tcx.c                      |  6 ++----
 drivers/video/fbdev/uvesafb.c                  |  6 ++----
 drivers/video/fbdev/vesafb.c                   |  6 ++----
 drivers/video/fbdev/vfb.c                      |  5 ++---
 drivers/video/fbdev/vga16fb.c                  |  6 ++----
 drivers/video/fbdev/via/via-gpio.c             |  5 ++---
 drivers/video/fbdev/via/via_i2c.c              |  5 ++---
 drivers/video/fbdev/vt8500lcdfb.c              |  6 ++----
 drivers/video/fbdev/wm8505fb.c                 |  6 ++----
 drivers/video/fbdev/wmt_ge_rops.c              |  5 ++---
 drivers/video/fbdev/xilinxfb.c                 |  6 ++----
 61 files changed, 126 insertions(+), 230 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

