Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76607AAA2E6
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D558910E5D6;
	Mon,  5 May 2025 23:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kraXVoNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638C210E5D6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 23:06:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 027EBA4D328;
 Mon,  5 May 2025 23:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBDFC4CEE4;
 Mon,  5 May 2025 23:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486377;
 bh=93cAwYNrBhIobUYALRIN+aixfXZiY+QQPC4xzf6ndok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kraXVoNOISee1WRfrr0ckycZjpfuecQUfUUUlr0IBKrMEBs44mJ1GFsqXZy2rWfR9
 t8BINZVWTnBCMgmOgpjgdyPdGGvN6hRb281xuKqyiHDK0CGcDqlfrS8D83svUKNbZx
 Fz51KO41woR+vjXgiWFjtBurmUsL/YCCl6vohzrAtCQc6ADnAHXZ+74Iq5widznAFz
 ZCuSJXn8TqnG8xkAnTlfnaR9BgZ5wEmyTN0kdqlJCwiYX+sqXBcYOzkLVK1oTFb5wO
 ySHmBvrVPnq9KKRJCKaBKn3h4j6uaOoc9y4EJ6Ygk6K3zYZBoW7dSJ/VYg50dIXtbj
 DAOvu9kLG72XA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sasha Levin <sashal@kernel.org>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, broonie@kernel.org,
 stefan.ekenberg@axis.com, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 291/294] drm: bridge: adv7511: fill stream
 capabilities
Date: Mon,  5 May 2025 18:56:31 -0400
Message-Id: <20250505225634.2688578-291-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

[ Upstream commit c852646f12d4cd5b4f19eeec2976c5d98c0382f8 ]

Set no_i2s_capture and no_spdif_capture flags in hdmi_codec_pdata structure
to report that the ADV7511 HDMI bridge does not support i2s or spdif audio
capture.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20250108170356.413063-2-olivier.moysan@foss.st.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 8f786592143b6..24e1e11acf697 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -244,7 +244,9 @@ static const struct hdmi_codec_pdata codec_data = {
 	.ops = &adv7511_codec_ops,
 	.max_i2s_channels = 2,
 	.i2s = 1,
+	.no_i2s_capture = 1,
 	.spdif = 1,
+	.no_spdif_capture = 1,
 };
 
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511)
-- 
2.39.5

