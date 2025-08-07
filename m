Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42FEB1DC36
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2769710E88A;
	Thu,  7 Aug 2025 17:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="LMUvHSbl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B9210E88D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:12 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-23ffdea3575so8951195ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586192; x=1755190992;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=flIxjpWpa6hoR0nexsnqX4duO2P6jkx4Mipqam9GCMo=;
 b=LMUvHSblLtWPe8YIxxzm6PzBYu5XfXlwUmKWyWCBmLMQbdQDOIhRqag7ZNaogMW5eZ
 akQG2zZSQFnMyuqMZBF0E0uWJMnj824dM0uquPSSUaHpcMELGDJYght2mhVy6Z9cZOV6
 yYmqCy/EitQAYVZqAt7Nkwng1WP6gDWP/7f8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586192; x=1755190992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=flIxjpWpa6hoR0nexsnqX4duO2P6jkx4Mipqam9GCMo=;
 b=LuO+XL8u/QfZRWB093MSAWWI8TO+njfI6n10MXoojMgT7WRf5uti603C7yavdkCzM1
 goZzun/NJwGlwbDrxGpuFx+9BnAvejX4uvqqQ6/1vWEUWwQVqfavyd/gyR0Ir2UjGAw4
 u9n+mXb8DQahjglG5PMVS4yQEmqd6S3qiHQzLRqz6p45LXGsariu3xlofOJ6VHYXJSDR
 JIREtozWaJIDj9FNESr9uerWj2iPBtlh/u19bu9SQDvrYpXm99DfmQ74GPujgq7JnnbS
 VcuouPhVXu2m8AAV8Z9NPTbs606lmd9doxuzeQmWJhSV5Oyw5vDoDaXU/qonyjQBFHdv
 UTxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4868MX+JKQcbcIw/G9GEmffjBU2urfFXKc9PyNkm54NHL/sd51nLwS0LlkIM61OLUT1/mgzwLbiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy70vVv9z7egJ8hEhCMb7H10+JP99NHcx9h1Ubpd3r9wybt5E3W
 VgnwOXYg5Lke7FbZCewUzOU5Yn56w2gwDdcpkXbcRQ4j73xL1VOMGtbCFL2yK/CuThU=
X-Gm-Gg: ASbGncvkGKSxzCLKGjGpmw5cPCsl472wvOS7LYF/luv9HC4iZWu7cyTOi2K0WsOIL8i
 kArrw8GQGUrGm/M7k5AHRJwMKyJKfEBJZ36raTMfbjwfQjh7f+OCtzh7hkKOAc01/hu0T/HnEie
 6mxMn0IuqW4DPEtvWXtta7Dop5N8T9ZGiWNl5PY+NcPl7yG9xm0RLoXYMB01/1EcOVxmlbEuof0
 VKS/XsI+S3XTRDgyi7FKDVRMS7+Td6TxWNfUKXL++5iaFBf4O3XDmwECRmO9DuTYENfOpBE8rWj
 sylQTZYxsOvfxtxq9vAYDofvqsIR8NhXFeBeLbAoH3nzd9ut/K0U2rl49OorOT52TV1C6E714J1
 Q6U0BQYhKslD3HE+xphAbKNHtBOXJDdtK
X-Google-Smtp-Source: AGHT+IGx2yLMioCxqd0sgFSD03y5HFFKScb1B7Kkc8rIpzJQlvi+IrTHmgd4FN3a1jUL7RN/Mn8z2w==
X-Received: by 2002:a17:902:e54b:b0:240:7fcf:ced7 with SMTP id
 d9443c01a7336-242a0aa6bd7mr116352115ad.21.1754586192005; 
 Thu, 07 Aug 2025 10:03:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:11 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 2/9 v2] drm/i915: Remove struct_mutex in i915_irq.c
Date: Thu,  7 Aug 2025 14:02:01 -0300
Message-ID: <20250807170212.285385-3-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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

