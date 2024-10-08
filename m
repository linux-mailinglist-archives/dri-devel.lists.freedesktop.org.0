Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC069954BE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 18:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DF910E595;
	Tue,  8 Oct 2024 16:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NknnC2Zi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E41510E593
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 16:44:49 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cacabd2e0so54952305e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2024 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728405888; x=1729010688;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7ikQLOlALZNXVFMnW7DqcctLilRiigotMVrHZ/dmQB8=;
 b=NknnC2ZiliA6ErIj6dNPmmZgezHXeeI7w8hO1wADFJnBuHva5yEykgkZuBxgmXemjY
 QtKCpnFt67F/fZU3Qcna7BmgtdVVzKBuOBA0ILX3E7lrzLdYj8HMlANe35+N4rzIuC1F
 4gfp4ZDyrtvObOIOtCQy6IsPkOEHJcDCCDQ4/qBi2dVuECM9+HnyAvT7mBsSoazK9Uib
 FnmuGGBr1/DU5Ury/Q8KG+TaUYs1yEtGDYAjPSBOuJ+ElTL6y7M5HiZlsqQLKXt0NT7V
 B0cRK8ErsbyLeNVidtKy2J3unaZsJUVOsMIYW28zzYoM1cQs2IkHyIcVj/FpQD5Su+s/
 4tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728405888; x=1729010688;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ikQLOlALZNXVFMnW7DqcctLilRiigotMVrHZ/dmQB8=;
 b=hiJFekV0eqDLttGzfx+CD966UgqlQGG43F7iecIe2sXZOc8t+9Uce2FeuWpJq18wiU
 RbaZZDgxL7afwhAuBHeYgppiq3f0KgsUcEP0xD8jXFINuKp1CUtJ0dxNuvjVOjGVPqri
 0HtD4I/KwAUYVbaJu6uNa9WOKpOoGq24jzVdqpSzXSiFJPTt/WvhO207YLg4BHpRkGgQ
 DvRCADkBLUshPsJc9O0qS9klBVeu9O0Ob3WU/gdUbvT2YdvisfpbRv62SdFO0CVj3cAn
 TWRtPl+ZdgEawHE9Mr9v1a1WpmBBCRYDwNhHC4PHxZXJfwadJl4t52kPpMaXHEkqZhgp
 rHwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoZcbbYxzQ9lq/CzZN6TXxX/GvBHemDIAOq3G7SZGZjfR1Lc4FSSaX2Du092pX5GQGAc9+WypXFUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMqWuPCxD81c7KW6220EfMjaYObMvU6iDxQoM7Y5/nPa2/NfnL
 8l3zEMybXi0UiUJN9PeWgwG8BoT1FroDu1QfwXfsf5/m0yEHNlmssWXws83bPTE=
X-Google-Smtp-Source: AGHT+IEsJwzrStX5MH98cq5gCBlUt8vaT7GTQuJ/pOjlbVoDQ8W+Ad1McV51f/G2wutta1nrDTZgdA==
X-Received: by 2002:a05:600c:35d6:b0:42c:b4f1:f2ad with SMTP id
 5b1f17b1804b1-42f85af8c5emr124785565e9.33.1728405887824; 
 Tue, 08 Oct 2024 09:44:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f86b4acddsm132133155e9.44.2024.10.08.09.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 09:44:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 08 Oct 2024 17:44:34 +0100
Subject: [PATCH 1/3] drm/vc4: Match drm_dev_enter and exit calls in
 vc4_hvs_lut_load
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-drm-vc4-fixes-v1-1-9d0396ca9f42@raspberrypi.com>
References: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
In-Reply-To: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

Commit 52efe364d196 ("drm/vc4: hvs: Don't write gamma luts on 2711")
added a return path to vc4_hvs_lut_load that had called
drm_dev_enter, but not drm_dev_exit.

Ensure we call drm_dev_exit.

Fixes: 52efe364d196 ("drm/vc4: hvs: Don't write gamma luts on 2711")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/dri-devel/37051126-3921-4afe-a936-5f828bff5752@samsung.com/
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2a366a607fcc..546ee11016b2 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -225,7 +225,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 		return;
 
 	if (hvs->vc4->gen == VC4_GEN_4)
-		return;
+		goto exit;
 
 	/* The LUT memory is laid out with each HVS channel in order,
 	 * each of which takes 256 writes for R, 256 for G, then 256
@@ -242,6 +242,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
 	for (i = 0; i < crtc->gamma_size; i++)
 		HVS_WRITE(SCALER_GAMDATA, vc4_crtc->lut_b[i]);
 
+exit:
 	drm_dev_exit(idx);
 }
 

-- 
2.34.1

