Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F58667FD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06FF10E5D0;
	Mon, 26 Feb 2024 02:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wxgQvAQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9051C10E5C1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so2460887e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913509; x=1709518309; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=wxgQvAQi4IW0vX7LJtkUu8TiewbKdmL4KWLBLy3dULKxgSL2XGGOFA2TG0ocDcvbOs
 AN96B9X8b1Y+JlHUcnHi+hqEj5qW2VDaCtwtvf4yH7eGK+dfUZK3sKp7DOB8/RsWewqx
 KtBHbVlWqHAVg3WXraCyHIaLzRyPsNLWHKg8vjOJ+dmtyLNqzwADMODUvqpHoHLMBhvR
 LP60gthfE3Q08YoIfc/F++33izph1iFelkgQnkiMH+jklaP/j4PPMfYQfR76qBN+MVBS
 Hwdo+TAM9rtAP+I2MSGa/qXsfkrVuopl+0dhB3k3UkOIQRQGOxMiP5+DIhkiMV21hMyw
 qPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913509; x=1709518309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8Y0RnqdkkNJT2IOUAgIJwE7VvEMel7kUBPozDnljrU=;
 b=lAuOjogRpRpOvkMoRPAhufWnCQcigJtDCJAurQZ8M4SZoGV7w7BN/8F+a8RhcUC+7h
 ch99ezrqUMfjX21770uAKGBz0e29smB37WBQwi7EXlY/ulsGtB6sqd/5+tAkHb8tsKBg
 +2ebLuo/rawZ9vq7Nd4HR/eOQSVbfQQVbLScRIOTVsKL7EYNxFt5BCQgUUFKOfUKOTyB
 qI3rKdn+KbM000xTRYen2uFRIIlv1kYgxDRzZyD9H66vw3HbNi0aEHg/VOahkyUV8n/7
 Xl7ROCmQAX/f6KX2s1SuBm8YkVAB6/zY3HtZduyftDIt+O+AoATsw+Tt3sgQ58WyGT+l
 Y+IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgZPoqRKFFb+vbpgVoxWGOP6uUU3MNCzXslY/mxGk2yPQIsNi0VNW9ZAU570Nx/jRpQKMHPI03V6KBL4bhelsL6I4y1Hj0a3QUxh6+Lj+Q
X-Gm-Message-State: AOJu0Yznt9WA/qfCmM98OLPYE6IZozTmMKHmZmS8RmIoVOkiuycaL2pj
 hhy29gxtSWuGj1xOovaOQxyZ6ywlxkoCXBwC23s8ID6k1YJ7+NffUYssBPBV6pg=
X-Google-Smtp-Source: AGHT+IHb04FdywAXBPTnIb8Y9ZBSIaj2Xcs5bB/kHt775lPS5Abcp+5HI/DcawcCN0Nsd2vj0epcfA==
X-Received: by 2002:a05:6512:40b:b0:512:e053:7c17 with SMTP id
 u11-20020a056512040b00b00512e0537c17mr2963203lfk.64.1708913509263; 
 Sun, 25 Feb 2024 18:11:49 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:38 +0200
Subject: [PATCH RFC 02/12] drm/msm/mdp5: add writeback block bases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-2-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qgjc0zwou9fhsXbbN2p4ZWlMuaNpRr7RxW3B4yymOWk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NgcMl8CxHPlugzZLhY4c+N8V9o8zlsAgOmc
 VKqUnSBl/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1cDuB/9aUxWVKUUBHVj2GdlUKQaGdLNPnjiYligKy7dj/FB2rJBpux6Dd+P4Ev4m7ajIracQwM9
 8vC9uc1jF0aT+EhgNVmMbq6dedCaEbPhJq6Ecv2YK+2qBbzZyOd3D9FtZfrIsq5KItL4WAyAT4F
 AoxeMZ0gaMUVVPHH2hNModk3t/9dTI5bvJ4L7q9Ar3p3E608qjcEzEQMC14Mw4fPdkBANDObU/m
 srOHFbZjcMyZeRQUV6vdK4baiSPt95tGeW0Vl1zuRXdDe7IRwYF7NdmiOBnA4JgWNgkfu7wP99k
 624m1ZpfxueGOTEcdq7vnJ17IZrc+1R3MMiUEeV2GzMN/+4f
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

In order to stop patching the mdp5 headers, import definitions for the
writeback blocks. This part is extracted from the old Rob's patch.

Co-developed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 26c5d8b4ab46..4b988e69fbfc 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -69,6 +69,16 @@ struct mdp5_mdp_block {
 	uint32_t caps;			/* MDP capabilities: MDP_CAP_xxx bits */
 };
 
+struct mdp5_wb_instance {
+	int id;
+	int lm;
+};
+
+struct mdp5_wb_block {
+	MDP5_SUB_BLOCK_DEFINITION;
+	struct mdp5_wb_instance instances[MAX_BASES];
+};
+
 #define MDP5_INTF_NUM_MAX	5
 
 struct mdp5_intf_block {
@@ -98,6 +108,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block pp;
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
+	struct mdp5_wb_block wb;
 	struct mdp5_intf_block intf;
 	struct mdp5_perf_block perf;
 

-- 
2.39.2

