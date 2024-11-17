Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E49D04BB
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 18:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E5B10E062;
	Sun, 17 Nov 2024 17:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="rkx6UVRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818EB10E062
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 17:03:31 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-6ea863ecfe9so62553757b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731863010; x=1732467810;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ip5/1nZqGxhHDaB5wRv08h0uSCzJ6//9B4YB74TxInY=;
 b=rkx6UVREY7pQC5Am/62nHY/Y4KJDLl5a6ULdwFM094p0oPCGeiyRU8f29WwXfiPRZc
 SyY/Q6BAJOepm1JZJb7faP6BoilkhFwwIaRBX7J7XX0eCD5nZEY7H23CgO4LJ5xX0PsE
 o4nqVGCKHdsX0oy4Thjdwy7R/f424E89wga4IyjLfCMggHS5Zr9jzAydxspsizyFXhe9
 LDPsHmU3VMhAqHuc+gZLmwzlKCQ4dtTMB9yxgjdjyYwZQo5i3euM5isQsdxZTjj0sBAH
 U0j/7/ApP/24bPQCmI6hNKs/NG/skxV/ULSxTqZS6WlZragwV7u0mB8R9mJtM0ibXGV1
 p4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731863010; x=1732467810;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ip5/1nZqGxhHDaB5wRv08h0uSCzJ6//9B4YB74TxInY=;
 b=q6w5BiEdxPQQSbKCgeKdDDj/lOUf/anl6WKKWb9legtBewDBvfn3tRhImKTqhezgjE
 j1jhPbImqCublloI+zh7XxqS93UcixTgVSVCAiRDdY5SMTtEJHve+QJyolkdLzBIYz6n
 jzw/L5gGZdy+wx5y6j+HAcjbGXH89qUUm7VrOwmdByL2xj5CKGUQCv3iAj6RemiSZnoR
 QwNc170OCRdK2owcMdZNJAOHTNWb6uqP01SudHeTSU/U4VTRKXNMtsAuF424Vcg38Fa7
 0MI1tgMpX4X7FDfoml/bh/BtalKi2WSpWJNaGJDv/bwQHI7QgP/dqep8OYfezvnZBY/H
 aHKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+1/afTeMZNjW9xR5si82W4DJ3c6si849mQ7rM0sO3GDS7i05vmNrnS+ZhwPRbZfLCUEbHy5BJzZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJSEMwoSYH8gCExmqhvV1IQ9ctRyqThnvovGEHuzK8atjO/9fH
 ps/uuvH7BpbPtrcBArlEIEbVE/xaHQbkfPeMWj1HekpkweGrce5nQFJx4X606KHFHBWJ0y8p4c/
 7FuV0Qfoe0Wk4Jg==
X-Google-Smtp-Source: AGHT+IG0Mg9dEvwB5HqwR/qPZEBllHTbHdRpgDouyxkiR2h6fNWlGlmde25AJXfVR0dvbM7cSC6zwR6YjRdqgDw=
X-Received: from tj.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:527])
 (user=tjmercier job=sendgmr) by 2002:a81:ad0a:0:b0:6e3:d670:f603 with SMTP id
 00721157ae682-6ee55c2f44fmr1527227b3.3.1731863010097; Sun, 17 Nov 2024
 09:03:30 -0800 (PST)
Date: Sun, 17 Nov 2024 17:03:25 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241117170326.1971113-1-tjmercier@google.com>
Subject: [PATCH] dma-buf: Fix __dma_buf_debugfs_list_del argument for
 !CONFIG_DEBUG_FS
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Sumit Semwal <sumit.semwal@linaro.org>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

The arguments for __dma_buf_debugfs_list_del do not match for both the
CONFIG_DEBUG_FS case and the !CONFIG_DEBUG_FS case. The !CONFIG_DEBUG_FS
case should take a struct dma_buf *, but it's currently struct file *.
This can lead to the build error:

error: passing argument 1 of =E2=80=98__dma_buf_debugfs_list_del=E2=80=99 f=
rom
incompatible pointer type [-Werror=3Dincompatible-pointer-types]

dma-buf.c:63:53: note: expected =E2=80=98struct file *=E2=80=99 but argumen=
t is of
type =E2=80=98struct dma_buf *=E2=80=99
   63 | static void __dma_buf_debugfs_list_del(struct file *file)

Fixes: bfc7bc539392 ("dma-buf: Do not build debugfs related code when !CONF=
IG_DEBUG_FS")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8892bc701a66..afb8c1c50107 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -60,7 +60,7 @@ static void __dma_buf_debugfs_list_add(struct dma_buf *dm=
abuf)
 {
 }
=20
-static void __dma_buf_debugfs_list_del(struct file *file)
+static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
 {
 }
 #endif
--=20
2.47.0.338.g60cca15819-goog

