Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011498F3C5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CAF10E8B6;
	Thu,  3 Oct 2024 16:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UPhHN3Md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9798810E8B5;
 Thu,  3 Oct 2024 16:13:05 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so167341866b.0; 
 Thu, 03 Oct 2024 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971984; x=1728576784; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
 b=UPhHN3MdQ5ihhbi5DM7Eu8XULgbfyuxmQlkSU+Y9ksNXct+mSErMRKErQyYH1VvGKa
 pkGiiCuUO3nkUm2OjR9/XWfmLwQhNEnoZlpHKn9v6l4M/IkUB8e7XQPPzG9vU/eE/Ajr
 IZ3KSOts7MVpudxDsrMQQnbzgERpkLDHFEwRh34BWunn5/UVvRhHA0gJ+pxI0M97SqWX
 5LM7qwzQi56RaIiIpQ/I7wqF6HYigHKntVbridEp7+APvz/4g2/a3//ruViP5dK6WNEg
 P3LMPC5TbgFenIXlCFl4HyrNCOSKAFWdsLqTI46vdCtUqBx8XjnxLAAeHBxlFW0kq6f7
 JOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971984; x=1728576784;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkSz1D5Hr/cIydOboRgyQ/kGqlozWFahzIe7ud0a0O8=;
 b=LV+zJdTMVxsX6ob/S+2itwtthajefYJtgOmUQ2PhkJswXHfn5oolekt2Pmu6TBtGkr
 PLtOTMtgWqjjakQpU9sbRFvot9K6dA8r8+k5Q/V6OcWTsXkvhzgW01mhtZIm7MYN6FGi
 nTmvWu3NXSit5FsqefvJcaF2L0Y88g6nbtihRdfCC/vkr4dNWb2/+gLMov+PhzELw0mR
 rWG2V7XRQxs3gTVmPB6y3RgTrcOyfBBO+DMwxqZEVrXk1BMWTd+Y4NC4mDR1IxGFMeGH
 0GTmQk6N8RqZPU2AspoHEqu+Fj6m6ajee0A3H1o+JJWhMvw1HtXM1TI2+KpNr55sF7qO
 JZ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGdqxq6moYpCqD+nvdaHuKTXLVLESSorWTvNTVldbjtIShPiCJTSAPoOXamS32EQCMlNW6j/FkEKg=@lists.freedesktop.org,
 AJvYcCWd2S+4VNRm3xphpUECUA25c+WFZUuaZdx4lrIfEN+7Bvrt34OPg9+thBHBOb2DRfFFtu8x5t1FO/00@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6hiJ0qJCCCIR+dW426JT0yBIIGG4Y0zOKYxICM9oehh5yatLW
 KN/98sPvFDOEpXI5VcEJqPHiEaNAa90mEZWSDQHxF3qMg6jC5Vht
X-Google-Smtp-Source: AGHT+IFAw9TWSHxvADxQ23Ohd8gd7pyUJ1VF2ICdjKGvRf0zDATNhgB+Gao4F2lCt+cReeKRzfUdUA==
X-Received: by 2002:a17:907:7ba7:b0:a8d:7210:e295 with SMTP id
 a640c23a62f3a-a98f820a7b5mr620924266b.10.1727971983820; 
 Thu, 03 Oct 2024 09:13:03 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:03 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:53 +0200
Subject: [PATCH v8 04/12] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-4-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=1523;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=95uWYhYXrJwsS/Si/bR6gRgvDdDmC6nz9iFGaH/gMIk=;
 b=NMHsNg8FHqzK322WlIXiE3vzgXWMVxXgrSoNw2PJTSBYYSgtHyE+fwI/sJiv3kXLNY42Kh38j
 AzstkrtmzP+Daw+BJi1y/uCfEMROet/14ww3bE8Iz9B0L8F+Uaxs+4d
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

