Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C876F3CC236
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825E6EA41;
	Sat, 17 Jul 2021 09:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F4D6E85D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 09:55:35 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id p9so6159074pjl.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EfwNnmG3nadYMoYKwSu2Tqh1mqtnnX08edBT4GksTV0=;
 b=YhF0Z+ayXSjn14J1p6k8AESlv+ie5i1Zqo052Eib9F5ri0SmEDT0VeL8NYjML6QVLY
 sHkEnTj/Tm0WC4b+zfTZS8S1oDqtr3e5TnaiHentYB8JvjRAfGSPrvBsotwj4AhbZKbi
 ti6EGG5UcZ+YYg40ksbLfhYqi+vjPSzK/KEB4vLFNCF/55TQbVvmKRm/s/AkEDO9okT7
 /92yjMwoMEPA/qk231WlNhnDFWRPtlnveVYYa1jv64g2P2ZJt285WH2U6HeACchaa/9Q
 e4N3uzlxpIHRzr18z7a90ZgLVFxo71roKlNjC+Pk2fa7QqMzCNo3q4G2NXiU3TW8V8Im
 Rpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EfwNnmG3nadYMoYKwSu2Tqh1mqtnnX08edBT4GksTV0=;
 b=aXnjw+3dtwYV7UQwbuQ7+/JQfOAfqCHfQLQnzmu3+zZwfaa67pL9TSWhDOntTLU3n+
 jEms4NwADX0O+8xgXmOLKfNCH54lQHG5wsx7bP8sxhqeeaY336Wxf/AeOW+bNLiEuRYS
 bTHlPvVpKwRzkIE8nDge4456m2sytsEkSQZFXBbKwoGG5ehyKMMKr7nmeOdnxjCYLYmm
 zJhJ777pDortmCUZ29fhyd4KEL+Rwu5PNChMpzUjrrql4IXSxkrG1P/8EFB2rprDOXrg
 nW1Rkk9Ii/yJNv3bG5kMJJcaRaFvXh4N5Owf3pdPi2NSBYPUB9VOSOOaYHVl/qvWtbYV
 W7HQ==
X-Gm-Message-State: AOAM533pZvLK+sIz7Wgwu1dRGLQE+AeGWf5/TS1s5K99DqchfnQ3Ienw
 UGQnOR65Hrcnwar/8VAGHUQ=
X-Google-Smtp-Source: ABdhPJzY4WxyHDB5+BnSodKS5TIp7w7afQDmtRX0l09Vdd0q4XVJey8UlE3Hdpw4lSdyzK8ESFtY8A==
X-Received: by 2002:a17:90a:6a01:: with SMTP id
 t1mr9191171pjj.10.1626429335606; 
 Fri, 16 Jul 2021 02:55:35 -0700 (PDT)
Received: from localhost.localdomain ([52.175.51.83])
 by smtp.gmail.com with ESMTPSA id f31sm10633851pgm.1.2021.07.16.02.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 02:55:35 -0700 (PDT)
From: ainux.wang@gmail.com
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 ainux.wang@gmail.com
Subject: [PATCH] drm/ast: Return value when do not get edid
Date: Fri, 16 Jul 2021 17:55:22 +0800
Message-Id: <20210716095522.27187-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
X-Mailman-Approved-At: Sat, 17 Jul 2021 09:35:00 +0000
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Ainux.Wang" <ainux.wang@gmail.com>

There is should a status when do not get edid.

Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e5996ae03c49..05df48b3d223 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1231,8 +1231,10 @@ static int ast_get_modes(struct drm_connector *connector)
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
 		return ret;
-	} else
+	} else {
 		drm_connector_update_edid_property(&ast_connector->base, NULL);
+		return -ENXIO;
+	}
 	return 0;
 }
 
-- 
2.18.1

