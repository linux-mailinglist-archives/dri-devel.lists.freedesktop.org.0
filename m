Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B7AFABA7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE13E10E416;
	Mon,  7 Jul 2025 06:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="adjjdPjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2210E415
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-748e81d37a7so1583020b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869139; x=1752473939; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=adjjdPjAgA5YmrXAtabiMPqwOWqLqQAmc/aZaekwY07A4DUS35lqAbQksL/I2yV3gC
 YpmSMlL4knxwLEc9I/b5haQk9eBp5tR7EPFbT9fPQt2KWfkU8yfbxOUDE8CfGvr7yQf5
 LgvnmnnG0c4InhXu4b28JRL257av7Iicwgqt9E0R/sO/MaUgkmvoH6zwI2jZq+oMgZk0
 SqTzCpMjBEYVcIcxj/0o103v0z/TJqFTBJdyK5KqbUuQdcY785ZA9tHwoylFWKgTWoCa
 f150eJj6gfMmpn9Azf9sNV0JZE3fdA9mSKyp9VDLGwCbXBVu4tS10J2WbNx7mUEV1swM
 J0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869139; x=1752473939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=A+LKV5e5Nv4tviqn57opgd8Z+ufnMd7K7pgIYWHcbG3o8z0rQV+FYjOfH+cMBxFPxI
 RD8GKJaYRavjN4iI2quHWrXunz4DnGOReKD3cPn1FZU6P8xNwaAQbHMaF8MhQJ1DxVx4
 wLj68n7V8g/84WSe2wLUt62OEe2G7rvLk47MBskfUYMGstcS4l8MVZfIKO4O+6htmsbQ
 8AsYPdbyLjM5jm3Y0or6ZaS19muqxrL88w+1vUj0orJP+mcd9OBuOLyC9iDUN5jPHYsK
 UELQQzCe00nk+m4gkV96lk5UcgZ5jinShDkfmb0oU/W9bZZr860yHAiBVQol8voPqgmi
 Q9FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXogmJoto3ina1IYVOgrGrpsapePaT9Ip7ZCKHYQAyAFbMnNf/ygKIvd5hscE83VkXhi7xTeWwsCA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI9JoZZsqTSyLLqHTdgiMz7kvkIJAdY4yhhbqPdLf0Pjmn8irm
 ElTv2cKQQomi+l2zRbw4BMGkyEvPW5o9jTGAgxaqFdopMMBI8zQ47xmNGCEcTAGEd20=
X-Gm-Gg: ASbGncsK/pdmg+5PYRkapACW28VQteEAmhbmnpImAKP9kollGK2zWeG/tSw18X1ZuOS
 fulnKWvnE3TyVG6fU5eDH6P3/fAtMMS9+SMr8CRLq5nvKMKbTjllDcPLGKCq9ohSVUWyC/2XuyP
 O/KDlArqNqzBRimNPZwuJYmr7/6YaUzlChiqDc+2mD4Xoj52pwBhEeD0OgE4L6iP19f66/kPCRQ
 eYC7GqKlRHs9bmTB0PshkhrgBeJLAuSl1JmjArl+xe4mcqE9lVspO7MHS2/6M114hZlYT2chzN3
 FWLJHzMeLc8O/0w0Jhn+C1mM+O1mgmg/N7+zRVXPNd/jNku2q5JDZru3WOg=
X-Google-Smtp-Source: AGHT+IGHeMWJ3CU7o8u2I3jtTuKviAnMMK1jk68uIZizqYV/+1lVKm5gab4fF2qM/al4kHop9FptTg==
X-Received: by 2002:a05:6a20:7f99:b0:220:7b2e:5b3f with SMTP id
 adf61e73a8af0-227213b0f9dmr11250088637.19.1751869139526; 
 Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:03 +0800
Subject: [PATCH v12 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-8-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=nFHB3VxCXhLEoI/KGV5opIO0xVlYrUN+hcLsZnNkOIelu+Vnn0r3HYqoOcRs+4m8mQ7Gt9lwE
 BgWUi8fort7AuSXXlYlKt/MQ7A0V0fejxbdR5aBcTw5rYTUIzzX9JJY
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

