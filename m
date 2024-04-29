Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69508B621B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DAB10FF8F;
	Mon, 29 Apr 2024 19:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qw9EwZMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4378010FF6F;
 Mon, 29 Apr 2024 19:32:17 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7ded01aa1d2so54830039f.3; 
 Mon, 29 Apr 2024 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419136; x=1715023936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCusk8GKkQWxBikouf75pGq1h+EOpfhpPreu3ro8jhg=;
 b=Qw9EwZMiEfdtWj/dcNCMka7oVOnQF2SwIgFzcLKAOGC9XUwiYaDynHU2nt8nGqwykG
 QAQug11aUJ2q9dDJmBU4t5II32ftj+zx+rSrW2JWmCPq9U2Bp9uU5SiynCWatSVb3VYB
 SPoMLeK4Fz3cimVqsya6ygSWcFRFZvmf9noahxel/KHbZsTSOOlVdaX0zXGhqcnQV6hu
 XrgvD17XiA5gQBV8LNi9SrVp40Wm1o338m9v9J6qMTs1XSDzLCPATsToLAaNKAe+lJSu
 Rf6I3lYV+gTleBjZJ3a0m4jHzvdKhRbAXPUjE+3IdGrSdrggTSDWW6qQiAjAgkO81UeB
 Q9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419136; x=1715023936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCusk8GKkQWxBikouf75pGq1h+EOpfhpPreu3ro8jhg=;
 b=JutcABq7zwQnSFqmifWupRzE8vr+himhVa8FhOM+jEVxiCQQjgFQYzFBlMWWvq12BO
 I1hhqzngcdwTQbMmrQVYTeMI50m2B92aMznf9I3+SYkNrJVlym5I9c5I2Af3yXmoBzL4
 ch/4KPDrWjt4y/HDbUzNYmZ7oJLv6EubAXtHW5Jkrs/XC5IkMkWRggSBL+l6uAsDP32a
 3XHvh0dZ6g4fEt5/FAAiAU+quYRo62l5dAHYZI0ti60jM7YRnLAlVnzJDsbL3WZavu2R
 MG23esLu9uNEBZxa5wKIsDQhedC8UIg9xNimjIqghNDnXIaTaABlIt3PmH/oTaKWUY/1
 MrHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYo/Qicnuw1ErFvCjxM+dnZ2d6rhp8wi3wfEx9ndD+kmS1+iPWoDonF5UMUSI8+tknCJwwAb+nuZ0Kb0iabzqy4C0k122+mhPzf76OTnSHWgduXkmNt/ONAEZCKiMgnxwuNvDhvMr/2rdWDMkoJK7yNYOguCdPA/1N4leTEFSzMQtNlV9kdiLFoxBM/BourFm9RJhadVWCYVVPLfY14E0Fkdf9e9AyY5E5Er/6SQg0D1mbkho=
X-Gm-Message-State: AOJu0Yxu+/b5B1aDelYsh3+IwNxGSO5yvdF0ZwnL2PEOL3UsWdeQqw8B
 RzbSaRXH6fmP+GxdV/mEbQfBxTmtQKLqwBZBN12oElLUh72kI4Dg
X-Google-Smtp-Source: AGHT+IH14GqaWbrfrr+QP4SpVTkK0x2ngYDCiN8y24Rs/2jpEJrSfNm2tmzjuCieVqr3UxjfHAADGQ==
X-Received: by 2002:a5d:8498:0:b0:7d5:f78f:ab21 with SMTP id
 t24-20020a5d8498000000b007d5f78fab21mr13368096iom.11.1714419136396; 
 Mon, 29 Apr 2024 12:32:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:15 -0700 (PDT)
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
Subject: [PATCH v8 04/35] dyndbg: reword "class unknown, " to "class:_UNKNOWN_"
Date: Mon, 29 Apr 2024 13:31:14 -0600
Message-ID: <20240429193145.66543-5-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it exceedingly greppable.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f2c5e7910bb1..73ccf947d4aa 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1154,7 +1154,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.44.0

