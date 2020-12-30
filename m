Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE12E7BEF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 19:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189C688E7E;
	Wed, 30 Dec 2020 18:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79CB892E7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 18:29:49 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id p14so14615099qke.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Dec 2020 10:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=M9QK9sTak0uwtUDL6xtKc0Xno9JnwJpSkb62mJZLuXI=;
 b=RMYZMxBU2fUkGg3S6JD90/CdcMZ4MZVX0B1zEPy27Vn+DjHGvbElrHNr8LKk15R+uk
 OFml6lJ1Utku9OPUtnaSttFzetPnRJFwdJ6MeDnSmp5uD1CTkSWdz6LTUjgCzdU1o3X1
 AGUCc2gv3xwbdqedj3V2nSgfGtDcpuDcBG9P8fg5S6JU1iX+dPXI/GGHitCUNEdrmAtF
 E8uvwWboV9u+sgW3327KR3Hc7WZQU0/IbDIU3tG53mw0mFfQdDDStl9Nv6EaN4qzZMrm
 yK5CcKtnuW9IlPQxPAA2kKWZH63kW8m4DCZjwATBkfMSZknJ/MqErW61ZjOupXdAg2G9
 +Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M9QK9sTak0uwtUDL6xtKc0Xno9JnwJpSkb62mJZLuXI=;
 b=GxtBoqUuGz//00Kig6ctQdWkDQZ32GzX8SrAyxGdz14TrcsZEPPjy62QAfwWUQp8px
 9OPTknRGiqzwBpeFFok6aJYo5QYh3Vj0JtVgMj1pLNKbjhxdgtM3atYG1kgcyPYgOIbr
 VszC+bwWTLqApdsd/720NT4ccJY75p6d+YhJgc3JpNT0zloKySzKkQRQFD/FADLsu8zu
 LKUNnFh/3R1RHsTQ5XbjGt/vQqFmTL15HVyIlhDGNPNqEztP/O3iN8Awm6SaXkvKtwHl
 3n3YU5+AAKIiq3udej2WCSsv1ypUq/BehrdQbDJVfv98WBVY0S9g52AJUxEgxke3g1mK
 SyaA==
X-Gm-Message-State: AOAM531bZR2UaXYxxKNbQJYSxMn+1sUdQfVYGE9CswneqnDRN++EqyOI
 a8t8S7LXMTsdfRYY+uf42tI=
X-Google-Smtp-Source: ABdhPJwba4IsKIhFopSp7ZH3UgFL4P9mD9dsRN5+YYCk6Vn3cuhgDzu/6Yb7J8Ju51fupvX08vj1XQ==
X-Received: by 2002:ae9:c01a:: with SMTP id u26mr13830506qkk.216.1609352988658; 
 Wed, 30 Dec 2020 10:29:48 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:a80:d66:6051:ad08:aa32])
 by smtp.gmail.com with ESMTPSA id f125sm12623236qkd.22.2020.12.30.10.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 10:29:47 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: l.stach@pengutronix.de
Subject: [PATCH libdrm] tests/util: Add mxsfb-drm driver
Date: Wed, 30 Dec 2020 15:29:33 -0300
Message-Id: <20201230182933.565-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an entry for the "mxsfb-drm" driver, so that the test utilities
work with the mxsfb driver without passing the -M argument.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 tests/util/kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/util/kms.c b/tests/util/kms.c
index 08b48fe585b7..39a93866a9d1 100644
--- a/tests/util/kms.c
+++ b/tests/util/kms.c
@@ -149,6 +149,7 @@ static const char * const modules[] = {
 	"armada-drm",
 	"komeda",
 	"imx-dcss",
+	"mxsfb-drm",
 };
 
 int util_open(const char *device, const char *module)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
