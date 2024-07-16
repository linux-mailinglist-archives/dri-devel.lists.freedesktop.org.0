Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618299330CE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C036D10E5F6;
	Tue, 16 Jul 2024 18:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDnwpWi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00AA10E299;
 Tue, 16 Jul 2024 18:58:23 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7f97e794f34so4316039f.3; 
 Tue, 16 Jul 2024 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156303; x=1721761103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gHhZlZC9lRM4IBPTZ/FMwaYyy9pebB6jMENYSRc4Ds=;
 b=gDnwpWi5UfwHOmOvwcoYnEqgoVQHl80oC11Z3ziw0LoyTuWSKje+1tBB6PjzVjFqAg
 QeEuj0cAcuRF+DJMUq4nRpA6wckuHIf1spPLFte9LuAirg9pbSZ+xXLf+vBVH+pEZPDV
 kMShWCBRQJBfgk69pRJtNhxZu6hCUvnkSI9iQhBI+xQBusAUHaGuyklW53gtFcErO5ZE
 LvC28a1LrY9Abrwej0h22duT/FU5HWNqr1ahkA5bniZ3SNn5ZOHswl0ByphxIfqxrmar
 /K3phog9bdP6HWBH0kTid8162fFRhCxVSQheD7jhW0EZz1uECyiOsupnrMT2zbxysF4u
 B0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156303; x=1721761103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gHhZlZC9lRM4IBPTZ/FMwaYyy9pebB6jMENYSRc4Ds=;
 b=VUCmLqSJPaDof8DO49sYo9Ic+WJpVHmCPv68lmzGihwLwxK21vRhzeanA/SV5pP8b8
 k29v8UdGUQQtz+3PQbXn+mJAcCgDhmkkZfCD8vBaRfmygmrdvaPePw4CaWr/nYXuza+r
 xhT9Lz0WQkhqmsjQiX7Gm7YyVRqUk5Xhcp3YkAAyaA8kGeLhrx8AXU6rGzc2MD6MPLaw
 ekA/CLyhLEL7xoHcAqNeUHiyxKTvf5tbrJB4g8wB93wSLqDe2tMtZkXsO7y9DUIXA1Hj
 pT3X9dNfrzpQFW4nOkbbUTBZsZCe9vEPtPFA62NXMgsQN1WIgCpGYf9XqrZ82+Rrq8Eh
 UcTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9hlphnvRTBespJHe+PW6f30qdaBAeAJsnRqnflKx7gy+vGVt8Z9FcQKlL8hKZlljUNmtCUPHMLnSzzGAD00Wc8HBFGdWIMcXECU3wGoLtacdp05mudVnLMgIp/irLu3dhsKAkyXs06/CmCphZPTJtl44CMfIZri2+e5Hl/3gpzMtJvOkAq0FslGvpUgJG2bZvGFeXc9jifrhlV7JbvkAqnzuzfWae7yDVUWuOq7cMUmWXcdA=
X-Gm-Message-State: AOJu0YzLOFJS91Svos7z2hunnFLdNzXa+tG3dZ5FdE/PfxHcfIAG14cD
 ozw3lM31dYAGfkzXsg+cZKr677KaeWLGUW/XiYTF5AoyGn9pR+Zf
X-Google-Smtp-Source: AGHT+IFIRyDhcxDXmtmK1HLnwwi/E2q7SlYEHNYrBcbDILq7EAQB2veK147HqsG4fbMsp7Bh70n8xA==
X-Received: by 2002:a05:6602:6408:b0:804:411a:16fa with SMTP id
 ca18e2360f4ac-816c34e606bmr41423339f.9.1721156302764; 
 Tue, 16 Jul 2024 11:58:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:22 -0700 (PDT)
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
Subject: [PATCH v9-resend 03/54] dyndbg: reword "class unknown,
 " to "class:_UNKNOWN_"
Date: Tue, 16 Jul 2024 12:57:15 -0600
Message-ID: <20240716185806.1572048-4-jim.cromie@gmail.com>
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

When a dyndbg classname is unknown to a kernel module (as before
previous patch), the callsite is un-addressable via >control queries.

The control-file displays this condition as "class unknown,"
currently.  That spelling is sub-optimal/too-generic, so change it to
"class:_UNKNOWN_" to loudly announce the erroneous situation, and to
make it exceedingly greppable.

NB: pr_debugs are only alterable via >control, and to protect class'd
debug's from unintended alteration, "class name" must be given to
change them.  Classmaps map known classes to reserved .class_ids (the
1..64 val range per module).

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
2.45.2

