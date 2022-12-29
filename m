Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7312658D8B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 14:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A10510E268;
	Thu, 29 Dec 2022 13:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9253510E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:37:55 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6C94ACA891
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 13:33:09 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7086FFF804;
 Thu, 29 Dec 2022 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1672320767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfVO7AZAqiYLzD7p45tSKrIhpVD/geNGM0ElIJ2Gj3E=;
 b=hUJ1YvTr+vM7giGxSR71JfxFiibfTv+I4udvv9swMdkMw6kub5wVMADusVZJycjTI08Ie8
 QM6e3xQIyYH7VwiUHriFfheJi8W/NxgYwpp6PgSiu7wJkrhBDLqLWPIYhlJOLU/SQ+aQLC
 RxD3AcRkcF2o7daa6C1+7P0Hit2u1aNs6hizknpsnTUxoGgbXj1/4vo9Aar/agVmLtZxPv
 hdvQSO6sBqZmjJmmvEIpL6WK9JyjMxgwxNpMU9heG4rtFbqP4D6+TvkOh9c2tSeWSEA01M
 7tc9QzqlHaO+eThox6OU1/E7RXm2FQdexUeUE8S+N9OJ9k95EVYmEQJE3LFBBA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v3 12/21] staging: media: tegra-video: Kconfig: allow TPG only
 on Tegra210
Date: Thu, 29 Dec 2022 14:31:56 +0100
Message-Id: <20221229133205.981397-13-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
References: <20221229133205.981397-1-luca.ceresoli@bootlin.com>
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are about to add support for the Tegra20 parallel video capture, which
has no TPG. In preparation for that, limit the VIDEO_TEGRA_TPG option to
Tegra210 which is the only implementation currently provided by this
driver.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index df1b2cff2417..c53441822fdf 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -15,5 +15,6 @@ config VIDEO_TEGRA
 config VIDEO_TEGRA_TPG
 	bool "NVIDIA Tegra VI driver TPG mode"
 	depends on VIDEO_TEGRA
+	depends on ARCH_TEGRA_210_SOC
 	help
 	  Say yes here to enable Tegra internal TPG mode
-- 
2.34.1

