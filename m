Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB176C107
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42EE10E459;
	Tue,  1 Aug 2023 23:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8690510E447
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:28 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3491516c4aeso10934535ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932928; x=1691537728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwG/t09lzKH4vpOX7xC63yDDKsVGwGMxzSidRaMZ9O8=;
 b=eGS6cq3MWQw8UfxiMb7+jObChSpBc0CJRoPyxDapyV3ASRLoPTwM3Tl7VNSAL2tYDc
 XSFpfhicqXNSh5F1/PTg+sGr1R0hnMMeywr2QDKOSsNgfrhACsHK+1KfjBMbt5rikSmk
 bvwjIInrfEsq2qsm224gcibq8kQ+LHtvuaruyTYsFWiZ8vMJxdWGYMU7sJFzlSNzFV1d
 MPyCLyzbdIWatR1h5YomYRj0QUiUM4CldAdrNfoYaJ+fWUO9zX5ameATzifKGtu6e6Ho
 ylKIU3+E2GpnUn1dn7uNaN7R3Q4qpT7qFScjXmn9FlMuNL9Hh+ufdCMhAML2MNQpDioY
 KPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932928; x=1691537728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwG/t09lzKH4vpOX7xC63yDDKsVGwGMxzSidRaMZ9O8=;
 b=a67SPGumP2/XwZfiIAf8u9Qlan/wGubRLGswEURbI7m4ulAYshFpmQINY2DKDQnBzb
 ncVkTEyRkQPhZMxh41DRwBCL4FvtQNhiUwT8/Kd74vjb9+sfScIUe6YvT8nHb0sxFfYa
 xgWZ/47N/5YnC9aY66AE69JFLH9vcU+mGlxL63z/5nJTS8Sz8mMCC9JeBhkL8I9tzAaT
 8RAA4RGexDxO7qQc9VfDeqfsjU2nPYnjILVOVrPOBGbsFMPGpMM3Kv5UWOXdROzH9Ozb
 jpVY2OxcdTQ+OJmkCrZRQdtL5U51cbqX5cn/VCQ2O064Qcq6+YFFlaSg5WZ8unWKjCkT
 8cdg==
X-Gm-Message-State: ABy/qLaT7uiXwks3OyaBq64khHGGQLjS2JObguSkt5Y9ZTX432ged+9U
 6FL0mF4tJokT5iopyTgFU3M=
X-Google-Smtp-Source: APBJJlHspFX8eYn6LPTB6+4ZNTDYmaFA8Ls8p1zQUa0ukEHs0nPtpxzH+LfF9bZMLfH1mjctvwd4Cw==
X-Received: by 2002:a92:c213:0:b0:348:eb44:2a30 with SMTP id
 j19-20020a92c213000000b00348eb442a30mr12015475ilo.15.1690932927791; 
 Tue, 01 Aug 2023 16:35:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/23] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue,  1 Aug 2023 17:34:53 -0600
Message-ID: <20230801233515.166971-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 596d0664c29f..719c5b6ad0f9 100644
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
2.41.0

