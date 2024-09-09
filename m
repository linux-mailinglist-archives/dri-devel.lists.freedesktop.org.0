Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5DA970ED0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C992610E2E5;
	Mon,  9 Sep 2024 07:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iW8xlgzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A91F10E2E5;
 Mon,  9 Sep 2024 07:08:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42bb6d3e260so35398515e9.1; 
 Mon, 09 Sep 2024 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865708; x=1726470508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
 b=iW8xlgzyr7od5mYtvslyJu6HBmtWzhVP4jkxPpQqwuW+HglfE7g2FQBKYFvWjhH5lJ
 vMbaCyjMq+42peWGywjBMn6J8NlYnrEivrH1c7d+XSMimkXDBDAFOFJZe8KSHZxb5Uq8
 3d1PjI3/Yp98E4nURlfx1rxbOXWqZi9vsUgxh28N4ogQvVwzbF/Cku/HNtsDGgkE2Xg8
 hQ/sBL0ZJoCMFCXMRsyX2BOcBl4O5fli0yDGfA9dxGcBI2liCrfdFC+X4SmSqNm9vgC/
 0SnL9lOpkGvfeNmmZYXqXE4K5v4hM5O9GxsCIRyGI7Z0+hvdQ5OZCJ4JVl+LSY+lG+Bd
 XTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865708; x=1726470508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
 b=eLWrkbdP/t/4Z06QirCz+XVQsdMMwS9E9u216lIPCnsAXukWGxE5aRzCJXPILaHtij
 f5RdtvBuJz1ZwWWd2IKZmCfYdl1MLDsj6zOagWOc7uGGDuatGXqLzER+mBdiRlibE7Vm
 XTfU/9P6IAyYRUKQK3TzvtOjhu/20pBNNM+s3D1Ii7dPrrZYt9BGuQMZ7xSbkG9RB1lU
 AScP+q6tfrUU2l49nKaYC9QZFIzV4w8JPl1VavPU/3qnnxgJOJ9IUCh7Mx4lBmE74ngS
 S1mKLoGykjeh/cfL6ygmJHe+cMhDLk5AzzdwJrkOvkWVYPbaFdiB9HorWePiJMTaJs/i
 4chg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrIREq5B9o0l2otrdzScTfiJucnkTzup0Xgn1rvdlol/fvOTub0CQerEOqTI69yrwfSyapc0LomODX@lists.freedesktop.org,
 AJvYcCXaGG8i7JzqjGE9fVwQGtHpDuBIwDOWM/WDgiT5musWXYSgPEzxhG/4JrSGR8IR2OVfvtZVgtzKDis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcr8ktTCItnebWPjCZHB92EknkIm2b5oLs36vkUTe9AgMy6Hao
 GoE9Q5vWFDUPjqH7wKeouUp1sIT69TxbqCHKftsIsgXoOmrzXBvEgQ3FWFw9VnQ=
X-Google-Smtp-Source: AGHT+IEUtqMurgdDVKYp6Wy50/2d2bJzb900f0HbaSF3BqAdcqhbaOgpHL4RtjOgNMEwMLQjmxS32g==
X-Received: by 2002:a05:600c:b58:b0:42c:a574:6360 with SMTP id
 5b1f17b1804b1-42ca574652fmr62131005e9.29.1725865707608; 
 Mon, 09 Sep 2024 00:08:27 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:25 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH v2 07/19] fscrypt: Include <linux/once.h> in
 fs/crypto/keyring.c
Date: Mon,  9 Sep 2024 09:05:21 +0200
Message-ID: <20240909070742.75425-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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

Include <linux/once.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2: Include <linux/once.h> instead of <linux/prandom.h>
---
 fs/crypto/keyring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 6681a71625f0..82fcc5683649 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -22,6 +22,7 @@
 #include <crypto/skcipher.h>
 #include <linux/key-type.h>
 #include <linux/random.h>
+#include <linux/once.h>
 #include <linux/seq_file.h>
 
 #include "fscrypt_private.h"
-- 
2.46.0

