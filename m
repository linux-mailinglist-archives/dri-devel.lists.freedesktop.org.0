Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D602A770EA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 00:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B75210E06F;
	Mon, 31 Mar 2025 22:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ma++RV//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DC610E054
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 14:17:03 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso81912475ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743430623; x=1744035423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pO1QeCUyXKGemqh/0PucODb/KuSbMsL5qkNhu7BZk4k=;
 b=ma++RV//3ZiZERIO7b56Lr5Qsil8us5ss0hK5YIQXrNVhm4Sh4RFY8B/MaXWKKZsU9
 dCJMTNxRDkhvTuQDz213DZU5oJMgXfQMFcq53dvJz3r4QHGFQIMA9I4chJnFb+IjgwAb
 T0J8v9dJA7oQmpBa0lDS+huiO62uFwyOBda9x4Pb3uZ24ay86SElMjIm2WRWpHYuDC7G
 GGykTNPRmljiYmBvkJiYX1jR2iIAwuWY7BAiZcqRzwQl8keuFZ11FzB5vtMsVfbaSSYq
 ZMYv61o6e04khOsLps839XXv1qxwPq7e+VJMGQDqk7ubi3V9UYJLb5MHugY1qSi5t/w5
 vfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743430623; x=1744035423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pO1QeCUyXKGemqh/0PucODb/KuSbMsL5qkNhu7BZk4k=;
 b=rbY+Mnt0/i5kckAPCcQtTkflHkmv6ZR/+MhJYmlREPtS8XL4SEDf8luZ/iJeErmRen
 zFhYAbmd07d7XNBVSEGIvQDj3btrxyBVxMe/LBDQ9hd+ajI440lc0vB5x11H0COUeSAF
 31bjNNPu1MhClAtS287HWvNqy/juJSzSS7Ceo3oRwIl6aIvqqth65xfxl5ynmyVPybti
 A+Dyy9Ob8M0pvMeLqA1L2HmTiQDGTOoWTqQNqT5gAwnp1W+Ta2H9VFERfnVwTasyvKgf
 rM65SwUpiSJ7321jzCd1c3CYfGZZ37gTT8MGCPYyHJIo9+W3lMPXXA0NfUMJx4xY7rUv
 LeuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX+agCRmDHhLb/hf6PVQaktYsQFEZsImoFUFeiNB49MDAJ3i13Z6FE8ntFG1hG/9eUbDl4gcsGQnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmKikdAf+olNTJRJ5niwpUkis9Wj7eAVnzsiU1b/nz/60Sz4sd
 Wcmk1/3InW2IcDlfb9yB/hqAad/6p/2vmDQFg6eEyDR+JyFrKYO/
X-Gm-Gg: ASbGncvjVwI1xsERdoEagFqE7lQI2/A+u6j37RWg55W+5UMvYPCHI8yLAvSiEwbE/d+
 kcD8vIeuVRp36d8y0e8ufi69qOzVMhgOICGWdMua4Mh1IAdXryQebJ2vcif1/uq8rbzABnJooUf
 eTnXtNL59aHPuVN5jip77dYjn7QrpcQbaCM0j452vXSulJX829Wu5cHr1zbk23KZg2/5WQfO62V
 6xB5AKICAaiyy6uS4thgdGv74tcNwpYcNBXGJJlZa+47KT66F+cfYIUVlBK1f2CgmGYs5/x1oyh
 eW1M/EyGUkjHOuGbwQzJNlBu8WE5tKRANZCzlMaOkU7qgyFiL74m5U7AX7HdvsaIYiiVKUE=
X-Google-Smtp-Source: AGHT+IHiS3NQ9inGx04Z/RImRKqM2ZGoOKLOipMryfa1UnPAFRetOHxg2LrRkj+KBOMUbzqf7YBA6g==
X-Received: by 2002:a17:902:ef07:b0:215:44fe:163d with SMTP id
 d9443c01a7336-2292eefd198mr163250605ad.17.1743430623282; 
 Mon, 31 Mar 2025 07:17:03 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eee5011sm69916735ad.103.2025.03.31.07.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 07:17:02 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] backlight: pm8941: Add NULL check in wled_configure()
Date: Mon, 31 Mar 2025 22:16:54 +0800
Message-Id: <20250331141654.12624-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Mar 2025 22:34:12 +0000
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

devm_kasprintf() return NULL if memory allocation fails. Currently,
wled_configure() does not check for this case, leading to a possible NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
characters.

 drivers/video/backlight/qcom-wled.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..a63bb42c8f8b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
-
+		if (!wled->name)
+			return -ENOMEM;
+	}
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1

