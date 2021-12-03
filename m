Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C868469351
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE67873DE1;
	Mon,  6 Dec 2021 10:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50656E09A;
 Fri,  3 Dec 2021 19:33:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a9so7774186wrr.8;
 Fri, 03 Dec 2021 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KkMqjzOv91kbEWcmfuXNAzPB98rsPnz33Du8jXmQo/4=;
 b=DcmSX6dV1UHFCCY4ITz0D8zPXxmPFsUvlxPe6iW6SIA514KGHV5HhGZj+Eno5vldj2
 7zefU34oP+H57TIKPBUoqNJOruzEoEDTlsxKPkUu5PQj/XhPbpLvqK6Rx6RPHNwvloVW
 O/0ZuqWN5JG0qtzhgjlPD6TVGJbE+0kWVI22BMzPnjno2IVrQ7g0nZCy+iVJJzbr45vp
 pGb8w3izUT+HzEyRBiT7OPBOaeWWzvr4V43d+3YtPMFC5FrLieJFZ1ZISwRyUNjD8ULL
 Jzy+XjE5NPeRlTbLgYCLYz8BqVoxGQgDhjVrQlX99lQbS4WYmZ9yhUsRMZabT/22Koqj
 wOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KkMqjzOv91kbEWcmfuXNAzPB98rsPnz33Du8jXmQo/4=;
 b=noSuV45SekSjjin5IRXojivV5iqGU/o/+L9DGXZNOmWZ07ed+bAODlgblk+C9Phmui
 73HSJbCMflB5f2Dw+dNIMvqujWLDUKnMBvXywsNBei6ftNXfszYLscb8mgXpeIPGoiBx
 stpCDSNUNgqLAvxp+RObQc+MgZ7i4gQcO0ceSiEgiMWB5B7TSP9BAU7h95z6KxIVnnyl
 SPuhfXY8fjlJHB9KUqWogLbi3wHH3P7xnUF3WHDemQVES8jR5FNei7a0u+zRBiDXgXAw
 MTZIEw2EZpRL1MDb8QjnM71+RZSmv9p39fmBejmvDTSmNv/qwTC+/ncm+nGL0uznFtgl
 Hp6Q==
X-Gm-Message-State: AOAM532n67VrsCCSwlg4pWdkggBJ/SkCpIvutPZMleMeNJjp68DLPGgO
 Bhg0w4xCnbBKv8jgSkFdUzA=
X-Google-Smtp-Source: ABdhPJwHkNocAxLPzcMPDuZ0QZvaPbQ/NHuFjMokG9Q5PoIIqWCWDfe347YQd6kuqYE2q3PRf3CMPg==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr23415302wrs.581.1638559990224; 
 Fri, 03 Dec 2021 11:33:10 -0800 (PST)
Received: from localhost.localdomain ([39.48.194.133])
 by smtp.gmail.com with ESMTPSA id l5sm4815155wrs.59.2021.12.03.11.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 11:33:09 -0800 (PST)
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/msm/dpu: removed logically dead code
Date: Sat,  4 Dec 2021 00:32:53 +0500
Message-Id: <20211203193253.108813-1-amhamza.mgc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ffdf9007-d2cc-2437-684c-66c00bb0ceda@linaro.org>
References: <ffdf9007-d2cc-2437-684c-66c00bb0ceda@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Dec 2021 08:15:50 +0000
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
Cc: amhamza.mgc@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed coverity warning by removing the dead code

Addresses-Coverity: 1494147 ("Logically dead code")

Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>

---
Changes in v2:
removed the 'fail' part completely by moving DPU_ERROR and return statement in place of corresponding goto statements.
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 185379b18572..ddd9d89cd456 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -698,17 +698,17 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_irq *irq;
-	int i, ret = 0;
+	int i;
 
 	if (!p) {
-		ret = -EINVAL;
-		goto fail;
+		DPU_ERROR("failed to create encoder due to invalid parameter\n");
+		return ERR_PTR(-EINVAL);
 	}
 
 	phys_enc = kzalloc(sizeof(*phys_enc), GFP_KERNEL);
 	if (!phys_enc) {
-		ret = -ENOMEM;
-		goto fail;
+		DPU_ERROR("failed to create encoder due to memory allocation error\n");
+		return ERR_PTR(-ENOMEM);
 	}
 
 	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
@@ -748,11 +748,4 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
 
 	return phys_enc;
-
-fail:
-	DPU_ERROR("failed to create encoder\n");
-	if (phys_enc)
-		dpu_encoder_phys_vid_destroy(phys_enc);
-
-	return ERR_PTR(ret);
 }
-- 
2.25.1

