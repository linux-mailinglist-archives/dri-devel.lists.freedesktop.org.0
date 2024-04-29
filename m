Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3F8B628C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797CB10FFB2;
	Mon, 29 Apr 2024 19:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mr3rkAIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F5910FF53;
 Mon, 29 Apr 2024 19:39:39 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7dec786b0a7so49976739f.1; 
 Mon, 29 Apr 2024 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419578; x=1715024378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gz40dojOamaMr3XzSBo+G+I5OCec93qZ3mLYpBVy9xE=;
 b=mr3rkAIaNi32nMjpvoOpw2L5XzTA23BR4VDTOo01yob2hmUN9ZQiut+mUJeg4Pc4lA
 2dOu1CukidEG1WlftpyfVDsGouVwk0K9OXyxjmbFWes5A5rSxZSEZDAzPV99zs++zz8p
 wyjcG8ASPM9m3eaEX7n7DfD7ibPZW7WGC3KGl+p+d5HxIh0BCzZT5BnrlendBpkYqcVr
 vHFI3FwNK5jZz4QFHfXDxGD8k/Sv09tWxKX65GXhr2a1O/BCI7rRooKrDbAwEukxe5Av
 KTCQWOYn9cMudGOvEDHk0aKKAVs9DFaRIQobOu+PfbGwSMjkqizDtZR5/3tciBqjZnun
 6QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419578; x=1715024378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gz40dojOamaMr3XzSBo+G+I5OCec93qZ3mLYpBVy9xE=;
 b=M4fqXfoMrnQ7HS6PciXuzppINlv9ZNP+ZwWBei3jyRvJTXt/lLkv6xg+cUvhH6Bsnw
 VADK0hxBV/wVbVFD/bN3msqlvEuKyAz+OZrfZ0KBuo3p0GyIGuYdj4VLTmNArFC6T3xE
 JBus94zj54SWc3UrcURMqH8ZbIH6e1makHp2nPMBHX2W6BLuhSVoQVoDFbSvHmvetceE
 WHcRABRXMvJ1uAlHpA3vZtcBcEl7TKYpn1jWpnjzDMj4lxdnu3COPl/4zBVvSXN0I7VG
 HcQ64PYrhm6CkbBLgGLP27JiNjkUE+fg3+SHYpHN7rT6eWVM+355wUilNO3VysdN2tzY
 xb3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/kcwUoY/0ECQDkv5IEhmHNbdRke4BDhYtloTAjrwoPapceLY81IIrsFIvhpxDlFf8Spk1HjPe5wJAFiA+RITdWizIo4tP9+Rf3tt5S24y9BWp0NIDoDfeYtOwHJoLqBQC3qvmIBFAfLdeFeJ51fIQHCeqouLUEOdzpUh/U2fMzDfZGri+whpWOxJcdux7PPZeCoDQZjsxcou17sjFD84ieYQfwCFIV9G68y1AWVKbgD2W4u0=
X-Gm-Message-State: AOJu0Yz46EWeFzujgWZ25YgPvAVmNdB7Y3iYEKsrUcI7zSU1XHNtjUjh
 tbXAVWmSyWrFxseB6My8SKikdnqLIpln03jz+bYmnvudRDwuaIh/
X-Google-Smtp-Source: AGHT+IEwjLTZjJthckf74C1CX3uaiE3oCQMny0EnG/l4mAH8Dbjs9ZTAj5NSSjRC7OpGprs2S+b1UA==
X-Received: by 2002:a6b:6814:0:b0:7de:c47d:a740 with SMTP id
 d20-20020a6b6814000000b007dec47da740mr558970ioc.8.1714419578408; 
 Mon, 29 Apr 2024 12:39:38 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:38 -0700 (PDT)
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
Subject: [PATCH v8 29/35] dyndbg: add __counted_by annotations
Date: Mon, 29 Apr 2024 13:39:15 -0600
Message-ID: <20240429193921.66648-10-jim.cromie@gmail.com>
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

Tell the compiler about our vectors (array,length), in 2 places:

h: struct _ddebug_info, which keeps refs to the __dyndbg_* ELF/DATA
sections, these are all vectors with a length.

c: struct ddebug_table, which has sub-refs into _ddebug_info.*

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 6 +++---
 lib/dynamic_debug.c           | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 090fe9554db7..c54d2a4e1d48 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -146,9 +146,9 @@ struct ddebug_class_user {
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-	struct _ddebug *descs;
-	struct ddebug_class_map *classes;
-	struct ddebug_class_user *class_users;
+	struct _ddebug *descs __counted_by(num_descs);
+	struct ddebug_class_map *classes __counted_by(num_classes);
+	struct ddebug_class_user *class_users __counted_by(num_class_users);
 	unsigned int num_descs;
 	unsigned int num_classes;
 	unsigned int num_class_users;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 625838bd74aa..390a35508fb6 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -49,9 +49,9 @@ extern struct ddebug_class_user __stop___dyndbg_class_users[];
 struct ddebug_table {
 	struct list_head link;
 	const char *mod_name;
-	struct _ddebug *ddebugs;
-	struct ddebug_class_map *classes;
-	struct ddebug_class_user *class_users;
+	struct _ddebug *ddebugs __counted_by(num_ddebugs);
+	struct ddebug_class_map *classes __counted_by(num_classes);
+	struct ddebug_class_user *class_users __counted_by(num_class_users);
 	unsigned int num_ddebugs, num_classes, num_class_users;
 };
 
-- 
2.44.0

