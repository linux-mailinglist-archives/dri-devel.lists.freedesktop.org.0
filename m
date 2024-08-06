Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD86949A66
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 23:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EB310E415;
	Tue,  6 Aug 2024 21:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mf+9tW7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EC610E40C;
 Tue,  6 Aug 2024 21:45:11 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-4f50dd3eab9so404429e0c.1; 
 Tue, 06 Aug 2024 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722980711; x=1723585511; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rG6C2q34NWeKgA7Rpje8FNPGJXT/EfHsIqSMnZCRL2s=;
 b=Mf+9tW7GZMQSqd1JPglMWmTPGbeJMq7VeHmxqWYjB590+XF7iJ2nw+ZBhiNqOdMAke
 AkDvC4RnWZo+3h5BLdIDvUUV+a4RCytSkKQsK2m3jWVOoIrx6l/MX1S52BZvIN2WQiNp
 whcQKL4vNGXtlV3Kz2A5S9WvvCZ+cpmPTZF7JrwLT2KYDYJQSphx7Ko1m2s7fi3/xTwR
 3QIlnxe6AyzHe2Y4esiDX3eB5Zz/NYQzbfG76ryRheOEqYdrBpHpAGpzwQP5e7Upvf2/
 60W+riBM+55hpMQwd08ohiR5pnp/n9a0wg1Hwsro9WugcGCDNd5imwP6qyt0dDb5t50j
 Q1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722980711; x=1723585511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rG6C2q34NWeKgA7Rpje8FNPGJXT/EfHsIqSMnZCRL2s=;
 b=miodbMvIfYb+DMdTCA4xHoor/YR3VVfj9XMpXcqc/vNF5cnQz0HsusMl2xgPRtdoW6
 PXk1G+a8c5NZYIDeRnl9rJ7Bi+41KN7sCFjIPxXxx7GRYZ8vXAwm5Hkhe70rgMXtwOjw
 634/Y1bWxGQ7igsFJ3ZvRbbHFwi08TYT/0Wq+PFaxiV/9GdSM/djA96I5ZKOZPJDi6G1
 9uGg3jyXdWN+9sJrE8B4wnFg3V/wXBRPz49OoCWIuJLsNDaenshS4mv9fC0gZ+bdxBiZ
 A/DG+tjDjX9BKs1reQKpCtOQkGiKRVF1zz3IPZWvklpdfwWgc47VA3MWedrk4jy7bv45
 p7Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ycc37M2vp0lzM3KBlnugPfMQfRwBu1V2ZNjQnANbobMpeS1iIlgJcxJWDYnVA46F1eNvLiuzRV3l@lists.freedesktop.org,
 AJvYcCWI94YawV18XoZeGHmrvfydFBtOu4KGz8FPR/3eYbDVM+IQjZrobqKnMjLmN8jntENrmdR/S2aT7IQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoikxLlnbhf+QI0T9CH2DdsGl2W+0Z52kLEgupVoWgElCT5UKq
 uupGZImCumlq+Og6VKw9RO6Y8ZOpTQWixFq5+t2NVWyOWjQ+C4F/
X-Google-Smtp-Source: AGHT+IH/Dpe/wIyv8ocAPkGI7uZGGC4gjw5oaxM1OgPkTR3suXR/XYthhC4ZWU5segmKMX73hvgZxQ==
X-Received: by 2002:a05:6122:4584:b0:4eb:5cb9:f219 with SMTP id
 71dfb90a1353d-4f89fe84d6fmr20318387e0c.0.1722980710619; 
 Tue, 06 Aug 2024 14:45:10 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f796911sm487104385a.131.2024.08.06.14.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 14:45:10 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: sdm670-google-sargo: enable gpu
Date: Tue,  6 Aug 2024 17:44:58 -0400
Message-ID: <20240806214452.16406-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
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

Enable the A615 GPU and GMU for the Pixel 3a. It has zap firmware, so
add that in as well.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
index 176b0119fe6d..465aedf32d56 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts
@@ -407,6 +407,15 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm670/sargo/a615_zap.mbn";
+	};
+};
+
 &i2c9 {
 	clock-frequency = <100000>;
 	status = "okay";
-- 
2.46.0

