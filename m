Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2ED3B06E8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 16:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEF66E529;
	Tue, 22 Jun 2021 14:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B156E525;
 Tue, 22 Jun 2021 14:10:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 463F81FD36;
 Tue, 22 Jun 2021 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4nG8ilbOi6FRyBuH/cMBHjv1Lw8HPtoTWpveyvfhLY=;
 b=w8mJNxdzJDqoNc4phBniwAx8Fogos1RhIJlZNZ0RkzvoZf58yZXeWYUiyf87NRUgc5PDDY
 0frTmG5DZgsaealdLs620LnGMTJKakvUc/k6XO23Y3fRXahEUTPhbbYdvis3fUg0k8oBio
 oxoSHelZxWsK++/8hDT9SatIuMR2LtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4nG8ilbOi6FRyBuH/cMBHjv1Lw8HPtoTWpveyvfhLY=;
 b=deMHjuRhwqmyca/jUI6Li44rG2SadKi6bacYi0AlQvkLz3/nffBoHRLLh/VseLOVMCkYqc
 ijZo6UYFw0flKnCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 38ACA118DD;
 Tue, 22 Jun 2021 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4nG8ilbOi6FRyBuH/cMBHjv1Lw8HPtoTWpveyvfhLY=;
 b=w8mJNxdzJDqoNc4phBniwAx8Fogos1RhIJlZNZ0RkzvoZf58yZXeWYUiyf87NRUgc5PDDY
 0frTmG5DZgsaealdLs620LnGMTJKakvUc/k6XO23Y3fRXahEUTPhbbYdvis3fUg0k8oBio
 oxoSHelZxWsK++/8hDT9SatIuMR2LtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4nG8ilbOi6FRyBuH/cMBHjv1Lw8HPtoTWpveyvfhLY=;
 b=deMHjuRhwqmyca/jUI6Li44rG2SadKi6bacYi0AlQvkLz3/nffBoHRLLh/VseLOVMCkYqc
 ijZo6UYFw0flKnCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 6BcCDUjv0WD3UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com
Subject: [PATCH v2 12/22] drm/omapdrm: Track IRQ state in local device state
Date: Tue, 22 Jun 2021 16:09:52 +0200
Message-Id: <20210622141002.11590-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct omap_drm_device.irq_enabled. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/omapdrm/omap_drv.h | 2 ++
 drivers/gpu/drm/omapdrm/omap_irq.c | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index d6f136984da9..591d4c273f02 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -48,6 +48,8 @@ struct omap_drm_private {
 	struct dss_device *dss;
 	struct dispc_device *dispc;
 
+	bool irq_enabled;
+
 	unsigned int num_pipes;
 	struct omap_drm_pipeline pipes[8];
 	struct omap_drm_pipeline *channels[8];
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index 15148d4b35b5..bb6e3fc18204 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -291,7 +291,7 @@ int omap_drm_irq_install(struct drm_device *dev)
 	if (ret < 0)
 		return ret;
 
-	dev->irq_enabled = true;
+	priv->irq_enabled = true;
 
 	return 0;
 }
@@ -300,10 +300,10 @@ void omap_drm_irq_uninstall(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
 
-	if (!dev->irq_enabled)
+	if (!priv->irq_enabled)
 		return;
 
-	dev->irq_enabled = false;
+	priv->irq_enabled = false;
 
 	dispc_free_irq(priv->dispc, dev);
 }
-- 
2.32.0

