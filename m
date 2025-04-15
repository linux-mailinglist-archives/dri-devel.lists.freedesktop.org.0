Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BFAA89394
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 07:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5CB10E356;
	Tue, 15 Apr 2025 05:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iRb9IyPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF1010E33F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 05:59:31 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54963160818so6312785e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 22:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744696769; x=1745301569; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
 b=iRb9IyPXzgLErR4/xIYilcWZliA0Uff/+KyRTu8HoCxnP84H4NtFfoH/n0MRbFSfAT
 MfH2KXNRemZtGEX0GlYza4M3RXMGYi2yQnh8KL76zCC3v9dw+BB5ESjeehwvEhlBrksM
 pR20D50pK05Ygi3Er3I/hr27jknAM//G3vSEjok6FFJ827gmaEszJEw3CXf84k+yXEYw
 Qcp2edxzRjXvL1X1lo1mJu7VYiadt3QxLv9G3OPdEnLviJcoEJvoMe8YNTyDxtBMyta5
 +y1btLj8DUlreGZa3uEQz4KylBIzendsKeGzBZkGAk5br8TSQWxPqw5ycDa44HNfviyA
 ja5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744696769; x=1745301569;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i11n14/4d12JDY2DmtQ7aKWTPCB2K2tXSiZI90yPfyM=;
 b=VtKItYSzhWa26FQr8fQDcgO0Or6GIweQHh247FkzoV7U+h5qSXWU/5MzPXaTndWGkj
 zxGP9Z4jmgcDlR8ny2wH/EtNmYjRes2UO5z522KoEAZyMNdT7L+OVBLiSOUFTq/dfX+A
 A8kc1BFtTyyK03m7aYxESfiqQEpAlu+LU3WurWWC4MxPLpn8mHihLXpB2z+MjvJPqrhl
 Hy+vIgIH3Y7fJ5Z3jn7QwOVoUHjGnF2l2UhiPj4D4Tyu67R9yfGMHPzwQzjh4NHbT6/0
 hN28iXy4TE1xEQ14QV2cFMEL92RmtESaYxbntu+vBWhqSdJLP6UuJI86/EOoWmFzWZAt
 oS/Q==
X-Gm-Message-State: AOJu0Yw2sLfJIP4eVpBc7/D9VUf2cDP41yPRTgXzs/LkQLVMiI+97ePM
 zKGokiExEJ31RQV4SiB1YmuF98h52fqlDedWH+fPsh31fWl+OOJB
X-Gm-Gg: ASbGncvdrtMm9E8cUF0QiLD0dDqyYCMXvbtOhhtDee971mqb4CQUlagi7RhT+ZNbgTG
 DX8/VL/cIV1yh1x0O/L8yktvr8gThtoqQyrCvQHp9mv6QR8fAeX8weMesazEGt7NAeiMXE31yJv
 FvohX6flACZru9JgE2SxYCZvpN+OD0AF3Sq3fGZr8a64flA8gDQVOz2FXN5/7+PHxir5Lh30tFV
 b8fublrFnI/I/fY3Gx7rOOwG0AFqollTpW5DK6VTzeoNdpSgnUQZwbZMvhIEGBPxzqDroqu48Oz
 2OpA8xTbt+f0Qg9nbGsS0S05LE6apT6Mb8pgoOxdw2TZNlybK1FOlHADF9P6pSq16HUga8Yp73T
 UTA3ys8Px
X-Google-Smtp-Source: AGHT+IGGzEQ0x3pZhLyULvXchSuuoFv6C+TX/Gfsfz6VnJM59lAdCP1QkZD/hF7omLQChyBq+YZF/Q==
X-Received: by 2002:a05:6512:31d4:b0:549:9044:94b1 with SMTP id
 2adb3069b0e04-54d4529d599mr4513847e87.27.1744696769363; 
 Mon, 14 Apr 2025 22:59:29 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d238820sm1325471e87.80.2025.04.14.22.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 22:59:27 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 15 Apr 2025 07:59:00 +0200
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-st7571-v4-3-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
In-Reply-To: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=954;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YCGDQojD8nya6OBnR7iagaQHAlVaXzUTMmVsiIk5blE=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn/fWyrMfUB92/ROVnDkWUc+Ca2lw8TH4nKiocQ
 rcfgkm+rE2JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/31sgAKCRCIgE5vWV1S
 MskLD/9Rk5p9Za1MNvrLcfpl/OYBNzjbdp8PdyTAWaUyo7BsYlbOEiZT32ea/LGn33rzskoiZcg
 /52tYVDIPkL5DfuHnWUsQtOc7AXfS4JiTP8sXUWEIu9Vq2zB2y+vPQRoxWEQWE1v4kM9yj4CLHK
 dSoA1YEsiPm6t/VgHk4jzv+anAY3odpFM6Kan7NcgckwWkvm+z2OjdLW+7SzJI6wpHphy1NDS0J
 /f/NXyqehGSWM7+Zv9VTZ4nYsP1JDSWjV3fbugFXVapbNXCAfZKvIhDT7Z+AoDyOg31SJW9mhk+
 TsTxgZcJcvoPnTGconb7khHmlDIY779nB5uPI+1A2rG/ppGPHjfWEKvDcJ+vMPDGZSDTzaTxIa3
 eEVyJjhayRL+gySkGduS+NGuCOTYd1LeExF/8ZsDBhLpmOv08Xc0kJlTdvKehqpey5KD5ldLw7K
 rW20Eaoo2GhIfgCB/u3MAtgpix2T455mEgp9gafdhBJWsVVMb5k9CO0om6s2gwEvKBWw+tymfKU
 ZA/KHukpf3tbVE3AsUyq9HkXSkBro2rXyeVHPe+5BnM/Cmvo7M5p7Z/bPrnu+LFUOS7+WvHqgG0
 1jS7Br6tN6pKTxo5qHq0d/uCL7g8TczQcHUQp9NRX6SOw7pGcKR3uhewoWV/slJ41KluqF7iKv4
 /PKK0f8O20Cpkrw==
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

Add MAINTAINERS entry for the Sitronix ST7571 dot matrix LCD
controller.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 889bd4a59551c9bc125f94944a6e1c7e3ef2de83..eeae24fda846b9f63400ebb08c3fa7f02f3f4b19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7572,6 +7572,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
 F:	drivers/gpu/drm/tiny/st7586.c
 
+DRM DRIVER FOR SITRONIX ST7571 PANELS
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
+F:	drivers/gpu/drm/tiny/st7571-i2c.c
+
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained

-- 
2.49.0

