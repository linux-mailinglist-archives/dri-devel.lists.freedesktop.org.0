Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD057A655E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 15:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4179110E266;
	Tue, 19 Sep 2023 13:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3FE10E266
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 13:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1695130657; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=fmNCdrliKmKlDo9QFTbljpsJthBV+utp8y7CMMjQS2cI7k4YGcLSaoOZ/gNUBE9sF7
 bUIQMKzJLh30qi/eZxLqTpEK7Gz44KiS9SXW/ePRMxca7wFe+uOcBfXxsuchE1QXNXd6
 66qKlGTAz+xlK5ynlDjvPCGmXzsLam9mxWTHm5Ss9sJoUR3NUj4M38xUgkQjwqh7xuHD
 y3nJ7JgPTG13aiYXb+rfDB4RUWoNbkQLA3b9XLqvBt0DCcHrsTkZKGzCRhlFMk0TaJtv
 R6nzuexHMXYZZb1FRSWE/SKc/GN6SImfH5ma52vsC/znrLlOD4keN+aQHhsWqezs8/jr
 h/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1695130657;
 s=strato-dkim-0002; d=strato.com;
 h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=C+Lkr4ss6MZINaRjRWZbodjkKT7ulOoKXpAu4jeNUT0=;
 b=qAK5LNPrtWq9JY4GDjefVmvqwUJ2sEwqglqxTPy3dLaDT+pIYRaezv/8uokyl0ZVk5
 IVc51zFv1yb541MSm0zm4jRf2djdJ6q8V9QJr81y+l/+BTtqMoDqFiq1Nk4FVdqpw8RG
 3YXyenqF1KRadAVnCoy30I1Yh9wXfEdbuzrIHSCGfKj6LHywzH0HzCknZzEEWsuobqfy
 uS5aoojhsGVwYf/YG3rvDq9KixgxxOp5UHEnRRptsFkf63eo+zgVp71f1b2QS0/i7dVb
 eCiEMRFOMh7riFMtu2IcQhBzhmFsb8HM3DEF8a7bq3EykafzSTldAJGwdakHyPVGiimY
 6Ujg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1695130657;
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=C+Lkr4ss6MZINaRjRWZbodjkKT7ulOoKXpAu4jeNUT0=;
 b=ZMdtX+2xP1lj3TfciIVF5fsah7wY+MfWwpbvVQttJWfya/seJu5lk4WsgZi/JOO+jC
 E92uty4UKec96v8dATYwSAjSVH2SE1KsgoT0MzXExJild6lYv7xie7jyMU+mEx9K+a4+
 wsLqDT13loVkRwIzRCL5N2yKewPT0Wk1ihmmKC2FwhJenM9b+50ORsh+zgY0SRmOUE6K
 tbXf9f4N3Z3n03VyJNyaMdhxyR314FWO9iIMFlWT540BOuM8qg/TXctKK0Hm1LNvirKU
 rZbyeR+3h7JOpBUbZ0fu2fFSMuHI95OMBZL+gRkEQBNlhHlfNC5iyc+x2OHkjfEwhRIS
 TpIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1695130657;
 s=strato-dkim-0003; d=goldelico.com;
 h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=C+Lkr4ss6MZINaRjRWZbodjkKT7ulOoKXpAu4jeNUT0=;
 b=ifLmEvTKOnMXlMzR3QBCX0YGjjxz8aTIuO14dJRB3MjzPCwotBsh4xxAE0dXltYj8h
 14bzI3TlgCCkbFK7ASCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrWLJ"
Received: from localhost.localdomain by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
 with ESMTPSA id Y04dd7z8JDbYhZC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 19 Sep 2023 15:37:34 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, tony@atomide.com,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 sre@kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] omap: dsi: do not WARN on detach if dsidev was never attached
Date: Tue, 19 Sep 2023 15:37:28 +0200
Message-ID: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: letux-kernel@openphoenux.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pyra-handheld.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dsi_init_output() called by dsi_probe() may fail. In that
case mipi_dsi_host_unregister() is called which may call
omap_dsi_host_detach() with uninitialized dsi->dsidev
because omap_dsi_host_attach() was never called before.

This happens if the panel driver asks for an EPROBE_DEFER.

So let's suppress the WARN() in this special case.

[    7.416759] WARNING: CPU: 0 PID: 32 at drivers/gpu/drm/omapdrm/dss/dsi.c:4419 omap_dsi_host_detach+0x3c/0xbc [omapdrm]
[    7.436053] Modules linked in: ina2xx_adc snd_soc_ts3a227e bq2429x_charger bq27xxx_battery_i2c(+) bq27xxx_battery ina2xx tca8418_keypad as5013(+) omapdrm hci_uart cec palmas_pwrbutton btbcm bmp280_spi palmas_gpadc bluetooth usb3503 ecdh_generic bmc150_accel_i2c bmg160_i2c ecc bmc150_accel_core bmg160_core bmc150_magn_i2c bmp280_i2c bmc150_magn bno055 industrialio_triggered_buffer bmp280 kfifo_buf snd_soc_omap_aess display_connector drm_kms_helper syscopyarea snd_soc_omap_mcbsp snd_soc_ti_sdma sysfillrect ti_tpd12s015 sysimgblt fb_sys_fops wwan_on_off snd_soc_gtm601 generic_adc_battery drm snd_soc_w2cbw003_bt industrialio drm_panel_orientation_quirks pwm_bl pwm_omap_dmtimer ip_tables x_tables ipv6 autofs4
[    7.507068] CPU: 0 PID: 32 Comm: kworker/u4:2 Tainted: G        W          6.1.0-rc3-letux-lpae+ #11107
[    7.516964] Hardware name: Generic OMAP5 (Flattened Device Tree)
[    7.523284] Workqueue: events_unbound deferred_probe_work_func
[    7.529456]  unwind_backtrace from show_stack+0x10/0x14
[    7.534972]  show_stack from dump_stack_lvl+0x40/0x4c
[    7.540315]  dump_stack_lvl from __warn+0xb0/0x164
[    7.545379]  __warn from warn_slowpath_fmt+0x70/0x9c
[    7.550625]  warn_slowpath_fmt from omap_dsi_host_detach+0x3c/0xbc [omapdrm]
[    7.558137]  omap_dsi_host_detach [omapdrm] from mipi_dsi_remove_device_fn+0x10/0x20
[    7.566376]  mipi_dsi_remove_device_fn from device_for_each_child+0x60/0x94
[    7.573729]  device_for_each_child from mipi_dsi_host_unregister+0x20/0x54
[    7.580992]  mipi_dsi_host_unregister from dsi_probe+0x5d8/0x744 [omapdrm]
[    7.588315]  dsi_probe [omapdrm] from platform_probe+0x58/0xa8
[    7.594542]  platform_probe from really_probe+0x144/0x2ac
[    7.600249]  really_probe from __driver_probe_device+0xc4/0xd8
[    7.606411]  __driver_probe_device from driver_probe_device+0x3c/0xb8
[    7.613216]  driver_probe_device from __device_attach_driver+0x58/0xbc
[    7.620115]  __device_attach_driver from bus_for_each_drv+0xa0/0xb4
[    7.626737]  bus_for_each_drv from __device_attach+0xdc/0x150
[    7.632808]  __device_attach from bus_probe_device+0x28/0x80
[    7.638792]  bus_probe_device from deferred_probe_work_func+0x84/0xa0
[    7.645595]  deferred_probe_work_func from process_one_work+0x1a4/0x2d8
[    7.652587]  process_one_work from worker_thread+0x214/0x2b8
[    7.658567]  worker_thread from kthread+0xe4/0xf0
[    7.663542]  kthread from ret_from_fork+0x14/0x1c
[    7.668515] Exception stack(0xf01b5fb0 to 0xf01b5ff8)
[    7.673827] 5fa0:                                     00000000 00000000 00000000 00000000
[    7.682435] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.691038] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index ea63c64d3a1ab..c37eb6b1b9a39 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct dsi_data *dsi = host_to_omap(host);
 
-	if (WARN_ON(dsi->dsidev != client))
+	if (!dsi->dsidev || WARN_ON(dsi->dsidev != client))
 		return -EINVAL;
 
 	cancel_delayed_work_sync(&dsi->dsi_disable_work);
-- 
2.42.0

