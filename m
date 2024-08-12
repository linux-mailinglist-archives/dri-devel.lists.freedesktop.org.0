Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7991C94EB26
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 12:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F0D10E082;
	Mon, 12 Aug 2024 10:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gpa5I3mZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BF110E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 10:32:48 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-530e2287825so3895275e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723458767; x=1724063567; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i1IfJ9u3yUX0iZ4jMFGItrUi/pvd+46Zvfr+ViX5sCk=;
 b=Gpa5I3mZDEsmbeCge9c//H489qzo5NtM/CtsommSwuZlyFX53wZDRhP62aPPWxJdhz
 6Vuft/rTYUZa7MXq/jy1+i/YLNfsvms+GRr8CL+2ESt5iaA1n2Jx26d974IEcFqolAFM
 daPfeymvBniOr7GbWbuWjnCDUd7zdPBEGZLgM8jAdzhD0OExYlt3Ecpn0K+fck932LTO
 6sWEohX2koi/E0qgxBw8j8j7W2py65lSsVtv59rT5zzOr9UnTdySWUoYEtDPDsIxOLZI
 wEWobOzDy+dB1dXrBiSfZCM5suxDHA8HMfMatruwYuYTZEBmOXDwl+ixI094X9lvSdUB
 zWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723458767; x=1724063567;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1IfJ9u3yUX0iZ4jMFGItrUi/pvd+46Zvfr+ViX5sCk=;
 b=DnNIUiq+RPNlgyMzX7Wy8CG6gSYCKhukEhKjr4Prb84Qxd/JbuXCV1ehnzXBWvwl2D
 7K7hkgmMRZHk7FIysGvim+13zl08HtFIdtteD569u+QkGhm+59r5bN0NS8SMb4jBTIuR
 Tizs/LTcPVOXHzEg9k5MnVqlDlXxl/bZ9AoiL0kdWbsgkMwsEmgvDXkg0tYGWVD9D+DH
 9ekx8xLWQESLySADlXgH81P4R4/KgrzoNP/wh+uNeezV2oxKQc6yTcMZ0b1E62ny10iZ
 gcTezU9jKTmLN9CVQi1a18M/G85O7JjNuYpUUY8U5T3yLNQhwZX6hDzNVDHMvgAALg+m
 TXVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc11G37fmrppR/lBQDETWnXfYIU7PbpQ7NH3semEzfoqcPFs19k+dzYdad3SGrkmwbGmk2NDm2NceCaVefudJe9EZsPp5yqkjcFrGhN42R
X-Gm-Message-State: AOJu0YyJ9cHomrgcDRxIlzIvt2YnEYRWVu5nrKyYVB3z9EV1JT9tJWdE
 TwxunnvUoAS8+KVYJ/B9Ltollwmy2k/cLtI4zmNnCoSy+j6X10ncyX+8TQz5kaA=
X-Google-Smtp-Source: AGHT+IHzgJxlWNmlpbcyADFmPoi5Gdg+YYXbOVyXdQhr3/VvVj6WyK6nEwaJnWhwJoNlT7DEw3b1qw==
X-Received: by 2002:a05:6512:ea5:b0:530:da95:b54c with SMTP id
 2adb3069b0e04-530ee985dfdmr5817998e87.23.1723458766440; 
 Mon, 12 Aug 2024 03:32:46 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a602da2sm2158926a12.93.2024.08.12.03.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 03:32:46 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:29:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH v3] drm/ast: astdp: fix loop timeout check
Message-ID: <1ba8da25-2d09-4924-a4ff-c0714bfbb192@stanley.mountain>
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
v3: V2 had the same bug but just without the always true if (i) statement.
    Remove the final sleep.
v2: In V1, I introduced a bug where it would msleep(100) after failure
    and that is a pointless thing to do.  Also change the loop to a for loop.
---
 drivers/gpu/drm/ast/ast_dp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 5d07678b502c..ca022c287785 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -146,18 +146,19 @@ void ast_dp_power_on_off(struct drm_device *dev, bool on)
 void ast_dp_link_training(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	unsigned int i = 10;
+	int i;
 
-	while (i--) {
-		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
+	for (i = 0; i < 10; i++) {
+		u8 vgacrdc;
 
-		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
-			break;
 		if (i)
 			msleep(100);
+
+		vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
+		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
+			return;
 	}
-	if (!i)
-		drm_err(dev, "Link training failed\n");
+	drm_err(dev, "Link training failed\n");
 }
 
 void ast_dp_set_on_off(struct drm_device *dev, bool on)
-- 
2.43.0

