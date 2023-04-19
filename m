Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C746E8B37
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF0F10EBC6;
	Thu, 20 Apr 2023 07:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D8B10E9D6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 iw7-20020a05600c54c700b003f16fce55b5so1579693wmb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=skGYkFK59/ukAv0WKnmVB0D2Vf4WzLOkmRLP20Jah6Y=;
 b=S/SHCet7T6o1bzniNlVL7gE5UJCdDdK+tx35QCxV16Avx1ks+QhmoPpYR2iSn97x+8
 fLji34fU/fXE0o9jI7a/N8JijPFVvqqy33aYjQH6LNCt+o9Vh5M+YN3Y8fwYvncGyt/k
 CvzAoGf3BF8d8zcZ9hSQalXdd+vEIQdtb5NX4XhU0KoH7+kq4jEmFjjT7DxbQeMPiyoD
 BhdopBmJJVZx9a8sn6P+g4em3ROBjSNsIpQ8MPCDoxkla+SchV8YnH6VR00JiVfzBL0v
 qCnngF6JauL//7bl8cIVDhEeqgtCeG2Sa0DG9focJRhG2jVIUOgYXOWQgCMuaC9lTYf4
 hHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skGYkFK59/ukAv0WKnmVB0D2Vf4WzLOkmRLP20Jah6Y=;
 b=bmO/s6i2ckPrw1bbA3pbsdHbdFQ1iXEOLXW8seM77faGp+KDcLnKnTQnpbNazwZBg6
 fOXRGC0uV01MURsd2rcua9SeDzyZSMtDDtdDTzlCCy3WpXVqQpAOVBQbQW166ohW7gJ7
 fs9+LWOKkBmXexyctl9sLjXP7ZvUT0cyDT6ghwpalhfmhgKtNa4I8O3OK6fq/9UqfAUd
 CYJmwswk5fr2YBjPa3V/S5Q8u/IleWOUeCLrQX5or7EsPwHLf68S5/mecQkxFj27gVbj
 v7YGvGxrCP1ufrdppCyvxOj0y056Ht1Pv3lB4Fp/r+DhP80EfSt1LXvrIYID3Cp6G8OG
 rmpw==
X-Gm-Message-State: AAQBX9cRNaBWudGcsnD6CbImyAtN0YAOiB93Cux7bzC6Pjb3aPPle7Pg
 nuLlV3VG+zu7XZ0q5L8kH1nJ
X-Google-Smtp-Source: AKy350YmaKK3EqTA0/QScooY92hdt3OuAEvnHBAhCJTAnTZTSLhDQXZTU2KFdA8T7mH+W4Fg2s5lLw==
X-Received: by 2002:a7b:c8cd:0:b0:3f0:3a57:f01e with SMTP id
 f13-20020a7bc8cd000000b003f03a57f01emr16543670wml.4.1681915320333; 
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:16 +0200
Subject: [PATCH 09/11] drm/msm/dpu: set max cursor width to 512x512
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-9-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=817; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=U2sKqdlLf08vu1Eh26+MgGM86CFL68O4zQFfb4I2ZHM=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2qdLhQ8jKSue86pVPaOBEUFNXXjoToVNKG6
 6b62FiMnMWJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9qgAKCRBxA//ZuzQ0
 q300EACs6Y5bbGsrBx9QQIpO3qcIvxHHO1/cU4aapUC4FXaAFZVZH1fnBncMrhExDQFjg/pzDEf
 9Kfbd7OJCwa3PRdB37UedeKukA4Vl2Bb3TrTSDrHEwX/OOWvM6ZI55NBCf7mStf2JpJNmbaKZ4b
 wCPtIN449OPMeLeKzEh1idAWQCqb68+irLQAXWku1EHOSOYKr6vRvd30fSKzsRCRW96zeuhz4OR
 YU0KZ7M8h/zHbY33ZfizVVwrM/UtF+akktNYosbuzVCoQyz8Tad8czriIVuZn9OTXojW1gJBRE7
 5EBP6GtskcsCrgjkG92vETqb+RXhrBD76QW40hxCpPi0Y8CDlkf28NG/C3m3Z4dZ1Qfw9o0dCwS
 4DZSkWvrCSgGx1zNxRbYmgfgBadzncfRdqdxSs3sJjdTcpHl1GU66Ukd4i5lY3sBETLCQLCtrEK
 KV4YjGVROZWU/tiTTZ8hsoPTc47Tk6DOVe/RCO5RhxH16g6Fsyxj9yu9L3Df5q1Cluxzrkvy02Y
 Dxmd9IDwtOVqZCR9dTpJMR01jD+Ls42Ql/Jg9DU9Dcilgs9u79tmQOWji5YsuLGKYjpsntX/ZtY
 4YA2J/5XL5LCURB9R/Ys0VjFRcBq33Jhyw0aEoiKmicnqzS9xfhzHQK0L9C8mLwg3KZHMh2ePVk
 XVKyDtMoSZPQ/fg==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Override the default max cursor size reported to userspace of 64x64.
MSM8998 hw cursor planes support 512x512 size, and other chips use DMA
SSPPs.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6cce0f6cfcb01..2dd19b7aca0f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1014,6 +1014,9 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
 
+	dev->mode_config.cursor_width = 512;
+	dev->mode_config.cursor_height = 512;
+
 	rc = dpu_kms_global_obj_init(dpu_kms);
 	if (rc)
 		return rc;

-- 
2.40.0

