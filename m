Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1F79AC39
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A92510E1FF;
	Mon, 11 Sep 2023 23:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99D410E1E0;
 Mon, 11 Sep 2023 23:08:50 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-34f359949afso16193885ab.1; 
 Mon, 11 Sep 2023 16:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473730; x=1695078530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=c914skkTKD6EL3+rC7YCOf+82UVH72V6NdLqeTRd+wcGZR8pxxpRO8xj4/MWiidEH4
 Gy9G5c9d+6zsBMtAnjyB2X3F24qKnRcJHP/Ej+Xwhf3B4/GMeuf8RMlVX++V9kaNd7Ty
 ngcD6liESEYBM+Yip3nfibMaSMX7YlLQt8zG4K90v6vcxsW+Kp3reWQBkc8yyV9B3BoL
 GT4MGMMF30KQkTKbTROJKSyqDcRLQw4f4pxEQujXpE1/8CdBZvfONM14ddPn6/abgcD3
 MpvNuO63ytwYCpmbTPHsG2Cg/pWbYoq4wt0lLdTLUJ4Nz9EbWOaS4EOsl89Fj9AzA1SG
 oP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473730; x=1695078530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=tLvoQrQiyC5WGwjq/y6uRPWmW7j0SIPFp80frZT/izAj3vVnE7064A6+7RlW51MG0s
 3hm6r516x371DkmpCF0++MuUtANKrzYXSoy2PSPVP8k5jB5Fsj5fTkRFy79oSV3q+J/+
 tuHicQxVJLiaHUxoWEmoFPvnMPHTdsOs4vO9vZAuxN6SpmO0izwRWCM6u7M2wXPTrPx7
 uW/I2r/Hz3fCkgf8TT+8PTAGiO6AbfTBwOzL8Y1peIfqkKWhgGAJYipnLv0YAfhSwZPB
 GupE5U/m85+L53RyQUALTU5Zgh4j7da6cmsOBRaivrZkekmqwqkqqrx+Vi25U3MeY7Ra
 0vCQ==
X-Gm-Message-State: AOJu0YwA5n+GqrpNiUUTT7Jq2jBt09bWDK5Wtfoml6qho5gJTbioSgZ0
 R8CudnqtcyZKa4rbfdBM3HZFosbAEkoHHA==
X-Google-Smtp-Source: AGHT+IGw9roeHaTtQyntmQ3xkyrxGL7naAB4H6rnS/E49+h4wJE5jfxNNoP6S5fKLhiwQwEVXDx5rg==
X-Received: by 2002:a05:6e02:20cc:b0:34c:e84b:4c5c with SMTP id
 12-20020a056e0220cc00b0034ce84b4c5cmr13702891ilq.27.1694473729966; 
 Mon, 11 Sep 2023 16:08:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:08:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 06/22] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon, 11 Sep 2023 17:08:22 -0600
Message-ID: <20230911230838.14461-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b53217e4b711..8116d0a0d33a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -106,11 +106,9 @@ struct ddebug_class_map {
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
2.41.0

