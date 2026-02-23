Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLOZIVRhnGntFQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 15:16:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41D177E63
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 15:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1679B10E41A;
	Mon, 23 Feb 2026 14:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jdZhNtnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E6610E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:16:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso35170525e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771856208; x=1772461008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HJysTvCTqmpRUuXQbPd6ZdWuCMMviCnnW2mHB9RPSLQ=;
 b=jdZhNtnc/DeVSWHQsaL7NM+yyT7SEyto/AC4Fe9OVncj9OIPYhX9pNk7d5EATt6wiN
 oNb6N/kTinMGRIejPAUInAosYgOilmBTAnKrXtiHK+/ip+RKW95DLoYnpDfHfKmtrWom
 dKBmdaaPOvkiGh5sjAu78u1GLwHek5mvh2lj8quaqcV6KkB1kGFh4K5D852iWTZGmFI3
 7u2/VQkX4HHMuvcye6Ep6BO2YafMRkjmmnqIHao4fboddPuw34VqG9nWWnUCmp9nZh9V
 1l7FjqAxe3f2y5S5a2mPAVXmMtVuK+6TD3pIFNKbShrhFX3rL/REp/DEpjOu1c5S7+R7
 YsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771856208; x=1772461008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJysTvCTqmpRUuXQbPd6ZdWuCMMviCnnW2mHB9RPSLQ=;
 b=d34KfDKRiv6XbWjldSpY+nvXHWgq+6bXRsoXd7vpC0G/WFibAWUP+uuj0eHhDWWPgh
 EEdvDHvokeZ6gbtAF4LbvL1foTdSQFJ12nRTOcWz7y52ylqHQQAbR9sJmn6kq0HoDm72
 XeUBZqyWc0JXBbNi5nfGVGGwGvpd2O3g2cKeV3FmQCl+dlvb8FHsxdRaJ+Jb0pidR8gj
 9BJXapwA5BhNzhw+6ttcLPda7UKM4njxBcdMvdf1Cd5WeghgxYdQe7ehmIGr11ss9bFg
 tGQxJqSfr7vCI52htpG9EwoXkOiO3lJaY0WAILX/QaEeWLsXTfnA6sYMszE40B8kbJyL
 D/eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQGDSJPGqfQ3RKMGr/VGL3cqIGWfDCw4LZHfzxuyp1qIQ4rZbyQMOZQIih949W2D/orBjd2f+joy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeay6puDFoRYQeGEKQ9lnuMdgpWY5NXs9GMmdgI3TVnqNox2jF
 6LS28Q4hsYUENFT09m9fgd9jS5fGb+t7dBlWjVuKIKhD+/hL4BS7j+oB
X-Gm-Gg: AZuq6aJwiVUY0d0ea+b/7nKsZw3aiHuH0UlcMFlKLoEb19XXPO58mVZcYrORMAwMxoK
 adyEOe0ZJAkv8dVvZqKdGT0Pj+8CoHwqZ9V9SFE5u5uS09h48nCwoWriVS+CgIp5ememMy7K8ow
 /4npTucP0z8Twe/CMpXPtSYyGGv7txn73LvRPiKXuAWhdYHFor9AcWzEibCD1mhV7FFLYamFSZC
 lq0yV4RZ4J9233Z0HEKg4L0ArIx/i8VWyuOWvLDofsVB7G7xOmYQ76JF7flLioS71CHgH1XwrlN
 5Yh1LHa6fjprUxzJDbG3gXzZSH+XzzxXAOi6GefIT9eHjRS8b+6JmSrslpekp5bI2lS/6hcdq9G
 9UK8i3duntheacoWg5YGt4a1k3GEgaQREXcs1kphgvZq0odcNL0530t1/HakdNMKEaGuuyV44o0
 aLZ2D2nv0IqyR0tk5aqqQ=
X-Received: by 2002:a05:600c:6206:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-483a95b71b5mr161419085e9.13.1771856207390; 
 Mon, 23 Feb 2026 06:16:47 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a43088fdsm86531165e9.30.2026.02.23.06.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 06:16:46 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Date: Mon, 23 Feb 2026 14:16:34 +0000
Message-ID: <20260223141638.2022490-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:angelogioacchino.delregno@collabora.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:ck.hu@mediatek.com,m:amergnat@baylibre.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:lscorcia@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,pengutronix.de,ffwll.ch,mediatek.com,baylibre.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: ED41D177E63
X-Rspamd-Action: no action

The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
structure needs to be stored inside the driver data before invoking it.

As drvdata is currently uninitialized it leads to a crash when
registering the DSI DRM encoder right after acquiring
the mode_config.idr_mutex, blocking all subsequent DRM operations.

Fixes the following crash during mediatek-drm probe (tested on Xiaomi
Smart Clock x04g):

Unable to handle kernel NULL pointer dereference at virtual address
 0000000000000040
[...]
Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
 drm_dma_helper drm_kms_helper panel_simple
[...]
Call trace:
 drm_mode_object_add+0x58/0x98 (P)
 __drm_encoder_init+0x48/0x140
 drm_encoder_init+0x6c/0xa0
 drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
 mtk_dsi_bind+0x34/0x13c [mediatek_drm]
 component_bind_all+0x120/0x280
 mtk_drm_bind+0x284/0x67c [mediatek_drm]
 try_to_bring_up_aggregate_device+0x23c/0x320
 __component_add+0xa4/0x198
 component_add+0x14/0x20
 mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
 mipi_dsi_attach+0x2c/0x50
 panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
 mipi_dsi_drv_probe+0x1c/0x28
 really_probe+0xc0/0x3dc
 __driver_probe_device+0x80/0x160
 driver_probe_device+0x40/0x120
 __device_attach_driver+0xbc/0x17c
 bus_for_each_drv+0x88/0xf0
 __device_attach+0x9c/0x1cc
 device_initial_probe+0x54/0x60
 bus_probe_device+0x34/0xa0
 device_add+0x5b0/0x800
 mipi_dsi_device_register_full+0xdc/0x16c
 mipi_dsi_host_register+0xc4/0x17c
 mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
 platform_probe+0x5c/0xa4
 really_probe+0xc0/0x3dc
 __driver_probe_device+0x80/0x160
 driver_probe_device+0x40/0x120
 __driver_attach+0xc8/0x1f8
 bus_for_each_dev+0x7c/0xe0
 driver_attach+0x24/0x30
 bus_add_driver+0x11c/0x240
 driver_register+0x68/0x130
 __platform_register_drivers+0x64/0x160
 mtk_drm_init+0x24/0x1000 [mediatek_drm]
 do_one_initcall+0x60/0x1d0
 do_init_module+0x54/0x240
 load_module+0x1838/0x1dc0
 init_module_from_file+0xd8/0xf0
 __arm64_sys_finit_module+0x1b4/0x428
 invoke_syscall.constprop.0+0x48/0xc8
 do_el0_svc+0x3c/0xb8
 el0_svc+0x34/0xe8
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c
Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
---[ end trace 0000000000000000 ]---

Fixes: e4732b590a77 ("drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v2: Added Fixes tag

 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c..af4871de9e4c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
+	platform_set_drvdata(pdev, dsi);
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
@@ -1245,8 +1247,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
 
-	platform_set_drvdata(pdev, dsi);
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.43.0

