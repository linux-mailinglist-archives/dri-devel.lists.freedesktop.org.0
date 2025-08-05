Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBDB1B6B2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A3A10E48B;
	Tue,  5 Aug 2025 14:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="sbkE4DDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC1110E5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:39:48 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76a3818eb9bso3930295b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404787; x=1755009587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPwTw55Tat4/RAcsZ0Cr48lAXm1AGjPrT47wjjBZvcg=;
 b=sbkE4DDLs7un/TZfGqPiYTrg/T3+TRUQhoHyNIAncK8tsIB60jtoH05V9DvbVIjFMI
 NAeXxUR3X5jaNopps3SqiZBLmq7qp6KEcNJOVI2mOwswEP/naGRgHCkThy/fIBMjl+Ix
 7BvImryHlk/my81P5+UkY/gTp2+3w55U1FRJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404787; x=1755009587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPwTw55Tat4/RAcsZ0Cr48lAXm1AGjPrT47wjjBZvcg=;
 b=ZCERWsBIeEPwXLAtjd9Sh7Nr/yjWqL/dwV+r7LwP3+XHogH0rdvnHgdSN/2YX7YzIr
 KNKP3FzpVA00bgNIq2THeUN8dlFWAobycsl2ht1BQMy8NClrJ5QnzjVdrnxHCWGWH+Kf
 SjMLFAmgJumieoweoxq13BK+2fJv57VTApl7mEuqQAOCQIA9T9ARA7d9tqKlHaxGYHks
 EIWyUgirN4U3Jlb8UJkbBk4DRGghhej9pYpJZabZsbGBC1fsgTMGiS3D5GUOAhZnSCTE
 sRZTeyuIFo4nzRxdLehAvjQnFFhWaN7j+Q+H2sARrgFZtVvZSgLbeR5SDQfMp6cp/QIv
 6ssg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLce22YREvWArkm4paqbwBr4WqGJ4MA1DvkBJHODgf/yxGfdscL5IkJOEKx3hxT3o/fi4uDQSYZ8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCWg+5y/g1GlX6WRXmF1+ctkQ6IUZIPldjgCoaHI+y8rdB3/WU
 IuNCBJH81VhlOIhaYs7AWf2rGBfA0zFQiJFK7x4MlQbWAUOti4FiMi4sgHVB8TVIEqo=
X-Gm-Gg: ASbGncsCkNFqatjZM7DB6djnudnYKHdiyVRe1DbeKeioncgq4Lp2vW0FHza3YBNbskN
 ZHIDUxf5NHBdLV83ttDTmSJeBUVNPkfFNqcr1py+Oe4SSlzw0gvfyYyFLOY8y1Kw8QV6gBFCTgC
 Z6BD98WAhtR0Fzn3d48SMXLaanblhpznHwI6J1CyxMeIeatp3lRH62zdVwM+uOslFYQvfv62jJC
 4IPpgGbiz78w3WlJIshNHc9diXGlkcWBvYnj55CFtvaPQWkJ8Un5MFSVeoa4lwfgeGxN4mKW3hN
 oCYHj1EeakZtrWhVQOOdNlAsNSdPBiBdAdflxB4uTRswMP56HITXWjoEHzSsKxYe2GAJaya5dTp
 rB1jj6osfIkoQ6JStOJQtuCnqny+zsD4aUBq1fbAlDas=
X-Google-Smtp-Source: AGHT+IEl5OfPdmnCRmk6I/LgZqLC8qo/yQ/Q8L8LBAth/mZRo2Dx+Z4Ol5V6b3R0IQeigYhSZ2RKxQ==
X-Received: by 2002:a05:6a00:464e:b0:76a:986b:6d2 with SMTP id
 d2e1a72fcca58-76bec48131fmr16231021b3a.11.1754404787510; 
 Tue, 05 Aug 2025 07:39:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:39:47 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 2/9] drm/i915: Remove struct_mutex in i915_irq.c
Date: Tue,  5 Aug 2025 11:38:57 -0300
Message-ID: <20250805143908.32343-3-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
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
index 7b29062fed50..a597751f9598 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -162,11 +162,6 @@ static void ivb_parity_work(struct work_struct *work)
 	u32 misccpctl;
 	u8 slice = 0;
 
-	/* We must turn off DOP level clock gating to access the L3 registers.
-	 * In order to prevent a get/put style interface, acquire struct mutex
-	 * any time we access those registers.
-	 */
-	mutex_lock(&dev_priv->struct_mutex);
 
 	/* If we've screwed up tracking, just let the interrupt fire again */
 	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
@@ -224,7 +219,6 @@ static void ivb_parity_work(struct work_struct *work)
 	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
 	spin_unlock_irq(gt->irq_lock);
 
-	mutex_unlock(&dev_priv->struct_mutex);
 }
 
 static irqreturn_t valleyview_irq_handler(int irq, void *arg)
-- 
2.50.1

