Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65729E870D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 18:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E27610E332;
	Sun,  8 Dec 2024 17:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="coPtdnM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BDA10E32F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 17:29:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so10649651fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733678954; x=1734283754; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/tzoYaJ92Gqbh47fpsJMbKGuzwxMycmsQJXhBU4UoPU=;
 b=coPtdnM6bScHkMgAH5ZvaZMi4LZqBkVwKqVHx70Ide0Y4IJIIiwZrkc93EcHEAI5H+
 /kbncSskG9enZioEu1+IRKUERVUegmpA+tM12nQsnInMY46DanL7kPsr7VuX2ScNRB2F
 VIgu/XbfDt7WnKAHws4P1aE4vwrQpe5udigrP8Bm9/ffTFD9CC20dtlaPJw5d3tBELkP
 9f05L71HAsTnO586x7Xhuiol1Rck37AUJ2rSwpdkPa7i2KWcvcjbFz+a08RT3Qif4BZb
 fRYXc8dmdwmtL523XDnvLeO/ytldNk8wdarsAyH9Geqf9G1b9LwTCF4ML/l1eg+8oOYE
 a+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733678954; x=1734283754;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/tzoYaJ92Gqbh47fpsJMbKGuzwxMycmsQJXhBU4UoPU=;
 b=lJ9VzZNohEUElI5Fl4Xy+0W2niKlai8czqSAhiEkwm0Hk1DYY19GVADDcT0DIZn50C
 1VLituiqKhKKSiLd7aS3gfBjE0DhjKdx6z3fXANW2iyELipaRbO8oQPGKdby11yHgz+e
 5kAUeCB+0xvZWB0g+svxBDEi9CNZv22/pnnLqN8BBTfeQT/oIQiYjncWDhrnXinXq8N6
 XFOecIq/62CRE5xPFfFmGqi07x4op2yy/NU4m2Qb6IwtfvASIMFTc26URQw9wHrXUMvm
 Ri/FKZnO86P54SI8WpWrkzI3E6qW6LTcr5kvZWYSLqucx7k684l2R17tCGeZBvE5+AuX
 lUcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAq19hFAxp0T38fpWlYHcTltxcqaZorua/7fyovAyUui11oAmS6JN+w12NmKy/5BJvPLhAH3obeZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1ceC5gd5XGrzWUBMgNxc6otUbg/ltLX51Pn1yQn5f9HbXAe6U
 cDCoURwXrLw43yIWCAwsrsfE8paUA1bxA3AlY3lomJYecxCXS9wyoCBqzUpqaoU=
X-Gm-Gg: ASbGncvM30YIe1Vf4Cfnxa+mcPp2rU7YI/ppOjoE9q1U6bUw70AAWD5z0GmxmOgag1U
 Pp4GkuDsRaCzCJ0inpGzdqC6Ol9aXzYZiTzp4jLa30Ow9eapkIpYzRYGES5rDFEfzoRKEE6aeZD
 Ox/c6GeyM1ZndnzhIw1BeRb7j/QmuFJzYFLiU3rdDU7XijJIy2Anzl0IK1g7sO2IeFQHldzot1Y
 /O8nBD3R/acpVWr3n/vAXOA1HLlBqz2nZ3Np+q/89qpaJKr09ymNShw1A==
X-Google-Smtp-Source: AGHT+IGpl4LZsuCLYc4o6t6jeFwINzov0q8HwajESXX2p2xRlg9YhxiyKZwpcpZtqT6qPbhArxAsDg==
X-Received: by 2002:a05:6512:39d1:b0:53e:27d5:85db with SMTP id
 2adb3069b0e04-53e2c2b1ab8mr3133570e87.12.1733678954527; 
 Sun, 08 Dec 2024 09:29:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3160ebe8sm783253e87.180.2024.12.08.09.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 09:29:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 08 Dec 2024 19:29:11 +0200
Subject: [PATCH v3] drm/msm/dpu1: don't choke on disabling the writeback
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGbXVWcC/22MwQ6CMBAFf4Xs2ZrSFime/A/jgbYLbGIoabVqC
 P9u4WJIPM57mZkhYiCMcC5mCJgokh8zyEMBdmjHHhm5zCC4ULzmDXPTk3X0Zi/DTtZVNUo0pRa
 QhSlgfrbY9ZZ5oPjw4bO1U7mufzOpZJwppaXSpnPKmsudxjb4ow89rJ0kfq7mYueK7NbY2gaNR
 t1UO3dZli/ruPa24QAAAA==
X-Change-ID: 20240709-dpu-fix-wb-6cd57e3eb182
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, 
 =?utf-8?q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2341;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l0e+YjJJLUTTCME2U2RfwtoWLrRTp83OMNrgSpxIf3U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnVddoeaOWxNJOEBGnhGweCcRBMxR3mJut6WFda
 BRnKILovEqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1XXaAAKCRCLPIo+Aiko
 1c1SCACznZ0DjA+m7Xyt+NmXA+EGu7YA91e/a5pV0heywojgc9cKCkh4DnloshzjCdKmzf+Y6r5
 3dMN62m79U+sfGHXhZ9YKSB/7lZOL8lR15ewqPtxcbiyiqG3gC/xBPnIXJfD66fXZGqlUSkrs87
 QLHEPRb8cjqR2Y3Mw4ktwFlFoLLz0ZqCoQ50S+kMRLLZJPsT2qtiTli42NG+9l0hLN7iIIGYpuU
 yBErwWqTg3wON4+gRHEV4wdcjcs+GZ95SzsYvFBKVfaCkisiiDfVfHoxn5gDK1+qFB24fgF663u
 D1BLlaBUdwTfdgtRLOj27qHXQnwSYPaW+n+Np5C9UXzVKEiP
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

During suspend/resume process all connectors are explicitly disabled and
then reenabled. However resume fails because of the connector_status check:

[ 1185.831970] [dpu error]connector not connected 3

It doesn't make sense to check for the Writeback connected status (and
other drivers don't perform such check), so drop the check.

Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
Cc: stable@vger.kernel.org
Reported-by: Leonard Lausen <leonard@lausen.nl>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
Tested-by: György Kurucz <me@kuruczgy.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Leonard Lausen reported an issue with suspend/resume of the sc7180
devices. Fix the WB atomic check, which caused the issue.
---
Changes in v3:
- Rebased on top of msm-fixes
- Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org

Changes in v2:
- Reworked the writeback to just drop the connector->status check.
- Expanded commit message for the debugging patch.
- Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
 		return -EINVAL;
-	} else if (conn_state->connector->status != connector_status_connected) {
-		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
-		return -EINVAL;
 	}
 
 	crtc = conn_state->crtc;

---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240709-dpu-fix-wb-6cd57e3eb182

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

