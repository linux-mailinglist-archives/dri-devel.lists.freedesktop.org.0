Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB557AB08AA
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 05:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223BE10E265;
	Fri,  9 May 2025 03:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fbAaav7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291A310E262;
 Fri,  9 May 2025 03:16:45 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-604ad6c4d3dso634651eaf.0; 
 Thu, 08 May 2025 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746760604; x=1747365404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJ+SSE57+NVD+voAZIpxys9eSbuHtPfvcAY3huVe52E=;
 b=fbAaav7kKlAKOjhrjsQMrwrU+xfEoXw+/kSygjZvgSfj7z5m2i1q6XBb6L3aRteMw4
 Bp/zpxeVjungnqdniezdazNRhTuqycNn24e2kQmLi76NtM9xHS96xzovjgXuFpG0IpBc
 Ez49OXne4VEIO2ZLiZpaZcD5jBIUbog4LUWAOncm7W1y4cB29+n8X7YYGMGGCU3QZDoq
 Z5RarlgqXWIj+OgXVEfysbPqMGlkARETjGQWPmZ0nz7ruf/7EYDlTpOtC6z2aejN49Ab
 JW4iRqT74lk7xG7SsMaQPZMy7xtatKPYriH9V1Zr8CJlcBvTjixmmn1N2kYdQdVS92qO
 gMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746760604; x=1747365404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJ+SSE57+NVD+voAZIpxys9eSbuHtPfvcAY3huVe52E=;
 b=e772wlnrE+gU8x9jg1smIm67ilH8Wheo05fECmvjuMTS85yJDd2zykMal3AyyCAHK4
 eUyLa7yMYq5sVLXhHmZBjAz/V39WF14JkMcYGekwyj8oSahBgMnP7AIi+Ezr62K0mqK4
 4WOrQwdNlFLy9AO64qPwTUgcQYwWXE/7GIRKMTApxEjx4UNH4qdNkSvTWxW1gSYp9Jv9
 zDGMZEtbDY3BXHjIiYB67RcL565S3cE5mrwznjnaVprMeKU2yAn08ai3lnQJJFFjo+1w
 B0GBlzVWifdwNp0BrFZ6LRHQICaf35Q8yp1GBW/9YRaavjdA31Bdbzh8msiw8n/FPdgW
 46yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpMKtiVK17sk7vlO1KFHoAlpbOTFplr/NF8V/Vp+lNTtCHemVK/cv+v80qeTm/J/NIl/QAPkSnloM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn0LsY55/Xd6808QQ7jmfxUcL104w973SnNdWAMR3oGJaUzryG
 lcnzhgFZh10iz5z2DCmYrTa2sDegyeDrClPfZtC4cqPUSajbrlpf
X-Gm-Gg: ASbGncsDyLko9o9UibOQUEKVczREoubmmhL7FZSc6wF4wI8wvNRt2B9fAg6x5ZkXPwF
 3xYXcQzUzZjTri3ACgPYOasNJkB+i9YKZRT8CocpwOcaOe+g5NWvdre0ty9AXztp9ZILXB7grwx
 hj/bghFc/L7467FNw4UYooFH2iCXUBfv9G6QrL7J+Qa3goh5igKRYoQAsGAHn89wP5YDn3Ivw7e
 c2AcUXUe8SNqHCbK9IyDgLKufaxiwRbCMo0y76anv/CoXWGCIJ/G07bdtvU7ACW723e1Ohj62oN
 1ddNmJmVGtZzuoP6BiTPZej2pxZRhPRdHh5ucrxM5LXg2KJV/2b67oXa7uADJDRWCbI0lOUtDgR
 ktb5idsFw1D7u
X-Google-Smtp-Source: AGHT+IGpMx7dY3dkHvqr4awICZ7vr0q2bv50WztDT96Nqcfn11nY3aHVKib+jqiYd+/U5X2LVifHrA==
X-Received: by 2002:a4a:ec44:0:b0:606:293f:f37e with SMTP id
 006d021491bc7-6084c0ff314mr1382389eaf.6.1746760604235; 
 Thu, 08 May 2025 20:16:44 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net.
 [73.76.29.249]) by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-60842b096desm303745eaf.30.2025.05.08.20.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 20:16:43 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 andrewjballance@gmail.com, fujita.tomonori@gmail.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: [PATCH 06/11] io: move PIO_OFFSET to linux/io.h
Date: Thu,  8 May 2025 22:15:19 -0500
Message-ID: <20250509031524.2604087-7-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509031524.2604087-1-andrewjballance@gmail.com>
References: <20250509031524.2604087-1-andrewjballance@gmail.com>
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

From: Fiona Behrens <me@kloenk.dev>

Move the non arch specific PIO size to linux/io.h.

This allows rust to access `PIO_OFFSET`, `PIO_MASK` and
`PIO_RESERVED`. This is required to implement `IO_COND` in rust.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 include/linux/io.h | 13 +++++++++++++
 lib/iomap.c        | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/io.h b/include/linux/io.h
index 6a6bc4d46d0a..df032061544a 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -12,6 +12,19 @@
 #include <asm/io.h>
 #include <asm/page.h>
 
+#ifndef HAVE_ARCH_PIO_SIZE
+/*
+ * We encode the physical PIO addresses (0-0xffff) into the
+ * pointer by offsetting them with a constant (0x10000) and
+ * assuming that all the low addresses are always PIO. That means
+ * we can do some sanity checks on the low bits, and don't
+ * need to just take things for granted.
+ */
+#define PIO_OFFSET	0x10000UL
+#define PIO_MASK	0x0ffffUL
+#define PIO_RESERVED	0x40000UL
+#endif
+
 struct device;
 
 #ifndef __iowrite32_copy
diff --git a/lib/iomap.c b/lib/iomap.c
index a65717cd86f7..e13cfe77c32f 100644
--- a/lib/iomap.c
+++ b/lib/iomap.c
@@ -24,19 +24,6 @@
  * implementation and should do their own copy.
  */
 
-#ifndef HAVE_ARCH_PIO_SIZE
-/*
- * We encode the physical PIO addresses (0-0xffff) into the
- * pointer by offsetting them with a constant (0x10000) and
- * assuming that all the low addresses are always PIO. That means
- * we can do some sanity checks on the low bits, and don't
- * need to just take things for granted.
- */
-#define PIO_OFFSET	0x10000UL
-#define PIO_MASK	0x0ffffUL
-#define PIO_RESERVED	0x40000UL
-#endif
-
 static void bad_io_access(unsigned long port, const char *access)
 {
 	static int count = 10;
-- 
2.49.0

