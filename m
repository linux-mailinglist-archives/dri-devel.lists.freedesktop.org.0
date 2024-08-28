Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52DC961C86
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A3710E489;
	Wed, 28 Aug 2024 03:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OSo/qUtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6937A10E489
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:04:14 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2d439572aeaso125416a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814254; x=1725419054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N9R7Mhbk+Se4PIDhpm0/p6nrldMPUtb+oC6vNd91DMo=;
 b=OSo/qUtXq5sDYASXf6yDXQgYlmudbZtHQZN8rwh06zuoNlQlr55rTHsmdSBgjN/1vh
 wgaYWrSOJlHEl/fYbkOGCldbL3GqU8jGntqI7yFbmcAZ+M+ihxweiAzE95D7Gj/WuxyC
 RJfroQ5KbVf79GEqAcrPyDbapyY7Oh77B1Eebjfp6DLzNKHzm62n1JzMC12RoQKaKtzH
 KQvjuKDSZ27c3pooApB2zyGikMXf2KQYijWzM52i6ws3EGoecSFtVx4H7Zn3v/cLQBUS
 rqQVAtbG7K4HG38Q5BQ83dIF2zzRKyIhOX2dvuY9O9E7aUZvOSfxGlP7Xuug8NnBVliK
 y0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814254; x=1725419054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9R7Mhbk+Se4PIDhpm0/p6nrldMPUtb+oC6vNd91DMo=;
 b=aivnTFKh7o2sPfz0JQYAD9XJN+nYvQNABT1rKq2mVwBWC7C9CWE+SRyYIU+pDF4+ZS
 uuiIc2iGPQnGAas9axJ5mPaauWHyBvvozVecfz21pNLpYH+quDHIoRPXRKhhtDph7/I+
 LTq+pgnmTSz0XB8WOzQaDlJNDhG+Nydjze0PoVX6YVavgvdwLgJ0L3RXYoPiUkL5L/so
 JgCtxtFZgvUQMldFl4MUtuvwsZZ6dEElLv4+WUtLw75LTIX/iK4eB/BFy2ZrzeagTmCj
 iHTT+Ci3NB3Eq+4mCMKC8ezR7JVdp40ndcBt9DhQR0gsbomNALPDLJgom6im7bzXt4bY
 r2KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1huqqsFPuVQOVFlXEz0YLFyavU6cNy7qMX2C+RKDBw4Vz/nupusgE+yfI25SNW97I3scC4X+b+f4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiRZnRFoiWG3jIbs2d6LKotpDbtgj8B/GhzPqoHWWzewFmyAAW
 4cj1Cl5/cDz7k2nYbsPosw1D91nYAoJuxf7SKd5+NRYyNZgys3JV
X-Google-Smtp-Source: AGHT+IGCtw+zPOY+Vs3gCNaMxterxPo1VEjCCML55T5/9brSfwlu9kiROVQ6nSIbi2XhsLWhhe27AA==
X-Received: by 2002:a17:90b:3b49:b0:2d3:d79f:e8b7 with SMTP id
 98e67ed59e1d1-2d843c16e68mr1209703a91.5.1724814253885; 
 Tue, 27 Aug 2024 20:04:13 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.04.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:04:13 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v8 5/8] mm/util: Fix possible race condition in kstrdup()
Date: Wed, 28 Aug 2024 11:03:18 +0800
Message-Id: <20240828030321.20688-6-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240828030321.20688-1-laoar.shao@gmail.com>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
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

Let's fix it by explicitly adding a NUL terminator.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alejandro Colomar <alx@kernel.org>
---
 mm/util.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index bd283e2132e0..9a77a347c385 100644
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
+		 * called. Therefore, we need to add a NUL termimator.
+		 */
+		buf[len - 1] = '\0';
+	}
 	return buf;
 }
 EXPORT_SYMBOL(kstrdup);
-- 
2.43.5

