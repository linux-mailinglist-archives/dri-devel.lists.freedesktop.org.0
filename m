Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1CB976D26
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 17:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F35110EBC8;
	Thu, 12 Sep 2024 15:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HPmUx7C4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC0110EBC3;
 Thu, 12 Sep 2024 15:10:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so9141905e9.1; 
 Thu, 12 Sep 2024 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726153839; x=1726758639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I8WoX8P+epnSNshOLCzpXpl70K1Lwft4iav6FmplCPE=;
 b=HPmUx7C4MJ76pHo1wNbJjdAyKOQM946UR3cydXiZKrMZWilUbIjQzWcI0HPKE75TQn
 cqbqWmgGfVaVBdpJSeK8qawVqHmZvg8FOPi1APfF+h2gxQ0ymUm0KASX67yhyNGxY5v/
 G41S48lK5dVPOVor2XvbqyoqZhHKlB3uDDJZA8AZ1+jcr5pCd5vMwpHgElM43hZaHhtd
 OltzAUNxOaQPqA8k0yn1YPLRiGfSuADKyoeXvBfCVTX6kxZ3h30Dq/JuDPUwM1d/QOX7
 i6lywJE72isGlGvmqxlMr9SuNOZQBJSlrn/M506EO0SNG4MA+UWqpa+v++d/JPl8otew
 5Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726153839; x=1726758639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I8WoX8P+epnSNshOLCzpXpl70K1Lwft4iav6FmplCPE=;
 b=p5+6qTsx67DKqIg2y67C0y30svpuoBkjvFoWKxsMaLNdLn4fpoJ086yRlA+M/SY2GY
 +qz0SMM6FvPYJeVo5yJbYV4DQjH0RDfNX+GkPHmLCB4tB0OSFpOuHLVFuLWe7jiKqu1+
 6VTFXC/jDpw1xfKBJmlOI+CqjqZp9Rb9V/7aZc3V/YXNlLiCjWV59QYIHG2ajMKGq/Zo
 xuUDNjhauJUIQAX78LMC1MoA9AMwF7xdKULkBqdoaONOosfDJRm8jZq4xlS2KYCuFNPd
 wr9OeCcZ/1BrSXzlsjOELE5FzvJFBAKbWXu2ix1/iBFZ0Hk5Kxs/j2MI044eNnt8MqXk
 4IWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPV1/VTCREt0axSZ5nWsec9uuDFcm+6XL8+JLaItiNPKtoxIUOVgG0o8sIVRkF+wxq7GcWQ1RYcJfA@lists.freedesktop.org,
 AJvYcCWWC8Gviyd8OXRZ4KOqtOFe1E87SJpDMSqbRbTtmSakJsL2jcVauO/MgicY1/BAXgEYKB2a//Z7Esc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7o/Tz4jqoZxsGAE39a6JQ31gdbUK7UkiIIYPg1A0VXQ5UTEb1
 biL2g3GtWGjP6fNTEOhUoiY9g3K3SG5i/4wQEM8Q27KW/n3UBbY+
X-Google-Smtp-Source: AGHT+IGpzTJbDNIVU4M1s3fHFXgywLBRPXTVSrJBFZCSKpEuUnw1QKzJPLNOIAsdnhNmKiA4JsiELw==
X-Received: by 2002:a05:600c:1c02:b0:42c:b58d:98ad with SMTP id
 5b1f17b1804b1-42cdb547f2emr24890885e9.14.1726153838851; 
 Thu, 12 Sep 2024 08:10:38 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3700sm14661524f8f.88.2024.09.12.08.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 08:10:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm8998: make const arrays ratio_list and band_list
 static
Date: Thu, 12 Sep 2024 16:10:37 +0100
Message-Id: <20240912151037.592477-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Don't populate the const read-only arrays ratio_list and band_list on the
stack at run time, instead make them static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..3f8f73e31ddb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -166,9 +166,8 @@ static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
 #define HDMI_MHZ_TO_HZ ((u64)1000000)
 static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)
 {
-	u32 const ratio_list[] = {1, 2, 3, 4, 5, 6,
-				     9, 10, 12, 15, 25};
-	u32 const band_list[] = {0, 1, 2, 3};
+	static const u32 ratio_list[] = {1, 2, 3, 4, 5, 6, 9, 10, 12, 15, 25};
+	static const u32 band_list[] = {0, 1, 2, 3};
 	u32 const sz_ratio = ARRAY_SIZE(ratio_list);
 	u32 const sz_band = ARRAY_SIZE(band_list);
 	u32 const cmp_cnt = 1024;
-- 
2.39.2

