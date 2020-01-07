Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0190133546
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 22:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF46E13F;
	Tue,  7 Jan 2020 21:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB326E13F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 21:53:34 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MirX2-1jIUBC2F1g-00esF5; Tue, 07 Jan 2020 22:53:30 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: mark PM functions as __maybe_unused
Date: Tue,  7 Jan 2020 22:53:19 +0100
Message-Id: <20200107215327.1579195-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:D8eyHNwsRIANzNeGG0V8wOYjma+itOWYQpYeJWgvj538rJsgGRg
 6vCziyI+PiLEyZMaCIC9PJM8kUnqc4NyfRiggbrSuzw/KeelU8vdisjwEqdBPqqM0l/1Tnh
 G2ZBa3GIFsWYl0z4vmfiKWI+190d9te4h0TuRxvwWPu2JjgE8NVT2jDsqUHLb3WC8wbKg6H
 SjKeog6jdsVZOpmj9Z9dQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C+o2XHhMGVM=:aw5Orf3a/sc1UBMpxULWVP
 NTnPwMOPHcBQ2weTAjOQak9b3mjkPc05hxxIhhvGR9RJSWDX0Om8NvNVKtH+IlDCz8v2/Zu4f
 Dh/Cv39/BEUumuxi75rj4MANmLHe/18th0AeSTVOlgk1TlOg2I9LDW7oGeb2GYlgBZSmOM5n5
 WCxsik229m/4FTzofAk5tL9WGp8FOkZkSUepiIEWMtcdYtbqDaw0E6Z8sKUPoJQFOEYtxIJ+g
 w4ActcFhG6EGXxwv6vq4U7hMOFH4Gf1XPMHvoSn5Bv2zp+FBMzrIQMb1B2As/Sb3CzGOwi5tO
 7/3RfGhnFvfvkJ+tFhrAVWrIdxZ5EoFvvDae1eWaMP35K1D/N16Nhe1OJ5Rp27i8ZQqi+VOR9
 hP38Vl2U7rIFd8fIwijV3+sV2e8S/6J0eYn9V9nHOT7Gl5Qdo/kx2qW7TThlcnOw4521FebTa
 Mf+ZtMHB7mFztLkpEFo6XHgy+lqoEkW0TcJwgzQJB7NjEiC2dnqJPq/XWtvsgFa+0uQlCzeV2
 ZJnMJw5A+M/i4k2jNYm2ikXss5aE2uNQND5WOTwRqA60CZ51kRB13k/c4OptNoB8n95tcduQ8
 CW5Uevr0LP6n5+7xLxSICffAkbqZh4yJnvx6I5wTqB/7V/Hzf4nTA0FipDj7JlDYSeOWhd34X
 UPc35SlyvkuJ/PuVDjmA9UwdCkXPPvzUkPwGtfD9vLmEyO6hGK5Xuf1Tmn82iXVcLMEEtV/Sx
 MQiWrpV6xhGAtADMlxZi0TyIc3Q2AfkwOy+oNMkMlVFVCpy0WnwVyK90idOOjvrBMuhqhF4k9
 FzT73UCzS+/P5jMrXfLMrXmbctDc2xIs+vNy28bgdGMN8sx6hSX1ZDgiavIiJhP1r14Z8PWOR
 m1ZUb+z5VbMqSLbqVUcA==
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without this, we get a couple of warnings when CONFIG_PM
is disabled:

drivers/gpu/drm/arm/display/komeda/komeda_drv.c:156:12: error: 'komeda_rt_pm_resume' defined but not used [-Werror=unused-function]
 static int komeda_rt_pm_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/arm/display/komeda/komeda_drv.c:149:12: error: 'komeda_rt_pm_suspend' defined but not used [-Werror=unused-function]
 static int komeda_rt_pm_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~

Fixes: efb465088518 ("drm/komeda: Add runtime_pm support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index ea5cd1e17304..e7933930a657 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -146,14 +146,14 @@ static const struct of_device_id komeda_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, komeda_of_match);
 
-static int komeda_rt_pm_suspend(struct device *dev)
+static int __maybe_unused komeda_rt_pm_suspend(struct device *dev)
 {
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
 
 	return komeda_dev_suspend(mdrv->mdev);
 }
 
-static int komeda_rt_pm_resume(struct device *dev)
+static int __maybe_unused komeda_rt_pm_resume(struct device *dev)
 {
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
 
-- 
2.20.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
