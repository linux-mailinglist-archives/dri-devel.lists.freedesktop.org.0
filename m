Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837C97106F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE61B10E30A;
	Mon,  9 Sep 2024 07:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZqB4h6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C28910E30A;
 Mon,  9 Sep 2024 07:56:59 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-374c4d4f219so2511225f8f.1; 
 Mon, 09 Sep 2024 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868617; x=1726473417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
 b=aZqB4h6lPPfJDiJEqQy0KkFFZsbC/478r7mm0UO+jTcxKXLx0FrGJCT7LilPo7jwEZ
 WtyX/LVDaJknwu+8d99qqoQt+g3NWfYaay/gB8DbLIPkLY8Thmvzwa4btF1imDcOYQSj
 ylwpxxonJEgidrjRqmByctlHvQUi2ikd4XJC95ZXWBlhuSeiwpkpf+r8nFSmzO6HEimS
 fW5ieITT1eFFH3ITLdE1yyO9MiLDHJsC4Tscixir7wD9lQD4zUa/tdAB4z0+FycbfuqM
 Rn+IytYLGcyYPLUWGOoUfEBq2N3t4Lb6PpElRc0eqZMEEoi+0PP1T7MXnue6m3v4hbAr
 xu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868617; x=1726473417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
 b=k3akAMmZ4ZfJONUE3/itBiJKxR39UscGxUp++ab74kGfgZi09MK8zSI9vCIetc6lkY
 cALp6oi1KGYMddNQWtc3jjTbm7DGYYNEPlMCi3axic1BFlwF+qTFUQRVb8+QrWLch5gZ
 fD4Tq2X9dkrC7iqXFZc3cCA513M3RbfpDamXIUwYru9DVMy2nlI4s5zIhDomoZHli3bW
 jFgxdDdzm3fwpKcsvvD+SYX8p8/kwVQH+x88PZaReK6lbnT9e+b6mSsEu1CIz1FIhaL1
 bzvreMC4Cmy0pIAKgTyn0QXh91Pq/Yv8z4ZU1KHPxaQyWIYXsFa/he48T4clKzahd9E1
 P6vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRuQ+h3SvsuM6Y/i/mf9kHv/NFyUce/Az35EDw5OWPHxpXZrUGPeafrBG32PZaQO8wN2ecTuVxxm0=@lists.freedesktop.org,
 AJvYcCXsaDt3DvmIsrGYA28Ag3l/3FGY2otT391v7iza65U0lWLisXhucgLuZlax6o7mdK3nteqPl5z6OGE3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxH+TWsouMgIcShGHdtoHFBWzycyrsB9WS2vrLWCqRDLparIG/p
 UTxW9bGZfxFVQBitk/vM6kHzvKhlGib4NeNG4Ce7oA5q5rOPz+7g
X-Google-Smtp-Source: AGHT+IGbp7ULiuTNUf7vRfm8ezmMj4Ynf6irlpbF3StQp/S9yZeLlgA3L9pUiafOY1eFXvpthfwEbw==
X-Received: by 2002:adf:f6c8:0:b0:374:c945:2569 with SMTP id
 ffacd0b85a97d-378895ca6f2mr7015316f8f.15.1725868617528; 
 Mon, 09 Sep 2024 00:56:57 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:56 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Eric Biggers <ebiggers@kernel.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH RESEND v2 07/19] fscrypt: Include <linux/once.h> in
 fs/crypto/keyring.c
Date: Mon,  9 Sep 2024 09:53:50 +0200
Message-ID: <20240909075641.258968-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

