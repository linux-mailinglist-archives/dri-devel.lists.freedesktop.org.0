Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601088B6234
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6E010FF6E;
	Mon, 29 Apr 2024 19:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dzla/MR4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D653C10EA94;
 Mon, 29 Apr 2024 19:32:30 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7da3ec3e044so232390139f.2; 
 Mon, 29 Apr 2024 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419150; x=1715023950; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXXERrklrfJcROQ6dIgi+SzS2bHgMiKq5Ff005OeSvE=;
 b=Dzla/MR4ckY9bngIDge+efYg8DItdlXeQ6UbJL8FqYD/TnylTl6s//Zlq0Drg9+rY6
 aZ6vQgAAXaxHL0IgcXVhpIrYS+oqaayYU285WpJXBuJk0rzOql/4tc5Pm0kAGSUw28KW
 N1E+3Wpm6Ozgyn4LVCBlK65kwWTtbS+7SUzGrqx1RJ1W0VQda2yiKVptaos802LebnBY
 R/z7EFfBfzP0w0/VkU139pwUrGuXCsyzu4VqydidHl/2NlfQgoLTaqOd951nChT5VIBB
 ksWZ5NrHTwJMaP6ipu4v4WvjKYrdnA1pWY0TJsdk1sdV7NLqDHaD3wLAmqF5koGajqA5
 yQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419150; x=1715023950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aXXERrklrfJcROQ6dIgi+SzS2bHgMiKq5Ff005OeSvE=;
 b=Z9yhZClwGxfTffRFLI70RU1wl+blmutvAU2sF2aEwUC2oY8RtVNM4+p+eKBJSjERRK
 Sewp/FoVHePZCFQhMuc+VoYz06w4gj8HINqIf4zPyQqMmONeFXLdI1zYhU+KcUaRy6SX
 pzMfNe2/QuDLG0QUzsu6DweA6DoC32rwFnH0KVo9jWnVUMf6PP/sAfa7vyOCCr2xEOH7
 dlB8P3dH89hrl7hg096RpLZ9bbqTh5Wk/Yr3OGP+3es9caXLABlADOMGGqbdB2oaPo9z
 Cjt2iFr+TBFN5kL1fa3NdTtSpO9CZ8tioJbYuDfR44OrJkEewxw1vsaXhdvVjoXCZ+az
 AtAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiVvqK5lL/s4KWdKujadg7JbZxOO4sAu9LuXJvMhakuaCinqFp/Aoq5KanHot3qZaaQFi2Z13W0wa6X/6prue9GjvTTRL0EHk0K0i0g8u2wIG/GCfsHvvXFHnxKqaTlFitPmOuL9SjsMv69XhIgCDfQNeJ2eDXql/3eShaSiw7uspWFS8QjqOa2u4FclxSa7DeJNYGO1QbIMq4j6m66gbfKSlJCkfgK5CSUSS/OYnVtqQCuwY=
X-Gm-Message-State: AOJu0YzsxtvQyda85XClxfSt39LyNp9ldekK5v9J4K1l5rHCOBeyDhaj
 syVBZuoFJc3RfBipfKgYDLFbGpBfPEEpYvMcNaqJ0mWd5SRDJTnO
X-Google-Smtp-Source: AGHT+IEA1RgM1171jNEZzZ8EdkMx4dSU1qGMrXboTTfU8qqeGHZPWqN8fwMqt58/jAs8Wz1Fb0qj/w==
X-Received: by 2002:a5e:a803:0:b0:7de:90ad:cdba with SMTP id
 c3-20020a5ea803000000b007de90adcdbamr827584ioa.15.1714419150099; 
 Mon, 29 Apr 2024 12:32:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:29 -0700 (PDT)
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
Subject: [PATCH v8 14/35] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Mon, 29 Apr 2024 13:31:24 -0600
Message-ID: <20240429193145.66543-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d4a0ae31d059..43a8e04b8599 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1245,11 +1245,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.44.0

