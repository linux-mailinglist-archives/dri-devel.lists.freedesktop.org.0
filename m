Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E511B84C26
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BD910E8A1;
	Thu, 18 Sep 2025 13:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="acapf04V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D787510E6FE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 10:57:30 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-77dedf198d4so63018b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758193050; x=1758797850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o8fD1CQqjJUvOAUt7m+V26PDaC5fPrsIK+KI3nVmRl8=;
 b=acapf04Vj6rqQ62QDjbd1WXRkxbFCexbd9lLHD+ZU/XlXv0z2PzwdwGvgGealyZPR3
 En8THiZfb4oL9EYZTZcVC+62Tn2k8D7Q2ns5F26f34sbswL25yMe1YPiKe0WOw2f6aZh
 p0KR0dMc+/iGSZFL48vZtmJK/ajAjKy3TeHYJIuohKy4NR8MKcJzcNxO5swUkLeeEJck
 vNtfKe08zaKVKkNgOC/koCDT/AItgu1DZBOS76Jw9OtukD4JGldJyCOy+88ORXYlsq+Q
 V6EtXUg5k3t2e84j5rumVGtWqPHy3tHffCAolasqNYV3UUqEBDRp7xW/FRsF/Ww1AqmA
 4jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758193050; x=1758797850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o8fD1CQqjJUvOAUt7m+V26PDaC5fPrsIK+KI3nVmRl8=;
 b=KgImN4nGonv043LdZS2uXZPpUzPlc2uYE8kuwKIKlHWXg8eTnwe/kYhO7KE6a0wNOZ
 9hzVPTbComcaD3x5CVrXYOu6m6+t1gJzSL4l82sGrqgizWMxNo/QyZgWxJGJwB1c9o5G
 xyOKDj7bFePfDtuocDY33BlkdCZDlSGZhXBElknMswbtjzs9Oov3Y78VTJp88SDAf9JP
 NLibEA2EfEVnpHi8KschR9ajm7gW3Oeh2NV09REy/TJW6/ZlKbWNHa7j8oID53XpeRlz
 SMCx97Lkssior/8cat4Av2fZF3uUKDjeaqlu6akk1KXhT/70Lszyh7OZziw8ZmfngJ0O
 1bZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHJB8zsOzZW9HxYtrFfpa8sFgJ6NP1DK7dOjrAALv3EGB6a/KZG++DDJjVsn1Ij1MP3Uy8hlLmmQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWCYN3/ekZTaic8oy/lPl7wel7bfx9jqQrWkvQlk0SedKU3ZZ3
 I46RO7xZjlyatUgbiSKtZVTRYkdvhLEfhfafmyPaVIz/4hz4E1DgbNNc
X-Gm-Gg: ASbGncvJIoMwYLTtO7pxqgQm2bVZISdaQ8Usa3MocQ/pvsAm1tfiM0nCoGQbRVxORml
 xQbs3NolywjIpzffrVLvpelponzWrZeGtuRbhWhCgrwCGNZElMP7kek+yNosMgd3nq0vXA5TLZf
 f+I+f91utnCeIygE8AVt71+i4UkIeQzjig+vOaVhq7YUeUnK3anRXW8b0q9tbn9FIe5jNWbLrEp
 I+5mmfB8TpePxWXBMFGiJi8TtIwa9vDkSZX5Zznyhd4wVwZpAn8A3wHPsyUo+22PfZGbJ8sn079
 VeR3nwdkbEKX/wFxiED1Ntyt1A7tg93myQhjDZG0Mwvn+q6Qlu6O9t4OkuqKe8uw/1AuGXFD0i5
 YCcTAkPwPOhPt/3eBcRdV0r6hVlq7t9atwRhO6gkPg+vhrWAAjw==
X-Google-Smtp-Source: AGHT+IHJVja8HNkuglOhZxfUAvb71rTHrEahoyXZo6qnEi+bdQYnLOPRyp4BgI/iBJSnqYyXbwrbzw==
X-Received: by 2002:a05:6a00:92a8:b0:776:4eba:de33 with SMTP id
 d2e1a72fcca58-77bf7cbf514mr7097558b3a.14.1758193050346; 
 Thu, 18 Sep 2025 03:57:30 -0700 (PDT)
Received: from lgs.. ([223.80.110.60]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfc34078asm2071491b3a.35.2025.09.18.03.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 03:57:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guangshuo Li <lgs201920130244@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] drm/amdgpu/atom: Check kcalloc() for WS buffer in
 amdgpu_atom_execute_table_locked()
Date: Thu, 18 Sep 2025 18:57:05 +0800
Message-ID: <20250918105705.3480495-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Sep 2025 13:15:15 +0000
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

kcalloc() may fail. When WS is non-zero and allocation fails, ectx.ws
remains NULL while ectx.ws_size is set, leading to a potential NULL
pointer dereference in atom_get_src_int() when accessing WS entries.

Return -ENOMEM on allocation failure to avoid the NULL dereference.

Fixes: 6396bb221514 ("treewide: kzalloc() -> kcalloc()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 82a02f831951..bed3083f317b 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1247,9 +1247,9 @@ static int amdgpu_atom_execute_table_locked(struct atom_context *ctx, int index,
 	if (ws) {
 		ectx.ws = kcalloc(4, ws, GFP_KERNEL);
 		if (!ectx.ws) {
-        	ret = -ENOMEM;
-        	goto free;
-        }
+			ret = -ENOMEM;
+			goto free;
+		}
 		ectx.ws_size = ws;
 	} else {
 		ectx.ws = NULL;
-- 
2.43.0

