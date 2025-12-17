Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A5BCC7104
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 11:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4739510EC00;
	Wed, 17 Dec 2025 10:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MnTyjjuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907D510EC28
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765967128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
 b=MnTyjjuMf7e1dHMhG/Ca2U7O25YbWRlmao6fKkoX4QeKmPnh6gUq9Lhe3cATD9ItQ6OecL
 ExUXSdYLBWSuRhJur8QHKRn03uyLYoWE4kans1AXQmrCM9Yf8Q1Uoqx0BEVc4v5/mmutG5
 AUyeLbYhqw03E5SwG9VvaQBAQP5UQdg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-F5w3NjxhNTSqTBnU2Q4-yw-1; Wed, 17 Dec 2025 05:25:27 -0500
X-MC-Unique: F5w3NjxhNTSqTBnU2Q4-yw-1
X-Mimecast-MFC-AGG-ID: F5w3NjxhNTSqTBnU2Q4-yw_1765967126
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477a0ddd1d4so38235055e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 02:25:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765967126; x=1766571926;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smHdiTegAULuGhXNBZg/bX/26IPaO/x2LiGtrg1VjdM=;
 b=AQyjdWLPGQWJVtzVWewG/oZfWjWbSUyfM6nK6tsIr+VlWMgRIVePhAZOWVytvONy6d
 /ThYRTI0iTtE6bvycLftrwVQ0b82PojKAv09w0lGrgY/pMI4FFAEDIwqBtOxvl3XJlz/
 n5i0GfDxYKcRgxxJ4VNQ6Heq2rdya5EyXom/j3VOlTp1kXNuBmOIq+Jm5ZzM2M2Vb988
 iGtyWg1EskxX9TP/dTrNHH4VT6ZoWnoqAoI5P5p35JuZLd+7TTEFjiGHtoGFMtgJ3ekb
 Ajk9s1fcbslxHsb6jExgJCABdf/n9hNVae2jnNkSy+ESa3P9fbdxh1Jsb9I4i2CFPZTB
 yRVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgImdGXBTSfOSBHcp+XHXKNjoaMEwbFqV6IIhAVcXuOtMoYUrggNFmx+RGCfvpHavvZsczAJttoZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7k/L6Xyrdm6fGbQ3IqPAB5Wh4IF5AYi/kd9trCp0z7u3O7wNx
 U9r14gcKv4/W+DZwJe48OfWTpZL0KrPICRE+s4/WwZDXLDYaE622l2Rq72/L2LliNhsqn/0MJe6
 IoaKRxJQl1631ZyPuk8a/cOI2DJLW0JEE1xl5du1zWH/MQm/N4Q7qD4mi389dpkzSzkEByeSRAo
 ApdA==
X-Gm-Gg: AY/fxX5n9Qoa8o9pHhhFpX8prD2AKKdru61Zhn1yiLgecu4z6StgU1wRzq0wVhYQCrb
 F2e9JOeqdIpbkGnEf03TKoGG2K3nQ1F/sO68oEoZC56A/L2mseSofR0DRA3szDop+JeLIotK9bK
 zhR1msfSnonbzZhtRs+OOLlPTWVLuofKz42zUBIdyJCz+MGf6ZCTl8mUB0Y+5Q6583wcgUniqRD
 5/5deLfyt4ZOL4z0rV89j6OpMApGJ8veFlYqWC7QSNfFzxZTU4xBFgMwSPEsvlOnZgE0fLO+mvz
 ME4Y5kw6wJ35xOceTVygSEzl9PUsaOkBERVnGFRpGId/uOPrTTI2H1K3eZWUHuWRsFmKiFpN+Dy
 hU2IPeSmlQ35g6aEh3q1agc3VmgIuVXDU100KN+i6F6lRsnxkWY8O6KzPXlg=
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47a8f90d28bmr183475055e9.30.1765967125962; 
 Wed, 17 Dec 2025 02:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv94oYFukoKO/fNpwSZWIAqty2A+HqHfndysVYm5pmz3lseu6l1OSQncA0MKLpd0JpALSjTg==
X-Received: by 2002:a05:600c:5254:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47a8f90d28bmr183474695e9.30.1765967125517; 
 Wed, 17 Dec 2025 02:25:25 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb
 ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc1e6ca3sm30491045e9.12.2025.12.17.02.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 02:25:24 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] dma-buf: really enable DMABUF_DEBUG by default on DEBUG
 kernels
Date: Wed, 17 Dec 2025 11:25:22 +0100
Message-ID: <20251217102522.2790298-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MDcSwb5iwacX2B3vun8vIAAKrAogSw_Xqr2le53QQiU_1765967126
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The intent of commit 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default
on DEBUG kernels") is clear, but it mixes up the config option name. The
config option for kernel debugging is named DEBUG_KERNEL, not DEBUG.

Fix up the DMABUF_DEBUG definition to use the intended name.

Fixes: 646013f513f3 ("dma-buf: enable DMABUF_DEBUG by default on DEBUG kernels")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fdd823e446cc..426c9ad3364f 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -55,7 +55,7 @@ config DMABUF_MOVE_NOTIFY
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG
+	default y if DEBUG_KERNEL
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
-- 
2.51.1

