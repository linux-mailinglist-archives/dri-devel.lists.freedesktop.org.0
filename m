Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69491D4A12
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA30189798;
	Fri, 15 May 2020 09:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4C26EC4F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 50so2752272wrc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9KaeRqZl4451HA4G/q1pCxkOJiAUpEliJAh03Golzf0=;
 b=XkQsWQazQj7pyqXKcnR6eN6Mrpyja6/4aM1Xe8o+3bcUYpASkoNRdHqBy6NujlBtej
 +m0b98ZG6ZiP/suaeCLZxMTl8QK1p2YDPMCuJXTaOwMMRLeOQVBbm0Hlt08fLw7DuXF5
 nER80OR+RdWSJ6S/8Tj0nGqyEtx+7sISQImGOnpyQb/FXVE/IwAScqyYEz+iXE1GPqzO
 cAtHDAzwjQinnx4KtBzjpDBWUqKo3zDdAuyrOiX+LbUsw2F6Wd6e3aq0ErBH9DypzwJm
 CJj5ILLZjcb4mzitxDPtdY/5gJnQ/DkyLlaEFkkpWGFaofJkAwzgwIW1YSXfgbvItAqf
 8DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KaeRqZl4451HA4G/q1pCxkOJiAUpEliJAh03Golzf0=;
 b=qGyf2aD+o3uT2XNdVGPLwp+uqxg42/sYteBgq2vCPzb7WaGWc5Kl5Z65s8cNv6lbSB
 49QRX275JgRt42a5BuueIwQLQBthN/sddMNXaMj1OP7TZ3vtMKbYFWhF7z3GgQSL0cvJ
 qt6TySsmN5gQlmEXfzB0a7PqI9Qaj9/2TQQV5hRWVn2zZocftaKrByQeWJloiFDR2RYP
 l2di4LTi+10lpdUsy1oCu/RirH3HZzQO0eB8QRf0uwrb05RCmeA6XYr4LSSMJFQlyvAf
 imwg1/bWdLS26X+OrexaUnRycVBy1pKArjLNWbjV7suOayT5vgmqdV9yGBue02r76Fwv
 p5Ug==
X-Gm-Message-State: AOAM530ADyC7SfPbRr3bpSCaE0BkM1YAVxjWR24PyuWAL6OGnDtBo+ZT
 eYOyhwiWTexu4x1QEDRpoDO6GAdK
X-Google-Smtp-Source: ABdhPJxPxMm/XfV2PxLVDQfFH9pPtPAxkkovo9OZUlJH0AzulnSQpyNHOkfmWI1LNKRHtYREUkKaiA==
X-Received: by 2002:adf:e802:: with SMTP id o2mr3333374wrm.110.1589536483612; 
 Fri, 15 May 2020 02:54:43 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:43 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 36/38] drm/vkms: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:16 +0100
Message-Id: <20200515095118.2743122-37-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, emil.l.velikov@gmail.com,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

v2:
 - Rebase

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
---
 drivers/gpu/drm/vkms/vkms_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index c541fec57566..a017fc59905e 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -141,7 +141,7 @@ int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
 	args->size = gem_obj->size;
 	args->pitch = pitch;
 
-	drm_gem_object_put_unlocked(gem_obj);
+	drm_gem_object_put(gem_obj);
 
 	DRM_DEBUG_DRIVER("Created object of size %lld\n", size);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
