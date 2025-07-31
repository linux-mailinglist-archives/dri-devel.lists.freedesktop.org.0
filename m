Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5CB16CA2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1802210E714;
	Thu, 31 Jul 2025 07:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dUP9OEBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08DC10E702;
 Thu, 31 Jul 2025 05:36:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so5091265e9.1; 
 Wed, 30 Jul 2025 22:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940208; x=1754545008; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cYq6/WMdCGI3NVumhbssuyW0E52SNpXkJoe+qhP+t+w=;
 b=dUP9OEBCJXCRhjgr/g/cYEKcqjqzoMezO+zocJIghHUJ0TicG6sgbu5HkuEj4QnN7G
 yuF4KEP6F+w5Tsr6Aliss6AkLjFr0Z+xC9+DjYyPbCX1mlPykI5CtQnuGARfJJMvleec
 IJfs6zLpM1Et4pBZBkQXIMsp5Wy6wyabGm9mIozCxiAZqgvhyAc1UP0T1xjwb8EQMzkq
 g3Aot/qcu4NmWb1h7uPE7jt7S9F99NU1Vht8imoXbbj6r/aczbmCF7SXaNApReI5dOKv
 0X4y9SLeSEZDvjfLcSVYC0zaTToki+8aDr8fwwbjLw2cALcQ+KKx5tMSioj1xz4TwQ8d
 SXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940208; x=1754545008;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYq6/WMdCGI3NVumhbssuyW0E52SNpXkJoe+qhP+t+w=;
 b=mHBDSAHKM+6U/QkdRoa9S9pKOFeCMS01ypnzn2tezeLLhJAOg8UWMErpQvvDUxdJTC
 0pBi0xmGiOYEL+lwWTcD5yTtoe1cKpp6Ng76E8SLngWPDEuaUSxyJXswdnyNqd7hNHPa
 l9OPv4rn/V72W2WEd/EiKR5Xv6qI+o05madcuKwxEsHz+JCpFBGzQKCpYO49jHLTUmMk
 DMxcjGqis5x1KtgNpk1zkaxttikz2P0WxE6XHt49D2XoqxAYmuEJ8X/JjRYb0LzXxc85
 SpQXMFvnyCX8OW3qlCYrfGPBQka3jn9/hvZb9bvskAZzdocr7PG0ACxyS22r2iYCLTQq
 m2Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEyihSU2A08sbWSC+NCD2Q3u8HEEuEwqja+r1kIlgVhrXyDYMvLoRVI0j/wqqeuSrsod4o7f/FPPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx47HRKBGCb+pyVs232pmBhtTkjauWDX8gzAynwpYuZFNWWaNdN
 0SOXYUWwUfRsJ2y15uK7uGNTPmP/mfBUUQ6dte1nRk+vPr6N3mTYVZd8
X-Gm-Gg: ASbGncuMci3h0fMO+Ff1vDZ+NDaYnjK9/F6pz5TkLwPUUNu53ywxgIg43pCD4BMOa2g
 9qJq1JYmgLxzpKznwrd/kMOvzui/1m38vOwWvapFttsf6sqGTZ3pFLoBl6CjDMZ23FZmp5FgFF/
 GHXyiMQAlO7G7l/dYein1kEUqn5tnsvqN1QY2gu/YZQ/3ZpF2F+mRIyoatxZDMY4gtLo+gLQYzt
 WjrGxJPqZhaQ7KK7b4ItsVnSwiynWf1muqz0Nmveqblum/MmFnUNzeMQlnfcARKfSfK+j227ltO
 wmHsyo6RoSc7fRR2fwfwNcuXwoKmJzkgKylkEx71PzZZ258oNXOdRUlHux6gvn8i1UjOXT5Buhc
 R183khlaXtdAEL58iKsFfQW5wBJ6fpeZKojh/1QKMVSfbZ4Fc8pLAtI5qckPA
X-Google-Smtp-Source: AGHT+IEp5VCzLJr0X68P0qy3TU0LoV0niMRhq9/WEWNUYlkHD0hdkBSjsI1HL68vgVh52+E/1wlU1A==
X-Received: by 2002:a05:600c:518f:b0:456:1d06:f38b with SMTP id
 5b1f17b1804b1-45892b9da13mr49754965e9.8.1753940207960; 
 Wed, 30 Jul 2025 22:36:47 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:47 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Thu, 31 Jul 2025 07:36:36 +0200
Subject: [PATCH RFC 3/6] drm/amdgpu: don't query xclk in AMDGPU_INFO_DEV_INFO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-b4-dont-wake-next-v1-3-e51bdc347fa3@gmail.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

Cache the xclk rate during amdgpu_device_init() and return the cached
value in the AMDGPU_INFO_DEV_INFO query.
This will allow to avoid waking up the GPU for this query later.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index e33c90c44697e..35827a0cca780 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -431,6 +431,7 @@ struct amdgpu_clock {
 	struct amdgpu_pll spll;
 	struct amdgpu_pll mpll;
 	/* 10 Khz units */
+	u32 xclk;
 	uint32_t default_mclk;
 	uint32_t default_sclk;
 	uint32_t default_dispclk;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 79d0ff0bda290..44a8fad60512e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4818,6 +4818,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if (r)
 		goto failed;
 
+	adev->clock.xclk = amdgpu_asic_get_xclk(adev);
+
 	return 0;
 
 release_ras_con:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 60f36e03def2a..190602bacbcdf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -911,7 +911,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		dev_info->num_shader_engines = adev->gfx.config.max_shader_engines;
 		dev_info->num_shader_arrays_per_engine = adev->gfx.config.max_sh_per_se;
 		/* return all clocks in KHz */
-		dev_info->gpu_counter_freq = amdgpu_asic_get_xclk(adev) * 10;
+		dev_info->gpu_counter_freq = adev->clock.xclk * 10;
 		if (adev->pm.dpm_enabled) {
 			dev_info->max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
 			dev_info->max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;

-- 
2.50.1

