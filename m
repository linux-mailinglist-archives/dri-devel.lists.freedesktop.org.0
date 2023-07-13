Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27567528A7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EF810E741;
	Thu, 13 Jul 2023 16:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459110E71D;
 Thu, 13 Jul 2023 16:36:53 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3463de183b0so3824035ab.2; 
 Thu, 13 Jul 2023 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266212; x=1691858212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwG/t09lzKH4vpOX7xC63yDDKsVGwGMxzSidRaMZ9O8=;
 b=oQz7jemHrr2XYquX8nZ71rGqBDKUEoAd0BxLMr4KRTp5s26+Z4cu/z5IZF2Ilth+Ng
 9zElvFOomGQr7F/GNf9vklrxL7z0IxTAZRQ3ML462AAB9DZQqnG1jfaDCwaPGo7JJJNK
 PA7RKvUQnNQtPGi94tU5a+EdJM2NKsvuQukeGidJ0PSwJiZ+kLu0k0MsFR9miZDdfz1I
 2WYBLOGALcUntkD1GMvL50jV0pY5oRxSWz4pYxiIdqySIExQONeHpi7B4YqT5MU6zPEA
 rsDA5zecbw6aI43/NFahUyRaXoqpf4j0ZMlc9HFmU12bWAuM5m+Cf60yPLSdB0lwhOZj
 S06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266212; x=1691858212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwG/t09lzKH4vpOX7xC63yDDKsVGwGMxzSidRaMZ9O8=;
 b=bz9zvmpx1ceuP9cXavITVIZqQnnRK/Dq4USUPJXqnHpYhZzhBf53ADWhirqDwypMlV
 aYGoQl2/eR039DFHip0ScooYf5zgFum2Ex9tf6j9JEv8MpujrY1QTPBZYb5lWcVslKU8
 YeLxroDHBV3yD8+kRBM2/6o4fMN0hZ73axwUobO7Wf16OsytTghUA826u05GzFbxxEmJ
 GWh+yPqjT0Y5x2Wu/FScbcYUo88MBAyJY1c4cfuL0YBhbe/ChEAX54z+N8HUMX5gGpqh
 WWpWdOEQQJioed3dPWbF1jfmu2Jm7fNYCJkQRDfgWfoXpCEpY9MIeWJIppEkdyRQ59Z4
 RBrg==
X-Gm-Message-State: ABy/qLbsV25ugQy3fEFf6SpFrqRufTrh/QIRjSvQMKvqJs5d9aoF8kvP
 kgTBmLzBZ3uaPM/AyIj7yhg=
X-Google-Smtp-Source: APBJJlHBQpk6ImGCiGbbiOxPVOnhPMDlVtaVfnNI9bAeTCH/L4kPF+ZUd0ZiUR2jyxFOdl4OiKgHIA==
X-Received: by 2002:a05:6e02:c32:b0:346:e96:7cbb with SMTP id
 q18-20020a056e020c3200b003460e967cbbmr1798401ilg.30.1689266212641; 
 Thu, 13 Jul 2023 09:36:52 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 07/21] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 13 Jul 2023 10:36:12 -0600
Message-ID: <20230713163626.31338-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
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

