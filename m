Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A19B0698A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA5C10E6DA;
	Tue, 15 Jul 2025 22:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lGJwPAkC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24A410E6DA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:10 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2ebb72384dbso1880465fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620350; x=1753225150; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q0r+lpi8NsNWVA/Sm1KkgGo1zMZG7gsRbU/VLszDSOI=;
 b=lGJwPAkC4hcX2Qkc5eGig1YOE6X23fyGl3LOtFD0YCgmccgLDNVefaBw+zN4edM7ps
 oqQ7kp+N7tVYVpWitP42oOXUfW5NHpOnNaRyiFrlswBwlumQq4I2y33ufrfibSijV5r7
 kKJBJXFM3B9K6+/MKC6XSizfUsa9yJDzx/D57zJdrwaxeJePZsGYbSs9LDoTxYSMVVTM
 OVll4NOr9BYgPW7Npmiw7XOmeVojWNsTSATZXNkUlgVY3a2fOX/IE4nUIG+oSB8NLESg
 Z9xbbaLkSReog6ZnVAxDIC87eSGVv6YRILcFqBTw/iVP8WLwS9ENJI80Pgb5XfOM7Yas
 b1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620350; x=1753225150;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q0r+lpi8NsNWVA/Sm1KkgGo1zMZG7gsRbU/VLszDSOI=;
 b=RvPY6uxfY5WZneoOFTjpfhBBwhfrK67+mJgOAblJoCyAsw+bAFsal+42zyUVodfRlc
 fsav6p4XaQx3UYYZ5mX15Md1xU1UHoAE19FqpGhZfAtLc06rXQ4pO6GY445eW87YVgIU
 xRR96vR6AjwhyFWfOH3wjqO3O629yKWBHoGOEBI3tz+UHl/32rCtAztetrsHrfrN0WfZ
 sHjykkSEfzQ4a0IGOdmi2gHuz6WIVlhkBsfX6ZeUfGiAtjqKeeWugfE+0ImAlb/SDs+2
 TreiEjNaf1z8jqbnFrBsTzEUCkfGe1bSO2In9LcK4aAyGxDoQYKFhT/eoPaVEqABwEaN
 c7BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeNsYv91lI2tjYUGrYI9rTZt3uYgMbDNTqCCOp2QSRiCSLiAIuK801JIBPSeXWtlv5uHIw3Bg7Lu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG+hxw5ydSKdEHT/XbKlVaDwmKh3Ok3+jzbBO2yu/yihN96pgA
 2zIRPDMufJKd6AXR4k56pH4j8E53FzJgPbKsmxinwDAN/h/GnIkEfY/Xy28/ihBCBM4=
X-Gm-Gg: ASbGncsJDId7I0nJ069UfHbDr0/pa/t2D6zAB6PTcDm3nPymonVTMCsrr0HLlAag0rp
 TsaBEwBd9gVGZuENBTpT9fnUe5WTPsTfjokoLgd7qb+m4krf7SGuEd27o42/IkoVkVLBKs7Z271
 wyDkTUE3FREY0yzuiw81+my2TNg7+nI4w/MYD6Ef9TaSZDNhRgzjUEcvOAOBCVT4BLq9IibdmzM
 0CbSPUPCdrjQUCygBl4lZjLfrcyPtxPTJzP9EfQITi8kmd4tqXNIHfHIih+FDyrX/mbHg7na8v5
 I2X22t6uG1xTLLecI1008CW0Te2HgR6g7rsOyrwcz6vUcZrPgS9HdGC42IZADo4LjUwdg90L8cU
 tRkdxgir6G1cC5GSfY+f+5uP2cicH
X-Google-Smtp-Source: AGHT+IHc/xJFBpogquGRvh2ovITPRrvj17Yzf/CgNYUFXPyrDzsqrw22DAEVZ/OJFSPIbJX0w4xOgg==
X-Received: by 2002:a05:6871:b12:b0:2ef:9aa7:becb with SMTP id
 586e51a60fabf-2ffaf4dcd06mr1050952fac.18.1752620350028; 
 Tue, 15 Jul 2025 15:59:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 586e51a60fabf-2ff8bc75ac3sm1100244fac.20.2025.07.15.15.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:08 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:06 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/bridge: analogix_dp: Fix a NULL vs IS_ERR() bug
Message-ID: <d679e2f0-f449-41c4-83ed-c3e26e440a4a@sabinyo.mountain>
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

The devm_drm_bridge_alloc() function returns error pointers on error.  It
never returns NULL.

Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ed35e567d117..4b9b444bd249 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1474,8 +1474,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
 				   &analogix_dp_bridge_funcs);
-	if (!dp)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(dp))
+		return dp;
 
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
-- 
2.47.2

