Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAD367396
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632CB6E9E4;
	Wed, 21 Apr 2021 19:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77B6E9E5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:42:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id p6so35824622wrn.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+9YyDbXYbo/3ZkbS9vnMcM6O6QITgJOco3N63Yjdcu4=;
 b=R5lT7KlW09JoVMcjFqoMiMID8trNeIRJeuiU5SI2eCwg8yStG0uKB3CAvFRsEDB7Ci
 OifXxx3vlT3J5HEQLE8b6o7AVDH3tE0ev8kyNbSeDu/1Pd0z6Dec2fusd8ZGHJRYJv48
 9mFO/Lhg0/oz5Ka0TdMCVuW3LAwDLS4kcLpmX9wiQPD10lGwPNaaPzuqhmeVsbsSCET0
 CN3rsDYR4E7sJBLry/q7foKe3J45lE8YqxzUOy/Av12h5UnQmYIPGlpUQRR7rp2t9h0r
 oVzEP5mVg49yI8BXpCmUc+DIBZTX2P+Fcn5z07G84fY/mLrOoLdErASE0V1FvlNobCOz
 L13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+9YyDbXYbo/3ZkbS9vnMcM6O6QITgJOco3N63Yjdcu4=;
 b=hZbKDQ6sYMtaW+XI+Rea2zYCowuaXHgQH1ZGCap6Lrg9iUXYaAZogSgF8Du1JYeW7n
 KZ48xNd8np1JML8+7kC48K8znKBwlK0rOgBmDTNy2wknXvooEBJQ8rhoqmtPdVvpAlH6
 TL88Dq3Ww686EPfcnuWSfTXH5D+6sw4krXiliu24FO8pS3AyQNm6xlHx92b/0WkF4fpU
 yvR9sDXlH15+l+YxvRgMdTHRFQ6XiV8Gfo7XXYbFxiVeSBigfq2iYPTxuAIJxb4nJqxT
 oBzUjeRD/8H2UMDCxCYL29NbacyN0PEqrdoQOZehNzZ4FHL35FhS7zUHqY5b5rfi1aL5
 E3YA==
X-Gm-Message-State: AOAM533hFCn+f7j2MHQs5YstzrBhpmpioL2gJNrAijToX5xi4pD2S53X
 PmP7NQcHdnEFpaiOVswpllY=
X-Google-Smtp-Source: ABdhPJx59Ihii72tQbBOF8SKCYEdKYUyDEqSZFT+yDTqevDePXP9MKA20iQzUl8vP/Wbv45uB2Y7TA==
X-Received: by 2002:a05:6000:186d:: with SMTP id
 d13mr29115281wri.199.1619034177847; 
 Wed, 21 Apr 2021 12:42:57 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 o4sm484163wrn.81.2021.04.21.12.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:42:55 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 3/3] drm: drm_connector.c: Use tabs for code indents
Date: Wed, 21 Apr 2021 20:42:49 +0100
Message-Id: <0200474fbdb1149856308bccb8e467415f0b3d99.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove space and use tabs for indent the code to follow the
Linux kernel coding conventions.
Problem found by checkpatch

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_connector.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..38600c3a6ab2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1958,11 +1958,11 @@ int drm_connector_set_path_property(struct drm_connector *connector,
 	int ret;
 
 	ret = drm_property_replace_global_blob(dev,
-	                                       &connector->path_blob_ptr,
-	                                       strlen(path) + 1,
-	                                       path,
-	                                       &connector->base,
-	                                       dev->mode_config.path_property);
+					       &connector->path_blob_ptr,
+					       strlen(path) + 1,
+					       path,
+					       &connector->base,
+					       dev->mode_config.path_property);
 	return ret;
 }
 EXPORT_SYMBOL(drm_connector_set_path_property);
@@ -1988,11 +1988,11 @@ int drm_connector_set_tile_property(struct drm_connector *connector)
 
 	if (!connector->has_tile) {
 		ret  = drm_property_replace_global_blob(dev,
-		                                        &connector->tile_blob_ptr,
-		                                        0,
-		                                        NULL,
-		                                        &connector->base,
-		                                        dev->mode_config.tile_property);
+							&connector->tile_blob_ptr,
+							0,
+							NULL,
+							&connector->base,
+							dev->mode_config.tile_property);
 		return ret;
 	}
 
@@ -2003,11 +2003,11 @@ int drm_connector_set_tile_property(struct drm_connector *connector)
 		 connector->tile_h_size, connector->tile_v_size);
 
 	ret = drm_property_replace_global_blob(dev,
-	                                       &connector->tile_blob_ptr,
-	                                       strlen(tile) + 1,
-	                                       tile,
-	                                       &connector->base,
-	                                       dev->mode_config.tile_property);
+					       &connector->tile_blob_ptr,
+					       strlen(tile) + 1,
+					       tile,
+					       &connector->base,
+					       dev->mode_config.tile_property);
 	return ret;
 }
 EXPORT_SYMBOL(drm_connector_set_tile_property);
@@ -2076,10 +2076,10 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 
 	ret = drm_property_replace_global_blob(dev,
 					       &connector->edid_blob_ptr,
-	                                       size,
-	                                       edid,
-	                                       &connector->base,
-	                                       dev->mode_config.edid_property);
+					       size,
+					       edid,
+					       &connector->base,
+					       dev->mode_config.edid_property);
 	if (ret)
 		return ret;
 	return drm_connector_set_tile_property(connector);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
