Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0889B429BE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972F410E0E2;
	Wed,  3 Sep 2025 19:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ciY97D3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D42610E0E2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 19:21:40 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7704f3c46ceso236731b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756927300; x=1757532100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=DBIcDNX+xCHFfbh4zBaxGqDtwHNN/sHrxYwH+z/LwHU=;
 b=ciY97D3WmBaAXaxzft6Gcp8+81Trgwt4mq/4t7caAAiQYho+h5CsQoqTu/NqaxPQz7
 Ekp9sU3YTwt2GGDXLqFiVsowtB0jlSLFFAFDeY1mtKeQuG0f75a+jHMhXIcPhkz9ctru
 ofPbnTDt1VpsnbYiY9KCk0rfwT09LcMimuX7Kw1Qvqll9A6BLUO06QEzO3nCb+M43fxf
 bXdzNrvlHMdR3ML0zycQfZYiwq0nxdRlUnVdEH2t5cZ4voq2RYK3kcoj3e5CsH6HdCqu
 l9szJh0ZGiBpigltr8lzoSRx6xGJ/FeyPUnhGyYnyK1sPhL29i3gQ4Bu5sCrnquLW6hq
 jDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756927300; x=1757532100;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DBIcDNX+xCHFfbh4zBaxGqDtwHNN/sHrxYwH+z/LwHU=;
 b=wrH+eVpwXq6Vag4nniD86fnSylbRPYBI/IhXh+CeKQBYcpc+ACilsZd2l1F8180/GV
 DCO4nwY/WakYXHKEirD0hkdNX+3sYimz01xzBxAPF7AlM6GNaYH73FFgB9Yu77hIsaiH
 mrivJe/PpqJoLbHN3EJ622HhIxQ/j9OgEkOGTAN9XyhqcGIrmCBiGdAuxGkoO87qn+Ht
 lWf2jinYYuVgXftHaIU3DdzFuJM131mt7PGdzBKLXOxr8uVxG8mDwzsygWMvGnGvocDA
 Z755BjE/plM6nAHN3V1wmlrSndPh43ZIXRD6vZS8DVOFG0WoAliRpg1JdM1RjILbOWtb
 eXAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuFwX7oGZMFvtiF/KgF2PlLISYDwKyxg2z3OAguDM+M/R+lxQL4IbDvGComlwnQhGNC9HNdT5P2Yg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrHEHdK7onDf3N/WaC9yjBJswQc+LisBGYeYTSm74q+gPE2IaL
 sAjBBp3GqJWA1D2POwgG/JLJ4iT7wzWYbUtGZg5E4cS8kgX/xITURnYO
X-Gm-Gg: ASbGnctWLsp87Ria/xpiA4Ui84IvKP9TPJt//TUYm4BfphPqWzGmH9DarclFcDfMwpz
 cDiiE0IdfcTy/Xnj0LOq/7N1bJHV8lirCFR5t35rStUFLHyuYDJ/TF9wruMuiPevUrMgeqN03VV
 hsOzL3yQETazZ5wOiZkMv0osJiF9YFWgHtjqm4bfavBKO7GVaAuNctYAaYcsy28bwqogVLfdj9K
 uAIDa1j+nB3+P19bluCoeEJAYKbFFy0Gj/w2SNRtJ9SkwYuL6NuPKf33KCMjM1Wny2tMWfQrGR5
 N+jRexE+7GqUbvqBUEcBdyas/4nObBkXy8Wj69m/S3EI0gZBMtqb8005ELy4Dbxd2/XPZT6z6sS
 AD74xgEg5lV6W+SFaGMOluy4dVcBpxeTyi0saPL3olcjTmEajJfv347V8qOCmUuCCHY2MA6fGRn
 e/+V0xpFoayq8gHRUt787I
X-Google-Smtp-Source: AGHT+IHkUA0mvnPsSgAVcR0DWhFOtjq0L19JNHkwKaF4QEsd4iWX2t/nKLi2cu2yEzfKlnG22mmhUw==
X-Received: by 2002:a05:6a20:3ca3:b0:243:d1bd:fbca with SMTP id
 adf61e73a8af0-243d6dd4e0bmr22695905637.2.1756927299624; 
 Wed, 03 Sep 2025 12:21:39 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7723f4858e6sm13840352b3a.4.2025.09.03.12.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 12:21:39 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: validate group queue count
Date: Wed,  3 Sep 2025 12:21:33 -0700
Message-ID: <20250903192133.288477-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
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

A panthor group can have at most MAX_CS_PER_CSG panthor queues.

Fixes: 4bdca11507928 ("drm/panthor: Add the driver frontend block")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # v1
Reviewed-by: Steven Price <steven.price@arm.com>

---
v2:
 - move validation up to panthor_ioctl_group_create
 - add Fixes tag
---
 drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9256806eb6623..4c202fc5ce050 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1094,7 +1094,7 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 	struct drm_panthor_queue_create *queue_args;
 	int ret;
 
-	if (!args->queues.count)
+	if (!args->queues.count || args->queues.count > MAX_CS_PER_CSG)
 		return -EINVAL;
 
 	ret = PANTHOR_UOBJ_GET_ARRAY(queue_args, &args->queues);
-- 
2.51.0.338.gd7d06c2dae-goog

