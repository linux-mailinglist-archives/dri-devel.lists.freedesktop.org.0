Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A40623DC7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 09:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB64C10E681;
	Thu, 10 Nov 2022 08:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D023897D4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:31:04 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 944D9D04CC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 14:19:52 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0A89EFF80C;
 Wed,  9 Nov 2022 14:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1668003589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFFI30QzE1G3IA3G1EY9+AlTR76QBFRpn0adqyIw2mo=;
 b=RHmJUClNhsoJQKGef2L2nMwo+u+sk7ShPTcZ/6LJ0l+ivqZ486KMaattzm3VfDTYZoxcIf
 u0wJH6gSY2oNrl3IHpSwpl0ICnhKcgc4RrSwAM4R/Vih8XsH7Ck8m/Lm10MYQnt36l+57s
 NJmxNDH9RpYNxbe+S7TIXlhkpz/Mkc5tH9jlOY2ttXdXMdD3nZImS4Ze1CsHXGjnz57A/f
 j03vGPknXdi5ZuAAozKnWDTOU+OBTJIVPTBLsNT1Di4wnpWFyzdtGimAW6jnrb7fjw6rnJ
 pyOgfZcgoaopr3tC/qmtjZTTsSl2Y3ce+7wTUU58ieauhe4kbwWkfomyMwYjSA==
From: luca.ceresoli@bootlin.com
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 12/23] staging: media: tegra-video: remove unneeded include
Date: Wed,  9 Nov 2022 15:18:41 +0100
Message-Id: <20221109141852.729246-13-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Nov 2022 08:47:29 +0000
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

There is only a pointer reference to struct tegra_vi in video.h, thus vi.h
is not needed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/staging/media/tegra-video/video.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/staging/media/tegra-video/video.h
index fadaf2189dc9..1e9be1474a9c 100644
--- a/drivers/staging/media/tegra-video/video.h
+++ b/drivers/staging/media/tegra-video/video.h
@@ -12,7 +12,6 @@
 #include <media/v4l2-device.h>
 
 #include "vi.h"
-#include "csi.h"
 
 struct tegra_video_device {
 	struct v4l2_device v4l2_dev;
-- 
2.34.1

