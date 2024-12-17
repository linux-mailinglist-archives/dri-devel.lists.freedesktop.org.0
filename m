Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC329F4FCD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B9610E9F8;
	Tue, 17 Dec 2024 15:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P8n03g3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4E610E9E6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734450260;
 bh=URSrD6DN9P/iN3W3e2XkeBkAqsZckLwEcyr6LKzK2aQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P8n03g3CTZRr0RRq75m7FFgyghq4XR1pFL5Sl5Xr6RRk/rjrc/sb5RLYW6cTIC2+S
 q4x09nz763iHKZVRLYvxgaUXWTTuwAm785MEWoLEwMi9AB7G9tGnpoBYc/4QY27cxS
 Z+4kLD0U0Wr1Z/VpIXrw2YwFoCwU4Mo1fwXKdF1mnpzdZuSm8igK08yL34ywY+lTAE
 pKHgS4E7Yh0baY0RVSnEksAjAfkcBgjH8/HH1sKu9xEeD6fXLwPCgoLqFxZ8CtNgS3
 XuWNs3lxL73HPqcV5dWuqdJ+3sFI7+V+9JgPpsLYtvPk7S6wsHvYqZ49IjfJ1/3EAo
 PEZr37Tqa2JfQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E75B17E37A4;
 Tue, 17 Dec 2024 16:44:19 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 21/33] drm/mediatek: mtk_hdmi: Remove unused members of
 struct mtk_hdmi
Date: Tue, 17 Dec 2024 16:43:33 +0100
Message-ID: <20241217154345.276919-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
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

The hdmi_colorspace csp member of struct mtk_hdmi is initialized
once but then it's never used at all.
Remove said member and the only assignment to it as a cleanup.

Also remove the ibias, ibias_up, min_clock, max_clock, min_hdisplay
and max_vdisplay members, as those were really completely unused.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c95c7b55998c..3ecd0ed59851 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -162,16 +162,9 @@ struct mtk_hdmi {
 	struct clk *clk[MTK_HDMI_CLK_COUNT];
 	struct drm_display_mode mode;
 	bool dvi_mode;
-	u32 min_clock;
-	u32 max_clock;
-	u32 max_hdisplay;
-	u32 max_vdisplay;
-	u32 ibias;
-	u32 ibias_up;
 	struct regmap *sys_regmap;
 	unsigned int sys_offset;
 	struct regmap *regs;
-	enum hdmi_colorspace csp;
 	struct platform_device *audio_pdev;
 	struct hdmi_audio_param aud_param;
 	bool audio_enable;
@@ -1036,7 +1029,6 @@ static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
 {
 	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 
-	hdmi->csp = HDMI_COLORSPACE_RGB;
 	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
 	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
 	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
-- 
2.47.0

