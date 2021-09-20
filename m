Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91186411CF4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 19:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE216E598;
	Mon, 20 Sep 2021 17:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495A36E158
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 15:30:29 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id u21so15901216qtw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rQ99H87nx71zTeZnm1PBaqgtUrgnKGZgxB0njW1Zu98=;
 b=qIlxa1d1fM85RtMxf1hyFljZ/Ht4E0RjTSVdscTBBXzFq5D8OQugMpk++T8QIx71Ix
 n9VrYAhnxJbnmo2/RaTW4XUeya7hORyQHYF7e/rmwy/+gDpz7zgHr7mLSn75ysmZVKgR
 tTjUuax7VyLsO3nkE46T5cjyUa/OySGIeyS6zqh+n/2T+cJmQ9l9G9dMiM07HE/h70L4
 oOy4mfosauZUth0NpnZCHFo6whv3JkbEdgOW9zWC3IoQ5DX6p2stN0oIM6T6RvudOTUW
 hudWaJU3gnJFEceDkTBEKK5blm/aayJlwwQ2GBwdhPZX+fANYWS20DSvTFLtHRB16COP
 CoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rQ99H87nx71zTeZnm1PBaqgtUrgnKGZgxB0njW1Zu98=;
 b=aafQGwvn4ztBGX+SHzK/aw72gBkTnvO0MmC3wuzW3RCehi8VLE6KM8oBW6s3Bk6wj8
 uuTnzqK0X+YQY4UaPuH3OZHcvNhS/fBgRPdKFpzx3E25ZPC6yQ8C/feX2mXVQV7NCKpv
 hopJAc6mEKg1Dx9XWc2JfFYU5oiZXhUZ+jDLWZe8lyzZa7Ddz28/lshK/oo06vTepRU/
 fwUUAfEAIC15AOqMGPqJmnubKiLqEvF3f4iXieQVlN2hOCkEkhdNfFiJ2iENlW2iyH1m
 ivE2E+X8ZJzJXigJeEYk9fZENKJJTV4VMxULhF7zaF4EqJR84+bKyoXZsnpsLQNh6p5P
 Vk0g==
X-Gm-Message-State: AOAM531iwUMMeOBxrnZDKa6tnsunCAA7BXnxIEbxaHTxZBVOhOW8cEgz
 S4MPbhCpsPJPgTpPKcZ5RAU=
X-Google-Smtp-Source: ABdhPJyqhK1V1TSoxa5piMCubgiZqrVbP9IuW+Qr/Hw1ALcUG/YAFw6MNFTYOHdrFlq6ng/x7saQ0Q==
X-Received: by 2002:ac8:5c4c:: with SMTP id j12mr24140831qtj.127.1632151828458; 
 Mon, 20 Sep 2021 08:30:28 -0700 (PDT)
Received: from Zachary-Arch ([128.211.185.212])
 by smtp.gmail.com with ESMTPSA id y12sm8962055qtj.3.2021.09.20.08.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 08:30:27 -0700 (PDT)
From: Zachary Mayhew <zacklukem.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Zachary Mayhew <zacklukem.kernel@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@lists.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
Date: Mon, 20 Sep 2021 08:26:03 -0700
Message-Id: <20210920152601.170453-1-zacklukem.kernel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 20 Sep 2021 17:13:41 +0000
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

Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()

This patch adds documentation for fbtft_write_spi() to make its
calling context clear and explain what it does.

Signed-off-by: Zachary Mayhew <zacklukem.kernel@gmail.com>
---
 drivers/staging/fbtft/fbtft-io.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
index de1904a443c2..985d7cf8c774 100644
--- a/drivers/staging/fbtft/fbtft-io.c
+++ b/drivers/staging/fbtft/fbtft-io.c
@@ -5,6 +5,19 @@
 #include <linux/spi/spi.h>
 #include "fbtft.h"
 
+/**
+ * fbtft_write_spi() - write data to current spi
+ * @par: Driver data including driver &struct spi_device
+ * @buf: Buffer to write to spi
+ * @len: Length of the buffer
+ * Context: can sleep
+ *
+ * Builds an &struct spi_transfer and &struct spi_message object based on the
+ * given @buf and @len.  These are then used in a call to spi_sync() which will
+ * write to the spi.
+ *
+ * Return: zero on success or else a negative error code
+ */
 int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
 {
 	struct spi_transfer t = {
-- 
2.33.0

