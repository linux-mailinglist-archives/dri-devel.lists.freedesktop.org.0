Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C237577B49
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BD8A9CAA;
	Mon, 18 Jul 2022 06:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277C2A9C7E;
 Mon, 18 Jul 2022 06:38:24 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id h145so8530121iof.9;
 Sun, 17 Jul 2022 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6KV4Yr3V4yuuH339Tx2aFB9MqcN4deLUMaEAUIDYPE=;
 b=NWFew2hm41m/0FtxJi+ys135wUv4kAvCpeqxBGeFOnK9bThuEEBFxDFI81sKHrevg+
 OL9BHt6Kq/68sim8Yo874bCpAm9tPC5NhWi9Z2MeC4Y6NQAvOXAeEtPGuKmEd5QM1cHZ
 nc+uY0xR+tpdNGinPkvrFijpfDF+nO2DE1O4XDj/wQPAxIsysK1HcC4BuxtjQ3/8VnN5
 oG77Y4T6m5Nm/k3H/5TJ+hNvgf3Tv/6gZAapCeOJIklIooKxR/Ny0Ch+ETATS4GJ/kKH
 Ly2d5vLqSsm7o/Q8S3IUs8u1XrTjhXoKZbA1wO7xl4YlMNEyYfAyrZqb3Vpd91Y7MKXz
 9fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6KV4Yr3V4yuuH339Tx2aFB9MqcN4deLUMaEAUIDYPE=;
 b=oRLh7BiR0WL6m3TvQGf5y5mha1lL9FIgGceci1apWvsTAHqUVE+C8kRjiiSoCKAXEX
 Y59TkQKC4GUPxXNt5WkZnE/CMglQf4FVtva+5PSy9s+PTfdX2Rt9stQxZBuCuEFsAkDp
 bmo03wTDPozkJyUFzq6MAYCERMUKfi42xk9wS2xtjGRYKXL7mG+tkLTfcCuW7c1T9v4d
 DTm4vmgFzG/cRKbeF2u+/5Mx+O2O3HKaHdorfaWG8nh8UHP1k40SGX5S4/XpsDImsd97
 lOyCaqKktGTFKk8X2rAzH8Dt1vkmWZ1f/QMfHZLPSQTy1FACwq5LzHO7DHb4ZGi0IHK2
 yMKg==
X-Gm-Message-State: AJIora+mN6B5ndKihMxKMYhbQXJh6oPewEKmsX6I65V6lbbVjEJfMjAh
 U+saUoYpZ0ohD7L1YwO2RSCs7aoN0y8=
X-Google-Smtp-Source: AGRyM1sHntoftYwgIWb/HKTOf9/krvEe6h6n2KAKTZ9ZIYjQ4gJvH3GJiLID2+TN0QR9B/8D19AWOQ==
X-Received: by 2002:a05:6602:2a43:b0:679:47e1:792c with SMTP id
 k3-20020a0566022a4300b0067947e1792cmr12569687iov.190.1658126303387; 
 Sun, 17 Jul 2022 23:38:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 06/41] dyndbg: use ESCAPE_SPACE for cat control
Date: Mon, 18 Jul 2022 00:35:50 -0600
Message-Id: <20220718063641.9179-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`cat control` currently does octal escape, so '\n' becomes "\012".
Change this to display as "\n" instead, which reads much cleaner.

   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
   init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
   init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
   init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
   init/main.c:1426 [main]run_init_process =_ "    %s\n"
   init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
   init/main.c:1429 [main]run_init_process =_ "    %s\n"

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8ff11977b8bd..e5cbe603000c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -900,7 +900,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 		   trim_prefix(dp->filename), dp->lineno,
 		   iter->table->mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
-	seq_escape(m, dp->format, "\t\r\n\"");
+	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_puts(m, "\"\n");
 
 	return 0;
-- 
2.36.1

