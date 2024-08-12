Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC16094E4E4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 04:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5458C10E045;
	Mon, 12 Aug 2024 02:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GVcrQ7Ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3C310E045
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:31:06 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1fc4fccdd78so25765335ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2024 19:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723429866; x=1724034666; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dg8K6fIsZQLFiS7Xpg/1YZlm81yjN4oHJWyrWmInMGw=;
 b=GVcrQ7Ke8FKjAzjNy2ts4M20MWHF7VHqtir/iVsrxwiiNS9Ikw5ttI6i4s4Lw4dWSQ
 nLA+FM+6239tzMnBzkhAfrZwjuGqrWyY8sq6fIRx+EaJAfZM58UbPL9ZUvW4NLJ4nkc9
 tVt6haLTWauf9B5pp8fmsHR3WHUbCMyLGluCjlv9yuMOswMC8SfWRPNvSs4LK5ON7Ddz
 rb5LmSLl08R8Gzr2IsFskwObk98TKCtxCmxwcEJ1PbbAhITrjyKH653sj5SohUIy+P3S
 HeiSN9Qt7E/9Ky7mle1y3FBPCaoqmX4xVIPcnvt1zcAHI34N2mSCOTalg4fsuiygVvUB
 XGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723429866; x=1724034666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dg8K6fIsZQLFiS7Xpg/1YZlm81yjN4oHJWyrWmInMGw=;
 b=KzuLasdK37kUs8+sfx37Hu1syT06dvujNX37kT1nByewEykzWJz8mqxUThMykWQSBG
 qdRfBoZ8HvPLcJxFw0gOsdkPC7RLRZumJrxWMmK5Eu1CCNhvQZAj7rIeq0wRd1/bZshd
 XRuIz1JSr1qbeGvrZo1Av6j7d7O0YiJBjhMMO8+dRWY0gfQJ5y7+QV6NmD1FaM3p6C8X
 L4NK+B7e+z3h7tUr0YYEkZd02xSZUX7CqgeRwzeXMl8oydcZW/eeElGfQw1xDed6lV4k
 sivt59aUlcPGKAbTV/be0ziOVFixGbe86BEbTEjbQYRtmK0PzYlF1L7YPLS9d3Q5TP0J
 yCeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIavtq5asB5o9TLMM+/34nU+5jVU6isU+zXBU4pCdMF3fULaMPTRLki5Nh+3Gw104xfzR7g2lPtAePsfMZ6UrM5OE0IMZrngUxkmYriPrs
X-Gm-Message-State: AOJu0Yx5GJs+ndHuerLham7esluaM62nC8Ak6gVeJNGjejqje9By+b63
 zOztGkJjMSM5lQmzn/1HdlSUuauWPwXritu3OB6vmRyBbCXKz9Wx
X-Google-Smtp-Source: AGHT+IGpTCkxya5k7tDP0eeWIg02IZrGkBb+Xs7WqcLI3e7hWnKKPF02puCEAAGLT4aj9e0Erpx/iw==
X-Received: by 2002:a17:902:cccf:b0:1f7:1655:825c with SMTP id
 d9443c01a7336-200ae5a8934mr50792845ad.36.1723429865812; 
 Sun, 11 Aug 2024 19:31:05 -0700 (PDT)
Received: from localhost.localdomain ([39.144.39.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9fed69sm27884765ad.188.2024.08.11.19.30.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Aug 2024 19:31:05 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v6 5/9] mm/util: Fix possible race condition in kstrdup()
Date: Mon, 12 Aug 2024 10:29:29 +0800
Message-Id: <20240812022933.69850-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240812022933.69850-1-laoar.shao@gmail.com>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
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

In kstrdup(), it is critical to ensure that the dest string is always
NUL-terminated. However, potential race condidtion can occur between a
writer and a reader.

Consider the following scenario involving task->comm:

    reader                    writer

  len = strlen(s) + 1;
                             strlcpy(tsk->comm, buf, sizeof(tsk->comm));
  memcpy(buf, s, len);

In this case, there is a race condition between the reader and the
writer. The reader calculate the length of the string `s` based on the
old value of task->comm. However, during the memcpy(), the string `s`
might be updated by the writer to a new value of task->comm.

If the new task->comm is larger than the old one, the `buf` might not be
NUL-terminated. This can lead to undefined behavior and potential
security vulnerabilities.

Let's fix it by explicitly adding a NUL-terminator.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/util.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 983baf2bd675..4542d8a800d9 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -62,8 +62,14 @@ char *kstrdup(const char *s, gfp_t gfp)
 
 	len = strlen(s) + 1;
 	buf = kmalloc_track_caller(len, gfp);
-	if (buf)
+	if (buf) {
 		memcpy(buf, s, len);
+		/* During memcpy(), the string might be updated to a new value,
+		 * which could be longer than the string when strlen() is
+		 * called. Therefore, we need to add a null termimator.
+		 */
+		buf[len - 1] = '\0';
+	}
 	return buf;
 }
 EXPORT_SYMBOL(kstrdup);
-- 
2.43.5

