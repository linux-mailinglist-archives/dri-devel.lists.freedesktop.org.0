Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB90C97AF59
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5162910E45E;
	Tue, 17 Sep 2024 11:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="itkZgfaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB2010E45B;
 Tue, 17 Sep 2024 11:14:23 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso809976566b.0; 
 Tue, 17 Sep 2024 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571662; x=1727176462; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
 b=itkZgfazROsIjKSPXE7fQqw+r0HnIhPFRYmPADw6vZ9NUQ5TC33Ye+JjbhHMCZqvyn
 Wp51nNT9NeBHVs7fqbPMAY5y0tkk7ciCSgPAcrcarjQ2hlJ5pQ0cwaRZl/nueJqHPJkT
 dgLAGhRavbngRZ/DYp6m5yFa5GsibAnPik47uj3gJLwyN6QhUuAVAiWYYNPGxcLZQPP+
 36H5tYubO8bCpLu5UqRo3ZtpxlBO1V+zrNgXDDOv5iU/bsLEo9zsxCv4YFKMVz77BBq1
 Rm6wWlpiSJktgc2vqXn8uqcoft0JR7AK9GQCfxMuRUaMfhMH+c4IwZj8coEqAVlBK2qE
 r6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571662; x=1727176462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
 b=Buy4amRlYxARrWtCuShqWesMe7yIlGuyZOht281u6KUa3FbMX738rdcBUghJvm0Myb
 KIDIxJwwqfAI/GZInV/gAt9sIOhEaHmJyBTj8CWanzyNDOEqiFyk09HHk2uP0NZQ7f6I
 6oeVhSkdOtVtAxojOxanzltzT+QE/yqArNiiBgdopOYu2oOLEVtjNDjweh1AhJlJhe3u
 ly/ZGMAPCuFeq6ZEOOuqr+xrB+LyRCC/xMKLs/FCfToX8Aw+q3Ql2P/o13TEgdolW2lq
 YLkSknLRaQyII/akedqssyQfa1bBfMMcY1yaFBuANnJSJJ09KR1kWsEUOfC1MYHKG3d1
 q5xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHwbITNGhcW1b4TXiNX7t/5VImbWB/RGNgwK8iNNad2UnJrobAkn4osYXFLLfdYnci6wLwSIs48m2J@lists.freedesktop.org,
 AJvYcCXEOBYwg6MKNMx0Ed4hP+uaGv9+Upim531DjSfg9Nzexc5TD4SDb1w/WckPfheNpvr+5z1N7tE/d7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjkCLtSdcKnNruTg3akrgZqM1D429Lc/liBCaR9OjhHAKH0Qv9
 DxqVymz+ibWDdDJ5oegUME/YYbgvkfKSZLKrLSleLqM2z/yJuBe/
X-Google-Smtp-Source: AGHT+IHgneGDCvJuxMRUcqIWZw4uzYYuRjuOQs2kAUZFFCJ7+1IpBxUFHDLvCnNqQZCBHN99FvEkiw==
X-Received: by 2002:a17:907:2da2:b0:a8d:2b86:d76a with SMTP id
 a640c23a62f3a-a902a8f0fa2mr1858239566b.32.1726571661866; 
 Tue, 17 Sep 2024 04:14:21 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:21 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:14 +0200
Subject: [PATCH v4 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-4-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
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
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=1210;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=oUM/CI16gozvDWhTcSfQS9qAoH2wC/uZWKXcoKsNOYo=;
 b=2VCI1aS4Z608h4Pi8Gj+VwTsW96XSeLQLdg0E8YySWBTbyreJtftTWlxqeZG4DnDHwcxzZkUb
 LOdjawpPx98DHEwkwqrEnzluBHfkfs8CBILQYtp77Hwt4fB2dM6H8KJ
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

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f..fd31d1d7a11e 100644
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
2.46.0

