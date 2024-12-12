Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA549EE703
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F30410ED9A;
	Thu, 12 Dec 2024 12:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HcuFyxfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC510ED9A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:47:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so1076465e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734007661; x=1734612461; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B1Aa7kk3KKfy9aAdx9Y9ApzJ11F7xml9XtZy8ZKLnk0=;
 b=HcuFyxfVIBmBxvxk1dgTLaAMfFQnBpIlcpALjg9recjr42HR88NF7qQTWbM7s5Etb6
 e5egpNOL+sSwdXSvxSFZxMVp01nuZVjVePHfdnJjGGHazbvBfQLQSzK8/McicyBUQ5zU
 47NB5bI2iQu3a1wxTj5IFfIruoXMOrM8G9rs9ZzCqgLCiyZ5VHSNoimMmKMTaQGJr8Oh
 7iPqcAeH8+AD6HuzM9/8zD5nmRahRbve5ABSQHiXQsEn10IPYKF35KWEbGedxXNAkhiT
 wrwM9tCzV6hYzOW9qkQ0o0hANmCcnqe5D7jn1jiyHR+FUhmB/edshXgMzxW9e0GvGkuT
 DrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734007661; x=1734612461;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B1Aa7kk3KKfy9aAdx9Y9ApzJ11F7xml9XtZy8ZKLnk0=;
 b=i2KDJ097EjYRM87MMA5F4sjy48MKW2CVF9cJ4nfYS+qr64iLQ9MvtJukuEZE+dgGn+
 nXbsAZjvsrn/Un3aXBUGrY/jLRLZH7YEoit9W9oUMuKTipwav5iXyTOdokpaP1pPqk1h
 iOgfCkn6xydkHM12qFXIyth+O1KaAZtprzvsNUBcq4b7humMLmmAgRPHwsjyPOTPEcRa
 ndsbe312WIHOjlmVzyc3XAW4tD0ZN1Iy2vD4rOdbCpgEW+XkSuZpoq9SKeaHxfJY4IXC
 MJObqfTHwRJuGT7x3aBGxQ342xpT90QmooMwFYnh8l8ZOYgaoggt0WZqy70qn+ebu37k
 dndA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzXneqfRtdt+XALv1yU8TkKnZ8LFV5IBQ8tI5bNxMX2rV1X0ZZKkUEH0h5x5rBKdoU0reaTE9nu80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLj6HfZzuHZHy1KcQNCUBpL5lf/fhBuDp74pjo1Eg4NN/HSazI
 XyeB6VPxWHSK+OgYbU5xFBEhkwlgrzePS67kKdX/DEUW+EymGTiG8C08DgrPHqU=
X-Gm-Gg: ASbGncsgkeZKhXBmFHHMQA9uw+qkcDoykUer7JItK1TdAtBWXT+9GIsrPRnGilftk+8
 skxD14HE9yPeLlW3Th1CvZtFho8jg3IUZ/08eHuplyAbl7yDWTLSyHQR9UaR4dHyZV4s4MCTEMt
 YIht2Yzbwi4pt/IroXvF1+QuRjLYo+quDH//8Wsrw7Y1XdauStCrMmSH2RsoJXpw88dA0ySSx+R
 3Te/QUnxdzMglHLQWnMEl/tLb0o2FtnxDy8IhnSK5NTq1RaKGaBHUUYTq/4Gw==
X-Google-Smtp-Source: AGHT+IHG070ZSCDM3VoQ8IcxxgcIA8LmAYT5Wy1Ts2flXAmROuoKHKuI+kgLYIo8ua64rhinlAKIfA==
X-Received: by 2002:a05:600c:1e0b:b0:42f:7e87:3438 with SMTP id
 5b1f17b1804b1-4362256dc73mr30023385e9.0.1734007661208; 
 Thu, 12 Dec 2024 04:47:41 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625553234sm16279045e9.3.2024.12.12.04.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 04:47:40 -0800 (PST)
Date: Thu, 12 Dec 2024 15:47:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
Message-ID: <b61a81b2-0101-43bd-a4f6-09cf3a016484@stanley.mountain>
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

The default statement is never used in real life.  However, if it were
used for some reason then call drm_dev_exit() before returning.

Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style fixes

 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b42027636c71..4811d794001f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		break;
 	default:
 		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
-		return 0;
+		break;
 	}
 
 	drm_dev_exit(idx);
-- 
2.45.2

