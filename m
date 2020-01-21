Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E66811444F4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 20:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BAC6EE46;
	Tue, 21 Jan 2020 19:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98A66EE47
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 19:19:24 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id x6so1975480pfo.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqRmMWrZ2O6AQaqMT6b2P7oahNOZhsaTo9RvQSMwDMk=;
 b=mo3JH4SseKHbVUnb9l+e/2t25z5zoMH0yyv2CYN61032Qsypr4/063jVln69dYTgFE
 NKdRgbhhDRJXhhyJ9xQodzx/Ph/j7H9lDZ/o1f+kDYviMVLkrCMfIgg01BTAL7wJe0TW
 W2pMcpMJNnkwDiA/67EHdMDhVEF6e60L20UEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqRmMWrZ2O6AQaqMT6b2P7oahNOZhsaTo9RvQSMwDMk=;
 b=N1Cjy73YVG5hxqFWYx8rAcjQOiEqLN5ShaZGxtHnoKG1yWjE9/9E+KcsiaW2M2AuUL
 OuIjBGVbNzAIHoroej01SeWNeKg2nJxF2pfgmo1tq/k8r6D3n4Jc/vR4f9XaE0ZNecLs
 vMu2pocmrfRct1wfqEwK1Im/h1aFG2tGEM7XyYxo+mQivYbzeWYpPv+wCTPoCmpFiV80
 C8QMFaaxZxNrvxbHZT16nReQe34AyZgw+PO+bhEtj8Qf/1JnXcRYQS2oyNtPNRDhghKk
 4GXzd2E9H8MsuM/qhCTfsgSk7juoHOx7aMNN+6kUDOMaYp+7SiWCWk5Y8sUW95TCDoCL
 PV6g==
X-Gm-Message-State: APjAAAX4Mg9Ep9t7dD3fAxJBg1TBM4ddFO3T/KRmPF+Llcd4uEVqISax
 C1Q38Jr3kSk92ciQQ5kpzX1ZyC5vqHo=
X-Google-Smtp-Source: APXvYqxYUXNBBxAHz3BQUbedFm4ESJRvljKeyTxsiakxKmCyPYaL8oztIYtPYLhvqyKKllweLSR2Mw==
X-Received: by 2002:a63:b50a:: with SMTP id y10mr7131998pge.104.1579634364327; 
 Tue, 21 Jan 2020 11:19:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id 2sm41606601pgo.79.2020.01.21.11.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 11:19:23 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [REPOST PATCH] drm/msm: Set dma maximum segment size for mdss
Date: Tue, 21 Jan 2020 11:18:48 -0800
Message-Id: <20200121111813.REPOST.1.I92c66a35fb13f368095b05287bdabdbe88ca6922@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org, saiprakash.ranjan@codeaurora.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, mka@chromium.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Turning on CONFIG_DMA_API_DEBUG_SG results in the following error:

[   12.078665] msm ae00000.mdss: DMA-API: mapping sg segment longer than device claims to support [len=3526656] [max=65536]
[   12.089870] WARNING: CPU: 6 PID: 334 at /mnt/host/source/src/third_party/kernel/v4.19/kernel/dma/debug.c:1301 debug_dma_map_sg+0x1dc/0x318
[   12.102655] Modules linked in: joydev
[   12.106442] CPU: 6 PID: 334 Comm: frecon Not tainted 4.19.0 #2
[   12.112450] Hardware name: Google Cheza (rev3+) (DT)
[   12.117566] pstate: 60400009 (nZCv daif +PAN -UAO)
[   12.122506] pc : debug_dma_map_sg+0x1dc/0x318
[   12.126995] lr : debug_dma_map_sg+0x1dc/0x318
[   12.131487] sp : ffffff800cc3ba80
[   12.134913] x29: ffffff800cc3ba80 x28: 0000000000000000
[   12.140395] x27: 0000000000000004 x26: 0000000000000004
[   12.145868] x25: ffffff8008e55b18 x24: 0000000000000000
[   12.151337] x23: 00000000ffffffff x22: ffffff800921c000
[   12.156809] x21: ffffffc0fa75b080 x20: ffffffc0f7195090
[   12.162280] x19: ffffffc0f1c53280 x18: 0000000000000000
[   12.167749] x17: 0000000000000000 x16: 0000000000000000
[   12.173218] x15: 0000000000000000 x14: 0720072007200720
[   12.178689] x13: 0720072007200720 x12: 0720072007200720
[   12.184161] x11: 0720072007200720 x10: 0720072007200720
[   12.189641] x9 : ffffffc0f1fc6b60 x8 : 0000000000000000
[   12.195110] x7 : ffffff8008132ce0 x6 : 0000000000000000
[   12.200585] x5 : 0000000000000000 x4 : ffffff8008134734
[   12.206058] x3 : ffffff800cc3b830 x2 : ffffffc0f1fc6240
[   12.211532] x1 : 25045a74f48a7400 x0 : 25045a74f48a7400
[   12.217006] Call trace:
[   12.219535]  debug_dma_map_sg+0x1dc/0x318
[   12.223671]  get_pages+0x19c/0x20c
[   12.227177]  msm_gem_fault+0x64/0xfc
[   12.230874]  __do_fault+0x3c/0x140
[   12.234383]  __handle_mm_fault+0x70c/0xdb8
[   12.238603]  handle_mm_fault+0xac/0xc4
[   12.242473]  do_page_fault+0x1bc/0x3d4
[   12.246342]  do_translation_fault+0x54/0x88
[   12.250652]  do_mem_abort+0x60/0xf0
[   12.254250]  el0_da+0x20/0x24
[   12.257317] irq event stamp: 67260
[   12.260828] hardirqs last  enabled at (67259): [<ffffff8008132d0c>] console_unlock+0x214/0x608
[   12.269693] hardirqs last disabled at (67260): [<ffffff8008080e0c>] do_debug_exception+0x5c/0x178
[   12.278820] softirqs last  enabled at (67256): [<ffffff8008081664>] __do_softirq+0x4d4/0x520
[   12.287510] softirqs last disabled at (67249): [<ffffff80080be574>] irq_exit+0xa8/0x100
[   12.295742] ---[ end trace e63cfc40c313ffab ]---

The root of the problem is that the default segment size for sgt is
(UINT_MAX & PAGE_MASK), and the default segment size for device dma is
64K. As such, if you compare the 2, you would deduce that the sg segment
will overflow the device's capacity. In reality, the hardware can
accommodate the larger sg segments, it's just not initializing its max
segment properly. This patch initializes the max segment size for the
mdss device, which gets rid of that pesky warning.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch has been floating in the ether for over a year [1].  I know
next to nothing about it, but I'm told it's still useful so I'm
helpfully reposting it.  Please enjoy.

[1] https://lore.kernel.org/r/20181106213239.52133-1-sean@poorly.run

 drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c26219c7a49f..e4b750b0c2d3 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -441,6 +441,14 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
+	if (!dev->dma_parms) {
+		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
+					      GFP_KERNEL);
+		if (!dev->dma_parms)
+			return -ENOMEM;
+	}
+	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+
 	msm_gem_shrinker_init(ddev);
 
 	switch (get_mdp_ver(pdev)) {
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
