Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5CBB55EDD
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 08:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F388010E087;
	Sat, 13 Sep 2025 06:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c4U4UZTR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5110E087
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 06:09:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-55f6f434c96so2879603e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 23:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757743798; x=1758348598; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eilgNmLM+UnUigD1ts/5zlgpCEeCLq2Z2wcl87G6xGI=;
 b=c4U4UZTRa7CD4Y+eq+furHp07hGR29a2LPp/DjEO7Suxf75efFAlcaP9JEduDJBJ5o
 k3FbcVBrghB/el3fwIn5xTIW0bAkyBI4BQCDV+ChqPF6I5O/MFvR+jy43PEEX67EZMZZ
 0aZh1KD+FVPuY+9kQ4kctCmTzXG0b2Rm7/PhfsDVIB2vPMCoe3wBn20bRJ/gzTwzLDzV
 bIZ8DuNHAgWld/9ageIc9GYahZCUPG3FUa0itGpIOIIqKeuC2qwo+6FeLw9ND8MWpqRX
 M+7Do7lqrlfu62WGbJ/g9vtV6wETfUEVN8cosQ2jrSk6aDObIifiSC9JYkUe8A8R+Noy
 gs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757743798; x=1758348598;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eilgNmLM+UnUigD1ts/5zlgpCEeCLq2Z2wcl87G6xGI=;
 b=MiKbs6WTYLNuURxFr1TQYD84zQU8wtRaFNhyYgDB+PpCTrrZMVpytAU51drHHGUrN3
 BMjgJiH6KmTzvY7G3UH1zCGQ3WU8/S4EBYkviHXVL+vq6kJF2KTKFx9y407+SFuIJGbe
 TlOYfm6+LPIcUMfq0duwKU4w6Gjyur88dNib++RRe572RxxJUGEgR/l/I4CBrIu0Aj1L
 hsAtxmdwq1gOZWkGUW4pmqyARlVWOMYa/43ca6zGII+R+wzB0Zxta2gV6BA/QWqXCJ3h
 NW2F+1UPVpBy3DmAqf3HmvdeQkFzi3RsqHz42hN3gM1cIJOl5pa5vXeuQN0DWN0Khaup
 oTYA==
X-Gm-Message-State: AOJu0YwXGb2NmpbqxEzfBV+phbO8XSrAmBdsiedx6z+hTGbOs9UioGTM
 QSelEfXQz7c5864s3tdW/a/Tgj3ryIvl5i0ITQnUNDOsoHVjjKOHg8EX
X-Gm-Gg: ASbGncvYXgjqvwRIcZFYf9Kk29LkE1FhzPV3kiJJ33nAhNGj/xG/jcuVSD0YfaFdOoN
 GtQMnNNgHNRgSwvmJgtfJ6BFr18zVCJgPaBS/+iVCzUxVzEUcCv641mYL5z3VY30zX4TH2MaE5g
 7XGLftobBRR5adasQAFF0vOzG0eEreGQv5xqnaSZ3pEdewlirEri/eFXHwFuWTMbZPXmVs1Zn+P
 ee9iqVk1JuNbZ+3awE2yuev3KZuKwAxtfp5Yfd7hEBgaD5TRumPauTNHL1cUNZ7nWgDWUBzIhTV
 mbqbqeu8WHkfMeguGxDZH+fJswYdlIGK0vwKFUO+fxsBu49bF1wHdfNDpCKecwfTHSEnmRwu8/g
 aDMxSH25bXik17Ag+Obpm3SkvNxpNiYbtN+7Bik95wS4Lj2W2W5pKrx8l2iybDx8dc0s=
X-Google-Smtp-Source: AGHT+IGmwZmsbVKZyzEV62EILsLHTLklQ4e5+PHt8mSyNhEWHnxkOXo8eDX3vJX/WmXUbz0ahwUfaw==
X-Received: by 2002:ac2:4e12:0:b0:55f:4839:d059 with SMTP id
 2adb3069b0e04-5704b52f28fmr1387061e87.13.1757743797629; 
 Fri, 12 Sep 2025 23:09:57 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e64fa7134sm1699740e87.122.2025.09.12.23.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 23:09:55 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sat, 13 Sep 2025 08:09:40 +0200
Subject: [PATCH] drm/sitronix/st7571-i2c: reset position before clearing
 display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKMKxWgC/x3MMQqAMAxA0atIZgtNNbR6FXEQjZqlSiMiFO9uc
 XzD/xmUk7BCX2VIfIvKEQuwrmDep7ixkaUYnHVkO0SjlyePJrHyZXyg0AQXqEWCkpyJV3n+3TC
 +7wdYQRDMXgAAAA==
X-Change-ID: 20250911-st7571-reset-785838285415
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=gTOEkj4ZvjJRwjmvXK70zhZ6+r0iqgJJfzfUuKz4ewI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBoxQqrq2QBZ5XmdEg1YGZgvM51PpAyHQA1cma49
 Pxth4Z6rlOJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaMUKqwAKCRCIgE5vWV1S
 MlHYD/4pbEnIrJLmXXp6nL/tqtzdNleFjnCyFXglVYfrviZpWfQcRHITojRjKvxWzP2IhDC4Y+P
 NrHgwauETMdNdnDxjGEpRUTqjujqCErHENLyl/hWAmpg1tx4P2HvVZcS5UpcSNqAH1ZnC/2fJOu
 R309eTTC7cs0LbDAuYtu/0Y3t+jtuncOIS1uE9KYjLt3EL0A99zbNuO6EnHYUM02Ded9Wr7ESHJ
 1JAkWNVPHJfKOnHM0elGpcw/WkIRwotKNEJ1xua1RLpmikMNoaewSAMdQlTnS/n72RYujG3u8Xu
 AkeDC3J1s4JMLwmQZPg03zAnCi8ZYLpzspaGuqgx36Vlf29SKkKrGDg6vLBMWryKOwcirl155nI
 WB8NxD/VsqpeZATgf+OsybyVCyo736tm+bDvmc3ZRX6mH0mhb/p8aVVKXfiSvmdoPPTXGvMJkSI
 BMQwPw2vKvV/UubmUGF0tdaSmMuxDXRpJplymv22U65E8kX+sW4cOt4frj0I7Fdm6I4Kh3cAnK2
 Gh10oc/rW9BWmIHV9vN/gODDIJUzmkfO8156H2qiN6pgr4cApu0HiaTVCeNruFsmJxBQZYF5LoB
 745SP3hFHr0c0ackuVP6pJm7dhJpTH7i1E5UUnwqztkPAUNVST7csZwSasC5Vk5M7P2I0G8de6g
 71uA8W1/HEA+rpQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

We cannot know where the write pointer is, always reset position to
(0,0) before clearing display.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index a6c4a6738dedf5881328414e9d8810d3af2a6fe4..32b91d65b768b26caa7dcef42a00d36f236fbc32 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -263,6 +263,7 @@ static int st7571_fb_clear_screen(struct st7571_device *st7571)
 	u32 npixels = st7571->ncols * round_up(st7571->nlines, ST7571_PAGE_HEIGHT) * st7571->bpp;
 	char pixelvalue = 0x00;
 
+	st7571_set_position(st7571, 0, 0);
 	for (int i = 0; i < npixels; i++)
 		regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, &pixelvalue, 1);
 

---
base-commit: 91494dee1091a14d91da6bcb39e12a907765c793
change-id: 20250911-st7571-reset-785838285415

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

