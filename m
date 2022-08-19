Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13759A543
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C94E10F587;
	Fri, 19 Aug 2022 18:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CC010E289
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:24:23 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id n125so5262056vsc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+PvdRmnLM5kLGna2OvRIJUtGxiVqc+OqOxNYNZz+DdI=;
 b=WymJejHKAoj1bHfSY8cK94WZTAX56g+JKuZMEDOixc9qtaQF/FtBEskM6CnmNLHVHD
 XAsXK5wxeCb+3KXmfqKOTOMBQ7wWyO9i/NMs6peMC/42YMghXtCunwjI5CyUFQYvvFXF
 qsjlBEaO0XJYZhU4jES0aeYriDs0jXbk6oJARu+piqsC3ZSXmpqWbHKjVIjmIBAtrYQE
 F1pyvWj23Oo9Pqb9LJ3f254HeSaMVyB0BSfFe2WBW/Yqd/H2qeWeZH0RPVzf4UNgdQi8
 IMru+Rrxt85CDtFW/DLnScS4+Z9+d3biseov60MgVwNdhEydoYLDDlx3gglpof4pGf4x
 F/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+PvdRmnLM5kLGna2OvRIJUtGxiVqc+OqOxNYNZz+DdI=;
 b=4TJV/g1VQCgH2CyJfRemYNWcu3ZpOXfkeRVG3JxK8ws3n1vqL/MBpchWSF73uqZvz+
 IfpIz7IFF9igZc+pqqtewPMNXeemMJ+ERyFwEAI2L2YC+e4N93HbZg8WlMW/1B1NFScO
 5Yr9sV8GJu66qr1YqnY1FIaHchuYoOZNPxfwrddBLCO3AtyU9o8bk5Kcfj4SmJzbtbKf
 pKdLbkmSv+7bZWfNGEN/4bk8mdXtP59mFj5Fisl5wg5Fc0tWUXyOPWMe/mFgcm/X5uKC
 g3DFw/I5RLxkMa4iIS1XSkDaUNp5M3IZPFTRmS5+HMseeWNf9s35JPnwjYAkisTOgA8G
 A4dg==
X-Gm-Message-State: ACgBeo1JGvBWFNENWywWOVc0nqT9kiiVgVCiHs1xsu39sSBJuDJ1yFlW
 3y1+CIKCfF9aE1XcU/QP5xw=
X-Google-Smtp-Source: AA6agR7/8+nbHUc0Gub46uDynwsnlSwdoD0WPjpNhYSVknqWfaVDupdsdZ6vaQQf9wMVeOBXHyFaIg==
X-Received: by 2002:a05:6102:3fa2:b0:383:ac6b:73fa with SMTP id
 o34-20020a0561023fa200b00383ac6b73famr3570267vsv.49.1660933462088; 
 Fri, 19 Aug 2022 11:24:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a67fa16000000b003901ef5d148sm1990349vsq.6.2022.08.19.11.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 11:24:21 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [RESEND v6 1/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Fri, 19 Aug 2022 15:24:03 -0300
Message-Id: <20220819182411.20246-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819182411.20246-1-igormtorrente@gmail.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
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
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 91e63b12f60f..36fbab5989d1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -30,7 +30,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct iosys_map map[4];
+	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

