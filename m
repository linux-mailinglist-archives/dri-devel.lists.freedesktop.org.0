Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD61B0C42E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 14:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4923C10E276;
	Mon, 21 Jul 2025 12:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Que+ACOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5B710E276
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 12:35:08 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4561a4a8bf2so47127335e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753101306; x=1753706106; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zWeKKFmXQT7g0C6PVGMg3GNyP6pXlJ0on9vzRpXs9c4=;
 b=Que+ACOIyQfTz4FnW30kvTpvj9RGdJkbGwe5/A0zdJyIoFuxANGy7XKlppuUyiugn8
 7EhPXq8VhusGksvQ29c5l53hkp4bxL07Jo+XNQGRhAN/Ni9goJAa5lAnvuj5IXGg4ETd
 wnKdq2IP6xmY+ilfSM3cZpMxjx384kiH8GlNDV2Gor9S7NEnVbUPuYBXWuptWEY9Fx7U
 /0vXFoxpreqgNcv6OH1cL4H9uxbOF0RU/aSmGW1GKmkJ7SjOKVLcAvtxKKMfAS1UAnDg
 /sIXZvMBAJux2KqPfv4NEcjTbNH7BLxS2OJfaUK+EWrvWtvjPMxJPaBhIv/ByDTCNm3h
 qMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753101306; x=1753706106;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zWeKKFmXQT7g0C6PVGMg3GNyP6pXlJ0on9vzRpXs9c4=;
 b=pllEOI02L1nS7mAlRmi284YxV0fTypSN+vUfosa6ANmkuaAHufJD6LP6+4AUPhSJPM
 +fdY1l0VUorwTZNQs9Y6+SVZy3mgD02jezIwHCdHqImvY1UU2YVjBcKLIFaJM3lZFI6C
 ZXfYjfNES5v/vPv6uFSBeNlxZOnMys7ZKJE38tvOQNVFYb3hQ7ogUX+u8DZ7Siiw+QgE
 1j3mXM33Zyf6M+apmDilwZoMGRhCyJBSx4xx/oug+Ae23K0OnQQpXbsnGJ1GgEpITY2A
 LmTFYkFKnlSizkFhWCfLsUf0eiWdPxUsNbQPjojeQUU58q0oc2lpyiIFAvWOi/1WO+Lr
 clvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUELx42nyEcvoMVhvDcEtF/Vxqq35u/mjzzJ4k7ab/wfCJGD6WKagkhgtnYW8hRWEvl926+drH/rFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE6phJ9/2tXX9k9y+xMbZi2uIkrkHQiE009b86VKsqFq7ZZDId
 eu2ZiUtzza1HoqcRW15mIjcdU1xhaFvTJ/fZHlmZApNWlSj/NPzri8NkeOsAJSyRcPU=
X-Gm-Gg: ASbGncvfvgl+HKMd6+AWYO1ZOHfhu1s5xQmvkqYfjVKgnMJlwDWByBKhZEALBJZBYTo
 YWeYoCwtfiup30v8+jom1alR2AtDL6KpO6LOEbjzLV84g5FZivHCZMoItjhYdcdY5V6xmLcJi6b
 +sSCPJXZ+BxMgYUhIjk4psp9ND3zOa+Q2OXWbZRxh7zIHVTCKE18kzlwj0tBgxWWARidqVi4tih
 mSOaksoPfL0C3toTmb7u3R9uWULNh5ZdJ/YBXhwNPPA1ckaSKN3M638BWri1Ggqw6bpjJo9M7fW
 oty69ah2J8DPdeiTxCOyDNVhZluK0cPq+/jmEgMkEo9rhDlcTkzwHX+YxRK6DB6d+CCCttjugul
 do/Al3mRM0kTwGSFfvVKWicO+wCK8NdJWLz9kAPnSAbg=
X-Google-Smtp-Source: AGHT+IFG4kXXmx0zh4K9sMcn1V0MOV16G+IB8ljJaAKXFE9c5b/lozHQb27C8mLcsiUk1H5j42FfJA==
X-Received: by 2002:a05:600c:468b:b0:456:2419:dc05 with SMTP id
 5b1f17b1804b1-4562e33db7fmr212236965e9.12.1753101306277; 
 Mon, 21 Jul 2025 05:35:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25643sm10026654f8f.16.2025.07.21.05.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 05:35:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Jul 2025 14:35:04 +0200
Subject: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPczfmgC/x3MOw6DMBBF0a2gqRlpbEIS2AqiSJxnMg22bH4SY
 u+xUp7i3pMykiJTX52UsGnWMBeYuiL3fc0TWD/FZMW28rCGlxDV8WHwFCPCU1z5vW9hAXfe3e6
 deLRoqPQxwevxfw/jdf0AHSMKJWsAAAA=
X-Change-ID: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=O91kV79pVlyB1aw34aHO5FvLamb5mNiEO23N/U5+fiE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBofjP4kJcyfWacvsCCp1u6bg1wWUMn/RjwQ3GLOc9C
 buFsCgGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaH4z+AAKCRB33NvayMhJ0SkJD/
 9OjSOM3gWCnvasEhptI4hBy1sc2kjQQqMcjy4dCSE18KxSG0hBpJR8LsXVJSKvWxed/zdmPse9wB8i
 HcwrX68tuo1Y11kf/IohKZOmW43zSu9X/ox0+Imq/1UxirYaezrAy6Le19D/H4Dcvy87PbsW+zck2j
 w6VZiu2Y21LHow4N4a1hA3uuwAtGV0WLdLyrLcBVIqO0msQIi8gF3Tt1fP0KNeokd4z4z2l3U8i7i5
 8YTxW0yGHZneLcYUqk1LxyIoaFnWtVNij/ON4QsDMCb0bHIoZMgzTLuOfygHEuAWXQTdR3nseFhAii
 E8XMDPkbMglGxCMiXjU92LeKm9YfZrHp2KmLom4BEpMvPsHYObpICMEy542dA3uOwm/6UqUS5TMVRT
 /c+ijayc/i+vJYFerhzCuJXZb9pvkNa7kOsCDYeDpBQU7q7TB0cHP9Ky0wWUTo+gvB3Uge6MFcELSf
 IEy3qCw0zLvTFkQloYfz73QsIPeTfLDvhZSdFpCIATKjydKx0HtfywRLv0E7cc2Pvi4dnkcAFcR2uh
 wYs2X/BVkhYBw47WQu3xqu4ccKVfH4uhPdXiJJliS0HqE4VME4lcYBl5E6ksB4Ohhl2zWABz3xUEi5
 A2vtwhF+C/qxPPoZxGDdr2DKhrLZhZgU7wc7wTNR/X5te04h5yPne7BZuP/g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

Declare the Bus Control Modules (BCMs) and the corresponding parameters
in the GPU info struct to allow the GMU to vote for the bandwidth.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7050001,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.preempt_record_size = 4192 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(

---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

