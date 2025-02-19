Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D636A3CDC7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3883810E37C;
	Wed, 19 Feb 2025 23:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EBzFM0dq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F06510E29F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:30:39 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-221057b6ac4so71306235ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739968239; x=1740573039; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYxtuN+FHDHDJ1UtgUUZtfJNaXcnoTaEgSZ1XZNBNzw=;
 b=EBzFM0dqmYOgKjA7LUuiNUwCJtKnXFUxQ0pNuufiAkNq79khtyBw/dnLiRspOuuc9V
 qP4ySdiEF2KtOqmWe9UBEUenydml1P/qALiuTS+EKqmC+pIVAGAjMoye5kJazJShB7Ti
 8/Bb2HS7MT2HXIClHBFFN7uEnyFKeTXArZlvMrSpOv+5RibAB6QRs8her03+/X2zC5+d
 s2FNY1NBd0KCX/kwAUJwcSNzyg9nXGzfJq5LchwowdKtoZerK6DyNJB9gKYuKQCxmdnt
 hzgdFqbWZkPOTCNBWCsDMc4Gpw7cifM0XETwq9Hg0MBOknybdqoFQvSRABrWiR1EjA5R
 ISoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739968239; x=1740573039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYxtuN+FHDHDJ1UtgUUZtfJNaXcnoTaEgSZ1XZNBNzw=;
 b=rCV6eag4uJzYGh09Iggg7yTRzguquZTlImKqfKc1pLO4Rwlatp6BVVdr0pkLginvAo
 VHeKSXYDyD7f9P1gNKdwlDMNTfloIJONLyJbvHRgxLOHLi0ujQcW6lcHsrln/5bDWuXB
 iSj3fTpyEFeNi1DB1uF4TqFeNgQEJaNm2CwLpohjfR5ta8SGsxv98gCDcNjypwUN1cbu
 hyxys2cZftobar93LN2NRvJdc1L5GfS0D3kPFcCAakwspzdc/G7Ggrozts5bHOb9f4Ut
 eZBituvpvEiMGmyLzyP2JCgwiyE2BCYBPKUs40qVnz5Cr70NflBU4PCaWlJBrZnSY92k
 isHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOJ7Z+m9wpsDB2goxQl1I+EMW7g073xh9rR5Nx/eiLyfHDr18IHViLZoj/2r95eZ3N0SWbbeh8zHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfmpyE9t/vaV4PFdSp3+piB1uZ9L9I3XlSRJjsjJwsJP3YseL9
 IJf0rGp9sexbnvKpyceYOunXT23f4/yGUxSEkmggPLYHJTtjAWeb
X-Gm-Gg: ASbGncuxwG1gKhKON+WUEkZPnePzpkh7JUrT2TO74JZJsJhI7SkoLiR9Ba2W64ZFFRx
 yBNj8UtBOl5pkerhwiC1eSrBh7Y5/5fqcq6mZKahqQ3B0hifVdm2fRaz8lHULMQj3NXmsI1O9FS
 8LuA64Ihwnitrs5My0/K4ArFkLm51k+oWfX/UtUH+51KGfHcXsYQtpefxaz+F3M5Uvg2Fny4tqc
 3jaV7pXK4RzjzbIkmkpvtyveRKGly2XAcS9O3KiHtX1ys1i8boAnHdXj9dyg8dVVBzokxN4l0bu
 3ZzBnKByHM+7tAjVAWo=
X-Google-Smtp-Source: AGHT+IFHs043Az3sOgkW8oNKMParbw6enY+JvxfeqIdEzf8wa0Ef/I2EUsS+62XtazqXNwwof3B8Rw==
X-Received: by 2002:a05:6a00:180f:b0:730:98ac:ad79 with SMTP id
 d2e1a72fcca58-732617d97b8mr27800074b3a.12.1739968238240; 
 Wed, 19 Feb 2025 04:30:38 -0800 (PST)
Received: from ubuntuxuelab.. ([58.246.183.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7327e17440esm5575536b3a.76.2025.02.19.04.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:30:37 -0800 (PST)
From: Haoyu Li <lihaoyu499@gmail.com>
To: danielt@kernel.org
Cc: chenyuan0y@gmail.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
 jani.nikula@linux.intel.com, jingoohan1@gmail.com, lee@kernel.org,
 lihaoyu499@gmail.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, stable@vger.kernel.org,
 zichenxie0106@gmail.com
Subject: [PATCH] drivers: video: backlight: Fix NULL Pointer Dereference in
 backlight_device_register()
Date: Wed, 19 Feb 2025 20:29:50 +0800
Message-Id: <20250219122950.7416-1-lihaoyu499@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z65fFRKgqk-33HXI@aspen.lan>
References: <Z65fFRKgqk-33HXI@aspen.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 23:48:37 +0000
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

As per Jani and Daniel's feedback, I have updated the patch so that
the `wled->name` null check now occurs in the `wled_configure`
function, right after the `devm_kasprintf` callsite. This should
resolve the issue.
The updated patch is as follows:

In the function "wled_probe", the "wled->name" is dynamically allocated
(wled_probe -> wled_configure -> devm_kasprintf), and it is possible
for it to be NULL.

To avoid dereferencing a NULL pointer (wled_probe ->
devm_backlight_device_register -> backlight_device_register),
we add a null-check after the allocation rather than in
backlight_device_register.

Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Haoyu Li <lihaoyu499@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/video/backlight/qcom-wled.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..3dacfef821ca 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1409,6 +1409,11 @@ static int wled_configure(struct wled *wled)
 	if (rc)
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
 
+	if (!wled->name) {
+		dev_err(wled->dev, "Fail to initialize wled name\n");
+		return -EINVAL;
+	}
+
 	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
-- 
2.34.1

