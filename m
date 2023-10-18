Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B47CE39C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF8E10E419;
	Wed, 18 Oct 2023 17:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60FD10E411;
 Wed, 18 Oct 2023 17:06:18 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7a67bc84c87so22026139f.0; 
 Wed, 18 Oct 2023 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648778; x=1698253578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=m4O4ZVv7bp+ebdCgxlfNxfGzHx3xsBJaO/IV3yJ+A/Dfqi/50PD/RBPg+5nANtF3T9
 DWTeUSSKjjEfWeZl53T5YuVVEGl2tLP0NFsdBQdf5BIMl5F9QNFe53yLrL2NA2RD9vQm
 xUEgDFPVtpnxaKWQi69Xi3ZTisWuJKf49gbTyaJl7r0NSuRfW9U4sngD5swFl6JlApn3
 BaedF8jOabNi/rgGtp5vMkZGPT+NhQPNSSf4UeKttfbCmI3u0Tsc7WKL1WLMnww+gVkf
 joivEoYUPQ09gYTEqx40VHfUoD1BBnKN3tRpBzPi9nRec4wiDBVH5fXqb028n6Mh/B9U
 4vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648778; x=1698253578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=EnMgFcEfAXFv7pRYxaIEMD+wFEN4ITbeMoq3roNOOFsT5k3MmlyVjLFNhjxvonDC1P
 9RFNBT+5gl7+lNh8zHyEZrhmCsTbQ5J8o6GbCf5QY/8Jtre/WNjKBMayzz/6Xk8tKW/J
 2Gmqu2LHVUuZZjOEwxpuV99D2BleuW7w9WPipuEQ0oJIKkxxk/3WaXRgUvydH+fMKhnl
 1TfyHkuw52enQU42m2c8YFRbC+nW7mvHsqdwvvUCtBaOfxP3GNGN6f7Rx0pXzBeonfAJ
 BuZ9iLqwZYKDh/5E7+86qkQVT/b9NPlUmaIsgRy/pM5LljmATAPY0SdhYpkI44DG1s0T
 yC+w==
X-Gm-Message-State: AOJu0YxWrWgupwkosLK1QpYuh1xMK9dryX++l/mgrX/bbhC/EGsx4Beg
 BFXuoWAU3BIGW88REBu5SlI=
X-Google-Smtp-Source: AGHT+IHiPCmw3qmoMK7AeF6o0eJf+It/UBfoaChJE/QZZEZ5eOiSjJ85hXm9m0W3TLpYoiqoPplX+w==
X-Received: by 2002:a05:6602:2b81:b0:79f:cb49:f476 with SMTP id
 r1-20020a0566022b8100b0079fcb49f476mr7627926iov.21.1697648778066; 
 Wed, 18 Oct 2023 10:06:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 07/24] dyndbg: drop NUM_TYPE_ARRAY
Date: Wed, 18 Oct 2023 11:05:47 -0600
Message-ID: <20231018170604.569042-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
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

