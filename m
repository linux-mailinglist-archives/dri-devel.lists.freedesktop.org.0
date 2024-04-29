Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328388B627C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F910FF9B;
	Mon, 29 Apr 2024 19:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X45DPMQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22E410F0B9;
 Mon, 29 Apr 2024 19:39:31 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7d86adab5a7so222209839f.3; 
 Mon, 29 Apr 2024 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419571; x=1715024371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0LYQlvE+T8WA65CtT3d9bMBQ65wsAHik/vFXXFGgqX8=;
 b=X45DPMQ6KewPGkYH7JB/a++w83BK3I0oPE22MHBao9o0PJ/ADJbswC0tVQ6jjmH19l
 cjVeN8EjpwOQ9E5RlBd497AJUPSe0rgw5CJfVBRjNCJF/5SzXKyCpZIx44mMoRAX75xz
 iKtPW5E05ff6CYk1WnWkb98WvHYKmD430gThRONI2NDObO51KwWvHyGlznzuzPwItryd
 vqqHBoE67UkzX2N3FU7Bl+YrdVoR+zUQyWmcM+IfPVLIAnurffUFLf55c7ss4WC7/PkY
 8WsssMDDoqEp+b1ialNfUfB6Cu+pSybJiJ0QbT8i7siDcpxAErEdSbT9kiiiKvE68M3x
 9ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419571; x=1715024371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0LYQlvE+T8WA65CtT3d9bMBQ65wsAHik/vFXXFGgqX8=;
 b=UN8UM7Qbg90C/fuTNMDjCQhw6eha03oWQI8mZPpuiWEoigBl+gNjp1hqROxZW1tVF7
 ya3MFTWKZFqn6J5/xsP1Em1i+qZeXpbmseipVUXxYzSr2OoqIoSUdEk1ksWFx2P4/zbK
 KtAGOS+Yn4BDDGZrOYYP4T/yB9pwtfJWA/QqrtdbVaukuL69OC7ESC1bLRfaf52nvTIF
 LW+zGdMOmOxNxwBxtV55hjrKIo9BXlQdkcd9ndQyScck77FknyKfsCi41ESVsvaN5Cz9
 n/HZNYwGd7k+ndfJpUcb/+Fh/Cuui0Q3UAUkvq6HtvUxp0y/h5XWg3eaS3akzNEJ7Cvg
 ffEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9KBMeIztWx2zGE3kWtu/Xv+L2rexSVBXSLm/uagKQORyLsWamaZ+tEieSziuFuyKYCAqayI2p5H0NMqKlcCZuKcEQZNy4ybbJwZtJEhBRwfXaGtfft7V7vwnWGKGr7zr9g484UkjSv4PzRQ44qfB+WVdd+p2ZTJHFm2fvV+TooN0loU0RVFJ7J45PmfmZ2BQ/Hv73Jq4L4+oyyGkx98toU7wSBqROxqpO3UMpQBF+43UmbTE=
X-Gm-Message-State: AOJu0Ywxj+B4zexxMrMUnG3NiNYT6xzvrPjaVtKyp7A2bcg/qAQxLxt/
 OQyWhGwFItfoSdGkp32ARrXcnQ7NIu0NF46mS9CxyjsGsRX4plXU
X-Google-Smtp-Source: AGHT+IF6th92SlL7HDkoTDaUnOqtPhi3umBEhatRUoNm9PW/+KDNrLLSMW7oFL47yK2VDF4hmnRS1w==
X-Received: by 2002:a05:6602:1c92:b0:7d7:56a:1d75 with SMTP id
 hf18-20020a0566021c9200b007d7056a1d75mr14087995iob.10.1714419571016; 
 Mon, 29 Apr 2024 12:39:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 23/35] dyndbg: split multi-query strings with %
Date: Mon, 29 Apr 2024 13:39:09 -0600
Message-ID: <20240429193921.66648-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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

Multi-query strings have long allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That worked, but it left unfinished business; the semicolon in the
example above is a shell special-char (one of the bash control
operators), so it is brittle when passed in/down/around scripts.  In
particular, it fails when passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-cmd
separators, which is more shell-friendly, and also avoids quoting and
escaping hassles.

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
index c1bc728cb050..625838bd74aa 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -596,7 +596,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
-- 
2.44.0

