Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F4791BAC3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864BB10EBE3;
	Fri, 28 Jun 2024 09:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H8iwIQgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BC010EBE3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:05:55 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-70df213542bso217607a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565555; x=1720170355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8rSpj4+mjUH2uIm/J6/DitPwV6C8fJ6cAywoYkpJrFY=;
 b=H8iwIQgwP/h7uhisnZqMWNiOwvHT4XnCfybHEkXP2LbLhdchpHr0pG5WtxQCyGv8yj
 qrnnKoOXmE0KCHu964J/yLpf7FlesfioF8DpfTQyW32OJxUYBowqb2sGsLJKo6jKoytc
 0MpjMmR3OXCIaFf0b+rDGXVdnkSy5TeopH/rDl702EosOG0vI0WNBEgVFKCpekqh+X3n
 +TWi31hnsAl7Jf4z1OhoTs9E4yufyU0XSK/wGq8hIuBYnRT9+asq1DdCcODD9D7MdSlj
 Rr7n220ifGYqYVN3wi80CQsHfSYXunsxgvZg/N6x2jDO5vDCDVvxWesY/opUZQossuNW
 FHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565555; x=1720170355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8rSpj4+mjUH2uIm/J6/DitPwV6C8fJ6cAywoYkpJrFY=;
 b=Z2DLduKvprfWdgP+M3amWReny9ECSjbw5aCYzurqt4+hOanCNgX1NTng+iIZtD65lp
 GSuhXtIlOJ1hCE6nCOMawfWh+SZbdO/4Qu2HJeGnS1wVkqVQbrq+Xg6TeL4b5AkzkTVr
 HuIfDNVS6zKhlt6lZjcrfwBxwOKvSD3JBZ3NA6VhYCnyFMvNBUpsWov+4rDZxTZXEq6/
 8hcDc3xjNIGyY2jfnSa7uJcId1u7CgwV3vS5RIxBj1NVcTROs3zEDV/tfBw3qgzkB9ZG
 YLjE2FzQCW84Ai/9yTo/zySB1njyPQFR0XrGfG+G4kRHPHWFQreYUMldTMxPZKM7b7S/
 M2/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJpLm6zeIYFN5kOaCSfXIUapZHN7gVdFqzODWWNcIRdUS9f9lnNiT09+giQZgvLbsUuE88dZmVgtznFadxihHACIG8WwabVadO2GHZ7kNP
X-Gm-Message-State: AOJu0Yy464Lb5Xpjk5ndWWH/Q3d3eFdZAmByyCjs7Es6mxfkv877W5UO
 jAabtEmXockhwfGxZb9qXaDUfH/zdRVEIAO3Byog8PTyry38c4h3
X-Google-Smtp-Source: AGHT+IFlYRl3xHVXsC7P9mtN40+ZKznkLN9wN0U9RRVR76hQVjzS9rrWerayfKdnpHLG4c4CVUtojQ==
X-Received: by 2002:a05:6a20:4c16:b0:1bd:22fe:fcaa with SMTP id
 adf61e73a8af0-1bd22fefd3dmr9032557637.51.1719565554658; 
 Fri, 28 Jun 2024 02:05:54 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e3a1dsm10473085ad.68.2024.06.28.02.05.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 02:05:54 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org,
	laoar.shao@gmail.com
Cc: akpm@linux-foundation.org, alexei.starovoitov@gmail.com,
 audit@vger.kernel.org, bpf@vger.kernel.org, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, ebiederm@xmission.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netdev@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
 rostedt@goodmis.org, selinux@vger.kernel.org
Subject: [PATCH v4 05/11] mm/util: Fix possible race condition in kstrdup()
Date: Fri, 28 Jun 2024 17:05:11 +0800
Message-Id: <20240628090517.17994-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20240628090517.17994-1-laoar.shao@gmail.com>
References: <20240628085750.17367-1-laoar.shao@gmail.com>
 <20240628090517.17994-1-laoar.shao@gmail.com>
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
index c9e519e6811f..41c7875572ed 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -60,8 +60,14 @@ char *kstrdup(const char *s, gfp_t gfp)
 
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

