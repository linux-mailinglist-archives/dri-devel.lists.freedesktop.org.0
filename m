Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A367BCDA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7216C10E869;
	Wed, 25 Jan 2023 20:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB53010E168;
 Wed, 25 Jan 2023 20:38:04 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id g15so16838ild.3;
 Wed, 25 Jan 2023 12:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RODNscjc/Rt2ZTSAcIwz/VoCR1rWE14Nx64cYwURel8=;
 b=iVUOqYzgJAMBp/vKcsOc/3dxzpTDj3YIoTkV3FTVQEPVPzyeOtbyzfEfGyIyRj5RYx
 4IQs2cPzx9CeQDiOcgp5WRitwoC/kRoOzCf6wADx84e8pIC4/Y+wjhabjvqSpcZea4OB
 KQWsCGRTnw70X9M9hpaBiEvZOS091NZV/egtGkzcF2CmI/UmUQ5RxpeCxpyCHucaoyo4
 3t6KmdAfFWEIotvswSf54UX/sv32sKnlwsF7bxUghIIje8H8BxLIJ+Z0A2xcafwiEFxV
 zMx6PwNNNYKpdY1DMjJQsav/a0vkNbxSPXyxxtKqWKtF20mpFHtzDBRcpB64GWqmXUt7
 eIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RODNscjc/Rt2ZTSAcIwz/VoCR1rWE14Nx64cYwURel8=;
 b=XzV4aciayi9lMHILERRfNosxrJ+iouFWiFPOTZbzzhzPFBCvxf7+myIsO7LCLxQTXd
 OKIOSjm+Dutu6rfB+ztfsAcA+Z1D7qZhrqBMb49sW4ZZJY0exeqbN93RPmdCqppTS7Qf
 lgtA5XB4kdntfj3RVlyncVhHTSFSpliVpQ/AYfeIseOlukdssCSifiMtxDahwcLCJst9
 4hBRo2zB5Thg7MgQtFEzll3Ln/QJwpqwzr4aPJQxvoT7gSjttZevd1qXIN8LMkqtqif9
 DhMmfuRMtbQkMYsCgGSAovpEmZMExo/6MSiK+L53ee97uUbAnxhCl6tS/BvuVfGU4eWz
 fthw==
X-Gm-Message-State: AFqh2kq7fROe3hF5rIHW7oyKrai/eCId/Jp0aJsMS037qxhfHtlDst4m
 6mIcEcN39cGRlyIKSFOEmSU=
X-Google-Smtp-Source: AMrXdXtdLLHNja8c10Pzwty2Gj1lQ6vwVCeNim0SzN6sX2Qpcc44eemPLvtkfADILpBvoa4cu9/12w==
X-Received: by 2002:a05:6e02:1aab:b0:30e:f07b:84ac with SMTP id
 l11-20020a056e021aab00b0030ef07b84acmr38533727ilv.19.1674679083872; 
 Wed, 25 Jan 2023 12:38:03 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 06/19] dyndbg: drop NUM_TYPE_ARRAY
Date: Wed, 25 Jan 2023 13:37:30 -0700
Message-Id: <20230125203743.564009-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index bf47bcfad8e6..81b643ab7f6e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -104,11 +104,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.39.1

