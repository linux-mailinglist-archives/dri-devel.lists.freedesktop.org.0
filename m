Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF22CD1AC0A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7E810E276;
	Tue, 13 Jan 2026 17:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="TOXv9eRZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f100.google.com (mail-dl1-f100.google.com
 [74.125.82.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E9710E276
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:54:16 +0000 (UTC)
Received: by mail-dl1-f100.google.com with SMTP id
 a92af1059eb24-121bf277922so9315109c88.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768326855; x=1768931655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VBoPvJAo38ohVoGbflRo1vh43rI5gqsLcHOzxFAHGTU=;
 b=hI2vx+g/AJILf07YCBB0IO+fWl3s4aDUhI3wjiVTcoZA1Xm4CxerO0zJabTyr71nL8
 i3Z5iLWTZWHIMx9CunnOAjOcyky8hQQcc3VctytOjPiqmgvdAUjhNMgM8qpRLRh968La
 s8lDRSdjKdnTqCUrekgsi7/pJliPjfVvA4dhAWX/wpMPWxW7Vf1Veli63qFQYGrOHnvg
 9lq06Oa1TP0feENE0fTkJkXaCvLDhICfLieXlck9hTGJ1hSkizJY2JCsN9Uej7WuOfX5
 aqPQa2LSujX1ZVEGLGWWFcQ9D/+wzEUvhZTm14wmqtzvbZC4fr9VI4oPkh6xfRyPtc2k
 so0g==
X-Gm-Message-State: AOJu0YwTJ+Dj7nc4c3U6pkLSJ2qOKJRC7k41BCBM4QKB93o8J1gZzVbE
 Yp0IoML+qv4wRa8ZAv6l39KeHPoyYBk02jSrPuGP1JW8u6+gb+BNZZX8/Uws8cUl/vqtCXez0xd
 io3MIihaciu3sU/bwaVjTMaGhudxg7Mj+357x7cJopRj9HricPBfUWUjDXOuy7V4ylyrb6HeW0I
 OXOkEoz05O2+eKbmN0ctuFW44ZiIy4iRoCepT02T9Ra1aAJyJoEvrk3wky+UPyXxz7hcnRZQUQX
 bMThbW1AxE5e0kjNnTk
X-Gm-Gg: AY/fxX5x9RRNMX9dGvZ6s20+pT9cVrbyGp6rjU2FpSQp3pK6tNsrw5hmRgyePNfkBD4
 Ue7SLN7vSvK5wVvfBxFqS+7WLnmW2P/wobqkCvf/y/p0E0UlXia9bn1rDs4hmLR8402oV5SmD/S
 uESvEN9ADQ5+xkDSbd4Q6BvrMRjy5KPyaivvD9eXD3qRGjvp0VXGKvCFYuBdK+QM6naamrp05HF
 OeKKCd9Tqbr3RgmnhI7RYf9Ac57+UQt8PQLZyMGrtjZZoVExF7FbQJbkMyIqLMhSYc6dHW0rICf
 kcXKwo6CcrFZ6S5oEWbRN/SNAoOwQTuWLmioJ0uI431cjSvYjN8dt0B3Cacud3cTzS3rnP0u2C5
 ShUGglP85bndalL6gdrc8oXG3RCVXPtcoSXJzPOuouXRvxfS1h4iKvAuYfDAwjOXPzw==
X-Google-Smtp-Source: AGHT+IHFmJb0MDThByLP+KzvajAjl/0crQLbQTQEtcoh92uRONsV/5tdeWbZIKIIcsdG9buPtYOS4qCx+mp6
X-Received: by 2002:a05:7022:23a5:b0:11a:c8f4:3216 with SMTP id
 a92af1059eb24-121f8b14c84mr18278435c88.15.1768326853853; 
 Tue, 13 Jan 2026 09:54:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 ([144.49.247.127]) by smtp-relay.gmail.com with ESMTPS id
 a92af1059eb24-121f24a554dsm4442331c88.7.2026.01.13.09.54.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jan 2026 09:54:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47edfdc6c1aso4309785e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1768326852; x=1768931652;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VBoPvJAo38ohVoGbflRo1vh43rI5gqsLcHOzxFAHGTU=;
 b=TOXv9eRZo5Csr7I8keVLdlUfYjQUg7d5Qy2Mq+rsoPd/TOSIz3tOISvwFktpVlwsq7
 gvfUPpdbifdrcxELYbqXy4KpF/vGnEaWT5awPRTx/kd8/a+3ATtTd3xDFA8w4eeVDwC4
 aiZjpO2HTcCK//Vi04umupl/O7ItfeYRowhPo=
X-Received: by 2002:a05:600c:4e49:b0:477:7c45:87b2 with SMTP id
 5b1f17b1804b1-47ee3344c8fmr666715e9.16.1768326851719; 
 Tue, 13 Jan 2026 09:54:11 -0800 (PST)
X-Received: by 2002:a05:600c:4e49:b0:477:7c45:87b2 with SMTP id
 5b1f17b1804b1-47ee3344c8fmr666405e9.16.1768326851313; 
 Tue, 13 Jan 2026 09:54:11 -0800 (PST)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e180csm44202387f8f.10.2026.01.13.09.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:54:11 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, praveen.singh@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>,
 Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Subject: [PATCH] drm/vmwgfx: Return the correct value in vmw_translate_ptr
 functions
Date: Tue, 13 Jan 2026 11:53:57 -0600
Message-ID: <20260113175357.129285-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Before the referenced fixes these functions used a lookup function that
returned a pointer. This was changed to another lookup function that
returned an error code with the pointer becoming an out parameter.

The error path when the lookup failed was not changed to reflect this
change and the code continued to return the PTR_ERR of the now
uninitialized pointer. This could cause the vmw_translate_ptr functions
to return success when they actually failed causing further uninitialized
and OOB accesses.

Reported-by: Kuzey Arda Bulut <kuzeyardabulut@gmail.com>
Fixes: a309c7194e8a ("drm/vmwgfx: Remove rcu locks from user resources")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 3057f8baa7d2..e1f18020170a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1143,7 +1143,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	ret = vmw_user_bo_lookup(sw_context->filp, handle, &vmw_bo);
 	if (ret != 0) {
 		drm_dbg(&dev_priv->drm, "Could not find or use MOB buffer.\n");
-		return PTR_ERR(vmw_bo);
+		return ret;
 	}
 	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
@@ -1199,7 +1199,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 	ret = vmw_user_bo_lookup(sw_context->filp, handle, &vmw_bo);
 	if (ret != 0) {
 		drm_dbg(&dev_priv->drm, "Could not find or use GMR region.\n");
-		return PTR_ERR(vmw_bo);
+		return ret;
 	}
 	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
 			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
-- 
2.52.0

