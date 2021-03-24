Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425B13471A3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 07:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE96B6EAE3;
	Wed, 24 Mar 2021 06:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B91246E982;
 Wed, 24 Mar 2021 06:33:05 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id q26so11778501qkm.6;
 Tue, 23 Mar 2021 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dr9jAGq3XCBEKD5miWJ7SRdpms+r36rKblFylD5bbSw=;
 b=ClS1JKychuCuV/wp29mYuMdQFoLOQLOg0eNzug/TKd2GoX03p4+ECOjY9ZY7nfGcOx
 VySjJZTRNRQ9cGbkbbpcTeoux0t/bZsXFCwh+e+i1ALIX6sdjCcl1huIG9Nlug3swKvf
 9FjkUtvrYmjNur04CPZEv/GSE/UlxaID8d4SkGvbWWQWwiYMtYPaoonOrZd7yVighdKT
 DyZhOEJoe0KV4Z1MuVCbdq+xC0swo7HaJLC5Roh2qPqqZ4GWzs13RCFbW6Ugno2mD+8l
 xMltepqDnpU8BXgOJiEaSeJOCjz+cvSIky6uTHI0iHm7YRXv1l8Xsaqlzs/NiI/X4Xze
 Q8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dr9jAGq3XCBEKD5miWJ7SRdpms+r36rKblFylD5bbSw=;
 b=REl3yVcMC0MLcb7qg0nFPCkCibvmD4eqtglLyL9WTQGeIjtcytgbqyhkIPUKzCcW5D
 PHZqo88RQlwmSpzFmMlnZBwD1ejU4emXDOYyHkcXldapXGTQHxrzjDuQKMQYPJiSnnqW
 lev05+t++z43f9RRQBawdRXPEvl854/y8bjXND3gtZ2/pj8DX/uMD4PENDDLiqXCFJZa
 f43mMVBXn8JdmIa8DfT1o8gfonQg4XdgYuIwrxntorYAq7EkGfrDfxRoU5c7lHo9aEZJ
 jXOrxZCfRT0IUHrp6Eaiu0BY1OLXwDuMyb8ftjxWqxdDIoZAwK3mRuKAGsd9uJ6eKyOJ
 eV6g==
X-Gm-Message-State: AOAM53129BSir5wTfwFiWW7KDznlzfvp6VHPdodseL5+zB4uIbc9Z17Z
 s3UEdDQU84MrLDFuYKBUmCU=
X-Google-Smtp-Source: ABdhPJx08Wqua/7QV4jRNH4tZmpPSNaQ9479WSYnC6bWd0xFFtPFlVDf0DpJTfL7sX3Rh/ECQz9uWw==
X-Received: by 2002:a05:620a:118f:: with SMTP id
 b15mr1628415qkk.5.1616567584114; 
 Tue, 23 Mar 2021 23:33:04 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.37.194])
 by smtp.gmail.com with ESMTPSA id k4sm1080755qke.13.2021.03.23.23.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 23:33:03 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 unixbhaskar@gmail.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/bios/init: A typo fix
Date: Wed, 24 Mar 2021 12:04:40 +0530
Message-Id: <20210324063440.14969-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/conditon/condition/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index 9de74f41dcd2..142079403864 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -401,7 +401,7 @@ init_table_(struct nvbios_init *init, u16 offset, const char *name)
 #define init_macro_table(b) init_table_((b), 0x04, "macro table")
 #define init_condition_table(b) init_table_((b), 0x06, "condition table")
 #define init_io_condition_table(b) init_table_((b), 0x08, "io condition table")
-#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io flag conditon table")
+#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io flag condition table")
 #define init_function_table(b) init_table_((b), 0x0c, "function table")
 #define init_xlat_table(b) init_table_((b), 0x10, "xlat table");

--
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
