Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6B9199FE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 23:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD2010E9DB;
	Wed, 26 Jun 2024 21:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IzGyX4dA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFBB10E9D1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so86388781fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438375; x=1720043175; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s1yr/14qrVQ/kYRjN6UH7sAJcJ6ZPXNM+nWCpzFkpGA=;
 b=IzGyX4dAlDZ/qAsD45xqsi0U0zh0tG9XQu7bD813IuU3N6F3/2yntW8D5VrcVY5EWE
 swRw+Ddb11HCYyqG0WYTqPg/Y2+MUtfSpHOra4nZX48evJiK2Q+kT2JAOMSBy7LmpTyj
 BOUQQLPCfjTWnlD6PvIw5oPyostvNlBMWcy1iO7aBzQ27hzrWwPEQ2obzX/dOjnI7WOE
 j06syHOCDPj1MJ3pkwv9PAYLoioWq8eytHaU7pTiuJE68m/kjTW60BNkp/zjImAVFa6s
 /kH40Ac6NLHxA0s8AXQed9swx/o6klGmSGN9OTD5MmEgEvNBczdTseUPBdvDhEH95gG/
 +zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438375; x=1720043175;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1yr/14qrVQ/kYRjN6UH7sAJcJ6ZPXNM+nWCpzFkpGA=;
 b=uN8XtwstmcBbxQcG0M7WXfWLCokca92L8TG0esH2gSmJURUpkQJHX3l0JTFDMSUz5C
 iIv89wY5JbIhI+hw+JS0jcNz6kv1lEjUaNbqr+Z+i0plHl+ACtL5xpbTIroXpfXTnJcG
 MxshKGliz7vIeQirvVYBeeUkmo3+JSMlNl/kmOA1CsEQLGfoOmtJHi7T6pYdCSrDj7lN
 jcRQOg54Gj0XXz5ST7PxKTCTfMBC9mhq2y9rty6XbAlCMXXcW4qcqt7plCL25by5hBcY
 f7mMaEZl8Nj4omjSnTV2fiu4Ts0cfcrbEjPFzvZG/LRHntwexSj8RisN+cvEjkxj10TD
 smfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4TRZAhKFBwqse+b2sIRR3ezLhN58MLZIH6R/6+Nm9P9nNGc31HH1hlNvoYTLs5vHw0+WaxrFvuaBTLBJaj5+zk/RHEKqjG7+fmur83ydJ
X-Gm-Message-State: AOJu0YxS+nmcUsg1i0w+xc4jWhBmgekcaAeCIaL62WZWc8WUuanzKdr2
 UQC9n1rH1+XSCQxc1Vbr+cUIW99IvL2wPpsu5e6WFYqUQpj+9MQGGTZlY0ClHxc=
X-Google-Smtp-Source: AGHT+IEjuMjBrK+rXfyXxF8hbNJfQANvpjcRm271/Z+9lFiuoS/ksY9Q8TulAVC4m5zzVOlPgVgzaQ==
X-Received: by 2002:a2e:321a:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2ec5b2840fdmr67894431fa.6.1719438375097; 
 Wed, 26 Jun 2024 14:46:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:06 +0300
Subject: [PATCH v5 12/12] drm/msm/dpu: include SSPP allocation state into
 the dumped state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-12-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eEJvD1LxPrQrE2+bV2Gb2aZ/2mj6knY0BTuucbpbbko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZkyt5CzRwY3hfsGPrmhjoZC7H00MHWqkks
 GnB6wan0WSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1XUsCACGQ+zsNDJAcL2Bw2/6RRgLe/mxiy/25t541pd6McAGXfdLlKyKlvpgn/FvjEdp1kRVZoE
 Vgx89cQD8WzLjs30HcTBToiSa/zZ+FpJOOk9CN00h+ttZrS41M3chOqvuvWLFGehdUDKud4lup7
 tf33yO0k7VszARMOwQ3sWgNDHL/kiySr5oIsskVLvTyV2iz6t7s1tgbs2k1GKowVTWn6o7oUSGx
 qM/p8o5TW+rU+Yu2vdrkH6nFU6LzV7tCdH0tllE49FDUNMAhPpzHG3H2qM7YJcJanHUg04qCsz2
 ObPQOKuwU9MBta3iru/e5vM43Un2xj1W6U0sRoMmSfc8GStG
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index dbf1f7229e45..3e3b6b8daa5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -890,4 +890,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.2

