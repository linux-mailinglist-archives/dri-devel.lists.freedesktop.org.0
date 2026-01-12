Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D95D13E9F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F10310E415;
	Mon, 12 Jan 2026 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iJE+GvVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F5F10E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:04:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47798089d30so5823825e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768226668; x=1768831468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ckmRos2OAgMm2H7B68f5iy8S3ZBKtjS9ZYbxKUXmKoY=;
 b=iJE+GvVXD0ik276aDXn3ixzUFqylVxipmM9QtFh8LGS9swJx4iLustwZVreZPFoxUv
 kawAnKhtQ5KqTKe2svpWmVQm+fU7hjvgP6yHrybGkNZxpUhQoD9OXwrW7vJ30VK907do
 OjchnAiaUKEOPckl9/t1q1W4zKYijiJhZXPHqxiB1/zRpDT8OcpwGs4VG/mCx5dwj913
 tHgJ2J4Mm0/vpYQPmfqvoxiOilRHfh44mRQt1A1TYUVsuv6jLgsTNE2BWyoiLFWjTxVI
 VQh30E30LoCt5jHGO6DTrEm+9l9LVBm/W/JOqjneXCA0VBIxev8sp0Jtgf3EQkZkzSvY
 0QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768226668; x=1768831468;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ckmRos2OAgMm2H7B68f5iy8S3ZBKtjS9ZYbxKUXmKoY=;
 b=oiDTqwHS8Uf5rnOR47OgumHXK2EOmt9lSL0JIBKXzlElbqSPOPGY0GY3rRXlSqNIac
 5xqnJ1ZE94nSN/Za2lHrmpFRYNLmiJO1b/9S8XEfVKFJZKcpU+5NI/AIwwO7/goiOni3
 Fyofc5J8rhPpbCgBHw4/Jpf9Ls8cWWflwjVmz8SLz47FG1CBupThqvXh3s1BMXJL8Zza
 rtrXSH6Wk8MJgW/ioN/nM48CXlr/XZSO9aqE3RwizUDr4BFVwT9yWqom2ikj3+3a4OFO
 AiUGDyxA2QHGWF8pNtpHcqutlnkbE3mCi5XgyFNPQXu5tU0WlK9KmPO3q0f2DpB/EIOr
 VVDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBC8OkWeQ/uA6v8PM+6nm2It4QYYl52xo9IZ6KEv7mVklr8KdnaFcu56G6mwOIPSwflbN+WPai7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx99/3u8l4qmj5IirBWUM8DHLa8QKG/5PkhYrtqYZKpD4D419mU
 ltkBDG44kAkSedc3Lbnv6ccrhZVKXOW6TZd9kkbyWSFtXkx7ehF4folc
X-Gm-Gg: AY/fxX6+jeRshPnXLVHr4AAgHrhD6Yu9cdWs4KE0RV418tawwTxTVK1efoZ1SY9Oyah
 8gNWF8HIb3A6efdbCXGlkikniaFdqGLByNS8HFWGOnqqTVceIZIkIXEA4jykLm+hyPIL55pbwTH
 8cMtV4BXOlgt4jBlyHmXNtkeQzxYiH8zUgZLHeVxcniJtCNEQD6PWc0A5nyUEF0bEra1iSj6HrP
 CyIZ+Cu4EiZQATEe0DyyLUrvg8RP4sa5ckXrrs9KStgRIw8x/6RCiNPBnjcP9xfaQNdB4WvWtBB
 wT93nMKD37SI/s71pc5O9OYHwig9uehOHE5L/hPVWZfu+MixEWplEOgRmt5TtDWXVSVUbnBzOTg
 TrU9OzbKlIIOSnZUYvkVxpMRb+kJwgnRTiOtkxjCwkxogOwWPctWzQunpbEjTpdvc2oDapwEP/o
 7e7Otl+qcZeybInh+uhaZT8tgabrCDAgzU0ZF5dA8GI5qjNAKMCtR9Civze6VdK/xVysvsD0js7
 o2CE30=
X-Google-Smtp-Source: AGHT+IH7GUSAAsNDPqrKUndihq0lAKqsPDKz3kaDifL2lP8tPCtWl0A1pugqhFaqlY9nRll5jZEn6w==
X-Received: by 2002:a05:6000:22c1:b0:430:f718:23a0 with SMTP id
 ffacd0b85a97d-432c39ded43mr12214129f8f.6.1768226667344; 
 Mon, 12 Jan 2026 06:04:27 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr
 (wifi-pro-83-215.paris.inria.fr. [128.93.83.215])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-432bd5dfa07sm38643537f8f.25.2026.01.12.06.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:04:26 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Helge Deller <deller@gmx.de>, Tony Prisk <linux@prisktech.co.nz>,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: vt8500lcdfb: fix missing dma_free_coherent()
Date: Mon, 12 Jan 2026 15:00:27 +0100
Message-ID: <20260112140031.63594-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Jan 2026 16:13:39 +0000
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

fbi->fb.screen_buffer is alloced with dma_free_coherent() but is not
freed if the error path is reached.

Fixes: e7b995371fe1 ("video: vt8500: Add devicetree support for vt8500-fb and wm8505-fb")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/video/fbdev/vt8500lcdfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index b08a6fdc53fd..85c7a99a7d64 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -369,7 +369,7 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 	if (fbi->palette_cpu == NULL) {
 		dev_err(&pdev->dev, "Failed to allocate palette buffer\n");
 		ret = -ENOMEM;
-		goto failed_free_io;
+		goto failed_free_mem_virt;
 	}
 
 	irq = platform_get_irq(pdev, 0);
@@ -432,6 +432,9 @@ static int vt8500lcd_probe(struct platform_device *pdev)
 failed_free_palette:
 	dma_free_coherent(&pdev->dev, fbi->palette_size,
 			  fbi->palette_cpu, fbi->palette_phys);
+failed_free_mem_virt:
+	dma_free_coherent(&pdev->dev, fbi->fb.fix.smem_len,
+			  fbi->fb.screen_buffer, fbi->fb.fix.smem_start);
 failed_free_io:
 	iounmap(fbi->regbase);
 failed_free_res:
-- 
2.43.0

