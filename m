Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D09AC1C1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEE710E793;
	Wed, 23 Oct 2024 08:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sMEVwv6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ECF10E793
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:35:48 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so65340385e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729672546; x=1730277346; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3keMfTd6iA7sU3pCEbZeVuLo6cE9jEmFKIeI2gY/mSU=;
 b=sMEVwv6lnzihLNZo+z4n//M3NeMduKikc2uuIryihogX8tgBJ2dnU25aUc8ZCuLId1
 2HLFiv6npGXxPqx+INtH1sFZpuc8+cRO4vGPaVGnvTnxrRfFVqAH/utzubYmsioHbiOT
 5p4HI+hUwkkKZZbse2+sp8rvaLQLHrELHaAyPsvoWTqENwcCMCUrht97RXdLQ1WSoVt5
 b3RVj7v2ukoypsZU+I62XtGKUCPAK+XxNRqSZY/e/LedQFm/ugiAmC59jabEjLeb6VkG
 KRvRw7omaPmSLk2dFR09iy6RzceDUca97KqlAegqG56Dits3gNUWlv8oEoTEoTtZrXwt
 MZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729672546; x=1730277346;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3keMfTd6iA7sU3pCEbZeVuLo6cE9jEmFKIeI2gY/mSU=;
 b=CQmtzs7nFSwKd+nYY8sDRkcsbVBROYvpqMjjYAPE8XRvBD6M1SCiPHv3rR8VP13rtg
 KjX7TDuY8lJb5iPHYjeDEBXLdN40emax98V2YIFC+/qLT77TC0PQJzTM7ddWQqf4r45Q
 PZalQ0rpdqmMFB2nXTQo7mCHfyV7f/nQ76E6gS8zeSxQBb9xf+6HxXRL12RZLI4myVzz
 lVYzh8R87MHIV5cF2G8oPZWmLEJHwp4VF7R9ur8QoKZTTzET2nEKvoP9FbWea+ZBbkyy
 7fcLisTvyVRM5mb/rp4TpNL/BFf8dCLs5XbbuaDBtc4zNfUEXnUucefHH38ft7iGZHAU
 QuBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQChWQIzTvzjrggnVz+w1Fb0C7hdxNM4/JuUpkdjF3PyrgD3gIzAhPz/ol8NsBX+8b65W5SHfGfWw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBV4xnElD2aQhPBGg3tZalAD6g9YsM5d86myRzFSkC0qyoczP6
 cJct11swRFg0MJ0saNyME3PT+X3vQbUYHQN7qs4YqTzfm/R8iXUwoOzutED1Zxk=
X-Google-Smtp-Source: AGHT+IHmXnBGT7OF7hHGlVdNz3VlYEysdkSKiDQWAZPncpV01I9EuZmg4AgrOK3MaMOXgvIs1q0j+A==
X-Received: by 2002:a5d:5223:0:b0:37d:33a3:de14 with SMTP id
 ffacd0b85a97d-37efcf00deamr1112744f8f.7.1729672546641; 
 Wed, 23 Oct 2024 01:35:46 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b9bb15sm8401812f8f.99.2024.10.23.01.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 01:35:46 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:35:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Schiffer <matthias.schiffer@tq-group.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/fsl-dcu: prevent error pointer dereference in
 fsl_dcu_load()
Message-ID: <e4e078ed-9342-48f4-80c5-28f0f7b711b0@stanley.mountain>
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

The syscon_regmap_lookup_by_compatible() function returns -ENODEV if
there isn't a compatible for it or other error pointers on error.  This
code only checks for -ENODEV instead of checking for other errors so it
could lead to an error pointer dereference inside the regmap_update_bits()
function.

Fixes: ffcde9e44d3e ("drm: fsl-dcu: enable PIXCLK on LS1021A")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 91a48d774cf7..5997d9b4a431 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -109,7 +109,9 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
 	scfg = syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
-	if (PTR_ERR(scfg) != -ENODEV) {
+	if (IS_ERR(scfg) && PTR_ERR(scfg) != -ENODEV)
+		return dev_err_probe(dev->dev, PTR_ERR(scfg), "failed to find regmap\n");
+	if (!IS_ERR(scfg)) {
 		/*
 		 * For simplicity, enable the PIXCLK unconditionally,
 		 * resulting in increased power consumption. Disabling
-- 
2.45.2

