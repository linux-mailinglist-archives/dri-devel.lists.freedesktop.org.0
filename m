Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5369DDB7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 11:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1AD10E1C8;
	Tue, 21 Feb 2023 10:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4815110E159;
 Tue, 21 Feb 2023 10:16:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B096D60FD1;
 Tue, 21 Feb 2023 10:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A4C433AF;
 Tue, 21 Feb 2023 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676974605;
 bh=yMvJYHxVZptlOU5QkNPi2i647YDtCkktqGaRKrHuIIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HDMSqzEIjkQp9Nbi1pc/AzuqhupeOI0A3vwNCZ+xQhLmKTVWYn/ECf7VyPVWCwLWD
 TuG7eYCCOaDEAGahZTISo0O92OQpg0Wy0ZylhuKSY364JZwl0PZN/d5PAJqjWOPTar
 UDHsyc2meB8Ioe2RWYK1b0W/OLDEvCQR65EUDoWh4OEtr/L4gHuLR+N8PhE/pY0UEw
 mCeQL/yDX+LVydQWluxQNOhU4w1cVrTfv9oJmTP2bI9Anz9A6jIrNY2IAEjrFEvisW
 nCnE9kysBsiCWJDtnFCLseC9daRe0P8aJpG2CSbTtOxSlgWMTgG3lH/GnNPtRoBVSL
 KYE9DoOW4CtlA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan+linaro@kernel.org>)
 id 1pUPhY-0003oL-8z; Tue, 21 Feb 2023 11:16:48 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 4/4] drm/msm/adreno: clean up component ops indentation
Date: Tue, 21 Feb 2023 11:14:30 +0100
Message-Id: <20230221101430.14546-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221101430.14546-1-johan+linaro@kernel.org>
References: <20230221101430.14546-1-johan+linaro@kernel.org>
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
index cd009d56d35d..80947420ac19 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -563,8 +563,8 @@ static void adreno_unbind(struct device *dev, struct device *master,
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

