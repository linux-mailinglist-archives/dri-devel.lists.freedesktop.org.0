Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E130A9558DE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 18:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39EF10E0BC;
	Sat, 17 Aug 2024 16:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R0jGffrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DD710E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 16:20:35 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3db51133978so1927608b6e.3
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723911635; x=1724516435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kP1WVQQ5Bv5vxEC3CBtv7f+mOuVDTnPEQv3oVhBSEyg=;
 b=R0jGffrvtl8skAZPvWtSB4V4Vh7CUdWDt5msckOyq/QCEQ+rTb+vYVsGbr6GIv5P1l
 YFlk9jQU6/WLFB87mNEtZcFInfhClRLhmxwEWqgd2MpHMktH0MaTZTBELPwFNBd37fvl
 OeY+Fk+t5c9DbBuOoLAnFMmoR64oOtwZ1ObIOFMKGID7iE0ydnJTGrg9BdExpkgJHHZt
 0rZzQ0/wj1lZUb6WA2/ybU8Z8eCqUX7NuWfQCdVthdGK/xtktiofWxkFxPuxZ0MlOkud
 saaq206zjhc+MCAzogn2pNRfJxe4Ki40XaxJYLiabcrsRRN0DLAoMn1q+FCziSihHl60
 K2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723911635; x=1724516435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kP1WVQQ5Bv5vxEC3CBtv7f+mOuVDTnPEQv3oVhBSEyg=;
 b=Xw7KAbAfr2FvSvfeUYwwwg2Cq08m4HDjPTjA9nXAqD58X/BFTl05KHZ38kWG0QPjf7
 LsHN8SYOtgHYuv5gFovPRe1vOsKXMHrrV93Ee3gkAQTuSc8AIsigvlU5QjMkfBA/Oc1z
 wL4B5rWBxkALiSp8NF2l8CySuodFz6np+ZmN0/rMpnu/cqeuL7XKn2S3hL4vTSjOBzBN
 +XGrlVGPXki7TiA4JyLmSbEJPvJgA5ihqs/l8wpSQpr8N/otIluZ9jkjg07TR/LSHbxo
 XSMSO5Leh0LbmnTAnpQOd+pXsVpd5ajuxzL/xxtT5Vg3tlNpHs79JVuofYTxsTCqXh2J
 hdpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1pHDYetLQlpBa4CwKz6ET53CM3TJdrwd5/XridURJQfX1X9tcTcusocmNRsxuWFtyCH0eUnWpF8Srv7VNBHYZP7DbHHwlH03bSufK6QCG
X-Gm-Message-State: AOJu0YzFFYQ/AKWI7SjuSRoShdky9GJw0WxhHsHff9pzrPrWEVEhvjUe
 nDNGtsPj6C7Ypsc7Sinv2U1DXPQVEJTcwGuvxMoKjcdh4VwJIV5Q
X-Google-Smtp-Source: AGHT+IGtnjHFRx3Qp4aKtlGFHGnuR8QNSWs2lim3Z4YbIn2a/1+v2IR7KoPlS+OHSEswXtNKCPILhA==
X-Received: by 2002:a05:6808:1911:b0:3db:2afc:b19 with SMTP id
 5614622812f47-3dd3aceab17mr8169782b6e.12.1723911634629; 
 Sat, 17 Aug 2024 09:20:34 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.188])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7c6b61e799asm4258049a12.44.2024.08.17.09.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2024 09:20:34 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Dipendra Khadka <kdipendra88@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Initialize symbol 'entity' in sched_main.c
Date: Sat, 17 Aug 2024 16:20:24 +0000
Message-ID: <20240817162026.84761-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
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

smatch reported following error:

'''
staging/drivers/gpu/drm/scheduler/sched_main.c:1063 drm_sched_select_entity() error: uninitialized symbol 'entity'.
'''

The symbol entity is initialized.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..dcfd4d0f7c6e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1047,7 +1047,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
 static struct drm_sched_entity *
 drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 {
-	struct drm_sched_entity *entity;
+	struct drm_sched_entity *entity = NULL;
 	int i;
 
 	/* Start with the highest priority.
-- 
2.43.0

