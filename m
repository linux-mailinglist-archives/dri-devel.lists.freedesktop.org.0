Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E26643A4D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9410E323;
	Tue,  6 Dec 2022 00:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1731310E2E4;
 Tue,  6 Dec 2022 00:35:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id n188so8754232iof.8;
 Mon, 05 Dec 2022 16:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeSlyGC+4QjekIyFRyMcJltxNINQMnR283Y5rstfp1Y=;
 b=h0LKM+koUxD63ixKVAQGoM915fvUhbF7qjLYPjNPraE7iyUC4PuTyXY69CvRpHBfkh
 MPaliefrvoVUMN2EmN0IAEK+2qd30mBjitC4tqGFecZrzEDqweA5+iVV7JJeh+el1mdO
 Yh7zXsaDZdT4H6MfVxtqSZrvopdzEAzDWQ+048m9rtr72OpC4xCCjNeJjOYMhwnTJmz2
 2enlyFSGdg8QBLRnoTeSfC5ZefQGJ6HhJbJdI8xuGT+jExB3qq2MPyWNhtdQS3y9Cx96
 6TaqVksxqER88wpsnUtXuvhDQFcypouO0c5LdTxeYDf0wO2ban1P93KJ94prI1G7Ndg5
 466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeSlyGC+4QjekIyFRyMcJltxNINQMnR283Y5rstfp1Y=;
 b=XSCQs58D5vna6Z5FuxIkMECiW1ZHe4i9Uq/C1EBJYnl4Nl8Mui/p6jCcvW2Jqzb0bv
 Wvs3k2UXF3smKdMcrehUA9e2uaJpyVSTZDQ+WS+d8q7MIDNC/aRNrEizzdqJIz8qXUiu
 l3Wxdhd071z11FJgD7b+UudZvcOuZkwOSxO15EbFMdK9pduwXIKehFQmZ47qXevFOGwJ
 L07z+02m4diAsPyaot5/qxkectGeUemtuKlG4Jlj57US3GDpghEdczP8JWqpw+UlHzWm
 eKclC7MOT/FsqeEWGtYN8GVlSMPqtzKyNn96qRBDIFJJpX/L83YJGRFZ0rwylbHsuhHA
 L1GA==
X-Gm-Message-State: ANoB5pkcH/NP2dXBKhiIX2cGfuZlYJN5x72XRcViICgsjppJVM4QftPr
 bDRQfFqcrih8PwGpF6CdfAI=
X-Google-Smtp-Source: AA0mqf4cdoYhV1MOscSXod9QpdhchGdE4ccKTAbn4ZBthUwankegsGGFYP+dAt7iIm0NmrBrdU4E4w==
X-Received: by 2002:a6b:7c09:0:b0:6bc:d42c:ce6 with SMTP id
 m9-20020a6b7c09000000b006bcd42c0ce6mr31063086iok.172.1670286916237; 
 Mon, 05 Dec 2022 16:35:16 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 16/17] dyndbg: mess-w-dep-class
Date: Mon,  5 Dec 2022 17:34:23 -0700
Message-Id: <20221206003424.592078-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

for loadable drm, helpers, and drivers, dependent-load is failing to
apply changes, needs more investigation.
---
 lib/dynamic_debug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 46684aa7284d..3ef1c0a1f0cd 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1248,14 +1248,14 @@ static void ddebug_find_kparam(struct ddebug_class_map *cm)
 
 static void ddebug_param_load_dependent_class(const struct ddebug_class_user *cli)
 {
-	unsigned long new_bits, old_bits = 0;
+	unsigned long *new_bits, old_bits = 0;
 
-	new_bits = *cli->map->dc_parm->bits;
+	new_bits = cli->map->dc_parm->bits;
 
 	vpr_info("%s needs %s, 0x%lx\n", cli->user_mod_name,
-		 cli->map->mod_name, new_bits);
+		 cli->map->mod_name, *new_bits);
 
-	ddebug_apply_class_bitmap(cli->map->dc_parm, &new_bits, &old_bits, cli->user_mod_name);
+	ddebug_apply_class_bitmap(cli->map->dc_parm, new_bits, &old_bits, cli->user_mod_name);
 }
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
-- 
2.38.1

