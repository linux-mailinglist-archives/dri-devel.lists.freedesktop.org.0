Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61AA37BD1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E97B10E073;
	Mon, 17 Feb 2025 07:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NvNY01On";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42BB10E048;
 Sun, 16 Feb 2025 07:25:51 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-727118c4f9aso339503a34.1; 
 Sat, 15 Feb 2025 23:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739690751; x=1740295551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X2MtFzYyeGI+w53HFhz70blX7wSMVkW9RRqxmsCmG4c=;
 b=NvNY01Ond9T13ILcdwN15NNExZHX0Fd/etfACbGD1ZKE3gqA8ig2bvw+LWrzPj4QvQ
 F1aVA7rfsiZ4zVmrztaxW6+d9hM7L8+y7tlI6Y9oxsAxAVgfbtjnuJ1SN/evuD8w37ci
 lbKkHEHVGfTKpZVGUjmYhN1A8d/bq10FVBc9py5xh+UsFEX80rXz6f8UyumM4xM0vZ8J
 aAJyteEDC54iiT87uTte8vx8fSeM6X63vbNKe2moleAqvtaED3Vk5Bqm430OO3yTXoM1
 uWjjPh470vPqb2SZZ7znsSYx5s++ItUnfkVmXDmb8lXxWFP/kBdNvxJpgFOquL9pPm6G
 IX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739690751; x=1740295551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2MtFzYyeGI+w53HFhz70blX7wSMVkW9RRqxmsCmG4c=;
 b=DIkKGrQmkW2V+0dMoQXyMh0WIgKo2FRn9skFjvFjp4dmnhUBnKP6baLdGXinwuy0AA
 aO3yoYS//4TSckKT8pj58hkgaHuyJWrPZWIKT5ykGFBFD8PXJPqnTvNgSe81J7QvUILv
 /DAmcyh/FM3H5L0fm3sLm005WMK3tn6qV22hT7eu9fS13jZA+3PYzG0P5HHOU1pU/KxU
 M+3Z4gmK3fV4FapFG21yOyv2O5xZ44s6/J3nhMjkEEWCos5N54VtH1xk4l9kpwOIF/uq
 AQSCB+WvN8ijsEB78iBN90H38D4fKEnf1FhcbGoVFLEDRSkWNgo4KQt3xXY470dTnJTj
 BXPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVf9cUe55Rn/x74kKoPDQ4Lhk3KeHwoETOeGSVS+c5jSTSGjwj7H7Em08A0DNJteqXu7KyN2XD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr6WM2e1tCWbIxtfzWAK6Uu/QpvlZ1hEOoA45bYqWXN1LMceP9
 l5ADjnbkv4DPfzsmyxqfxZGcGj2xItugRhCqpxXpQZp3j52l6QCs
X-Gm-Gg: ASbGncvM30NrXtratXJ88UOhfS32mLtCnBFY2u6aFGEv8Zat24obgVveTCo3cpVeXQe
 PlTcikEovF2LA+Ih+nOdmVrqv5ey3Ises5hLo42iWQgd7z1AvuFBt2xWbvsSTGugZkCpw6TD2/d
 43rPvn+cGLc2f1e79AimWWavzcY3Q+8N6BxVOI7IrP3y+gWXjn0nPagQ1iNoZVAUbMnUUvdcP12
 MRlbMQWAs13SNRyRNj29D7qlrBA8u/jliveQfGX1NIZdob/DXgnVAVglfiNQqZE/xCvrsNzEmLa
 UUBjzNPJZovFQv8BMripRDdXvA==
X-Google-Smtp-Source: AGHT+IEldSYRhKKvL+bF0zUKZ2HmbKXzdMRqJSuAGcuPjdAPT3c5bZVwGqGNztiB1tyFq27lo9WP7w==
X-Received: by 2002:a05:6808:2107:b0:3f3:1ca8:97b with SMTP id
 5614622812f47-3f3eb122105mr3150386b6e.28.1739690750791; 
 Sat, 15 Feb 2025 23:25:50 -0800 (PST)
Received: from vengeance.tcpc.lan ([97.75.251.196])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f3daa19849sm2467306b6e.44.2025.02.15.23.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 23:25:50 -0800 (PST)
From: Aaron Kling <luceoscutum@gmail.com>
X-Google-Original-From: Aaron Kling <webgeek1234@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Aaron Kling <webgeek1234@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/nouveau/pmu: Fix gp10b firmware guard
Date: Sun, 16 Feb 2025 01:25:37 -0600
Message-ID: <20250216072541.317954-1-webgeek1234@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Feb 2025 07:06:12 +0000
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

Most kernel configs enable multiple Tegra SoC generations, causing this
typo to go unnoticed. But in the case where a kernel config is strictly
for Tegra186, this is a problem.

Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on available firmware")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index a6f410ba60bc9..d393bc540f862 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -75,7 +75,7 @@ gp10b_pmu_acr = {
 	.bootstrap_multiple_falcons = gp10b_pmu_acr_bootstrap_multiple_falcons,
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
-- 
2.48.1

