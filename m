Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7870A44723
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B0210E69D;
	Tue, 25 Feb 2025 17:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OAO69rKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5EE10E67C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 13:35:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4399ca9d338so34317545e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740490505; x=1741095305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vgOIooV+vPcoX74/jt4WArZdHKkpzYkOZYv/SCbrW0s=;
 b=OAO69rKqL5S11KPfh8F0vHfSaRm/HEzMJ9zBRy3k/CZ8BsplVvPlHWgMvGwhnH0Fg3
 HZt99zGX1LHvlLzwbfCwdXK4ueUsh3Kg5ouRAJGffmr1TO6fNGL4TaUlLobGutovjl4n
 k4akZ6M5Pbn8oJwBDcXOq79R1UOXGr88OxKYO9FWIDVkrAw/TZiqeoQbPQvnQnA4hBd6
 k4qsfjkmDyAa3+MWrqcgk4cs9ZbxJojOh0mGUOxcWM9JSGSNDocopm5PCn20Sgrj8awC
 zupWww7yCojzoBXD8/0/Bu88NjoO1MKTc5KpCQISVwEUibVeBRoTjkbmTy0WrKCC5hcr
 8SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740490505; x=1741095305;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgOIooV+vPcoX74/jt4WArZdHKkpzYkOZYv/SCbrW0s=;
 b=v64PhLrAuMHeUCoKXt5BUhinsVQyY2lq7LUWp7xFeVdLHTZjgyLdJZjC6d9qGm0otx
 uavr1mh3QZaPsq6GiVfE81QTXGgACR5yXh2oWqIGRu+1rfNrHPt09jvAgMObV0hPpZkZ
 xHIOxeqxF/BoqKoB/Ds3qFhcdT2L8fZNkTZBI60D1EidkKdONHWUqHNQ+9d6oCBJXO+5
 eJRVZlAde72ux1WMRwHqsARpbv0sjvs4p5McMA7G5TdhAN3MEDxTpqvZ4vA+Do67/HFF
 l/h8kD757p/sNILD84eh0+sUsODOOwZxlTGR/8yeXr74rL9ZqPkMPVlVwerDkpW2qddO
 MtoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXABUFkRO+F+JTl3R57rf3RSsVJL8JhxKXi3xrl5edC/elUvopAfSLjzBhZHSzgDDmy37a10XlUzMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA0xwVdgg+cWrBYy8XJsJHErTsnprbOCt1ahBgqTqNCmwA+H3t
 3QcMGvQFYRXcmb/eK1VUWltf/N4aO/KLWWqcvJsEZBmCDY7xRK3u
X-Gm-Gg: ASbGncsDNyb6fV+SiXHBO2XQPQ9tYpTxoehuQOCfzsWWgSqz7QsDBxE/xUCLLqR4uzS
 qzoXMLvX9K7A+VR3/pOyH8I3B9iUBIgDnH0M/uRVoldadx38lr0LhOzp4r1WRdo1/JCPUvKFjja
 0hHX7e27u3ysSEnak9ua6zTG9CcJcd5U2lBOrizeFDnficAPo268/IJAmu44uitWqwc3W30yxyt
 uYSqQ/s99W6f0T1m/DLlue9tsbOXRTGDBCvmcAi6FOI4FLrNMEf2XcQ04s8d7gIq+JPc5SSG9Bs
 ToSOIVb9coRWbDR324Qi+QYKIjpjv0KgTLDBk1Q=
X-Google-Smtp-Source: AGHT+IFgIttL2OJHMfhu55YCgKpGUWOUuIqNz+zWdPlkkQCExtB2rK2ob3PSZBKrarWdAmTUjdMOHg==
X-Received: by 2002:a05:600c:1d94:b0:439:9a40:aa09 with SMTP id
 5b1f17b1804b1-43ab3be40d7mr18392495e9.25.1740490505165; 
 Tue, 25 Feb 2025 05:35:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:7c3b:8f00:8531:eaa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab153a803sm25743175e9.12.2025.02.25.05.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 05:35:04 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: Use max3() instead of nested max()
Date: Tue, 25 Feb 2025 13:35:02 +0000
Message-Id: <20250225133502.28084-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Feb 2025 17:00:13 +0000
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

Use the well-known max3() macro instead of nesting max()
to find the maximum between in_size, out_size and drv_size.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..96cb9ab5731a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		in_size = 0;
 	if ((ucmd & kcmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);
 
 	/* If necessary, allocate buffer for ioctl argument */
 	if (ksize > sizeof(stack_kdata)) {
-- 
2.39.5

