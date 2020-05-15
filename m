Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5011D4A18
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821A96EC5A;
	Fri, 15 May 2020 09:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659A16EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l18so2795818wrn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3gtOJfa2YZz/FqZXXwOZAucaU5gEqRStJz3hrmVJMU=;
 b=TE84JCbErXdjPh7jCtfphunyTTcvE6p1lGojqnajL72wM/ZXU+CgXBRIGG1G8S3LIS
 3rRS9Mdg+mbKKBnzx/UpNwDgQl5Z22m1C00zzJ4Pm18vLkf59v17q8x+WrYk4NCpB9Ls
 TtzMjpsVnasoBtg2d17slfecyvr9Lpx/cG7r+d6MFtjfYIHA8C+tDtBlXGsyT5PsDV+B
 Xb3l7xjX0UUB8JRQoFdqedVB8pUFDpCtwNQtevFykcu4VBLrpXnEb50gghjpvzAcCA4l
 BRrIwjuh9uOYvhc6dv72AxKD8JWemdzIAuf0+kdaaVsOu3xacDyrQogRi//mgoQG6A2H
 4xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P3gtOJfa2YZz/FqZXXwOZAucaU5gEqRStJz3hrmVJMU=;
 b=Tbj2otKviy2tQOqqdMLhrhyTmbRam7FeGDK9sO3+wRLjmsLgxqwjgA+Qko49XKUN/N
 lws4TfinVJwoRo3y6wWjlL1rM6dOBw8xkUwpVe1vcIbojVbJVPscqXZ1iNxVpx65GSd8
 hIPuCedzd4caGONDBqGZiPHfM9ou6Akli/Rj04sXnEiihswnZgRIZtSjg1TGDT0OphHJ
 whDJcFGYcvwo0CRW5dY3FTAu+MUy/LoFzTLVCIrV/L+2a0K+6IGmVLfAEVTYMF+T1FwG
 SF/JPnv3YhtB1JWk9K8e3n1uBLZSFSLCUE8p23C0tIwZC4pmFyZhEGCvblbU2+7JPGz8
 oqgA==
X-Gm-Message-State: AOAM530nGGecQt1IsGI4LruxBZjEdYSz0aKShX19Ssre3j1V66WCd4ep
 udXFEAA5rcIQ4onRZO8PHRxSCj4Y
X-Google-Smtp-Source: ABdhPJz0lK1oUGp3qbQzbxgiDZOZ0rXqSEWgyuRU9Gk9qX9N4ivTK2oL2JFwgdaFIx4iYSVP98J48w==
X-Received: by 2002:adf:9d91:: with SMTP id p17mr3244654wre.119.1589536484735; 
 Fri, 15 May 2020 02:54:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:44 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 37/38] drm/xen: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:17 +0100
Message-Id: <20200515095118.2743122-38-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, emil.l.velikov@gmail.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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

Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1fd458e877ca..3e660fb111b3 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -419,7 +419,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 		goto fail_handle;
 
 	/* Drop reference from allocate - handle holds it now */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return 0;
 
 fail_handle:
@@ -427,7 +427,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 				   xen_drm_front_dbuf_to_cookie(obj));
 fail_backend:
 	/* drop reference from allocate */
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 fail:
 	DRM_ERROR("Failed to create dumb buffer: %d\n", ret);
 	return ret;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
