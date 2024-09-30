Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA4E98A5F9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D3410E50B;
	Mon, 30 Sep 2024 13:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LraVYW5C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D4010E503;
 Mon, 30 Sep 2024 13:52:48 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fabfc06c26so18234121fa.2; 
 Mon, 30 Sep 2024 06:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727704367; x=1728309167; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
 b=LraVYW5CE/X8Le15oI4fWBS+ncNb2+2/tzVDmqM16akyj8Qc2opfp46f8k/YkQrBBX
 Oo/ThzrZwT1H0224wdZbhJ+8O2heMHN8loD58E2arUQbOMdLgP75zESL8aS6fIoTKYRg
 CMQnR/OrOgivZDu0s99R9MWXH+TwGkBxzI0ERl6TzRyGNwCmVjiqSxvgkeVHi1c70FQy
 YM57KgadBJ/1iUhluV4scHFAafW5Tko7wEBQyNBwfA8YK8N1e/27Z5udAMqqtoJoZ2q3
 b/ySe+u0i3LaKzmqM0n/fSiSyistOlrjXpIuYCP3HQ1dCske1tgkeJ0VRBBZNWIuRth6
 NPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727704367; x=1728309167;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
 b=GrMt+ssWVm8GvCXFZTlimbsYabTOR6e0nGkJTGBo7qv3ranTvTUirSjM28UTRf3DWF
 uJ3Z0Civ1/pwjssrKnz4Gm2CpIXNcjEoLjBPwBNtdkTJpoQhJDQLtisRnwIPKVRikNZ7
 Z/G1cnvocwVpAgo1NEnN4/XiP68v7YwVJiU4chOQ45C9wRPWlHMDvttUimWAHjv5haxM
 GUbJyiFqxmSBxyw4FVTKpPVwFmMWl8NxNqKGxaJX+hUXn0ZdXd0N7gblpT9YZxbwx64U
 4as8XeBnyjIbifCkVS3S0R7v3cjXGypwzdKQfktRWKXGfIH3lTWP8CT3wglNcHmxl2fg
 RXmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8kDfVHwWk+EyXyaN12F6DwwVvKGCY6apVg4o4SQen2/IvBZ0Fow46YbxjV0oHS+iHg+/4K6QR4rp7@lists.freedesktop.org,
 AJvYcCWZn4wPeurgnI0kllMO7kLM16OyL93H0QXg2M9QJZ4EU1rJkLCWXz1RhNi5JfVfbbOuuDxh5yJcnKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGHMSZUAWXhc4dGBMs/klXQ43LA99DfV3rYAbpvdB6Sf8aOHu8
 74F7JKF2iYvXuV9Mnd4GKQHAAOV4yW8UoFXBfLR4rebpSVgD5llX
X-Google-Smtp-Source: AGHT+IHFWGcngO0Ta4UMRaZut6aiuFnh2a+knY7824+0F//PEHWOi3H8hOBcbL8yQAmt+yHj298wYA==
X-Received: by 2002:a2e:802:0:b0:2f7:53b8:ca57 with SMTP id
 38308e7fff4ca-2f9d3e55c41mr46525921fa.19.1727704366634; 
 Mon, 30 Sep 2024 06:52:46 -0700 (PDT)
Received: from [192.168.1.17] (host-95-250-55-22.retail.telecomitalia.it.
 [95.250.55.22]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245ea57sm4507540a12.55.2024.09.30.06.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 06:52:46 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Mon, 30 Sep 2024 15:52:39 +0200
Subject: [PATCH v7 04/12] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-preemption-a750-t-v7-4-47803c7a5a64@gmail.com>
References: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
In-Reply-To: <20240930-preemption-a750-t-v7-0-47803c7a5a64@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727704357; l=1523;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=95uWYhYXrJwsS/Si/bR6gRgvDdDmC6nz9iFGaH/gMIk=;
 b=x48nLkZ298lfcSnmRx8/BH6OnDPu2DerFLczl32o6cWttIfpIJb8/vtPTH9eRQXD2sgAhA6Ik
 qWu8XBcqR6ODjpn2Y2egn9FNzdTNkI9N14kPii6AULXWcqGESZ4Ggbw
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.1

