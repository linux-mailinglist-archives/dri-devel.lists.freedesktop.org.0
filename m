Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E867530E94
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 13:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE16310EDB4;
	Mon, 23 May 2022 11:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11A410F093
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653305748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=esB4CG60KOiYCNvFLfupKrK3na9cJg7bNU5W1vo473k=;
 b=A5UOaWu0RGWuiRwQ8OBpNpW0DnTBXMFlJ8OwGjEG/6wXeGnotlE6mh3suMhSHC22IO70AT
 JkJT4hbjSLem1xaCsxl0ILN++MLviu76AYKM/kFfGZcWfGNxG1djXVRM9yJM8OQYn8Lh8i
 o4fwkZ8PUpS317HrwJUZa1GWgQ3Ysho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-i-rtPCBMOienVfnApBUNJw-1; Mon, 23 May 2022 07:35:45 -0400
X-MC-Unique: i-rtPCBMOienVfnApBUNJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l15-20020a05600c1d0f00b003973901d3b4so2674263wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 04:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esB4CG60KOiYCNvFLfupKrK3na9cJg7bNU5W1vo473k=;
 b=zbqFjuoZuPnuaSd9Fh89seizaGT/kiGJwmazQIoDAwuNTnkl1SENB8wu+MrIaJHPEF
 mZcfZhN3NcCWjnsEm3+gxjmGIw5gYAfLSGxjnoZynKgGcqReCzXAob1jPqSINyCJXXFZ
 toiP5ggDss9boHN3GarVnXdv4uAfLlr+UAqO5mR3noR+0oi744cOlzNgvcRFx0kfJc58
 Lq5b2+E5UquoAc3yfex5A0VZV7qFcZ5iBYLpDNn8PiDA7sfHl14C0HYcsVu17bLdWPK0
 fIO/VAa9n5cTS+X42Wbzq2RoA3Ps1oLQ0hKOvvs37DKrvpaM+P+3gGGjGGRhZZFjLW/5
 L+jA==
X-Gm-Message-State: AOAM530vk75zbBCLPTiMDWO8cTgZiQx6Rjp0qH4DeKvkdgD6R22w8/wk
 jG25a3k8sjaX1mhZi5bbqwn7GVA+36ybt/7fPfymQP8GQ/u7wHHjbPeJXb9SF1EeUQ21xvtq837
 aUma+IJl++utukTJiT5yXjR0rE+MM
X-Received: by 2002:a05:6000:1562:b0:20f:c999:fda7 with SMTP id
 2-20020a056000156200b0020fc999fda7mr8843867wrz.65.1653305743952; 
 Mon, 23 May 2022 04:35:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVT0wpZjAWWuYWqm00EefJbbozZgIflACNx9uqBlH4bB19uD4jcj1iQ0owk08/zmUDeBF02A==
X-Received: by 2002:a05:6000:1562:b0:20f:c999:fda7 with SMTP id
 2-20020a056000156200b0020fc999fda7mr8843843wrz.65.1653305743764; 
 Mon, 23 May 2022 04:35:43 -0700 (PDT)
Received: from fedora.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o16-20020adf8b90000000b0020fc3e24041sm7577841wra.106.2022.05.23.04.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 04:35:43 -0700 (PDT)
From: Mark Menzynski <mmenzyns@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/nouveau: clear output poll workers before
 nouveau_fbcon_destroy()
Date: Mon, 23 May 2022 13:35:41 +0200
Message-Id: <20220523113541.10562-1-mmenzyns@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mmenzyns@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Mark Menzynski <mmenzyns@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resources needed for output poll workers are destroyed in
nouveau_fbcon_fini() before output poll workers are cleared in
nouveau_display_fini(). This means there is a time between fbcon_fini()
and display_fini(), where if output poll happens, it crashes.

This patch introduces another output poll clearing before fbcon
resources are destroyed.

BUG: KASAN: use-after-free in
__drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
[drm_kms_helper]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 4f9b3aa5deda..5226323e55d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -39,6 +39,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_atomic.h>
@@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
 	if (!drm->fbcon)
 		return;
 
+	drm_kms_helper_poll_fini(dev);
 	nouveau_fbcon_accel_fini(dev);
 	nouveau_fbcon_destroy(dev, drm->fbcon);
 	kfree(drm->fbcon);
-- 
2.32.0

