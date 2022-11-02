Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE204616E1F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 20:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C5410E5E9;
	Wed,  2 Nov 2022 19:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9AB10E5E9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 19:59:21 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 p15-20020a17090a348f00b002141615576dso3109406pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xTlEc+TwvUwH4QO7vIX81PZfuP6PZEvZ9DCLC/XDVPw=;
 b=Da2Tkm1nScX/U5I2jMWmKou8fXW4etyob6wD/3/kfuYL5zhqiXQHxF/mB7vIfBQr/m
 JlGucOwtE6bRHi9K+rhHrWT3f2nQYyquha0Za5oQsTxmaYoB8w9O2+9y7xcbCL1kzW1N
 8o8t4sMvo6w3/Oi/XZ4FNTC16116JU4dZ2EBBbBI302gwtu5XB60XFIp8Y7MGLDIVMXn
 A6l2IKAzxIQmoolS0C+l6TcsS4oMRLMnbpHnEBjVPTZJ3Ki0hSgR+nTt6XdwK+qz68EH
 WGrPQ5DM6GLxu0Aej+IZ4LhQ/1cb14UE6bg/cqItDbNvmf4rVlMPDGbxrHe38+qX6elR
 nFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xTlEc+TwvUwH4QO7vIX81PZfuP6PZEvZ9DCLC/XDVPw=;
 b=ZOdHazTtlSDq+/AEX+M6Bhoi7DF8GlI2qsncgdZbfwqheRimBZYAGz4fzHBGn2kkqL
 3lv5weDwMXM/jAPT/Ed4daN3yz6C0rfXbYjcz3krfdG46BZm7dhWLbaqCm33jwcPNuge
 C8Uj+WrzSaMH/dZoW64EubjZa+v0SJSZODl5CdvDmKlfr8xuILay3X+rGm9JxIqUfHbl
 mT6aPRKwxyYZ14dQ8mgljBcGN0Gd2SnLKMsannazQb9U5xlzBvBTBuWW/XxzXddUoqjC
 qgCeOCzwURO7y+usPk9SulmezW/0NwDrU8umYZwsb3+84pKDpTtc6NU/sk0dv87mhNtz
 XdJg==
X-Gm-Message-State: ACrzQf3HNEbaTsvZoQyKtYkNCNmfXMXsBIzGPz6dDVF6YjyvjgOtkivB
 v3DHICIEMmWP7nGUR+aSiUbmsgqmIa0=
X-Google-Smtp-Source: AMsMyM6xr4NMN2eMK3hCghPDMLTRzAK3wTcOFMxNhnOCA8mBK8fv37f/h/FU7rx7wHbOsucG2WOdYw==
X-Received: by 2002:a17:90a:fa0b:b0:213:ead5:92d7 with SMTP id
 cm11-20020a17090afa0b00b00213ead592d7mr16688766pjb.147.1667419160296; 
 Wed, 02 Nov 2022 12:59:20 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a62f90a000000b005625d5ae760sm9058299pfh.11.2022.11.02.12.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:59:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: Remove unused field
Date: Wed,  2 Nov 2022 12:59:44 -0700
Message-Id: <20221102195945.352241-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Seems to be a leftover after commit e7cdf5c82f17 ("drm/syncobj: Stop
reusing the same struct file for all syncobj -> fd").

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/drm/drm_syncobj.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 6cf7243a1dc5..affc4d8e50e2 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -57,10 +57,6 @@ struct drm_syncobj {
 	 * @lock: Protects &cb_list and write-locks &fence.
 	 */
 	spinlock_t lock;
-	/**
-	 * @file: A file backing for this syncobj.
-	 */
-	struct file *file;
 };
 
 void drm_syncobj_free(struct kref *kref);
-- 
2.38.1

