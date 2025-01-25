Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02301A1C163
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5621410E2C4;
	Sat, 25 Jan 2025 06:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kB0oSXq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAFF10E2BC;
 Sat, 25 Jan 2025 06:46:48 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-844e161a957so209605339f.0; 
 Fri, 24 Jan 2025 22:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787607; x=1738392407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uX3l/iQikxAaQX2/QdRkr7TBe7St6PLnbGyQCN0qCdQ=;
 b=kB0oSXq1prfPbDNAieLUy6u5if7dZPGQHhW96Wc3b0ujf7R60yXqX3ZNzuMbYAJZ3S
 i/h58n++7pAYgIOOkwD7vVWx2NUuqmkcEenxn5sjyU3dpsDz9SSURAQ0/EezVbQRGZ83
 JVdcz+I9a6fXhJBrh8inIV7BKrIhtCl04oX4dcmgmWeMC7Xck+NBRGoICKtTlVGLoCjH
 OzP9cLor3/Yf68m0ozQCRxwgCmKGnRwFkgI/8LCej9mP9dsra6VFbkmZd3paa+TyAbJq
 DZBGp76fPDG5gk2a6xqsS84rKWnW2HUXeQ8VWBEvPWoS9IyQIiJX/3lImqsxxVueiD7e
 tN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787607; x=1738392407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uX3l/iQikxAaQX2/QdRkr7TBe7St6PLnbGyQCN0qCdQ=;
 b=GIGm4ij/mj6u0sdtG2OMu+th+7yrnyHf5FH4wPSXqyXc8RJkZ067vxEs/TibiEJ3U/
 Mybq9e+sUZdJz8G2mO0viXkH8umDAXQFl+RRaf27Y0JSpdxeKwifwBmx5s5PdSHpocJ8
 rSOy0oOmqpbJdGDSF+ZNXO3/PAk0Bvh92mpk6sgjVYzRbv/kD66TZiN3AJmJ6XKgO4oS
 2CKKJpuXXlzpi0tw5hR7LE1GDaVzoN1wZ4nayb37YB6e/L8naJDCES7qNRkZgO3qXhfp
 oWVkRbw8UJayDTbhil0JWeMuXOtIqwhRDcLU+w4ulDUieLI+5QVeFCyaz/ViQR5vCO08
 YO4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0FkZyhyrtL3YKPOQgNrq5CWwY/ZZBj2Cdw7csuUMR/5gBTnAuiE6e2xyi3fYoV01N6hI49w4AloybNhiHIA==@lists.freedesktop.org,
 AJvYcCV8rrw+hN+T39U40T3KDAftHRYq9HV7Wp1w8+aQmT1rAz8jfdiP0c9QBbXKgcdzJqj7KCNx40F3td1w@lists.freedesktop.org,
 AJvYcCWcaLi9/Po6KrWOG04KFqOCw27n+FGy1iiZpCQAqhu+/Tksq5I7t5czchH1kv7qDVKKjNwvwU3w5Jer@lists.freedesktop.org,
 AJvYcCXVAYcs8GTWrU6Hd13VV3m/+sVXWE6YJ3ajjrBbdxgWrdjG3XKsXsmU/Oe7YehQb0lu2aYMKjRu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6sGtpKbjdQqPBLautTmtJMVCW6XdeiJ7S5hlqar57aPraigRA
 CYXNPSHqxAnnQv2C4nN4a6szlxgz1fSxG5o1y7tALFiCRtci7NsC
X-Gm-Gg: ASbGncv4IC+y3Szhe94/K9RSaNbOROPFqVBspapFVsWaQFICDuRildnXXJUcE+v2lP3
 cETatx+XNr0JNALCYHq6nyiBgHAwyEJY1H6SZSZWOP/O9jzmV2tt0prGTNk9WjuDn/VCZl5SQZ1
 JBzhNfJUVITyexnTuhQZWmkMqAiRrjeKtguc2p+KhRkiZMQw69k9GAY5thHf2W/uk3E9B1TIaFi
 3qmYt73H4eV+JD8Lw7n0TMqOBSgxfn2Z3CWlJ7c9SKudbHYyb2rul9TpWMYBVrbZtfeTX7oCEwg
 Kbh2olm/S52Law8Q/vOH6fW0j6yXgMCdUj7BcA==
X-Google-Smtp-Source: AGHT+IERZTxhAZxFSe1csHMGwCl8KwsmPfchqC0NaFpULXt8261DlITQ09T7azGi9+ykPl9fw06Y+w==
X-Received: by 2002:a05:6e02:1d9c:b0:3cf:bb11:a3a4 with SMTP id
 e9e14a558f8ab-3cfbb11a52bmr102830845ab.15.1737787607309; 
 Fri, 24 Jan 2025 22:46:47 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:46 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 10/63] dyndbg: silence debugs with no-change updates
Date: Fri, 24 Jan 2025 23:45:24 -0700
Message-ID: <20250125064619.8305-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

In ddebug_apply_class_bitmap(), check for actual changes to the bits
before announcing them, to declutter logs.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1b2fb6502e61..c27965180a49 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -606,8 +606,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -622,8 +623,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
-- 
2.48.1

