Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154AF344478
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322336E48C;
	Mon, 22 Mar 2021 13:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84496E497
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:02:25 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id g20so10349869qkk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dMH4QAnKMYAm7SV5kDPsGP+GUy0GDEG+vPXEkoZ0Tc8=;
 b=UiWo5DT0T6s2hIq4vT2rvCAkJOPIUgQVjcBgQe58BOP9zL6pUJF0ZKVaJ0GiW97qeK
 hqMjKxAti3LtuoC30QcGslmlNw/9tJoC/hcDjIR/2ECJbIqxUg/uS9G222r1CulMkv4s
 DHo/nJ4n1Y9Ee+RyyzxSahr+v5eV9Cuz/wSO7zizBtqEkPs7TtCXpv7UtRSjLD6Dz3Hv
 fSRIePlXgSFxGJjzIJMfDS5JJOyiFhLBS5DwDsUO8yEQrTR3iR2icQVJRcNu4hORRvzd
 45JQDRKjfEigGkKFr/peQNu3GmT7zVCA9qUComZupiOCC8chBYFGwVwQCgr6RG+VqSal
 MmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dMH4QAnKMYAm7SV5kDPsGP+GUy0GDEG+vPXEkoZ0Tc8=;
 b=SrpjKMtz7dtzb0vP8Ij36IUbRVOmy2cp6+SkI8z1gT0abY7TwHr4HpWG4V7XdBtDPx
 1gtX3YXRcTYKcojGFmVKD7vOXgyduwnF7n5tGznH5Mcs9odRxtZg/o+pRge0ynJvlTRc
 WIIfCHYFkOHm21hBgTIaav9IWe4HhRIlCpMxmT39fh7ebCDXXCShFaiv/yrkETwJXo2e
 BqZ4IX40gW/fd3MQmLcpuDKvnMkCk/2//Gu2M5Savnu2CGp3eDKUJnVjBgQNKgHm9PFk
 ucecb4k3b9+lwwPa7ZIDfqoCRyp0Ba7xBzv/wvzClTawGUp2USmIvehe6looncLOdaxM
 jBIQ==
X-Gm-Message-State: AOAM533vAiCHvQjcFrIuK3rczl6EGbRnnU5KlOOzGUqg01nAkQ9EAr8L
 X3WKmKqq+Usjhs4IEEGD5F0=
X-Google-Smtp-Source: ABdhPJx+9Viv9Em+PGreRyAyt7xaYv9wDXL//i4JvTFnQZYD+AXa6lRIzDFP80ZnSLA7VZ3tVkmr1w==
X-Received: by 2002:a37:a9cf:: with SMTP id
 s198mr10303355qke.143.1616418144881; 
 Mon, 22 Mar 2021 06:02:24 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
 by smtp.gmail.com with ESMTPSA id z89sm8963497qtd.5.2021.03.22.06.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:02:22 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: unixbhaskar@gmail.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: mmp: Few typo fixes
Date: Mon, 22 Mar 2021 18:32:10 +0530
Message-Id: <20210322130210.3641181-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
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


s/configed/configured/
s/registed/registered/
s/defintions/definitions/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 include/video/mmp_disp.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
index 77252cb46361..ea8b4331b7a1 100644
--- a/include/video/mmp_disp.h
+++ b/include/video/mmp_disp.h
@@ -172,7 +172,7 @@ struct mmp_panel {
 	/* use node to register to list */
 	struct list_head node;
 	const char *name;
-	/* path name used to connect to proper path configed */
+	/* path name used to connect to proper path configured */
 	const char *plat_path_name;
 	struct device *dev;
 	int panel_type;
@@ -291,7 +291,7 @@ static inline int mmp_overlay_set_addr(struct mmp_overlay *overlay,
  * it defined a common interface that plat driver need to implement
  */
 struct mmp_path_info {
-	/* driver data, set when registed*/
+	/* driver data, set when registered*/
 	const char *name;
 	struct device *dev;
 	int id;
@@ -309,7 +309,7 @@ extern void mmp_unregister_path(struct mmp_path *path);
 extern void mmp_register_panel(struct mmp_panel *panel);
 extern void mmp_unregister_panel(struct mmp_panel *panel);

-/* defintions for platform data */
+/* definitions for platform data */
 /* interface for buffer driver */
 struct mmp_buffer_driver_mach_info {
 	const char	*name;
--
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
