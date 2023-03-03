Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D916A9C1A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 17:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D4110E715;
	Fri,  3 Mar 2023 16:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD08510E70B;
 Fri,  3 Mar 2023 16:48:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D870B817F6;
 Fri,  3 Mar 2023 16:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D00C433A0;
 Fri,  3 Mar 2023 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677862103;
 bh=vLHp6zfTAtlmPAsNSVAaON653kcH7IWEthUS+f3d9jE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BPi6ora5KkXwil7JTuFP5WMoI7+GYA51OE6LgUi8oxJmJKwxDEQacbEmofLEZs4bA
 4vGdSTrlImplGjX1478iDKA6GEh3AflKGr0Kvw8MO4Ux5zhvz2eiGsZGhP4fRZ30Hs
 oyQZ7y20+Z42gS9HAfM0O71N0rFOLGEYnwNUFE7kxDUzNFn6Vr1ofQkezosac0rXkI
 IulhKXidHaoIzsrxVARyef5JI7RA1lI9TEYyyuNnT96XqpM8Rf02Uoipz/9+8c9NOa
 22fRh35/cD2z7zIMl1Nw+lVgDnrjfBkEeV39TPEhD7ZW7Mwc9e3zSl/ZFbabxYC4O6
 y8UqrN0WK0zRg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pY8aV-0003Qi-Mx; Fri, 03 Mar 2023 17:48:55 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 4/4] drm/msm/adreno: clean up component ops indentation
Date: Fri,  3 Mar 2023 17:48:07 +0100
Message-Id: <20230303164807.13124-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303164807.13124-1-johan+linaro@kernel.org>
References: <20230303164807.13124-1-johan+linaro@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the component ops initialisers which were indented one level
too far.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index d9100e3870bc..f2cdc5ad7ce7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -571,8 +571,8 @@ static void adreno_unbind(struct device *dev, struct device *master,
 }
 
 static const struct component_ops a3xx_ops = {
-		.bind   = adreno_bind,
-		.unbind = adreno_unbind,
+	.bind   = adreno_bind,
+	.unbind = adreno_unbind,
 };
 
 static void adreno_device_register_headless(void)
-- 
2.39.2

