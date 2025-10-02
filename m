Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8572BB31FA
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 10:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21DA10E077;
	Thu,  2 Oct 2025 08:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KN0A0P4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF510E0E0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 08:33:38 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-58984c363ceso1751402e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 01:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759394016; x=1759998816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rCnWTNE47EKUFdNbhO9xh7Mmv5d7MGU177iaBEqF0KQ=;
 b=KN0A0P4bJWcEiEODwbwXhn0h958zNupTJ/l3tdVFEBOP5zl3+s1mFmZnVC7oF6Ille
 A++rwKBQS8pOWzmq5zID9FMeNDZqorSpj+jl8bww2d1NFTUlIhMIl7BHK5m+axD+VfTm
 EgAqSTA+WZqtgsSlmO5T52znVM86x7R8CMTBrDO0iUCUH6UudhuEjbOORDypSjRLI03K
 Lz9lXuD+2CRzpk/hexdf8pXQ1iNvtoFxOgb8GBZzZuYQbXV1pHMjBIKK8iYFh1L3x7c1
 gbaYIdiP9OS3vjyA2sbaMwEzfCmnnP2KPANiDbI/ghdFbNOEGbNxXRhwqVS9ODRk2hqS
 PVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759394016; x=1759998816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCnWTNE47EKUFdNbhO9xh7Mmv5d7MGU177iaBEqF0KQ=;
 b=W4sRFIksFv0gUoOfodsRYFw/QQp0kDPXaooZEkhzRN22lrl/xghQfetueFuP1oQUVj
 hW+xPBhDcRCvMhL/mqJXhExJEguYPKfXqg0CmueCOs9ux3Gb8LG46KWau2Yfekq98Bbs
 mkhJnwXAfuDisABXiY0h/yylmMn0wyZoUtxqzIizZqQ9mKwsKUuNbgxnY6cMaI63wdTz
 bHlDecFOflTMK/i0VBd97T1cPaaFgCyS9lOjoZM0rE2D2BCMwdEkvmW2P+6uJw2rbWqL
 dt7r21GtAdA7OEe7bPmzNqjrukKdK5BfKDzBbn7hcjUB3oRAT2TToXqM3VVsBNfJ+fzP
 fcng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPhSzv0zV1kawPO3aHINT363r+SoToaamMDchRcv6+JPLQhbt0Y9rmoOxJGmcfSS7bJ2qoJZDsRv8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweijLVSgQNoKpQHKhTE1jMqKj9tjFqFBrITe3XeRAjbFOPUPRj
 fHCACAG6pvovNwEKVCQJkJDYsyXTum6EjQLKabEX7Ik9B8DNw9p0Irp4
X-Gm-Gg: ASbGncty+t5ab3gAS+As+2yYJ9jJRVSXvhQf25/GTHVRvfDb4rx07tP45pUb0+5/ATi
 FWMTJ+1zin1W6+Cp+q1ww7WUBRnrhBuE6eaI1OXoMZDHQShTDYWHZjsEDbVkx1YFvZH6o+Y0e5y
 DRTOlYOCGgRisi3Q1w7I/tVtWi179/RnT/LiAZ+xhC//aBqeqHnP8y53lRNzAPUNmRnF4kTztcK
 Of8Eobjmz59TFAIlJdSQgt1mmGaouxN7b9vdZ41u6jpVavO2jVOyxVqpZNhYGCvg8cc8vJjP/NY
 xuiW8lBEPuhUlKsFJ3MXAojOlx13nc4MT5cmrDAdZx9FdyCgpVCg/JUMrpJUXlRROt148zsq5Ox
 zUmIVbmsULpY3HwU1HWt8zWPUJA1u7JPwM8NwhnzPwFBizfq0uN42WKCmGo/YpdiQ+arRBOVdXl
 74KvX2dxXzban1B1wFQXPN9mDW+LhKcrknZKcWnm/N
X-Google-Smtp-Source: AGHT+IHjcjwtFqspT76BDrqWmxGqO8qvZJDfBRE/OUo2b+yHt06K2O/V4pEtvb4W9p4Ul/oCXQ8WRg==
X-Received: by 2002:a05:6512:401a:b0:58a:ff9b:2234 with SMTP id
 2adb3069b0e04-58b00b3d66amr894765e87.2.1759394016142; 
 Thu, 02 Oct 2025 01:33:36 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0114033dsm632852e87.53.2025.10.02.01.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 01:33:35 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH] gpu/drm/nouveau/nvif: fix a null dereference in
 nvif_client_ctor()
Date: Thu,  2 Oct 2025 11:33:30 +0300
Message-ID: <20251002083332.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Alexandr Sapozhnikov <alsp705@gmail.com>

If the name parameter can be NULL, then you should not do 
strncpy before checking name for NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 3a27245f467f..3cfe420b5156 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -69,7 +69,7 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 	} nop = {};
 	int ret;
 
-	strscpy_pad(args.name, name, sizeof(args.name));
+	strscpy_pad(args.name, name ? name : "nvifClient", sizeof(args.name));
 	ret = nvif_object_ctor(parent != client ? &parent->object : NULL,
 			       name ? name : "nvifClient", 0,
 			       NVIF_CLASS_CLIENT, &args, sizeof(args),
-- 
2.43.0

