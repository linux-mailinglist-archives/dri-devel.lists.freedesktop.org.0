Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E35F1DC3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2510E66A;
	Sat,  1 Oct 2022 16:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2A10E666
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abXRF2x6PmkkxgNipX/KKomtwvHsLuue5IHJHi8dXLg=;
 b=EA9Akj7loGtIIO716YAmF+QkdtnULYE+F+q6+Da2LAqRibMAcRaDjDJpf9ryzLUQVIVHbK
 /SxWR9AdVLo9AI6YEEDLr8bq4pR3637nv7+e4t2qOAsyhnvihJ6NlCgr2d+DJ4IaxustlQ
 t0ibY1EQVCQNTgDlk6MGLdASUhBD76E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-TPANuzdfPzmpBdTuMx3jhA-1; Sat, 01 Oct 2022 12:40:24 -0400
X-MC-Unique: TPANuzdfPzmpBdTuMx3jhA-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so5685262edb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=abXRF2x6PmkkxgNipX/KKomtwvHsLuue5IHJHi8dXLg=;
 b=Bndwlxv4bPbPk6xqHe5PhMpu4BpjmE25gxAVnfkHHXhcmsuvrQyt20THqRnGXBToyF
 ugB6+VwscNJOdLXgPpdEl/CfDof2OLTCMpxgsqN2FXHi8rG2J8ZMFlTfjwmddIhFNe4e
 2F3N89dv21REFD0Q/gdNeM2yFCg3GT9HFSrr0azJB5l+CkEgzkuUJNSn7DHBdUHUKLNz
 GLfYSaOytsP01ZKtjwuzoiuPMuuRpbGu5yZqbKOY1vJgquckxubnjzq0WVXqZaXSQrvs
 40E64VrT03BAQRgb2oyf6tYoYbaO7h6rBsPOHzIZ4TZweRRtzwhmEtramSc+ZCoBzu8s
 A0lA==
X-Gm-Message-State: ACrzQf0hve9/JpGe4qPxAMEQNWJvenF4I1MLG+jgYuubXWKzJYUqr4ba
 VNRPXVFDOjSwuCZkvbiV6iPH7WNK3u7wXea4OjeAdMxZOOgNj4qkGTN7N50u0a9YqEhr4lrLpzD
 ZH/DWCFPFzMp8vScwYJQoiYyAabIQ
X-Received: by 2002:aa7:c3d7:0:b0:457:e335:20a9 with SMTP id
 l23-20020aa7c3d7000000b00457e33520a9mr12146834edr.423.1664642422843; 
 Sat, 01 Oct 2022 09:40:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5c2q88b9WNyAEwkZN6tMyNNztnVJ4pVe2/TWskbOVxN+6Ua71UqSEuXJApBRk2W+5Mjn8+xw==
X-Received: by 2002:aa7:c3d7:0:b0:457:e335:20a9 with SMTP id
 l23-20020aa7c3d7000000b00457e33520a9mr12146827edr.423.1664642422703; 
 Sat, 01 Oct 2022 09:40:22 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 rp9-20020a170906d96900b0077fb63da010sm2907882ejb.114.2022.10.01.09.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:22 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 9/9] drm/arm/malidp: remove calls to
 drm_mode_config_cleanup()
Date: Sat,  1 Oct 2022 18:39:46 +0200
Message-Id: <20221001163946.534067-10-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001163946.534067-1-dakr@redhat.com>
References: <20221001163946.534067-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mode_config_init() simply calls drmm_mode_config_init(), hence
cleanup is automatically handled through registering
drm_mode_config_cleanup() with drmm_add_action_or_reset().

While at it, get rid of the deprecated drm_mode_config_init() and
replace it with drmm_mode_config_init() directly.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 8bb8e8d14461..ef6a9fc1c864 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -401,7 +401,9 @@ static int malidp_init(struct drm_device *drm)
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		goto out;
 
 	drm->mode_config.min_width = hwdev->min_line_size;
 	drm->mode_config.min_height = hwdev->min_line_size;
@@ -412,24 +414,16 @@ static int malidp_init(struct drm_device *drm)
 
 	ret = malidp_crtc_init(drm);
 	if (ret)
-		goto crtc_fail;
+		goto out;
 
 	ret = malidp_mw_connector_init(drm);
 	if (ret)
-		goto crtc_fail;
-
-	return 0;
+		goto out;
 
-crtc_fail:
-	drm_mode_config_cleanup(drm);
+out:
 	return ret;
 }
 
-static void malidp_fini(struct drm_device *drm)
-{
-	drm_mode_config_cleanup(drm);
-}
-
 static int malidp_irq_init(struct platform_device *pdev)
 {
 	int irq_de, irq_se, ret = 0;
@@ -879,7 +873,6 @@ static int malidp_bind(struct device *dev)
 bind_fail:
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-	malidp_fini(drm);
 query_hw_fail:
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
@@ -907,7 +900,6 @@ static void malidp_unbind(struct device *dev)
 	component_unbind_all(dev, drm);
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-	malidp_fini(drm);
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-- 
2.37.3

