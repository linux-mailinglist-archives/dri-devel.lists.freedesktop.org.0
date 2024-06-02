Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C848D7860
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 23:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB1310E17E;
	Sun,  2 Jun 2024 21:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WIaNXFXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CE310E0DF
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:56 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52b8b7b8698so2737192e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364395; x=1717969195; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
 b=WIaNXFXRZziUCzSI9ntWSePzEs3XO9cM7A0fRDmpAZNLuZicYnt0L83T6KnmabDhL7
 +cbwf0UG0jtvelZcJkAIW7ktTYPWhIUckJ0+ndK+8vesYz21A6HkAp2JQ6dKcZFnOv8L
 05O8odaBSZtI2ibqfLm5sA2Nqjh1RCYlzbSULCaSP0eQsZTcJDDts7Y38+86JO/Eqyzl
 6psdXjNMhDXQlc2lBkeOeySFoY23vCG6cSI+AqUZZQfdkw1uWenlV8l6nvdL6l4vJrE9
 F5wqGZKzkwh4d6Ezu3NzQv/x4FMagi5oSDkhtnTbGRm9QV7untZMYBjWK2SPM/WSAZxV
 snjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364395; x=1717969195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8NGTZXoOFTfLmhsazwKT2UsGEPrRF8ia337hm+GXXs=;
 b=bnUKqi2EYymNORX8nFmlggsFf0hrwPJHz3sNTeSpVemVk4K8768GbS8YWseSup1k9m
 vVZbeJczW4tdKnLTC4qM45ly3C9cOKdx49Ag8kgHiuXT3ojs1yE0vhqhrE4B3rUWemZ7
 sBEXqHlvJpEHwX42iIq0wom1X2JQA+E7kIOf/qlvcZA1GIoNZTdVIUcG4oWDsyHa2etH
 kkpezcpE4qr8srm90Tdu94PGfjfJOadMFsSmf1PcCPWon5HkR8kOjWwrT0+chBjYOWwH
 n/n29c7IIk6c8kX3Hqn4cB7wsqJ2KoOFWQmdtK5e/hgyONM9O5WWg6xyf/ZQo7YcxOtg
 1HcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxuBpkhsat7o4SrlxHmpqmU2bJw3tjOKbSEAEJUpwyUqGllHP3B5K4JDcL8OUnhbCZeT513rS0IUXEgqwFKiGx05ZGqhhi9qZ9Y+hUODVM
X-Gm-Message-State: AOJu0YwwSfRRfhXoJvIrSgOMb9IcAkkg47l25/11P0SB7TkwcEbXdm12
 BLvhpAZsjNIJn+Fdh0ThVTAVFCViZJ/xCNFXStw+ND0lnf54eR1BW/ZQhLyGX0E=
X-Google-Smtp-Source: AGHT+IFodRA7wtJWYqOP42HP+r2Eadd15Zax69RlOlDxQZO9sG316AaJi09FuIzx3GCZSw504C4ZBw==
X-Received: by 2002:a19:8c1e:0:b0:52b:8280:8c10 with SMTP id
 2adb3069b0e04-52b8956b5b3mr4664626e87.18.1717364395030; 
 Sun, 02 Jun 2024 14:39:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:51 +0300
Subject: [PATCH v2 5/9] drm/msm/dpu: check for the plane pitch overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-5-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4803hWNpcHudkouDSAWKTu5smpjA3R/H+DmuPg5Dn0I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOal57sL8VMNXDeoG/fMtixB373FIQWN8gw/p
 Jsq7M8PeNyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpQAKCRCLPIo+Aiko
 1SS8B/9IvoUaga2Nmr6zLxDaPC0Pc/bQ9umyzktyaqzhu5FrXAUTstXPTkXN/Vvvm4IgHL7Oifm
 WcQeu9aesYxb/ZJPQ9o8vy36CGWa35+aCrBfj8HB9h/IHRsCXNKIZGdKg9TzZi4bnYOuSAnGiae
 roe0B46ZN0KiaM5s0ZS916amsyfzrXGBUTq5YkK6vWozKe4spG4H/JLLyrGee8y91BOfhjj5UtR
 dpDVLc3WUp65moHflX0M1QkiW6L/w9O/SKw8QQZ/Im24w8SS84aULi/YwCxDO1SP3DdHux9xecx
 98Aj0bzISAffMSqrXlRQ6NhYl61qevbjcTGXb7aPmBYGevrW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 927fde2f1391..b5848fae14ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -791,7 +791,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -865,6 +865,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

