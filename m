Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10EF88F96E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 09:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55C710F384;
	Thu, 28 Mar 2024 08:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="2kD4Ieps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A818E10F384
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:02:50 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56c147205b9so1172048a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711612969; x=1712217769; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5mODnViOF43Qf7BlbaL1yV7bCzvxW2J00s0tf+KV++c=;
 b=2kD4Ieps2KbWjZHgTg+qlgpPvUhQIKcq0tcAWMGMrpBg7629ovuxuM7/OE9mg0ahyK
 cDMW8LFpohJXOW56d3vc4ZfTKD9fXfu4d2FnSjqeyKYPC77OTY0wUgfd6EQBS3Oq/lvl
 0alXcxPiPVpTQgOGz492M34R82t0QHR7Qyym/BsI06VOmk36/BWh5+5MeRJpqD3zjmAu
 LRsUXGArilK/jT+4b8EadpZiAyyrC4qYhaHHp/M/sbVh9p+36BzSs9HTxLvNh0Hwvvmw
 2cVeXUyP6f89eaTqWxpjKxJBD1XALuK+aztY21fN2akTBGVE5FyHsIb2RFJzDVS8Jmsv
 0DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711612969; x=1712217769;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mODnViOF43Qf7BlbaL1yV7bCzvxW2J00s0tf+KV++c=;
 b=HS5Rd10SUA5lRJTTCW05ZgIIExn2Xig+4EIWSuD2YdETUimJzhoGENQn6jX+CTjKjA
 WFFdZeVpooXhAAsAyGX8+8l7aORtSa9DlMQWu6fsrWSjimBNEqprI7X/gGIFeqIJLJ87
 soV+EKYOFJViSMAloIcotaf0DLWcOl0/G6XMNkrZXqpl5XMM0s68c8bT+8oDEHmo32mD
 oXHUJKKpGfBSdWlABzEa1/7sSM8uJsbphVx/Rwh7X6by+yJzXq8bMawDgaq2G6M4eBRL
 xG7885628TT/0HOeHQPt0n5XJ3rQ5KUrwK0dckRQeUlVRswpKWrUZczAaesiFemrx5JN
 lEDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDlky+zHqRIZKx3NxCc1le4e6/Yz8GwghGgs54CC/UXuViAsFpbRJETdUT215AeJYIhTXxoZmFWn9X01v8iaRzUtdUPukB5uEURSo9hYJY
X-Gm-Message-State: AOJu0YwWxlF8PrZ/ezeMIMBKnJ6JSQMqYHXxGtdNKGl42V0hZ3SUdI1s
 hPNvEx1dcGa2pNbLmzuJSpdpGiJ7Ch+7xqW9YVUIg3tD7ISYMbsw9FgWO9jAm5c=
X-Google-Smtp-Source: AGHT+IGvGtijoBb4YavjO3REnAE+9JEFT1LLiQTDvEwJxSta1iXIKu06X+xRwMugSsM6ImuZbjFbHw==
X-Received: by 2002:a50:9519:0:b0:568:a226:6685 with SMTP id
 u25-20020a509519000000b00568a2266685mr1455890eda.8.1711612968600; 
 Thu, 28 Mar 2024 01:02:48 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 k7-20020aa7c047000000b0056c443ce781sm522618edo.85.2024.03.28.01.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 01:02:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 28 Mar 2024 09:02:45 +0100
Subject: [PATCH] drm/msm/adreno: Set highest_bank_bit for A619
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-a619-hbb-v1-1-cd135e2d22a7@fairphone.com>
X-B4-Tracking: v=1; b=H4sIACUkBWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyML3UQzQ0vdjKQk3UTjJLOklETLVJNEcyWg8oKi1LTMCrBR0bG1tQC
 NjGDnWgAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
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

The default highest_bank_bit of 15 didn't seem to cause issues so far
but downstream defines it to be 14. But similar to [0] leaving it on 14
(or 15 for that matter) causes some corruption issues with some
resolutions with DisplayPort, like 1920x1200.

So set it to 13 for now so that there's no screen corruption.

[0] commit 6a0dbcd20ef2 ("drm/msm/a6xx: set highest_bank_bit to 13 for a610")

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
@Akhil: Dmitry & Abhinav said I should ping you specifically to take a
look if you have an idea why HBB=13 works but HBB=14 causes issues.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0674aca0f8a3..cf0b1de1c071 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1377,6 +1377,10 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a618(gpu))
 		gpu->ubwc_config.highest_bank_bit = 14;
 
+	if (adreno_is_a619(gpu))
+		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
+		gpu->ubwc_config.highest_bank_bit = 13;
+
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;
 

---
base-commit: d5a436a7b5958caa6fc0dcda6c842f9d951be73b
change-id: 20240328-a619-hbb-a3b6bda9e4a7

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

