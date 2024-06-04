Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E18FBE27
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 23:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D31110E2A0;
	Tue,  4 Jun 2024 21:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtTDYOjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BCD10E2A0;
 Tue,  4 Jun 2024 21:40:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-421578c546eso917035e9.0; 
 Tue, 04 Jun 2024 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717537220; x=1718142020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rqq18CXoyGbGnQpbX01uKNmZ4w2EbKsUOPcap/enREU=;
 b=JtTDYOjTFDpOnsW48R/e1dO6Vwfdbx3y/kWvTMpfQOvzHlu+Dm4jOKaBO6FAdGU+0u
 8Z4w05bKXq5iBWLu5asPW41I5GO6xhdt1xsW6xPpqES2cAy1wKl3TLUnLMCh+blzuz0e
 BoNZLEOoBn0DV93A6JPPPgDcixjvvd4j26M5ymJoyXjlp3q250tOx73GE7qbgZuEXfdb
 t5Lje6JP+mzd4Bs/t5FK8iCeNCcrzJ+ZWbSnvcO6qDdXiIeEqbM/7ttUniDFjGEKX8et
 OthWvBOJxyNmOtARw6Qczv9cA5upHONaN/IqR92w2UmI7OrREaPNjzd+K+Y053TU4W19
 bAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717537220; x=1718142020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rqq18CXoyGbGnQpbX01uKNmZ4w2EbKsUOPcap/enREU=;
 b=O8hciGkJdxRhYnmsfQCU91kWFS3L8LFz6UtwpQrzqZcu3yY4uHxXOFMaEMcxarV6VH
 P/+3FSZHZkRQvs3MIVqTYjqJINKwjFGaPaTe63/fyLrikH9VSDQmLW1qJ8Z5a/vzGG6C
 xcrNUKLT0tRshEzcmvf8Vp0wwvnLaVtRUK3vyysXTpoy5jhGfdrewCU4hDAic/QMHx1G
 w1CxdQOm3rfeXtBLg0JT1Ji/JRdZJJpR0GdgijybAdbTAUDL9qcCUKGQSx6UI0gvaKXi
 9ma8Z9Cec5w+njkQi0EN+fc8AqjjFhM4qngnk+f9YJum9RAK8JyPzzzXDFLkIjWSwP5Q
 v//A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu1MPHGL/XgHfmERpfQIDMRe2WPfXNpNkjLydfsfbgwoMChyWKAdjLJH9JU/pr2KsAO59I/J3cd0IxOMjYdRAt+knmWi7YkuaxPx6SXzCG8OruQjHCE3hio2QPhxkcfLHv0YHhzVRs/2mQtRHyi9OG
X-Gm-Message-State: AOJu0YyyUkpMtG/+AIST1rkC1eWipcHtyojxCUQoqc1Sble6dV0As1C8
 F7QR4wU4+UTTp7gecBmPV+vZD450yGfNpReVDq6P1YIZyf1LKhgH
X-Google-Smtp-Source: AGHT+IHpCQ2HAPA1QqPFRWearVj1yS2MowqKgCHg9WOONS+xyrz1IWSdlUNZ7OspAvgXBXnkGD7Bgg==
X-Received: by 2002:a5d:484a:0:b0:358:4af8:b76e with SMTP id
 ffacd0b85a97d-35e8ef9437fmr441650f8f.62.1717537219648; 
 Tue, 04 Jun 2024 14:40:19 -0700 (PDT)
Received: from morpheus.home.roving-it.com
 (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681::1c8]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-35ed8b574e3sm270624f8f.79.2024.06.04.14.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 14:40:19 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
Date: Tue,  4 Jun 2024 22:40:05 +0100
Message-ID: <20240604214018.238153-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.45.1
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

Add missing MODULE_FIRMWARE for firmware in linux-firmware,
this is needed for automatically adding firmware to things
like initrds when the drivers are built as modules. This is
useful for devices like the X13s and the RBx devices on
general distros.

Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b4..fede5159e7f5b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
 MODULE_FIRMWARE("qcom/a650_sqe.fw");
 MODULE_FIRMWARE("qcom/a660_gmu.bin");
 MODULE_FIRMWARE("qcom/a660_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_zap.mbn");
+MODULE_FIRMWARE("qcom/a702_sqe.fw");
 MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
 MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
 MODULE_FIRMWARE("qcom/yamato_pfp.fw");
 MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 
-- 
2.45.1

