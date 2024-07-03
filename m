Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0A92549D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 09:29:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F002210E744;
	Wed,  3 Jul 2024 07:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="OtJEfuyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DED010E744
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 07:29:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-706627ff48dso3786920b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 00:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1719991792; x=1720596592;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eyHOv+1TQs3NJgyrsK3G70btEgM4PBOJQcOuP6+/cTo=;
 b=OtJEfuyGjnh/m/77VNP5AMTWMN0stQuhTUJWbeLJZRolTGuQjC/8gAFlDn2uqDtVoW
 aKCbRLmw8yDlKP1Z1mLcU8a9Vr5Lra6Fjctclpl4uxcc0Ud1QRkYtMScr8zMAnRhrMvn
 x9Jmfd6Jf51WzkkSNWMM1M6ZQQeJEMhcPTYUT/AxNS9zNNDXe+xdjWolcq0rkhmQeYOL
 oqu3dJOyo/J0MgZSdE1RJOjiD1N9gPBtTb7hWuWshW04SHv7K5QWkt97vcgtOlCQlED6
 iTPS2fDuvlmTdvoFVfXQClaTmIKxe2ixtB2lb0KwX26eE1WCrRztdWZfCwIbMCtwOjhD
 +L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719991792; x=1720596592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eyHOv+1TQs3NJgyrsK3G70btEgM4PBOJQcOuP6+/cTo=;
 b=EFH/Ela9DjvGM8FggF9xV89mJOZO5GwTWSI2k6xpmo6vca+I31K8xTK+jccBFSty8+
 TjBErdNfSpqQhXzIdlHeFzAQCrEheFtcwT7ChPWURxv4aKlZmY0uDINbqEZJzyeaJw22
 XArBE7z9+mnxSJ37ToEOWIj1edrsl2hpQFf57VbvzRKTEIUp+PII2ElhutKqRe2ANEnM
 CwJQbzBmfPDM7BLCNdSEt0OpoD8AxLsNZWlnurGsdnxEVrH4dxlLlJjciN45Z0vzpnry
 GejOlFVpwhSegMvDHFTKygikdHPrfs6t7myba0+yyJaanZ2qM372/JsKAsnHkcIw/N79
 9rRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwF3GjbUg/52FGp1Hd8KcLIxoGSElhA1frFN8qGukxindhMDtLd6w+IwBgBxMDxo0H6xk8cu07h9mjNk/s6T3/CtYTav7xGNI3fZ08i/cA
X-Gm-Message-State: AOJu0YxEKvL3jtEWF1GkyyhEwqmdObF2KYRsFqSnqf0Lc1GYskolSfnc
 6/zlW9q67z4omc6MPbhmActaXS9RiluSA5uldAMJICbwhnkJPCtA8+w+oEEtT/E=
X-Google-Smtp-Source: AGHT+IF/2q2bYv+AW1oYPuOUB0yCXXmEAlApl3JeOfwhHA84IKB4Vo8dFV5LyPLNM+Hvub3oz8ssbw==
X-Received: by 2002:a05:6a00:194a:b0:706:759a:70bc with SMTP id
 d2e1a72fcca58-70aaaf32f24mr14483206b3a.29.1719991792618; 
 Wed, 03 Jul 2024 00:29:52 -0700 (PDT)
Received: from fedora.vc.shawcable.net (S0106c09435b54ab9.vc.shawcable.net.
 [24.85.107.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70802959d41sm9993502b3a.96.2024.07.03.00.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 00:29:52 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: ogabbay@kernel.org
Cc: ttayar@habana.ai, obitton@habana.ai, fkassabri@habana.ai,
 dliberman@habana.ai, quic_carlv@quicinc.com, dhirschfeld@habana.ai,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thorsten Blum <thorsten.blum@toblux.com>
Subject: [RESEND PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory
 allocated with kvcalloc()
Date: Wed,  3 Jul 2024 09:24:39 +0200
Message-ID: <20240703072438.725114-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
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

Use kvfree() to fix the following Coccinelle/coccicheck warning reported
by kfree_mismatch.cocci:

	WARNING kvmalloc is used to allocate this memory at line 10398

Reviewed-by: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index fa1c4feb9f89..8024047962ec 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10489,7 +10489,7 @@ static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 siz
 				(u64 *)(lin_dma_pkts_arr), DEBUGFS_WRITE64);
 	WREG32(sob_addr, 0);
 
-	kfree(lin_dma_pkts_arr);
+	kvfree(lin_dma_pkts_arr);
 
 	return rc;
 }
-- 
2.45.2

