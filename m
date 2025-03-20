Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661EA6AD9E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9512E10E6AE;
	Thu, 20 Mar 2025 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDcbH+AJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5A10E687;
 Thu, 20 Mar 2025 18:53:33 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-85ae4dc67e5so58314739f.2; 
 Thu, 20 Mar 2025 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496813; x=1743101613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xw8adb2Z5sY9CYdNStTgPHlquDwGHHXQsVDd6QeFLJc=;
 b=gDcbH+AJYzWuu0RJXFFoSOhukf0VC7OtxPGYShxImX6kVk7QB85DRwzJcfS0f918XC
 DtfoJ2JFNN47yL/oi/VgYc0w7arhwY6UWhqIX7tdI6fWCtTYYfirnNFWtiarNThGimBH
 6ZuM40hP0dPRII2H0NZAEE7l3ot7vdFyBAlNTQMFmifQiwi/n7wZVmdViV9JDITkJtc8
 1y33a5dJOshFX58590TJanwdEMSThX/PQRf6NIQ3ZIqhNHhHXKp0ftZme4lGDD9CHjx1
 jKATrUUOHy3ShVUossceTm3bXXQfFJV6Z5nR6uLcuuA6LWllbYIG2jjvqBBvam/spGdr
 6pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496813; x=1743101613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xw8adb2Z5sY9CYdNStTgPHlquDwGHHXQsVDd6QeFLJc=;
 b=xGSIjltIpY5zRxVcwpfmSLx5MIDfPMNwEnuEYnBzX17igCmz6B+73YFeZbjiX2gwnK
 5JKiqLtSoB+WxJCNaXuAR0RKXXuF7bFr/lPyghQ+agInaFbG2LwAWxX94wCsltUAzlry
 B9HdTPLH9SkaXlVdSmM4dhHXnxkwAup4+gEuubxi9J+auE8Vq+jKFvaoVZi1+xptocor
 69WbviRPP4NzDEeSo84+ZXrRfJNB/jqaEDKm+ptJMQMy36tWoYLrDzh5iRmoWMZWk18v
 AXEcIMAkyuFdAQ2IZ5bhQtbzmevhcLR/ZBk6sZIGZWm0xTO4GDl16plkecZBsuV/9JnK
 dfrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/QP93WP5no0clGRSCGEcoMVbdPffZ430HDzD4FcIeghZq4uTGiMFN7kYZen26WMUzhoyU0tK81UGp@lists.freedesktop.org,
 AJvYcCVH2hZU7ML9f5pugrq1XWMHTl3Gwb3lRsbSGIk8SY+1bGd0Zyn88eFpkRAlp8KeTZD0qwU6iVptb6T0t73xMg==@lists.freedesktop.org,
 AJvYcCWzxUQ339i4A4IiRj4OoqoJUpGtTxydblq6CZV48Ts2e8c01+b3lNnr4rCih65tb/UZMUM18WrU@lists.freedesktop.org,
 AJvYcCXKTU2TfmrzYkBq38v15AXiNHCTqTsqTWGCKEUv7iTBzEdP1e4MWSGco52HvJZkRddRhQOn4KOUbgPwmeZi9i4wEQ==@lists.freedesktop.org,
 AJvYcCXiXemgYPZeKrXyaxSoqg8k1r+tl4lpqfEneAinGTlGdjWcCXMrrjhjytF2bRwxGkvsXHV4fBZVjGrL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJm1Or5p9wHZZxdWG26he74cILqzZG5LDAzEACNSrHHp6iPvga
 5nH7BG7FnhXwNz5SBNRPjVwaBGks2284x4655DRxoPFujhpMJ5XK
X-Gm-Gg: ASbGncvcFf6x1a9HeV4P/xEfKr2O3S63FSxyZ9ROvAWTHLbmS1iOc+kXZV+tTQxaitX
 7HKvS9kqCK4WUbkZAjpXTygcWQU85+96DQIM4UR3JR2QyEL8qKgvS7Er8E78UvNrzbRrwihihE6
 ZZss3n8vAZ8tzSrZY7A1G10lb9IrtD02J1thDytDOTWoqd17VIfY/3IR+9y7nSAvFecQpO+kSOv
 CBCBjTUf7cXvkHWpCq3vgSf8Btl1NVE4TvpwEXqIvgkmfy4JHhs3o5CuarGwgZOV5umqjhWQDTz
 hHfzqWRFUcRyed2p+dRYAyBeN4nGkd9Tq3JXCX/+hNvcjZVGZ05CyTExU4/ylgDq59HRm1J58/k
 IUw==
X-Google-Smtp-Source: AGHT+IEM+TCm6SAKhxXC9orQJ/SOjoMht1drU2xoXtyO6z7G8nlW6dhEGvYl4P5S+BLPG1cYCvgpwA==
X-Received: by 2002:a05:6602:358f:b0:85b:52d7:17da with SMTP id
 ca18e2360f4ac-85e2ca756admr60410739f.6.1742496812752; 
 Thu, 20 Mar 2025 11:53:32 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 26/59] dyndbg: split multi-query strings with %
Date: Thu, 20 Mar 2025 12:52:04 -0600
Message-ID: <20250320185238.447458-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 168663629ef2..c44502787c2b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -599,7 +599,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
-- 
2.49.0

