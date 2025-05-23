Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579CAC2735
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1687210E832;
	Fri, 23 May 2025 16:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iOZX6Sah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63810E832
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:09:08 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so48213f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748016547; x=1748621347; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g6chOe/tXluDkGi3FLf3UONxFGeWcH0v84gFfRtryfM=;
 b=iOZX6SahwMrHEXxAkF9oWoOs1sNEbdhW+rJjJxQC0TBk4bMr9rmVwZKesGmhbyBFv9
 o5vNL0TtsneXNYpFizsQxpG47kaqwurn3kUskCtijOhpAIxclty/bGlZyysiPrHjc61c
 JMNgwkwuJw0a61cWREAtk325kH7qvwc1chmFPbZoAFUHsBU5OlssxwOIkLIdLpNpwF0F
 5OfC2td7K2OLWo32083I5udN67J2wGz1jVxya1Kr5OsjUS1orIekQ5JxKcbzGC2QnNSh
 hZngnqPRF3ztglz1bnUWwBJTG9iDHOYXcEsec7YsIwHierwQdrMOgrTS79B8zddDd3kJ
 Ekgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016547; x=1748621347;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g6chOe/tXluDkGi3FLf3UONxFGeWcH0v84gFfRtryfM=;
 b=JGET+u02TwQZMi+j7HK1mysGjBxbQdbGu4l9gjR71sSfYrhadVzeU+53dNiX7KrXOc
 VJtRBOvZrdcLSYDyj2AgcnNLg/33DBvJl1jrgU+Nsa6fZAOCh9DEKN0uRIJSNNb4H6Lz
 lj2QgLFMIk5Od20bN2D2ze26EC19ZLKFhGsZPvQyPUUrSzB3ZoemVI/CceNvF9pQOsf6
 NKGy3Xv3KNiVmugKPfepelEX/6PRg2027jptEyYLdThQX30IhtLjNQf+Us1bpz9Cczd9
 jCFpt6nV+zUPJ9Ip9h1zCQ9aBwBXwGmaNOdUtAuCLiyPOVV+hH7wiz+4qF3KpxOj4JUr
 M2bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVItlDlqxXTU9SPP/HI4GsperVqDzj4oStqzxJCwacxWVXC9ukEicEqgZWxNJKu0/M/i0MgiBXfC48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHkr/TOa5mb14/yMrLCwdWSqwFtDuiNJuIXCTVoLBOd0nLN5Na
 xI5apxETj15+CtwXgtl5fWJHFWnnG2gIxtx0OH7pheZYu9R1F40lxpbi6Hh8J86WSZI=
X-Gm-Gg: ASbGncuYjbh3sqE9vYrLjx1U/WpqsIBNBv11x0fZdJqndn/OrWFHXN1IBX01nyGEyCP
 O0VUvZaPzWSnyuylRDSIf5E5K9r0vY9LWmcjawQvEgUbvpDfCmpPyYzrvLokMuHcx40uLkUc3q/
 GLkeeV6FnE5gMkDSq4/KSALViFIyNJV/drp2kx881H4/8i60YK8MLCSkuU+cKZfIdT3h4CZ9tAr
 OegXFi1rq/LjJ1n2tRm3bzSQEQtMdWIuAj6RH1YAyB+6ma8KF79fpaBYK2xHQNxwihsZqlTsgEX
 B6IEEWFstsFNd9780mA3rWOL0ESZP0opHJyvEuys1X7U3K7cRD3q8YZ1
X-Google-Smtp-Source: AGHT+IHPVwqYQMQUBFaNXvEFIcr3w0MI32C5yLoljXKKKhZovzZeYOKYCcY5hi27O/0atp1C/FA3vA==
X-Received: by 2002:a05:6000:18d2:b0:3a1:fcd9:f2ff with SMTP id
 ffacd0b85a97d-3a35c808dbamr21076476f8f.12.1748016546702; 
 Fri, 23 May 2025 09:09:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca4d310sm27215487f8f.17.2025.05.23.09.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:09:06 -0700 (PDT)
Date: Fri, 23 May 2025 19:09:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panel: nt37801: Fix IS_ERR() vs NULL check in probe()
Message-ID: <aDCdn9r_ZAUTRpWn@stanley.mountain>
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

The devm_drm_panel_alloc() function returns error pointers, it doesn't
return NULL.  Update the check to match.

Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt37801.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
index 84d367eab058..d6a37d7e0cc6 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
@@ -257,8 +257,8 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
 	ctx = devm_drm_panel_alloc(dev, struct novatek_nt37801, panel,
 				   &novatek_nt37801_panel_funcs,
 				   DRM_MODE_CONNECTOR_DSI);
-	if (!ctx)
-		return -ENOMEM;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = devm_regulator_bulk_get_const(dev,
 					    ARRAY_SIZE(novatek_nt37801_supplies),
-- 
2.47.2

