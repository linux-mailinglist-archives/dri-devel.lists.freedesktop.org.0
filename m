Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD531BCEB3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 23:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8931D6E99E;
	Tue, 28 Apr 2020 21:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B536E90B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 21:31:57 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mhl8Y-1iycqy1vmK-00dk8x; Tue, 28 Apr 2020 23:31:40 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume
 __maybe_unused
Date: Tue, 28 Apr 2020 23:31:24 +0200
Message-Id: <20200428213138.3171708-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9gben41GuxcER2oeB9wYFmmawlgPoyYBUHJXzEFjF9Cabdyd6zx
 UnQqpKoIlMMhMSJMpuySRnALm9dHkuP2ohqYNq/f1dDi8rb7CkJYGeWWaT5DbF2erglp9jy
 3dnGb8OeECJrvFGIXwYVDOrV/PXlOVyafv0VaeEy3uA6RtW2Vo4Iu93RlK6TbIOJRrhZw1c
 pp3XMgxlBaX9JAjUHxR9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PpL1chTksEs=:0aWKAbC6CW1CMI3dzP5Gzu
 BZBRqPxP6Abvzmlu7WERc3rgNnMtcHirhasII1DlkqCVt16q0C+fZ8ue4ruuVX8oCISwbyejA
 p2pHgv1AGbewbLj49YMiETFtVQr9Sl42j5XNtq26eUN94I514lrIGZD7o1m2Rc0sc1x1oKjSY
 RpRmcczTirgb8KYRp+O+SDikXS47dme+T96VaQefBAviX3IvR/+TSM6GojVBgTJlq5ie5y4UB
 zFkmoty+bLSedIJn1bva4MxZTHT40+E0CYFs6LZT0vpgA9SxoKEtNPTSNL+56QiXAnr89Rv0J
 DwV1btZHMLgKyGI6a1C5nI7NESiwwQw2ztp5fF1mmfGrJTQQqiBlvHLxQBhQxG4nFd7ZxQBnl
 L86RYJUU5WUbaImD6KV9niyjczw2Y1AI358s0LJ/uJtgggdHgLCMfryNoLWVuskP5+f22cyNx
 eUJlm6EmNQiyl0sJm0VWBwDPQFD4AGHrIpx2XNUr9OIcYWTm+R47zrZUjyvvHaBJEqEqTosIx
 mJ8/KbmpbhepBJDPF6EVgTjeRFmTUa96uvRZiF7u5B+iBewkNpfrfBQVNXAl0Jbbm0kGRSHbO
 nuTDJrxKieLaOefJUke5OeRUY6uMWXHarOOSTwhoERccYSorX5lDGViY+UdD0ef0x6uaWI79D
 TatCoGF3WzbWrR5UumEiT/5sqJ/nsG3XIh+2k6NhJpqNy+/Nw1Ri7VvUgtuAg+6PB958HPY7B
 V3Sgnel9PC8tBoXnYABhIfwxsbE8OFYsb4ABLxGS+AIYVNAkqRnSAtm86mZK6UXxLzsIBrD7s
 NU4xcEH1iZsFiksRG/EuB6b1CocT//Y2QGhYlyuQ0fa7KdIh1A=
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the new static annotation, the compiler warns when the functions
are actually unused:

drivers/gpu/drm/rockchip/cdn-dp-core.c:1123:12: error: 'cdn_dp_resume' defined but not used [-Werror=unused-function]
 1123 | static int cdn_dp_resume(struct device *dev)
      |            ^~~~~~~~~~~~~

Mark them __maybe_unused to suppress that warning as well.

Fixes: 7c49abb4c2f8 ("drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index c634b95b50f7..1cde98c6b0e6 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1106,7 +1106,7 @@ static const struct component_ops cdn_dp_component_ops = {
 	.unbind = cdn_dp_unbind,
 };
 
-static int cdn_dp_suspend(struct device *dev)
+static __maybe_unused int cdn_dp_suspend(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 	int ret = 0;
@@ -1120,7 +1120,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
-static int cdn_dp_resume(struct device *dev)
+static __maybe_unused int cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
