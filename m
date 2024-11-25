Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3549D8CF2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 20:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C871C10E717;
	Mon, 25 Nov 2024 19:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cPpVeu7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A04110E717
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 19:49:07 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id
 d75a77b69052e-46695478d03so8543771cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 11:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732564146; x=1733168946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YnQPQy9QUMSA3qSC9VfWBW7KVkhU2YHo+3Vjavlz26Y=;
 b=cPpVeu7zkgaDTP8+58GgHcGsrxuUhkNP3lb3gOheb0vJRuDDNb49Gu5b6lR0JTwbg7
 16Mtgxl4sGynYCVJElMr8uFM1GxpG2nON8DB7O5kwPAYCoqq4COEdcfG7X8q4MUA85Cx
 wmidCfLjCyBROHq+xfwdzEjxKhhtetDixhhAk3eQehVAqHDZI2zrcAZR9okbttfx02ml
 LiGYjhI8f2y+KjCJjkDj4V9SOF9oC1vxXkSXYyum4UBuufqZU6trjjjr067r5lwdbj+f
 LIxJvmDBPTeG+S9biW5m/Kez8/JvB6mlIMFQuCou7APqH0RDSEUCl9ZMbU1NkkEc1OV7
 4Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732564146; x=1733168946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YnQPQy9QUMSA3qSC9VfWBW7KVkhU2YHo+3Vjavlz26Y=;
 b=RXWGVtBsokSIaUAZKv94ER0zGCVaLf5f1pjE3G68gdANdv5D0HdyDhZ8RWG/CApBNH
 k3kuwRRYKjDKBHY+WQg/lQsoy6Zdueomkgzix9b45YNIdgIvyly/oI9QfR4ZIf/4cTfP
 CXLQ+D4XUvT3Z4yUzvjg8kl8D4oHg/PJDGv0YYmNa/Ryj0rr2pjG4XxccWWVkFUIOURO
 htmNcpiTBmv5DHms7q4Tbvy4coTs50VAxoNBmAjWA37gwPhJ3T+dydk1SPSUPev2tQ7i
 0AOj9REsK8KCGzZ3/nWJQdeFbbfVbREcW6hQJ8uSoWjvIhOyrvUBnNRBjlckpI0I1oGQ
 +P0w==
X-Gm-Message-State: AOJu0YwFiZ+9SiSumaFOMhg1BwbBCyAtu9zpEbVlvuPTQFHPdY+i9vMm
 1c58+TMomOgB0QvuVR49cuLN8hbbEjDKlsKgBl6tXGbDhqgAG0Xw
X-Gm-Gg: ASbGncvwwvUg3LCtoxErelIOx/TWnIKpV4VY0ztwfSTkbkaKn22ggTqOdsnE2YauZL0
 msDmnS/hdOnzoYBqiOv19pIFQoJM3jyjVDPHylnZpQteWaUI68xFf9eavsY6Gf3wlWjjopu4ebE
 7VdO5WxsyGBfyobuGCLha7ydwbk8Khr0/Y1W5XqXJ34Yh8lyJszGZOTqUrHBIUrtLc1pQSDfR/n
 HSP/k46RKoqrEImip/yP+AxKwAqQjIF3qaNfDLs4hzb+9uFtfZbKywcC6zfvFzCyyBUTnNNpGJ8
 TwakPCw5Dr9izQrqEAEK+gYSu4zkdaW3t8cp
X-Google-Smtp-Source: AGHT+IGASnVlZTy8uOIIeLvm0VVgeI8MN7apGYPIXsgonX7l5aN8h7HkmTpP2xqHs+QhD2knS7irSw==
X-Received: by 2002:a05:622a:391:b0:461:17e6:2651 with SMTP id
 d75a77b69052e-4653d525977mr210750511cf.8.1732564146425; 
 Mon, 25 Nov 2024 11:49:06 -0800 (PST)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu.
 [130.126.255.54]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4653c3dc08dsm49025411cf.3.2024.11.25.11.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 11:49:05 -0800 (PST)
From: Gax-c <zichenxie0106@gmail.com>
To: oleksandr_andrushchenko@epam.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/xen-front: cast calculation to __u64 in
 xen_drm_drv_dumb_create()
Date: Mon, 25 Nov 2024 13:48:51 -0600
Message-Id: <20241125194850.14274-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply args->pitch and
args->height may lead to integer overflow. Add a cast to avoid it.

Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index aab79c5e34c2..639aad26f6c9 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -415,7 +415,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	 * For details also see drm_gem_handle_create
 	 */
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	obj = xen_drm_front_gem_create(dev, args->size);
 	if (IS_ERR(obj)) {
-- 
2.34.1

