Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85610853968
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 19:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12B410E64B;
	Tue, 13 Feb 2024 18:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="scUIEJUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE5A10E840
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 18:05:09 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d10d2da73dso9482901fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 10:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707847507; x=1708452307; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e70wXDD4s58i4pPQoq+fOfAGn7fmyRVc02WAzyBJDv8=;
 b=scUIEJUVsqS5l1+MgsKlx1CplTF4ibsyJ9C9I9XptlvwaRte3hn674XIDXOsGrJ41X
 HGxTMiRAxlAeiietPKJHDUlaUhOa7Xo13EQXCBuDr3EVlDetlqjv0MPIqGj7JcVDydD9
 fX9JhnMQCH4cz160qe8u+Py5unCnl9GcJBFYtFkxJs8nsLTkLpyXhsDSuoTiwmjJceen
 ND0yp6jfiuI0uelmOw3RzYz4d+wBdPMY/islsCLVM5MjDctcEFxmFNEi9MacXptKYQmd
 jWXCK9PCkA7qePFyZ8yrUWfVo12DZ/jnFB92wTXoJa19nRL5rPQJyEJRpCbcmZ9+v4tg
 9uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707847507; x=1708452307;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e70wXDD4s58i4pPQoq+fOfAGn7fmyRVc02WAzyBJDv8=;
 b=Chp/It1dH2Fj4eK1gUJsLFgKdWfEtvG9nnT9AxlX4GuJqiBC3SPEW6OtGDtQmu4Rbi
 jXpajwQQtq+OjblF6dHEOYt75sW1wzOnyhGknIBMTHHTX5c/LyGIKvQH0Q45MmS0zwCX
 cXrcjHizLIwtszfdMbCN106e289P5sYr/0D9wRpiDhXPLvbm9uzG64g/x47Wqv/bYi/M
 mmGeVYjx57+9tx2haeiDkHe33ptMdHqLNBF56S7wUZn1Mrc1XFZafLAZooTjNmP2h5E9
 cyCoYDgGZOgWqx8w7PJF2LRbSmifiH/K7ZZ+foC+gZBMgvxnZw5igYixVCjkZi5C10hm
 s81w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ZKLhjXS+4lv4zUyfT3OyIaNFP24cwYKc9V5BvX3cM3/gITfBW7IuTsVuAHtQYScgk1iWu1n1/TMxi1/J6+zGrt4CFQvMID7KqK5a2OzK
X-Gm-Message-State: AOJu0Yx2VDPMEVJ5vJweG5R0PJXsgLAThrWuwgZYMWl5RWESstJ6jVIA
 uIKuk/COWftUrtiM284/kqnpk/xr7hPn8k43lUbGZ9GW9VzaXimpzqeC6ntB/fI=
X-Google-Smtp-Source: AGHT+IHmkNgIi7TzfvE847XBZ2OZM5yDgs1O1Gu/TDGtB1RJErk5/dezneWdy7eJGVqq6KcPWyHDug==
X-Received: by 2002:a2e:2e09:0:b0:2d1:ca1:760b with SMTP id
 u9-20020a2e2e09000000b002d10ca1760bmr297273lju.30.1707847507407; 
 Tue, 13 Feb 2024 10:05:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ54WrawIOvlpxGz8yZKRDQ4SqXq+ERsBBvUjJjAj9qIo+bWEyrtNeTqIAiLi9LXVheQhFRx9UR6ajW92PZ+CvHLgnewa2EHey+1qbM5k6vFOqj97RVJ+DGojyFT8KwZtvgHrqGU9IPR4yGbV7GBdYJt2IULruG++q1lypc0xAkiG2Oh/ePKKJ6k0cZhn9x5CzoFHWTvZDrU1iQBLyUrF4Eb7KG6vjhkTVbsR4+YZjkeZz2Lk1kUd8QLhJoDAtCk1qKUv+RisDC2l7/yiHlPLnJhOUrqkDMCPA7waGTcg8DdN1tNI0rceLgid50LvlR+6BNKq+VGapvGwAv7CEq41MUsQZ3gqHFeawGmBtfuvghXbxoeYSC1mp06StN5ZL5lVqWurMvYL/OHtrq7O7wOQIedPShPXsBh5kTf/q8wxfD4HTEIlEbjP4G70TvEm8D8Qz+gCu+8umWLo3TMvAem9GcDkf6HfHjRUFvRx7pMOG0uBBd1d6DBNRXpTN9PIikhzbFmHUOIGYLC1v2rqRSMUXHdyKfCfUV9S0qT1C0C6U32aKxY2L4cQLx8CQW7drWAr9rDxmjV8VgdM3fmQhTstf/Q==
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 j1-20020a50ed01000000b00560ecb22d49sm3827246eds.84.2024.02.13.10.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 10:05:06 -0800 (PST)
Date: Tue, 13 Feb 2024 21:05:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/imx/dcss: fix resource size calculation
Message-ID: <4914592b-4256-4c9c-bc1d-6dec1e473831@moroto.mountain>
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

The resource is inclusive of the ->start and ->end addresses so this
calculation is not correct.  It should be "res->end - res->start + 1".
Use the resource_size() to do the calculation.

Fixes: 90393c9b5408 ("drm/imx/dcss: request memory region")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 597e9b7bd4bf..7fd0c4c14205 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -167,7 +167,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 	struct resource *res;
 	struct dcss_dev *dcss;
 	const struct dcss_type_data *devtype;
-	resource_size_t res_len;
 
 	devtype = of_device_get_match_data(dev);
 	if (!devtype) {
@@ -181,8 +180,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 		return ERR_PTR(-EINVAL);
 	}
 
-	res_len = res->end - res->start;
-	if (!devm_request_mem_region(dev, res->start, res_len, "dcss")) {
+	if (!devm_request_mem_region(dev, res->start, resource_size(res), "dcss")) {
 		dev_err(dev, "cannot request memory region\n");
 		return ERR_PTR(-EBUSY);
 	}
-- 
2.43.0

