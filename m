Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB26B275E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3310E83D;
	Thu,  9 Mar 2023 14:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CD010E845
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:44:01 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 1CB95FF80F;
 Thu,  9 Mar 2023 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1678373038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdRp15j/k4XeYmQe3luSEncUUhUk/h4Frh9ooM2yWbA=;
 b=GvPyYvV+RzXgDfT9Ok4kHclraNH3fivV4H/83JhM5IkFib2D8XpQP7tq0BUEE2U6RbLGLY
 b13oOulz/W9mK3YUTUOCaAJ5hGm/YaN0zEdLyJP5+Pd1i4911ITHbxeR8gqV2QGxsnacLq
 4+jNRFQQO0PhMo+wYmvliL0EVUMKkK8DBxQYI6FMREK3I6pOVjYaqxXGh3PYOSUHnOB4Rs
 bw3SZZkqCGbA1zAwZ9R2Cha4NXWNOTi17SPuzrqQacBsT3samqkek84U91cl4Zht69nYxN
 JkPWGnowFwT64h7oQuRXdRDvNiHDPscnpETIZQ78h2eprpU1qVO2iFREUEfRSw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RESEND PATCH v4 11/21] staging: media: tegra-video: remove unneeded
 include
Date: Thu,  9 Mar 2023 15:43:10 +0100
Message-Id: <20230309144320.2937553-12-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
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
 Richard Leitner <richard.leitner@skidata.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is only a pointer reference to struct tegra_vi in video.h, thus vi.h
is not needed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
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

