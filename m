Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93825484A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 12:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB610E3EF;
	Mon, 13 Jun 2022 10:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B23110E3EF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:57:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so4367689wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=I+mQAAdlRxYZRH/29vXWOhrYvOZ8KHnvV5uZ0Clui7o=;
 b=YpyLEN1/a2T0NyREDZwDbs+wwokpx38lbbSATmCX92bFRmpSoXUwuShVVr19qfrMiP
 7F3ltt35cRIHX3QT4MeuSbOD1WmTgOZGiB65n3BeqKUWihgcFmMxTr+/mtjH8qdOHI6p
 susamQxk8bGDNiMihDzG+2GSzABq9j9JNZ0ufsis9uU/bJbyG40nZchW3JrfGsdsKAM3
 9vuKtElkiOlRcIwdBf707wuBUrCAsGuSWfZvcNGurFK+LWmnSD1P0fobCc2q5v6pMSmq
 FBZEZJ3NpZLRhwZI53sn8TSIkkGrhzsbTyCDrhsaniB0DAiUe9EzGMpqfLOXfvMoWYXK
 ccXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I+mQAAdlRxYZRH/29vXWOhrYvOZ8KHnvV5uZ0Clui7o=;
 b=bQVpHB5AheKnqI0h1v2zO6kT5VUJa6/TM8wV9VsM5ns5Hn14LyCOB7a/6m+LqiP4ng
 KZARK8dwqU3Q3qIRO96ZUQq7lSTVnIszuGFHbHwZdjbcUr/SELcl6zY3ZmspHFIy7WA2
 jNwiyU+1vG6rqFcPZKlB13PHVWlQ4Aok9yX1633Wz4ZIiUGnXKtoYeN4AjjrsEq8awQQ
 SCqx7c2A2ASGQ8bEk2C4uWWM3MSTEZrBT+q1Fu6H2w7X8HOvzfTohLCvGCdHdyrnuwEK
 /PbSZxbKI1SjiK8+BOLLN9eZfcdf5Svx85qrRQZOiDCuuyPYXX5gRwephTtsM6viSADJ
 c87Q==
X-Gm-Message-State: AOAM533m9tZCSZAgXkzMYhRKeLj4HaZzZrlTFuztc8FPrJsBo6K8o7Df
 wBmOG5gmTWFvlOaKFTUGZ34=
X-Google-Smtp-Source: ABdhPJyx101r3sLv5Q1UW6EdzWAxoF2lKwCmcCsohkETQk9BiO9huRU/LN+nbnRLzzeYjq3k6dfGGg==
X-Received: by 2002:a05:600c:34cf:b0:39c:4dfb:1398 with SMTP id
 d15-20020a05600c34cf00b0039c4dfb1398mr14043917wmq.133.1655117852610; 
 Mon, 13 Jun 2022 03:57:32 -0700 (PDT)
Received: from felia.fritz.box
 (200116b8260df50089ef6db2443adc92.dip.versatel-1u1.de.
 [2001:16b8:260d:f500:89ef:6db2:443a:dc92])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c4e4500b0039c4ff5e0a7sm9008225wmq.38.2022.06.13.03.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 03:57:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: add include/dt-bindings/display to DRM DRIVERS
Date: Mon, 13 Jun 2022 12:57:15 +0200
Message-Id: <20220613105715.13578-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maintainers of the directory Documentation/devicetree/bindings/display
are also the maintainers of the corresponding directory
include/dt-bindings/display.

Add the file entry for include/dt-bindings/display to the appropriate
section in MAINTAINERS.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
David, Daniel, please pick this MAINTAINERS addition to your section.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e7d1e885aed..a8d243668992 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6597,6 +6597,7 @@ F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/
 F:	include/drm/
+F:	include/dt-bindings/display/
 F:	include/linux/vga*
 F:	include/uapi/drm/
 
-- 
2.17.1

