Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927284E375
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B200710E84D;
	Thu,  8 Feb 2024 14:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cmDDuEy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE56910E84E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 14:50:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51168572090so3173793e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707403832; x=1708008632; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=isFytFDXARzCh2Jm6b6WyMr5DRIgqurmR16IdjoLmWw=;
 b=cmDDuEy0vRrg1S6M8ChtJS3RHumltIdQDr06L2Nm1ip2j2sw1zv1MLB+vXsdsi/bvY
 6xrcgi3kvzvRQ/LJh3c9t8WRheU60YhoL9bayWo6601ePYvnIGoMl3weYRuvNNBoSBAX
 uC/PrPnk2OyZ3ytLJE11n8vVQbjELvbD5bKt76qamZioWLnVxV1TqwMy8Q0YEuqTu8gl
 ZhjA1VnB1d1EzE28fBFe77V+7rJvvWt66lwuPa/5ct47Bx7iuYGUjXRBKL8QiOISIo8w
 Zjl9o+VzZ4JoWl4gLzpQApwAF2SQdDCNevcD3CyEQgSdKH8CcpYjDNOhFHgSx30dspOw
 mIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707403832; x=1708008632;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=isFytFDXARzCh2Jm6b6WyMr5DRIgqurmR16IdjoLmWw=;
 b=lhGaJXkVs9YOdgMxdAaUMyZSobU3f+q4ZFD6UbxQHC1BE+AUJs+ia2bE6trxmC3pYq
 cUh61vVejr0NSm5yt3CMmj0dfqod7KzWASSIGBJ+nvJQBMUkPBJmAciM7aOegJPm/oLw
 drZakvxpcmaDxXe/cu/Arg8rkpOjkd1+kA+0Rnj10APJ19O6aaSU45+RpN1h3yon4yYO
 MaFC9N3bBB+/gkSTH2iY0dbyO4Sjt176InfwyD2CWn/qC44Khshrb74vhfB52Eyf13PI
 VVaQ4CmHzfym9T5ivM34hGTiXKBSP4XGv+jKpxoC74KuRGaWnhLqvcnGyDojRBBkDtzj
 J+3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMbvmjHHI3u9EEjx894aOHksN5weOIa3WG9YPb8oyrjjE0sn7vXBRmdTX8ch0yPLjlBfsxPULEzWfP/CNIIn6RbEzVPzj9QQrX0eIn//FR
X-Gm-Message-State: AOJu0Yz0a3kRbYwLzIoV7S32Dr5vmq3rEkUyTUOz5RW/foA/4INzlAEo
 ozqejZvTErfPc+jdGq7DqA5iyR15uPAF5inl2dQl1rBMd89CxVvu68yEfF8P54E=
X-Google-Smtp-Source: AGHT+IE5P6J4KgAgsuL0CsQE8iHKVUyxpqlXKbhBUrR1OdOwxJGpw7JPp6luC1UX32OF+2q+jVtXsA==
X-Received: by 2002:ac2:5e9d:0:b0:511:60eb:cb1e with SMTP id
 b29-20020ac25e9d000000b0051160ebcb1emr5468828lfq.67.1707403831789; 
 Thu, 08 Feb 2024 06:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU889DrDkoP2EL0AQ5Awe3MnvmaThnO6wNUDDSKLLdLcLXSO01+Opd6tk6yqykwTUZs9JGEyU9uLk6UkHKOH3b6QJMwN+eQWdxsfBkRUnh1E7ecjhQ6zhekL6kCkzBwfbDz+aOhfJ2wUw5BYx5M1SZzZWorGD6WDIf+g8KNLbxTGwiu8zO73rN4Y9/KEZlmoOKxEDXttleer9tkLti7m/sGiFhoaqEor+PbZHE7HuW3X/IPGh8obaRVHPDc3ihESzcXKOzc5xyPPMW/M6qQ4BsrzRQrxaXuKUoRGg13o4RdX+kTIb7U2DkxEyV8QD4aj27rFA1dE+1uSGppFVUy
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l4-20020ac25544000000b005114808a6a3sm18706lfk.168.2024.02.08.06.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 06:50:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 16:50:27 +0200
Subject: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
X-B4-Tracking: v=1; b=H4sIADLqxGUC/4WNQQ6CMBBFr0Jm7Zi2NgVccQ/DAugAkyglLW00h
 LtbuYDL95L//g6BPFOAe7GDp8SB3ZJBXQoY5m6ZCNlmBiWUFlIYHC3aNaKlPk648Ytc3JBqWY6
 iHyphbpCnq6eR32f20WaeOWzOf86XJH/2TzBJlGhsXRpVVdpo2Tx56by7Oj9BexzHFzdfS0C5A
 AAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=x/YVZfjdNfpe+Sx6imXL9gORrTESWB+MUbneEnPObG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxOo3cq2IouUVB8De6f00vICVYzCDbalGwerEn
 5b+e6Wey8WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTqNwAKCRCLPIo+Aiko
 1SpYB/9ulG3MmOsHSUbXR9H9Tq2M8lBcWigpdCj0CDDaOuXMQFDJk/Jjvu2xo9k6lT86PcKhf5x
 QEE4Z8EAZai7fDQ0ugBk83nfi5loCR30Val4odndfGz3nF6dQFK1RoYcIIhMXHHR7yo6g/8NA1q
 +R8lwDkp5TAT7KWWPk3siq/WbCgeOuYbUn+YdLgf6O5zFbBzvVFwYU+AdpZtu3YfqOl5da0g1wu
 VTO8PJx280w5XFuTwyuZ74g3JKENeY7y7h3p7bIlldy69AhFLbJZnn61Ll/TMf1ar2ZqWVcDRqU
 /CO85qi5PON2G/OoE5B5VxPqFK3vu5VgH20Ybw3esisaS8dy
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

We have several reports of vblank timeout messages. However after some
debugging it was found that there might be different causes to that.
To allow us to identify the DPU block that gets stuck, include the
actual CTL_FLUSH value into the timeout message and trigger the devcore
snapshot capture.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added a call to msm_disp_snapshot_state() to trigger devcore dump
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..a8d6165b3c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
 		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
 		msecs_to_jiffies(50));
 	if (ret <= 0) {
-		DPU_ERROR("vblank timeout\n");
+		DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
+		msm_disp_snapshot_state(phys_enc->parent->dev);
 		return -ETIMEDOUT;
 	}
 

---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

