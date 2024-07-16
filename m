Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C869330EF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107910E839;
	Tue, 16 Jul 2024 18:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z7ESRlcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C027210E847;
 Tue, 16 Jul 2024 18:58:52 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-8036ce66134so4802839f.3; 
 Tue, 16 Jul 2024 11:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156332; x=1721761132; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VIvOBtUs6wwUYmdF+Bm1LKjLjq3TMDH2Ljy+h6N5XvY=;
 b=Z7ESRlcqomx4WZJZJnMHMHLpZNa+gZxA4fjRJCgjjDUIFauYdk0ESsb8QbXubVPnEZ
 x+aVQ38hnvVJS390HMasnBOeCTPOroE/x7AQ/PjviStWibRBhSZOv8lmSTJVskF5mTtZ
 uxbzq0fzGd1A+byY0P73YSK2JJuLoxdqvFIdFsqj+J3OUP2HA6ugJjnM/1FdaL5SQvbd
 Ta3nWATFHNv7zlHs60bqlJBOHcbj+77X+U4aMCUvj9cD2TQHkGMMnhQrK+BNNm8MSt9S
 90DOj51uF3ZtCiTMrQuje6WjPnN/YtnTFlPhmEkHYosJlBiYvVXlR6OccVVQlK8h3h/t
 OlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156332; x=1721761132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VIvOBtUs6wwUYmdF+Bm1LKjLjq3TMDH2Ljy+h6N5XvY=;
 b=m3CAJm7PUQGkYruLHs81fBqeJpuEL8wcmpmbnbGWOBe+Pf3EnVCJWUAh6ihfP5sxm/
 3d9ivXbAFy8JEuAsMxXStnw289w5lEAzPKYPxbGIN9dXQcc4iRLB8zf3SIMYYgyaMys1
 9mVTIN4kqUIkmx8OJfOjIN7kjr5xULzIuGiIlTB6+34FPgGgcB//T+EpkdHekzV6aQ0V
 oEs1o7Dk/T+lNJol5eOvdvmHTyhHXEE/PmA1rcA11Tre/LIMoctXVhp4rCOOv0FI6WRv
 CueQhu/zjWMF1Jvbbd7SnrjSJquw8+j8W/KO3mbOSQlJYCu5M0FHEFz0YkmfAngpTIY8
 Rxew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuDqFiX7daAd6PNRis+7SH2cnzvlcpVz/RtMs+qcrGmGihuoQ9CrcQN+68BoC83MuSnU3SB5ZV0VHGSh/u13Gc3X1RjNb72NLHw9RZ60Vlw5DjX0FMP44yhvscafprDvDbX9/4YciGovq/HDKnowxdv/tByGFNPFcq8RA91YK2xTEBoX9LTky+XZRuLfSSxjWIUc2eYG8AcabZbiNJBXrgYmNHINdbgzbC8yHzErzSCgGoahg=
X-Gm-Message-State: AOJu0Yy6GDUfedUwJuw/48uusnW1dXBHxbN3r4bz/ZMaiqtAZNpnzcI4
 KwW56DOO85WX7jEMyrQiZ312Fp2h8ZM7gKftEYro3LXYoPIS87ph
X-Google-Smtp-Source: AGHT+IGIzqzPIEDRHp4d7Lzv1bJMSuo67sIN7LKuY04te4B9L6LczQkAf5ej+65dlhPKvxI7KIqPPQ==
X-Received: by 2002:a05:6602:13d0:b0:806:6b24:ee2c with SMTP id
 ca18e2360f4ac-816c5883f11mr40915339f.16.1721156331976; 
 Tue, 16 Jul 2024 11:58:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 21/54] dyndbg: split multi-query strings with %
Date: Tue, 16 Jul 2024 12:57:33 -0600
Message-ID: <20240716185806.1572048-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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
index 235d85765b63..dcec7b3657bb 100644
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
2.45.2

