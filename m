Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B1643A3C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AF110E2F9;
	Tue,  6 Dec 2022 00:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59DD10E2D4;
 Tue,  6 Dec 2022 00:35:04 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z144so4477588iof.3;
 Mon, 05 Dec 2022 16:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqHcG8IoVHCeAot1jnlaRtsmWaAjiGKlPaDXWaVNPkE=;
 b=A7/mvKMv6LDl78r2Rj9xCkoZIwaeMy/ak9988vd6t5HDbBlwgk4bnRXzsudLAya22e
 haZhic/e+DQ6ZU/O2o3COuZA+Tzcadp58eb9SsftWKK6LUK10YF3WSh9dCW/OLAGGozu
 VAE1G/L8wXaH4sZsupUAL0tB3cmyIK+vpVcmF+NHT2Y+9GDML0mztfJz9MxRvv4TMQN4
 T/IeL73CFbxzkW0yRaI7gJpfPyQrpCS0yPDp213t+4jJNtEeXs06wc0Hx5SxdQ1QfUiE
 K43T7/O2AaYd/OcJZZ6D1mOnXsinMxcOzmdaih4LwfQFT4iaO4ZskuIC19ZKqCH2ZR7S
 54JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqHcG8IoVHCeAot1jnlaRtsmWaAjiGKlPaDXWaVNPkE=;
 b=KXBz9paYltOkRWfn3rjejIYswHm2rsDTSuDj6GXnQNvy47YoY9rK+FRkbif2k+fhkK
 QWUmZytvvZdAjML7AX/xbnCBbDVBeicsKxRcPabqvUPXCgkWozwI/pknmgnxOr9g4sf7
 JihH/sqDViYRSRvUhs1PlLNlwkaD06VDR3bCqCCO3KxZzYkvssM5lRQarhp9gxOXJrr+
 R24LX/IPbakMR0UlT/S7aE9IEshOQFrMZfb8yjDED1xvXNDgGUd1EWuTBL388vATWTPl
 9OygaStKM0IRGA2ER/8/unJNoQ3UxE+zCLn5l0pT43u6w9cvYDdEwlkpLQthFkkayP8C
 ZBSw==
X-Gm-Message-State: ANoB5pmNMULVhmFp/hauo1LDeKcIGTzWvGubhRTCe8k2Zs9zVWx1rdyC
 c8zhQkMkH15PH5shlznnx5M=
X-Google-Smtp-Source: AA0mqf6ta4lRaVtAryCiD4AXOuuI/qROZfTtCI3fA7lbb5hI7xxbgG9Jg0K0wH37Zdga/RopadHZZQ==
X-Received: by 2002:a5d:954c:0:b0:6e0:17f6:4c2a with SMTP id
 a12-20020a5d954c000000b006e017f64c2amr2157044ios.129.1670286904403; 
 Mon, 05 Dec 2022 16:35:04 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 07/17] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon,  5 Dec 2022 17:34:14 -0700
Message-Id: <20221206003424.592078-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARRAY_SIZE works here, since array decl is complete.

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
2.38.1

