Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E787C908B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0510E649;
	Fri, 13 Oct 2023 22:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2263810E642;
 Fri, 13 Oct 2023 22:48:33 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-351367c8fcdso9403815ab.3; 
 Fri, 13 Oct 2023 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237312; x=1697842112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=KQWaa3ybabtNRqw2kFV6JCCRL+yTIv8ffRCD6rwiymZIHECss7VO7Y+PLMMda2pqwu
 eKlYL+b45lHmo/Brv9c229GyJsqKuMVg4xW/TFSce6iQmMPkMOuyZOTA3AA9henbt+hj
 0UmhL9j8wgdW1r6pYwgEVpR8BE2Rx7Z+T8+Ejz0JP1LPw4n1Jjy9tFAsFKFpLTC0F126
 wzYLmtVZdXWzKiQhpPPt5I3AXsO9c1+x0ZpnViCovV9w9kjb4oB0qJymiNGO0G4g02Rs
 +PvO0XW1E9IX2NaZjRHOZu2NvX5STPP5DlcXL3Cm6M/39TdK7ZlypkeAemnsThfx59hG
 GKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237312; x=1697842112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ctyB3lbzkdQhDzqOoTWBErv3Q5efkvJrKvFBj8oTC8=;
 b=B5zU905V0FQcqt7YHFLlzJuAepn2nRXY34JnNr2QEp9jl8OgiUOWUQjswbtJcyOhFn
 a8qT2Oe8qcA/zbPxGITiN10fB1ou6dzYVqwsEPvpvtCqv0+UcE5nmVg4wiwx2QRkqmlo
 1eUr4rRl2UFGySPiYMeHrT5Xdejnnx77okFkQxaGusM0sMXBS/peLvZsfgCyhJ0wFsBJ
 2o9U66+XDG/6o9WmGtV0Bnm3PkXYZDfyzOIABOnUv37Qgr2mkccwi9eYDQQpdNTIMF/H
 ANzSrLqtKRLUYcko/gp8ZU+K+ctx5etDMDVYTYgCSzx5kpG3pn4mkZ6bm4OVhp/XHX3X
 5Srw==
X-Gm-Message-State: AOJu0YzyI08aIw7is1OAVI60UhwZJNDKrBVuG3sifSwz2F6SA0ScoHXw
 sZ6VELbBjSo1Pa9jwbheIGk=
X-Google-Smtp-Source: AGHT+IGrDx/xhixmqvzmaR/QNUT5+O9N36ypuiAiSw2lR0C8FgpfvIsuC3aggKtg532I+m11zDgKSQ==
X-Received: by 2002:a05:6e02:1d89:b0:34f:2756:8fd with SMTP id
 h9-20020a056e021d8900b0034f275608fdmr33304624ila.9.1697237312386; 
 Fri, 13 Oct 2023 15:48:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 02/25] dyndbg: reword "class unknown,
 " to "class:_UNKNOWN_"
Date: Fri, 13 Oct 2023 16:47:54 -0600
Message-ID: <20231013224818.3456409-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This appears in the control-file to report an unknown class-name, which
indicates that the class_id is not authorized, and dyndbg will ignore
changes to it.  Generally, this means that a DYNDBG_CLASSMAP_DEFINE or
DYNDBG_CLASSMAP_USE is missing.

But the word "unknown" appears in quite a few prdbg formats, so thats
a suboptimal search term to find occurrences of the problem.  Thus
change it to "_UNKNOWN_" which properly shouts the condition.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 6fba6423cc10..ceb3067a5c83 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-			seq_printf(m, " class unknown, _id:%d", dp->class_id);
+			seq_printf(m, " class:_UNKNOWN_ _id:%d", dp->class_id);
 	}
 	seq_puts(m, "\n");
 
-- 
2.41.0

