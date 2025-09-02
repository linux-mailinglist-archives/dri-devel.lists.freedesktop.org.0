Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363BB3F591
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2210E5A2;
	Tue,  2 Sep 2025 06:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cLKgydUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE91A10E5A2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:33:57 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3d1bf79d7acso1599636f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756794836; x=1757399636; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ympzDmmI8MhfVPuR62lP77gCJMNp5uNIli2mbJ4bZQ=;
 b=cLKgydUn+sal/0ucvAr++qaiS4FdW0dRvGHq3i5I+t+SWiE6nBExM5V2nxS4bMYnat
 5WB9UQvYrhkxKPZN02ZhfACfXz5bh0TSQ5aQg00m4xwZLclRXRnCkihTfHXTFCh50kae
 OS12ykzIet11pyaXsABhDm+6hcIEfd6VGlivflwedZLxEF21Ol6aKe28SWnWAQgejQlZ
 NMOsw+hT79uM/F/KEKvBhf7Kd2NV5CQTHJ/3qsF9+DGZB7judPqNkUmtH+YsDBqtQ5kW
 +l33Z0KKxW/nIzN1jFKCIabIkqvmZkY96cGbbIMzwhKz4RPyFdoAvaybB6xcUpTuNE+p
 /gGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756794836; x=1757399636;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ympzDmmI8MhfVPuR62lP77gCJMNp5uNIli2mbJ4bZQ=;
 b=rDM45wG/Y+GdlB7jmOw0nr9Zkdyi57YWwBcn+3JgclYW4D9bFKVHBwIqIPu/Jy1Cjg
 CRBebHrE2Nm0xEqtDiTh4t4OO1sCEggni+iPW27Om40Q0keFj2QZRRM9xPb8OOw0f+ie
 dbB3lTYKJ9D00yPBGc86Ws2lS0sftYVeAcaKqIUL8OeDfLXX1OEGoJ1vlMbyK7F83aSy
 AZ5kVggN+9Rl4fseZSvP9pZZ0HD3IQ3XNmIyL4vmEo4xDtImibE9YNUDdcdndtXAlTyN
 T3h1cDZqhQ/yeGoe2ADizp/G1caMQNE7cdK7dA/mv0eT6Xw0ydESEhruliHWO1wShzGG
 3NKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSR0lyEtAqWhd8cIRho+UCq2PXd9teqkPuz2zxeSa3BHQ7PST0euKY/oTGwu48W4w9PxeEeB/0RzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzrvg773K8N+wD8+buVEapXluh1CKk5SZU1bEbogFyDVlE++LLV
 v4y6tOW54ZDbGq+W/Ki3t4e/YGLjexuKIkZz9yOMgjNayUMjtVAAF/pAonqBgdJhH6o=
X-Gm-Gg: ASbGncusc719x1gOvLN/XJCC3T2drfno4tLHjUtuF/YJFQHgSfk/vgzsYcnuf49d5e7
 pgkJ5Vzqzf4O0Kb2oBIhJDi5ryFb8YECpKSpKE7i1SZCJ91FWpt5XOT/y1SrVS3UrhgED943sJX
 JzGSSeBPMjNxUDPnD/H2NQD7LE8IhOiqq8KNZDufKSI4rnhFABLBxw6oGu74PDPvMolTzli/ibP
 JRO5IFNMiMxv9PXqHik6GqcOz9PoZ5O5cWNE4SlIjR59We1oMh9LZMBOUyRxfOt9/5ebNdVTHvU
 XD2O2gLY1w6nGN7sIrv68mOMuJfhhB++dh/G06EU1AdIuczX3hAMO8uRaF1oQleFHN+5SNWJ07V
 WnkqdK+RtlobUdQt1GOnGhn3Uh3caFCP8tPRc6HFBfgNNDs+k
X-Google-Smtp-Source: AGHT+IGczOOV8MWINPPIkYniAwwdymVO48SZpByPT7RWy59E5cu+BCfrp0a+JKywzdS+lIUS1DG3Dw==
X-Received: by 2002:a05:6000:2112:b0:3d2:6129:5505 with SMTP id
 ffacd0b85a97d-3d261295a85mr6792091f8f.36.1756794836310; 
 Mon, 01 Sep 2025 23:33:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d26f22f5bdsm13043671f8f.37.2025.09.01.23.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:33:55 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:33:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: synopsys: Return correct variable in
 dw_dp_bind()
Message-ID: <aLaP0JVagRyL0f_O@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

There is a copy and paste bug here so we accidentally return "ret"
which is zero instead of "dp->irq" which is an error code.  Return
the correct variable.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 33be4eae2b20..22e8b08ecb74 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2077,7 +2077,7 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 
 	dp->irq = platform_get_irq(pdev, 0);
 	if (dp->irq < 0)
-		return ERR_PTR(ret);
+		return ERR_PTR(dp->irq);
 
 	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
 					IRQF_ONESHOT, dev_name(dev), dp);
-- 
2.47.2

