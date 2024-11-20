Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8029D35AA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1C10E6C9;
	Wed, 20 Nov 2024 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i74v8ZcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3370C10E0DF;
 Wed, 20 Nov 2024 05:04:57 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7e9e38dd5f1so1388748a12.0; 
 Tue, 19 Nov 2024 21:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732079096; x=1732683896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDzqRQmbV2PA+ACm5mYhCZYmsznh/BcrPcsNX+5Rzd4=;
 b=i74v8ZcPRgd5npBxJhpRb30nxMtI/yanuMgIJ19wR7EiIylVRebZ1mHyvmu8dh4vi5
 92BSCh1mBbjlDgsNaK3aDcVLzELGQO4eUDR42ZY7BlwIvo3jKdrtoRnMyjKko8m35PEi
 /ndfxXz9hYYZjN0db7cwGN8t0KfkJmtvxvY+Wg22u5zTvSEkVP4fWv3pMjT1dHvuEuhw
 lyEDZ9geiRQhVWiCU2X14vtGXkeXNhcP9N46n1oFz8huhIUBWLuxzKaZvpumUqcPj7/u
 2KNzeagQlZG1vqLcbrphvBGq/9/o2BzRgLRp4gnzB4dIW5r8qPoLketjjGn3W93OCOs1
 HMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732079096; x=1732683896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDzqRQmbV2PA+ACm5mYhCZYmsznh/BcrPcsNX+5Rzd4=;
 b=QOyVYT6Wn5JswcwCTO8NPc/WLgr2HhxBqCFVhwjEkU320hqojaW/GuT1AWbzMoq9HM
 X5zJLRZuMSyql+EzBAr/Z67yzipxhshJGwg1ypwSoYs2UH1jhVRQGu3qcR+N8Zvgirn6
 Sg8iA+OVNm6doP4+9IFkG8GHLjscfu+5OZst1k2pEDXnRbsBJWJ9JP1GB1aFBPJCPFbd
 +/SUWMLMGobFMH3H2WDnkfNn2iagToh2NGzQ99GVT/ZmVGW2TCh5mOlnpLJ/8xRoYQj+
 rSeRDZ8kzXR3563yvLY/ZY9scIVpXCUV1ZXeBMW+MMslTUEq3FCKn/XVhw1wa0nVrWyo
 b3BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSREX8cusN4NVCtGxHRaxWksE1M7LnMUKsLHLgL2Z9S4TULHjb6ekiyGatb8fGQx+W2EJDCIWW82lv@lists.freedesktop.org,
 AJvYcCXyl4f+CplnuCwdiPicSexbEcGPaDBZ3XTOeTbMJZZ4X9A+Dv8LrvG6jWJHnzCI3JfIGcTwBg03w2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzZSzgnf0PdNe7oAFkwZ4bMNvrwt9ZcRhorxGjuq9fy9TCSmJV
 nNlkubazYANMUYd4PcmEP8KdgHtkUaIaQ3Uhq4up/p9nXdYStCDP
X-Google-Smtp-Source: AGHT+IGXHKrgOAEXK8lTj10qUqfAMieZLXkbaFv8HzsFgHnzL3kEMyr/0wjhIgmVWuNZ4D1J6pHREg==
X-Received: by 2002:a05:6a21:6d92:b0:1db:f642:8d8b with SMTP id
 adf61e73a8af0-1ddb09139d4mr2281960637.45.1732079096328; 
 Tue, 19 Nov 2024 21:04:56 -0800 (PST)
Received: from HOME-PC ([223.185.132.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724befa6f7fsm623414b3a.134.2024.11.19.21.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 21:04:56 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org
Cc: sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, quic_parellan@quicinc.com,
 quic_khsieh@quicinc.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org,
 Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH drm-next] drm/msm/dp: Fix potential division by zero issue
Date: Wed, 20 Nov 2024 10:34:51 +0530
Message-Id: <20241120050451.100957-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Nov 2024 08:41:15 +0000
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

The variable pixel_div can remain zero due to an invalid rate input,
leading to a potential division by zero issue. This patch fixes it and
the function now logs an error and returns early.

Additionally, this patch resolves trailing whitespace issues detected
by checkpatch.pl in the same file.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b4c8856fb25d..e170f70f1d42 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -225,7 +225,7 @@ int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog
  * This function reset AUX controller
  *
  * NOTE: reset AUX controller will also clear any pending HPD related interrupts
- * 
+ *
  */
 void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
@@ -487,8 +487,10 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 		pixel_div = 2;
 	else if (rate == link_rate_hbr2)
 		pixel_div = 4;
-	else
+	else {
 		DRM_ERROR("Invalid pixel mux divider\n");
+		return;
+	}
 
 	dispcc_input_rate = (rate * 10) / pixel_div;
 
@@ -579,7 +581,7 @@ u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
  * This function reset the DP controller
  *
  * NOTE: reset DP controller will also clear any pending HPD related interrupts
- * 
+ *
  */
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 {
-- 
2.34.1

