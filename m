Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A17C924A56
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A992510E6CD;
	Tue,  2 Jul 2024 21:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UoY8XI4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02EA10E6CA;
 Tue,  2 Jul 2024 21:58:30 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-376266a65c8so19416475ab.3; 
 Tue, 02 Jul 2024 14:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957510; x=1720562310; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PG0HixeKNGYC1yKqg8pO4K0aUEEvqiNOUzi5OjavD2Q=;
 b=UoY8XI4+bZBTT8F9Qr9kl+0rmdwynNbF3gGYnxasfUu1ZDD5kNpRDE1chNv5twH/Cy
 u6tR/6ViT+2Ybz80HAaR4uBaeK8nTHU72XOxpKeC1+/pa3aD0O126H6ahpHTMT7ao+WN
 Tc16T/504/HXNwULLfqi2KzjUI3tSzN+FbxCkV39iuBzrFi3UxZEjw8aqBXiMGs1xN99
 J8dZeG89TctsmDuGzt1pyGKNYd7Px+JPDqyrSutQl9/jPFV/osb+cXp2CdoKk3cJZzeR
 DuvC1bxo5acqxShWUV3bDw/TnsLxy+McoezWrSyheYKQOY0gy4vpODytg8pjDZ0xfBai
 hYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957510; x=1720562310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PG0HixeKNGYC1yKqg8pO4K0aUEEvqiNOUzi5OjavD2Q=;
 b=A72gaUj12TsseLAjAL3icZ1Nuc4l730LolCFYPevkmw0VGHyC5GQjoZJVctYA6wvcm
 CPRrlh8/QZnJ0iAXOJfoP7L+8abwNn9UAvr4mYMtCVoYK3GoooBHt0lN+Wemx7c/R5QC
 H7iytrFN4rqFdCf9wHs3FUEx+YcCF8O707vy3/bgv82ljLJ2El/0WLAVkaophioheLmF
 qYiVYs5HS8rwh/09R7F+y+SfFiguHu8YXyzH8vtt0waeQyEOq2lEUyZb7O8RtOpD2WNK
 lzaexpQfYDmfo7glVuL7atmQyrYjYII4EpAtqAmDmWyJrYmxs2jd7GgOo9Rqy0cN/cZB
 GSHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/EW9jXamk9jd/mqmOagLB7jJbn4uxjYXhPDkfLZUj/1jSQCnwmVKX4aVEGsV650Dmnru6nFSK/+WrlBUyk12c/iHWb/V6C9JRPIW1AWJNbrL9gCHPxpYMInC92ykXysyBg/wQ/C+ksrxAaHsIyU/PAMDMba2zupRboBUNRdQ+jHV+IebuAKh8sNxhM5S1Nw17IZfnFbkTElWjdL/xMcWcrhHYoNJ6KF1ICvTTHkqWm9HDqoM=
X-Gm-Message-State: AOJu0YxYBA9n2IgUHMXMQbU1c6nq/CTinN3YcCXkwykG0YPQTTDd2bLm
 HOnGGhW3nh5Y6/T3+FgYwHYDu+1kyKUuUTfncFfUE0CiRIdIUDsl
X-Google-Smtp-Source: AGHT+IHFxJvBXIHq5LZcv20uJ1NKUAM88ZngYdPTVnyFhFGhwG7OwIeFbtlBvY1gNg2J1W/h7jPgdQ==
X-Received: by 2002:a05:6602:2be1:b0:7f6:1b3a:437b with SMTP id
 ca18e2360f4ac-7f62ee79e9emr1172631339f.17.1719957509908; 
 Tue, 02 Jul 2024 14:58:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 13/52] dyndbg: reduce verbose=3 messages in
 ddebug_add_module
Date: Tue,  2 Jul 2024 15:57:03 -0600
Message-ID: <20240702215804.2201271-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
2.45.2

