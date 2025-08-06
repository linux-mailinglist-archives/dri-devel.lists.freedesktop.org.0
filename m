Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA00B1D312
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D3410E7EB;
	Thu,  7 Aug 2025 07:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUdmlbtE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9606B10E308
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 18:30:56 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso1393365e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754505055; x=1755109855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i9tF7LI6280Rqv7Cfa6VisATQ2AWLBgyuKrf+KPfB4A=;
 b=OUdmlbtEvL91b86Yl5zfvzjayGW/et3Pbzc264T4wU2lUzcc4+1nDmIc1tQxgEpvUn
 dztLObKSj5BPd4QCFnMmGsxyY1GuoOv4mp/6JWBQEmmgI9VUxVGrUaZJZDE4CJFDASUc
 ++bApFrq47iJT1kbGxAbfQfCQpPkwqbJG4XIr1Plq4ZUkBLdnfvy7pf7VPupdKy1qQRO
 HWU+Bl6eheUl6xouVgnWOS6oL9HpjvFXlYA7YFX+jN0MdhYCDMvsLC1ODucXzLugGW8A
 qDM0wJmne1zqjCB8WhNPmAwVc6l5Uk1nUAgZ+ktMrVGNfnnu2NkBahrpDtHsci6hCxJ9
 0b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754505055; x=1755109855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i9tF7LI6280Rqv7Cfa6VisATQ2AWLBgyuKrf+KPfB4A=;
 b=nAXv2YLH+zPb+qX8GbXzGGe6hs9fSgYyDEJyKGVui3ubfsWyYP9nJ5EXnN5TLgxcNC
 NKcwlg8b0FsRk+R8ZZC3dY3G72KB6n+ZwdRBj69rQnijDf7zeU5Onsa/u3AHx83gLvhy
 8arwCD11ltz+FkLz6CSmFfvkWpusg2rQ2LVKVTcOoQnQBNs1rnu0wmFoPKzOW7Vt9CPg
 7q9tvD37wTOt9Sx+7BTE5ohBugjqK0MoaeDCdTmjKp8A6l1MWcgrgDqwl6EKwTJ+oAro
 OjpBVpkKh1aK1C/wWrG+uB4K4CVM7huCZBiY1pn3G4OCxQYp+OR2zlbwMFpuUOERo+VA
 Lbtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg+TU8s/KI8jmIqxg8NkHSmbGSRpThw9ibmP66XvbL7HuMx62nqIIdiX3fvtjWXap2atYR90nHV6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTK+e91QkJvTAuXvlkCjP/5Y2xFy4FBb+/VHpjMnJLMInpq3ko
 B0eHJ+KZ2Nm5Ke07VULd6bSJqQEnIZycA2gy7fzopMhmdwXjDS6HrKE3
X-Gm-Gg: ASbGnct1zUtbmic4inQ3woPWozCckpAl87pnugySTQKqlpvCNYZyVcNgUs2093mOJ21
 5hYk3Y5ruY3BZLdc7MxQ/YNo/7Qn1NJUOH8X7o1fQvKR9dmAUBbPKmj+ZYHsr4bsggBG5a/22d3
 fX9fmzMDDjohL3YiN0q7uHPWlYrapVN7WRlan45v/35dRNkJE/YJiWITvTN/dJ+DE7IYg+K4XyE
 Ptb98LrgXTwPU4rnfwTtBq1vcCB/pIg76L7+E2xcHmFJSinqWVifrBaPrCgdWQHbONHAv7bVlcU
 bmOtIQd0yAoYcRJlb4nHzrqDz2v3a2eUjJj19ysj8WkIsopq8u2e6tEQ6I2c8KHx/6eWAAqYkzN
 Octao39tcnUqdIESVODa90EU32x43S4LlBzAQu4uOAKwK9xk8Sf6GYyBj6iaTDwt3OfiyUWV0DG
 A=
X-Google-Smtp-Source: AGHT+IH6HaHyzrxaoLtYAvA1b+HYXwJxcd00pdb2pcxvIAdn4XhD1N71vIwvp/Bn4tXqtLYoNd2ieA==
X-Received: by 2002:a05:600c:6610:b0:450:6b55:cf91 with SMTP id
 5b1f17b1804b1-459e70797ddmr32849155e9.6.1754505054523; 
 Wed, 06 Aug 2025 11:30:54 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.172.189])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm156104065e9.22.2025.08.06.11.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 11:30:54 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Cc: skhan@linuxfoundation.com, Eslam Khafagy <eslam.medhat1993@gmail.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] drm: atmel-hlcdc: replace dev_* print funtions with
 drm_*
Date: Wed,  6 Aug 2025 21:30:40 +0300
Message-ID: <20250806183049.52112-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 07 Aug 2025 07:13:37 +0000
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

Hi, this patch is to replace dev_* print function for the atmel_hlcdc
driver with more prefered drm_* variant [1].

It's eventualy up to you the mainterner to chose to apply this patch.
but since i am a starter to the kernel i'd appreciate it if you do.

[1] https://docs.kernel.org/gpu/todo.html#convert-logging-to-drm-functions-with-drm-device-parameter

v1->v2
change dev_dbg to drm_dbg in atmel_hlcdc_place.c

Eslam Khafagy (1):
  drm: atmel-hlcdc: replace dev_* print funtions with drm_* variants

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 20 +++++++++----------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  | 14 ++++++-------
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c  |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0

