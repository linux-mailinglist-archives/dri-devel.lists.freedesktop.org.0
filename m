Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839BAA46603
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262310E951;
	Wed, 26 Feb 2025 16:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DmJw1n85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16110E951;
 Wed, 26 Feb 2025 16:06:00 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so3909455f8f.3; 
 Wed, 26 Feb 2025 08:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740585959; x=1741190759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sjm0Buwjwxm+WDev80/Z7KsjHHkctsu1ONm9k/3wnjM=;
 b=DmJw1n852aroNYA3ArBPcfFOrFBB86rRIxE4GHiZH9cSMc0YyH9cIRNj62iyfP/81K
 vIeq0Qvm4fZqIRxChfyDfLqaN2aSP90Y5g2BU0akZx1Qydb6gQcDd26JYTMHNCa/7lib
 PToPeiBcM89Cnm8t9CgEMPu84cMnucBm+icDXLJCJiRCQFF2K/ENwL+MuhwzKzZgHxfZ
 5/UmdSPEcZoPvCsNWe+heIyiLWChBvF7OciUU7Y44ZVOWEVnKxoBOp+lms67iQGpFQ9Q
 Djb8z0k24KHbIgntI5rC1fmvfF5PcBtkyb/Ld2/60osUKWEoBfCJhiZ/Hzy0XmiYxjr7
 Md+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740585959; x=1741190759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sjm0Buwjwxm+WDev80/Z7KsjHHkctsu1ONm9k/3wnjM=;
 b=oTaLWhFD3cRyBKL9iMIJ+gZKzxFg/s1SMHsz/3wYjtDSIClyrRAcBJDxUNXlUG3BPX
 K9AmQ1NQEQq9rARhssPxclFQefgBaepx8qVzDbUX/EZqTiRTXEiJhUAjZog1CZUi5Zos
 KS8y4GCVUmEfUy42fSdb+diUTwpJSAAzrWgK96fu7g6yOBfNPNWymrlf1rNFTo7k/b8y
 NlI7YuDwM5AVHkoCHJvW8KOZs2O+CgXfa20bqFCrkH1JqL1w4skA52gkWCTeqx6QHdYw
 Ym6G1dzeeM/bd9D4TAEVLAAkvKCmVTJ+gNUqE33+IHZNJ2+NrFe8i2h/iWR61sPrhVhv
 VKEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHMilVbgt5J22teu1Z+UAUi/ZVif/zU8xGzyMPW25yzK6/g5XZhx2S9vT3HqDw8DeZpaGuSlplnOo=@lists.freedesktop.org,
 AJvYcCXgMGtRVZg6GRzj/T0ZECfbHEmISlRb3Tro5XOfCEtWXaWH5enTWoOgQzqloY0f7akqu8+h/Sjccvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWLGLWH5dqz66Q176zJl4cvbknGqm3yLaBNWZMJRpue+/nlMup
 AMe7C/S8H4klVpyvs9LwkI5StK604JJ+609yVvRmO2MGoY0BlBnm
X-Gm-Gg: ASbGncsjmqAgkaX1sf3Ez651twTl+3iuLUj4p5/VranFvDzsRTPbMWOxMpd+CRcurfZ
 7jkjSDKwjINdq4M3o9cSN0jFn8XvaNE0rfApW7s4qsYB74Mfdp4MZ7Bg2gel5ACkmUObmI1k38l
 ADBsdrho8BFrBFSISHQ0kURPbEVUevz2GdEy1qg6sDXE1NLCtR9Lbw+AOenJBJDUV7UKRWKQKE8
 ulZhtJMBSTfh2rgjPanUAR5nKUcW2OIP/UM0LMbtTs6XLvokX43MWvfmNnMJa6fW9dDnwH6jXJg
 5Viy9UH/w5cV+hplTjz1fH4AyHo=
X-Google-Smtp-Source: AGHT+IFVFHkpnnU9VW7aOfIZgP4iCvawfQNvVOj9zraHTLvEMvl93gNJtyixpuT6X2RHpxCfcLJtrA==
X-Received: by 2002:a05:6000:2c7:b0:38f:21ce:aa28 with SMTP id
 ffacd0b85a97d-38f70827b21mr15686879f8f.36.1740585958499; 
 Wed, 26 Feb 2025 08:05:58 -0800 (PST)
Received: from localhost ([194.120.133.72])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390cd8fbb5dsm5943880f8f.84.2025.02.26.08.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 08:05:58 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe: Fix uninitialized pointer def
Date: Wed, 26 Feb 2025 16:05:24 +0000
Message-ID: <20250226160524.566074-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

In the case where a set of checks on xe->info.platform don't assign
a value to pointer def the pointer remains uninitialized and hence
can fail the following !def check. Fix this be ensuring pointer
def is initialized to NULL.

Fixes: 292b1a8a5054 ("drm/xe: Stop ignoring errors from xe_heci_gsc_init()")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 3ea325d3db99..27d11e06a82b 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -173,7 +173,7 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 int xe_heci_gsc_init(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
-	const struct heci_gsc_def *def;
+	const struct heci_gsc_def *def = NULL;
 	int ret;
 
 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
-- 
2.47.2

