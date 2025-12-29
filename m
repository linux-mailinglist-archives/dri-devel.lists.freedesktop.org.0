Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8911CE6537
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 10:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45BE10E360;
	Mon, 29 Dec 2025 09:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TjNDQYGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0A910FCFC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 01:09:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso54250765e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766970558; x=1767575358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5dW38RDm9ae1+68aq0l8C8yBQB4OMEKFfYFCgP2bm/4=;
 b=TjNDQYGN1Fyy1edj6KD703HOciB6A2ISBP2N9cSlGTheAtt4RqVq8TkPYwvFizWFp4
 TllOcXFNUub2fpSCYeVO0NTS/SVnM0EQpnnCNmaehzojOZaggzgYFVTQoB5LHS0nXF3y
 Dodw9vtUvDIcBBCUdUMg7YIlm3SBnz6gQNb69vetXA3hF04TqPBaO9GKnX+uEjqdqOHA
 bvrMB7oUis2L7hwVYw5OWwnbKBLptWt8xbzLWWNnUUDY1aQesEIlr03KN2J3tOKU/RqQ
 wb/j7wf1b/1CezZhngkcRdrMsdOubXjT+0OUK4IYyJ/9adqU1oNjSmVbPZtTZaHFwyeI
 gULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766970558; x=1767575358;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5dW38RDm9ae1+68aq0l8C8yBQB4OMEKFfYFCgP2bm/4=;
 b=OdX9bKjxL/A/7KqW9dmCkpyGn8tGgWITHSUR4ntIN0w1tWArzj1ZGSBD1lKVfqMs0m
 0thNVfnGxh0p2e9x7wXlL+Mwt+3EaXXUSjqyX3m5OG+vUWvEsojKBjCrArXicA3AHkPt
 uprjaNk2w4cCBNYZQQPIT4W7X3c6Wv/kmVwDGGc1WaltqOf6Mv5d3PCTP7Dvih5rMwED
 VDBv+1dHaK2iQEAqLmwE36yQhxA+rQamneDn0husOJZwZIoGdiMoWyo7HNlVZoZ8e0Jk
 omkPhrfOhbrz4Cgygf+PsGKw3jqhMx2GGRf8nulSwBp55ILh2VEmOmCK6tBoLMT/Ni/H
 xvSw==
X-Gm-Message-State: AOJu0Yx6/S5lC7apLpvW1b5a9lGrd9zKj+z6fW2L4rn4liFQfA1BC3oQ
 SRQB7JN7F0juLKWBcedMHZYQ1VVbDILsUnIMkGxYvynsyQi+q1sOYP2t
X-Gm-Gg: AY/fxX43ihTE9156MwW9y7EjVbfEBnCCZ0ompM/FyKk7N9FjQmLwm7azv0csHmJXN2J
 4SfHJKbI85iv4OYuKpoU4VAZBp8VR5Nq4kJtd83TtVozQkmKtEiPivvxJ8wAX2wetT33ONqG4Eh
 WV0TcnbNNvhbNgFi7TXQlk+FhYaNlAZNe0BrDnmRKkLqc+YPlsRHxviZ4tp5dO3aEnETxjEgilD
 +yznGW8DUrIgSBzACnfF5yF7xYz/+HYTLeTow2PhwFid5irrDNNZK6BlRj8goXYCkvfB23XDoc9
 EhPwWQnz11oT4MWfjOqayQB25WCLFg5xjgNKOwE9UrFnNZeZQ3wcCvPbpSJj6nyYcmZmGVOL+xU
 LoNBWNmRuuzamcBDf16xiCUlAxjyBSyTF3Nv9Q8SWGE9kx9tSpPhCYMFc+cVQ6mE4u05841Sp4I
 bLaMo5QGh+pBi87uVYmCe64oG6zQCTO2bkXNRLjQ7GNdE=
X-Google-Smtp-Source: AGHT+IHV4ZJMK7bXEGIcq0XJLLZ0z9mzC37KodrTHfctPm6PYkmg1Ku66Axj7NdKa2uj5K/YYl8V6Q==
X-Received: by 2002:a05:600c:1991:b0:477:7a78:3016 with SMTP id
 5b1f17b1804b1-47d1953318bmr316061175e9.8.1766970558082; 
 Sun, 28 Dec 2025 17:09:18 -0800 (PST)
Received: from alex-ubuntu.. (88-127-35-143.subs.proxad.net. [88.127.35.143])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2723b2bsm566557265e9.3.2025.12.28.17.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 17:09:17 -0800 (PST)
From: Alexandru Costin <spxxky.dev@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexandru Costin <spxxky.dev@gmail.com>
Subject: [PATCH] Replace udelay() with usleep_range() in PLL initialization
 code. According to Documentation/timers/timers-howto.rst,
 usleep_range() is preferred for delays "10us - 20ms"
Date: Mon, 29 Dec 2025 02:08:14 +0100
Message-ID: <20251229010814.94255-1-spxxky.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Dec 2025 09:53:56 +0000
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

Resolves checkpatch warnings:
  WARNING: usleep_range is preferred over udelay

Signed-off-by: Alexandru Costin <spxxky.dev@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..130150b0f07f 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,8 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 120);
+
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +232,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 120);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.43.0

