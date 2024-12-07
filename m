Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13CF9E80CE
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 17:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6946310E2EB;
	Sat,  7 Dec 2024 16:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GzX2PZtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F3110E643;
 Sat,  7 Dec 2024 16:18:20 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-725c0dd1fbcso1591642b3a.0; 
 Sat, 07 Dec 2024 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733588300; x=1734193100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKEc7pfcoe2pEfex+pxqSNNJz1K7IYFf9h97WA1H0CA=;
 b=GzX2PZtv/vKWb5KIgrBEmbMHPVC2q6FgxYCxngJ0CkmldjB4bP+hup1smc6zI7mV8R
 zkBoILaM4EbsQhxTZy5CdpG+Gig/Uh6scQCpVwxQ8qirtshjmaSGfmVoPDnNPvAZgbg1
 lz2mdf4XZg/XmtHDaDCB+Cjtse4AsX7J31Ql0C2BVt4Z+KSlgvcYtZh3BiDNXp8E0XBN
 LgIj2IzWVAephkK+KMtSufrpE2EXzjI6qYk6VxDiCqB15vEEXztsF/cKD4JAvQ/Js5Cm
 MbzF6bv9WXHRbrlN6cTgXs7+2YwtVWdN179ru+NoMkwoL7Oe2WluAJG+cIR/huI1eYmQ
 +Bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733588300; x=1734193100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKEc7pfcoe2pEfex+pxqSNNJz1K7IYFf9h97WA1H0CA=;
 b=u3/l+AWYbHNujDd7EbeANJpWcs7+kNqCVXFPnjE/HK6PPD0dF9lhQo/3Ftmbdmv3ze
 uz6zafDQURu/ion5PJuMkeVKXH4QDWwgP0znIwWV5nHCqWddIi/IwpXJjXK3VZaegFRZ
 372Je6tRuBc5PWMyhSIJI/RsZoFADI3YOqikpKadh0cG5l6MUZBiETCLgDddPH/TZyDA
 6puugQnIav79A6hHiOExP9umyd93g5wBwEV6r+wPyLXl0R/FUeN7LjjK9hiJ3ByygrRe
 XFr0Sot+EBbjTN7mzu+OYUgCg2roOzL3EHjcOb1uIVnNrNw4ubOjNWZFPJy2WDyFTJMP
 4ktg==
X-Gm-Message-State: AOJu0Yy2aM5tK7YzE5PkAB9Ilw0vY0IvXqSLtcbCAbF+88in/sKi7BVd
 dseUOuHLm7pPSZL26nDqkZ/OrsihiSPrImY0D8yTc2jZXUPXlXdCkNLkWw==
X-Gm-Gg: ASbGncu9CSequ/L5pE7Xl9mRhAk/rbXSN7rbDm1gwop9AjqMlLl94eqrUYw+QhN2Ymp
 ZWzT7ErTWZT/qamBT7VbAig5ElrjlOkR66Q5G8hDxv5N35m1RHzHpj43aKyCBq0Qfg+04ytgnW2
 KTkxNxXULDsXN1WTYRwisz9X/ofG3mMNouB94M53vJ3vkzueJodo5XACpP2k6WPBJuPRrHw0OpK
 PZauVytqmRfb5N80r+divDtVmX2FlGFEyXJogBpyxcYnZ5tnnA0f+8M3bKzu3Ro8Lm5Nq0cDttQ
 j0eKRQfL
X-Google-Smtp-Source: AGHT+IGDDW73BrrybWnhgDLvwKJyffdiYjbRHUUDZGdP2yCEnF2SVu6E9reKoz8edCA+hBCTjpoxkQ==
X-Received: by 2002:a05:6a20:2589:b0:1d6:fb3e:78cf with SMTP id
 adf61e73a8af0-1e187156a70mr9628465637.41.1733588299724; 
 Sat, 07 Dec 2024 08:18:19 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd2f40dc81sm1874742a12.64.2024.12.07.08.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 08:18:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC 24/24] drm/msm: Bump UAPI version
Date: Sat,  7 Dec 2024 08:15:24 -0800
Message-ID: <20241207161651.410556-25-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

Bump version to signal to userspace that VM_BIND is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b31ec287c600..dc00781a099d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -41,9 +41,10 @@
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  * - 1.12.0 - Add MSM_INFO_SET_METADATA and MSM_INFO_GET_METADATA
+ * - 1.13.0 - Add VM_BIND
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	12
+#define MSM_VERSION_MINOR	13
 #define MSM_VERSION_PATCHLEVEL	0
 
 bool dumpstate;
-- 
2.47.1

