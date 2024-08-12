Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45894E6F3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 08:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91A10E0E6;
	Mon, 12 Aug 2024 06:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KQFrSGBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE8F10E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:43:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52fc4388a64so5478316e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723444979; x=1724049779; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UbHIy+o48Z4/7AHlMrZBoQctzcikg51wtZVN0gnDpss=;
 b=KQFrSGBy/t8GgqSpc5ptPmiAtO2nCfZK+HudmCkgJJICYqRdiJzA81IOFqM35U5iK+
 L8+kc0ah9rFj+mu7Uv+qcvjG55kn8AM1S4hBQvuTlYwD5NQY+zd5NEYBlT4Z2ANvLSHR
 iMWBUg3tQwkLjY28wHlBUorl/Qve3Ua8irSNOG2cqiNILCtAL++bYIXSBhkOJVjyB0PG
 VuL2QgIYgC6yqTg55jPQhi9uk+f5GWP3bUbFOZYCX3GIIQSIpQEQM7aeVl/UvhZvG1Bx
 WNmxqafclTFBqVJ41dFOIxXMQTSHLDby4WDj8Lizd8LUTKpMpR0OKXNWLfi0Kk8WWl1l
 XrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723444979; x=1724049779;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UbHIy+o48Z4/7AHlMrZBoQctzcikg51wtZVN0gnDpss=;
 b=ICPKb2MbpvL7ykih5Xgn+bwYrsz0rfn6QLF8TRqR0eGIYclEmUqV0PRgst5oZOizZb
 W/pZTlw+Fq3ZbQGXEM3nSj4IfZZytzKYapysdX5NjLNIdES81r5QFWh1MTuorRmxxS/7
 pzegqv3JaTjBZbPejO5vDJyyvo4OjaRkqOqPleI3AawnKTQrlf7F7dfMEojfBzmySOKH
 up5tNRY88lKV2OQSDv63/RryUno2u5OK4fn/9t9J0QBtPxBbQfH3Ge83hhnoj90nYAPc
 DGCbykjyr7w83Z+DJ+anLrZa5UkQNO1wpIArQpIy7Oh7uywGSF37nWZ8vkue+fmO4TUI
 A/aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYX1F+FsUj2StnELeRaHXj+X3LKSJlzbGikiP3+ESWJmVz34w1VJn1lJQBewYr1nNd1Ss5yNT41Zq5/1tl26X/dqMubHk8DfgIwTrbIlvB
X-Gm-Message-State: AOJu0YwP35Ct/WoG90+u/wZ0of+NN6j8ZtzWV2MEIvk257CM1dkCoQuA
 4NvZQyK9kD/Tjki7gQ9UgqvrmXLAVzZix6/WO+PY2/xF/zWlsmB3PFzZhi12lFbDNs+O/UHDx28
 o
X-Google-Smtp-Source: AGHT+IEk4ZnNIsnzZV7k0SJFKSmS/31tiOmiB1Iz5IztkYLjgc9jdDjTxOdK5wP8Zh9WscuTC77ptg==
X-Received: by 2002:a05:6512:10c9:b0:52e:fd75:f060 with SMTP id
 2adb3069b0e04-530eea70162mr4660900e87.61.1723444978819; 
 Sun, 11 Aug 2024 23:42:58 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb212bd2sm205048766b.176.2024.08.11.23.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 23:42:58 -0700 (PDT)
Date: Mon, 12 Aug 2024 09:42:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2] drm/ast: astdp: fix loop timeout check
Message-ID: <9dbd4d2c-0757-4d5f-aa11-7d9e665e7633@stanley.mountain>
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

This code has an issue because it loops until "i" is set to UINT_MAX but
the test for failure assumes that "i" is set to zero.  The result is that
it will only print an error message if we succeed on the very last try.
Reformat the loop to count forwards instead of backwards.

Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: In version one, I introduced a bug where it would msleep(100) after failure
    and that is a pointless thing to do.  Also change the loop to a for loop.
---
 drivers/gpu/drm/ast/ast_dp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 5d07678b502c..9bc21dd6a54d 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -146,18 +146,16 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
 void ast_dp_link_training(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	unsigned int i = 10;
+	int i;
 
-	while (i--) {
+	for (i = 0; i < 10; i++) {
 		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
 
 		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
-			break;
-		if (i)
-			msleep(100);
+			return;
+		msleep(100);
 	}
-	if (!i)
-		drm_err(dev, "Link training failed\n");
+	drm_err(dev, "Link training failed\n");
 }
 
 void ast_dp_set_on_off(struct drm_device *dev, bool on)
-- 
2.43.0

