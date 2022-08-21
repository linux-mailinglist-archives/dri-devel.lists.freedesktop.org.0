Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5E59B255
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 08:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B011714A334;
	Sun, 21 Aug 2022 06:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C13214A330;
 Sun, 21 Aug 2022 06:41:03 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id n125so8187990vsc.5;
 Sat, 20 Aug 2022 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ytZKdYUnft3zw47YJkefPgcAf98Ms5YVeOG27pEj8AI=;
 b=Zsi3WSxLYpU0pacztqUlVPW8iatV0LWto+9rVcDwlyQmTvcmPZhKvpWwU7Xpp/qKP6
 iYXNQslvjML01mRxIc6xM+gAHCHsklGm9G2rM0stiX6V+ihgDnr/HoXKLzBmQ5k+FLqX
 oQK9Ymt+V5VOZ0O8CFvfSHMZJ90IE0ksI2lfn6r3jR6RTaZwZSsR4Uekg2tEZp/5PpiS
 sZtrYY4FsPqvR9d2liHWAde/uRqPK29gbuKllzGczBLgaQ/YBsDIWniFQtrZc8ZrqRpl
 0JgJYcY3099gqq6OaKsPLBbt73Q8H2zqjZDyVRfpjICiXP47BcDsZpRyOBxee609GmrF
 P41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ytZKdYUnft3zw47YJkefPgcAf98Ms5YVeOG27pEj8AI=;
 b=ZusPwiqxFzg7+bQRokyuRzXghnyrvpdux6o2gmykXuo3IQTBDVbsKmkeyAnZHr2HSY
 b1pQeYlSAI9T9bJvQxCnp/YyrLh0kpHmQs6EhXa8ndB4aR+xbGlvaVJGm3m3ytoo6pfN
 ji2qkms5b50wHu7gKw5TK97ws5ioqVKb+Jj7Lt7z6JnM3mV4BKn0xSNJes0fCUyDCGZX
 CP8XfSKMdqKCSn3JsUkMb7lryqsWF3fTGBI7MLOhPI5VD0j5o4o0E7M1hQg/6g/IywGj
 v/PU8fHNjOAyaQUVgiEHV61vDZ3GdFuFzTXu+68LMd/lH6VNQRRh94/iBg53lK078ieD
 W77Q==
X-Gm-Message-State: ACgBeo0oH2tr4wbLm8eJJ9NHyseNHzShxIwQLQvF4U6WH1KzLU7T1FJo
 amr2WXovPu4L1XGcatmlHhc=
X-Google-Smtp-Source: AA6agR52Y1gL6ZNjDwk8h8fIHUi6BPZq3k5iTk1UOwABDIgsn8hPjCUcSZPeES+9oNlVuslWWIaVXg==
X-Received: by 2002:a05:6102:2753:b0:38a:a86f:6ac5 with SMTP id
 p19-20020a056102275300b0038aa86f6ac5mr5132744vsu.80.1661064062655; 
 Sat, 20 Aug 2022 23:41:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8202::1001])
 by smtp.gmail.com with ESMTPSA id
 x4-20020ab07784000000b00391bb2403adsm6695823uar.29.2022.08.20.23.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 23:41:02 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: remove unneeded defines from bios parser
Date: Sun, 21 Aug 2022 03:25:28 -0300
Message-Id: <20220821062528.13416-1-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Tales Aparecida <tales.aparecida@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removes DEFINEs that should have been removed after they were
introduced to ObjectID.h by the commit abea57d70e90
("drm/amdgpu: Add BRACKET_LAYOUT_ENUMs to ObjectID.h")

Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---
 .../drm/amd/display/dc/bios/bios_parser2.c    | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 09fbb7ad5362..ead4da11a992 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -44,25 +44,6 @@
 
 #include "bios_parser_common.h"
 
-/* Temporarily add in defines until ObjectID.h patch is updated in a few days */
-#ifndef GENERIC_OBJECT_ID_BRACKET_LAYOUT
-#define GENERIC_OBJECT_ID_BRACKET_LAYOUT          0x05
-#endif /* GENERIC_OBJECT_ID_BRACKET_LAYOUT */
-
-#ifndef GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1
-#define GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1	\
-	(GRAPH_OBJECT_TYPE_GENERIC << OBJECT_TYPE_SHIFT |\
-	GRAPH_OBJECT_ENUM_ID1 << ENUM_ID_SHIFT |\
-	GENERIC_OBJECT_ID_BRACKET_LAYOUT << OBJECT_ID_SHIFT)
-#endif /* GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1 */
-
-#ifndef GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID2
-#define GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID2	\
-	(GRAPH_OBJECT_TYPE_GENERIC << OBJECT_TYPE_SHIFT |\
-	GRAPH_OBJECT_ENUM_ID2 << ENUM_ID_SHIFT |\
-	GENERIC_OBJECT_ID_BRACKET_LAYOUT << OBJECT_ID_SHIFT)
-#endif /* GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID2 */
-
 #define DC_LOGGER \
 	bp->base.ctx->logger
 
-- 
2.37.2

