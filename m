Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C198A2A5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4EF10E435;
	Mon, 30 Sep 2024 12:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Np8xEuA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A54010E431;
 Mon, 30 Sep 2024 12:37:12 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42e748f78d6so34920585e9.0; 
 Mon, 30 Sep 2024 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699830; x=1728304630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRI6G1zgxxf6ByUGqs3lmNwTcdt012WbdG6WrxIrfn4=;
 b=Np8xEuA8qbudA30cxOZr7zpyrSvqF22cJhtvI1J1KvVUBKnw5+7KSyG+byHL3jmeob
 su0QGiUO9uRBZK/9oFWlZf4ZcJ7JtjQKRCqQ7J5HM5/mrCx/eQ1FTkFdO5FP4ya1JtBE
 CSbOoZjZnETywY1cYRVOAcYIQkevmx2iNsiybRSxjUi0f5tiKI+SRQB0jtn5caiJ8bdj
 LVMbzMJnDAOwPCzf9mlzbnOyD+Kzsaj8dlH1d+p0QRfSN7Ob4YAqYEpFJfz2xaKd1KtX
 PGHHOkNzqFjsAZu/sQbCql4ntMVuzQ3b4sMR/AD5JNpLAOtLh62ceP8OvH/6e68vQoTQ
 1Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699830; x=1728304630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRI6G1zgxxf6ByUGqs3lmNwTcdt012WbdG6WrxIrfn4=;
 b=Hgr9jv2u0qQNPSD6XPYy7CCYviPcGGvKIQkEaXlg1JkIO3hJK/SJ7F7x4dIFzF4j38
 GdMYgP38ovjDIXrS1DDEPPi29wLNtDOMMXuCElEVVvP2cN+dLUpv5fY465E1bKrO7yjp
 yL6wl0mAGd5lTzSN9Hr5hmZwsE9xVOL+cZIKPUw6hff9szFxtv8wJW0syWeyH5gHquSJ
 1iuxBcHIqS7mIBe84t+Y34wBp+BUOy8b9NsEvpH8Pn6/7zdKumdyKOk9hG2MJBI5Hd1C
 D073Ny1oW4VVKzI2tyz6DcbGDR5e4lxmezpS7JBI3sCtI43p80ClmWHLND4qnW06/bQP
 d69Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoeqkAia8D0dP+s1BWb3CjZpa2yqb0wSNDnBn20ThQGINXDzIailjkQPFh9644ObGIlT5JUv2xpVav@lists.freedesktop.org,
 AJvYcCVjy8VichzUbL+hnUbR5PnMrv/xCHIMxZ50mQB+eH9gZ3809CUyZU/ac8hUE9VLzr9sLqCXAy/H/GE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGhQpl4oDHBjI2d+dN73ukJ4ZNoZ6rdpQ9NU2UkwoDDNX23SFO
 93P7xJqv/K/CsPDNdKltRdOCyohxZEKLUeq0vJMZBg5TbjKtJWWS
X-Google-Smtp-Source: AGHT+IFu5Oiwuj+i68aKGbWWitLMicT3QOqH4yvr2CkBBlw3Y4l78E7VTBxoGWeYODKBQH4FUNaUOw==
X-Received: by 2002:a05:600c:3b17:b0:426:50e1:ea6e with SMTP id
 5b1f17b1804b1-42f5844c301mr92255225e9.18.1727699830327; 
 Mon, 30 Sep 2024 05:37:10 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:09 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 01/19] x86/kaslr: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:12 +0200
Message-ID: <20240930123702.803617-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/mm/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index 230f1dee4f09..e17e6e27b7ec 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -22,7 +22,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/memblock.h>
 #include <linux/pgtable.h>
 
-- 
2.46.2

