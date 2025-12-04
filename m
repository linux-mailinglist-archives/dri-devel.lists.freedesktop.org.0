Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E74CA3771
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 12:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BB810E086;
	Thu,  4 Dec 2025 11:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cXKYHKCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3361510E91C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 11:40:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2958db8ae4fso8672115ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Dec 2025 03:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764848429; x=1765453229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VOLP0XruPd1QOq3grXNaxKngGKdOYC2kF7NcMiuxQlI=;
 b=cXKYHKCBEjlXy7HJVjoNREJ43Zy+K/sBT5pLnqb5qzvzrxjSVhVfHhpkxWY6jxpbnU
 xuviJrnrkCAPMvK4r8z3DiF/FnClVDK5fasEnoUsnKd6+KIujKK8dBJ1EtBHF2xWeBqs
 LYkfUSRjYCetYcWIzuj6iDtiaQoA5qWxE2kmjdpVWWaFgWhwh+qyLyIRqV66+Wtbw46C
 UGgUM0BppWSu8NPr96VCp+HVoARa6nBFIWwDiXBwTeM9sk/u8B11UEjvrguvj1D4BCrX
 GVygc2lAAZvsdDKq92UMZNzzZCalthw9ufIoh8N/E3A3JAeVK6VnyDuAKoED97qOpXQb
 Ofwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764848429; x=1765453229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOLP0XruPd1QOq3grXNaxKngGKdOYC2kF7NcMiuxQlI=;
 b=DKIMgHhOiopoi/keFmuoTn9wFMKvlaQiJ/36bxI1QMkphsXegD2C+PA9X1b1sp+H8G
 u5YYREKJVMiPfCsmphsTLemYcr4mA/vl6izW7Tz9745VeDcR9qPvThaMDl22h+oC3fFz
 S5RrZBBkSqltd4Nh4Hvgy6R06ZgWgnSO9TGbs7TH+oS6Drw/mTwao0RG9kU/CPebaJRs
 CN2ui6PhBlMCy6lFns6zJIMMlZW3T6UkjPGKVfx9IXOHooKsP4HNDfe/1TjYBTnoYDgg
 7qkMfnfRQNRoopjFzzPSEsdi3wlqH5IkR/wH+gw/vlMKFeOVaSWKUaMW+sim9yWNg52E
 VLHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMeA3NghmH/s/XJroletMIVfFFZN7YBS0UV4HrZlLcZufQSzCuNGTQJfKS2it1YWVB3jbrUXfD3/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMA3TbjhBI6tQexwMn5d8CRc1D+p8lVThtsaDdf1oB3W0RF/Kk
 gjpMcEH/PeCkJNT5PidI+hJ9U6Vzm99sSjeug/1m5meSE+L2LXAwSKGt
X-Gm-Gg: ASbGnctF86OI2f2DiXyTlfOkLcWwqWjxwkw9gbmfpjO8IIScbbTMQOy1xdkAjvGhPVc
 TDVZBMZH5xTrBd/3T4AfoMqZLV7puv4BzX3pdGvYQ1+mqVv0JoKNJBMoFT7kKLrmmK3QE/rPf9R
 EN/QowbqYnL2WjXLxWTIdmcT3Q7EuMG4mdLbm7Np9eMsuv/O5vxkIA9P8BTYGPvnCV49Q/nDGTf
 P612Xdvjs4rp4yazKhqYvQOpXbPjId08AJAmMFhpoevaHkltWlKogpkuBOY/HlI3B3m1XZKZPNp
 NzJpyTL+sOEGtBEJDeUlmz6j7cIdg5WcEJ+E6fONTI9aJ28Uyi7m5fv415BJ6SdSt0V9e+JMJNs
 Sl5nOe2HVKnohcNyOgX3IKZG9UExGfuHL+CsB4zyCR6HXN2dThCjDlpwUCz/eNMKoRPc1iktvbX
 CuheShqBwTqiHT3pflzONaTqI=
X-Google-Smtp-Source: AGHT+IEOyFNQpZDBuG6E+IFuy81iiipGlnmTigN6oxFceckZ0M6BWW7ltYQKjSJV9ixoVX2TZKIuZQ==
X-Received: by 2002:a17:903:2d0:b0:298:60d5:d272 with SMTP id
 d9443c01a7336-29d682f4b2amr84735045ad.17.1764848429504; 
 Thu, 04 Dec 2025 03:40:29 -0800 (PST)
Received: from archlinux ([36.255.84.59]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeae6ad1sm17734215ad.90.2025.12.04.03.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 03:40:28 -0800 (PST)
From: Madhur Kumar <madhurkumar004@gmail.com>
To: lyude@redhat.com,
	dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Madhur Kumar <madhurkumar004@gmail.com>
Subject: [PATCH] drm/nouveau : refactor deprecated strcpy
Date: Thu,  4 Dec 2025 17:10:21 +0530
Message-ID: <20251204114021.36719-1-madhurkumar004@gmail.com>
X-Mailer: git-send-email 2.52.0
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

strcpy() has been deprecated because it performs no bounds checking on the
destination buffer, which can lead to buffer overflows. Use the safer
strscpy() instead.

Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 869d4335c0f4..100c7dff4ff8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -183,11 +183,11 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	fctx->context = drm->runl[chan->runlist].context_base + chan->chid;
 
 	if (chan == drm->cechan)
-		strcpy(fctx->name, "copy engine channel");
+		strscpy(fctx->name, "copy engine channel", sizeof(fctx->name));
 	else if (chan == drm->channel)
-		strcpy(fctx->name, "generic kernel channel");
+		strscpy(fctx->name, "generic kernel channel", sizeof(fctx->name));
 	else
-		strcpy(fctx->name, cli->name);
+		strscpy(fctx->name, cli->name, sizeof(fctx->name));
 
 	kref_init(&fctx->fence_ref);
 	if (!priv->uevent)
-- 
2.52.0

