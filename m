Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2B8D885E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 20:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37B10E011;
	Mon,  3 Jun 2024 18:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="eH4CLKEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAAC510E011
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 18:03:40 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a68b41ef3f6so26269666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 11:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717437819; x=1718042619;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7TPkYuHgg+gLnBsrbKhRQC0OqluG4mID27p8/iWKRL4=;
 b=eH4CLKEeHrw1ugCSoMb2xmhVtYTKDi/PDg9paQIP4JJyvRxI/vRXvRd+ATejN4wyHQ
 A+5yggBisbAMdpGzzq72LMG8Gy1K+9f+/xScerNJQMe2ww0ilVg4dqtrXaaB5rWBmtO8
 EPGjt50BYdnoCvlDPDhXF1+ZAG0Fh0Csfqr+Sb5HJcGiLbr/lkUqvtvDCZLClDYFz2HQ
 /Iz3FqtCwFN7pxtvdGkrtCDUqQa5dN7kGgpCYy1vJUF6MvObyj/QmnoVpyI7PYJK2HAw
 FGQvy2gST4rXxSOx3raY/Yo3KQtHFLk5AD/uA8MrVDwfm+dt+f1FuWxL2sDoNIH9cj/G
 JMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717437819; x=1718042619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7TPkYuHgg+gLnBsrbKhRQC0OqluG4mID27p8/iWKRL4=;
 b=JyBYu0ePZ/bJyucnBYL1yyj9SMxeuiSBQGeHqlx2/b2v4IZGPVlZGnxAC2NHF4QIlN
 QdfTqU+YcKsr2sOCtx0ehVWpSNsQp1JSpQbREfM7eKAhRwwN769mCTDtyZDE+RrcY7mi
 l65DYXgzczhkyfmOiezqHrdeZSIVHcARrYqKIn+5LDyjknRUJM/yuRWWcqHkHbSO2MaE
 7619Nrl0SuDFgry+ke4cs4ADFxg9o9u30szgyBunfNSS8qIT2rEUObsDd+jGBGiPmhhQ
 gDyEbY7XabSB/vYAUMzJZwsN9aTKrgcW+3/CUf5jU3syqt/MgurWjOTazIJ1yLi/y070
 dbGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQf13ef1JUljUZBqt/SOVtglVCFuIJa4Z4cWcI3Vu2mozTD1cfKzsIcO2fq7ZNkpKWwS9Iy03vqKJggDyQlEK+ZquOVziL7W3pVEbpsX5j
X-Gm-Message-State: AOJu0YzzWs9hKcWIS+oIiRv4x/9t9hGAvXfT0GIm1rAHUeJVGo0i38tt
 oK1cEK2no6J0DY7Fu0pnxm/uLz6iMEHd4rCS5z9DsEjur7D3UyUantgje6G57SE=
X-Google-Smtp-Source: AGHT+IF3e1jIAkkZakp9bDQCCh8sQNC6LAEwH/bHwmzy6c4E4ZcH5ahX5INbvrL04dlbGKPBJ578ZQ==
X-Received: by 2002:a17:906:f8c4:b0:a59:e52b:39dc with SMTP id
 a640c23a62f3a-a682234b8d4mr621238766b.67.1717437818913; 
 Mon, 03 Jun 2024 11:03:38 -0700 (PDT)
Received: from debian.fritz.box. (aftr-82-135-80-81.dynamic.mnet-online.de.
 [82.135.80.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68b4b09cb9sm391917366b.178.2024.06.03.11.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 11:03:38 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/xe/vm: Simplify if condition
Date: Mon,  3 Jun 2024 20:00:07 +0200
Message-Id: <20240603180005.191578-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
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

The if condition !A || A && B can be simplified to !A || B.

Fixes the following Coccinelle/coccicheck warning reported by
excluded_middle.cocci:

	WARNING !A || A && B is equivalent to !A || B

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4aa3943e6f29..3137cbbaabde 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -85,8 +85,8 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		if (!q->compute.pfence ||
-		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-						   &q->compute.pfence->flags))) {
+		    test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+			     &q->compute.pfence->flags)) {
 			return true;
 		}
 	}
-- 
2.39.2

