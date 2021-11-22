Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6974595BE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BB589CF3;
	Mon, 22 Nov 2021 19:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD7089CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:24 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id j14so29107521uan.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4h5zssoprQVwUD/a+0iu7NgShrwtvdhuvMV0VoWpIVI=;
 b=TA/ButnDcdAREK1hiNg40XyG/uz+bmZU4ZjZnN064r41beIoMh82WKv77itPl4f8pX
 01XfGOasRlNNuMEGL0FFSQ/PEwHhX8au6VQI6BPse4ANM1+1sGwZeXUGVqwo5e2wtMn/
 SGKc6sqpdxmeiFDSyUJ5Sn6U1VllDI2l+GDofpUKwUEjusCmwHeaPxZlHttJy4Q1kyAT
 EfWkMxMhP5O9OUfKLBCh8iWQu02E/IJIvptb5GIzCZ1HjxCwUqDttPH7iFLU53af/1Va
 xafvC1k+4Y6FaTnugyfbGaHPcQjk4vyLf/GZbNNvbrd2qnDWebQVzv+Mx2UcW6ZfgZug
 SvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4h5zssoprQVwUD/a+0iu7NgShrwtvdhuvMV0VoWpIVI=;
 b=ROAdKQXLdxdrDax/gzqBIHkIHhT/KeuP/3vUyJtpfMs2L6lTTjVyk3xN2fhck5KoYI
 QSj+pk+8q/q4yjsHho0JyQZ3BtoCJ4u6sy4vQMZgp2CjsUIpeisakVHoV0V5mKEnlu3q
 PqQ1w0VswjWn4gkZzx9B7U2+79qW7UTPdqFZIuUG3RmVMMrAihBNpaIx/pY5pJtcQyF5
 0xdSjkxMn2x2FA42QjuCa5o7fxTn+48ORg3jr/d49sigeJRAYg23hvzRXb3WIyFtKyK3
 Ua8xrjlHALVKNlBRQmV9qyFgV9u5Ew1BkTyFaY9eqooRbCaes7prtnxgTBLt2MkKTwVe
 PORQ==
X-Gm-Message-State: AOAM532AObAJbDawZxZIHu5hKm3bXdRQf2RowYGZYcnNyIzt/zpD+7FX
 vXi4Jy4Cdqm3nY/XFQLqJ0xfhqUv5SM=
X-Google-Smtp-Source: ABdhPJyZ796R5Rb6F3jLDyHbr2AM65aVhCNJVEYupAjn02lQtpO7Wvqjv8PlSc1hBNQkv/rCh+oDEg==
X-Received: by 2002:a05:6102:3ed4:: with SMTP id
 n20mr134961528vsv.57.1637610263831; 
 Mon, 22 Nov 2021 11:44:23 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:23 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 3/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Mon, 22 Nov 2021 16:43:54 -0300
Message-Id: <20211122194400.30836-4-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122194400.30836-1-igormtorrente@gmail.com>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index d48c23d40ce5..64e62993b06f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -28,7 +28,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct dma_buf_map map[4];
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

