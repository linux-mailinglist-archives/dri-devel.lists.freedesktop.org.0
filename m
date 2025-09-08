Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77765B48D1A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C93A10E4E8;
	Mon,  8 Sep 2025 12:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="F1UAEBNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADBC10E4E9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:15:41 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77459bc5d18so332399b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333741; x=1757938541;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUvezD/YP4/BWL9WTYanNDY2Y50PSfkJDab/A2rW7GU=;
 b=F1UAEBNowoakGpfXCZLQeijLlVzUHbslCEo8vApKDb9c1scRAsxxPyzxZizZmvYhyU
 iIULdPNhRnwZDGVaMPZ6zMGVRFJqQ+o2oejSNmcdnAdHisivajVm8zTAf3lbaiUo5mEF
 hacvuqH0jIRSgi6W/BkKP/2foaqinzuRz3DmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333741; x=1757938541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUvezD/YP4/BWL9WTYanNDY2Y50PSfkJDab/A2rW7GU=;
 b=JMszsqhZO/NznM++kZrxqx4Yv0BmMkRr0+MxXzI4EapCah2wUPG/UjQAW3Pir9d79D
 TVnAYzK4/SEJbp8SRryV4PSK40zkTvmBhLbjkHlk4rMwYC5INQa6LSvoQTjK4f4DO/IR
 i6T81Wu2LztuvRjQ09vTDTx8+xLdYExKzQkQZP+jXcSxA65rbYArCV34bYmpOJVOzq3P
 WM0qHfCSq6mgDdqhnEdmRbYF4ECVoqMt34mxA7BGPcF2NlvM2Z9kljQIU7vNXkhyzVt7
 zhfyzfPU0iCN7k0HNAK9eYmyHUeZ7n6aTQHxqvOXw0/1Awfq3xtz/hc8nNdb003tLdRH
 mWWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGyrfa1vcF4wdav+umEAmQjzkSKEawoEhzaA5UoTdacUa0nFhkKXsNsR8gkIDXwHmsqyItMkINaEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYggFoQKhu56HWN1jyefo+tXrVyNk+hOrGEQlpCo+Zv0LyEf4A
 kLG8exmJom5HJcvUVdJ0FnKi2Tv+bMetzz/VztTqr90nSAk98lnYxKUiSSoPfQY3gds=
X-Gm-Gg: ASbGncs23iQiFavmLSnbzll5pL6r5yDoqDcc1Up2FmvKzRn9WN1M+CjGJxaDEYyjnxW
 npWl+R3HRJgl6XHFfkzG4iqEIYM/Lgnk/eQXliZc+R1mw3AQ7sMYL0uRWfQozA3CEHEZAsAFFhF
 pWRyXw4DKKFsM11akx5yKglWI6VMSWAsyRXSNUggqYAJgTUEuMoQ4B3ULfEcmxa7b9zjHIfBOMF
 Dl10q/VSdWC12e/1257z5fd5HYsTXOdX/dSkB6nOaitKvTR7DB/EROiQGQ+ImaYB8kQbCfEBGj6
 SlM94ZoG6mCqUDjvqjFxuGJXRJ0w5Lad6XzUFqk5Vz8q1VgTkQIgxlBFPw2mIFqH9qMpazLYxzb
 +eyY90uPxlYfV3hiGgqoX3D1yQJ+xtDPGBg1wvusayIs=
X-Google-Smtp-Source: AGHT+IEPI7hdeFA1Bef8lJ96znAq5Oup2SUgcoyYU9jmYh3VvtUv8MVkT+47I/v9x+1vN+I2SSU+cQ==
X-Received: by 2002:a05:6a00:1acb:b0:772:43a9:d587 with SMTP id
 d2e1a72fcca58-7742ddf13cfmr8055303b3a.20.1757333741395; 
 Mon, 08 Sep 2025 05:15:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:15:40 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 2/9 v4] drm/i915: Remove struct_mutex in i915_irq.c
Date: Mon,  8 Sep 2025 09:15:10 -0400
Message-ID: <20250908131518.36625-3-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Remove struct_mutex from ivb_parity_work() function.

The ivb_parity_work runs in a workqueue so it cannot race with itself.

Also, it is not protecting anything with the other remaining usage of
struct_mutex.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index cdfb09464134..83b08dacd194 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -163,11 +163,6 @@ static void ivb_parity_work(struct work_struct *work)
 	u32 misccpctl;
 	u8 slice = 0;
 
-	/* We must turn off DOP level clock gating to access the L3 registers.
-	 * In order to prevent a get/put style interface, acquire struct mutex
-	 * any time we access those registers.
-	 */
-	mutex_lock(&dev_priv->struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
 	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
@@ -225,7 +220,6 @@ static void ivb_parity_work(struct work_struct *work)
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(gt->irq_lock);
 
-	mutex_unlock(&dev_priv->struct_mutex);
 }
 
 static irqreturn_t valleyview_irq_handler(int irq, void *arg)
-- 
2.50.1

