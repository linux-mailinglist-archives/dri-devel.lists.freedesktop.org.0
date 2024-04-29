Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE98B6233
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE53310FF90;
	Mon, 29 Apr 2024 19:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzanFpJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE72010FF69;
 Mon, 29 Apr 2024 19:32:23 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7da09662332so160165739f.0; 
 Mon, 29 Apr 2024 12:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419143; x=1715023943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Q95ZqInWMJScwhR6tUig8g54EU3c/DeR371Oq/AShg=;
 b=dzanFpJMAKnUKQ6S+iCvlXh6NObK+5M7B8fsD7iYzatztGs3iqhQIYDTeSQfJy1vrX
 HU3FavB9r0wDBvIevDU9Q3Cc+Q9TZSUsH05QSJEzDyVs8Ctwbty0sOpHrPf+yg8Ysm2x
 Dl7qfZ50pGEV5QR1PYbDJu3mGfgqvCRVqWOpCRo8/5f/sUGmPEiY6+wlfYwXFT166ZeZ
 sPZTzixZ/muw+WjEKj7MNkS1XKv112i277u4MyACVqDDuOCgr59qM2G3jbvfV/O4HpLL
 c8dCjR4igSAoJbuZobKijynKtL72BMbe4tf+gXLqFAVGpCm5L2Y3ukOYxu+Pl9sORj7f
 yADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419143; x=1715023943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Q95ZqInWMJScwhR6tUig8g54EU3c/DeR371Oq/AShg=;
 b=j9GCTHAqIkh2048LQPYN8v2rYYn6v55f3a99oz88k/DgkDiOBM92TpMlTe3Jbi/e0M
 sGXSSKog0A/J8RnXWlSgCYhwlzKTmrtEV/9HOJgJzNfH2bCcraP/QrGxD3EM8uVVRU3T
 Vk3fpOQZrLH/mPV70wAXzpUmKieZAHCHzkkP32Tapa/HI2rjYmpt+Yzz2SkRxICY03t3
 1GPo6JP17SvxDzDwrFsi908v4VEgU93H8tkoha03/YJYl2zkPCF6vuOQo3y+B7Vhabwg
 fQ2Js3fRh9VY/jPX345nUPPcZOovN/K5d0f9xZyDrXh+MbkZrMqJpuOtBxcD24WhLmAy
 4FHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Bkmk1Pzt0C+XCPKVXFSx3t7k34aFoGO6iAxj/zvDeLKKCBo+adGVz7GcBkX40I7ibtwHGmb+pRpxIjdC6wU9dPUuHxYz/gdQC6EEFFIQ74JX63u9wXyJWMNEuv3yg7rxyc8OPHbSnWRDRvHQUA3zQwvcc75mAkJrTmj6TeUiFxex+B36NgoHh4gRax9U7dPDe3Dxbksh6akKMplLkVM4kYbpoBKs9LNj0hmyqWS002vHlgQ=
X-Gm-Message-State: AOJu0YyM0PihuuP3YDxWJtbnfz8Mq88imxxoBjRhYLRMk2opmdM1JCL+
 rNo/irL9trZUCzsfk4ZmQb06SUsMXgggM+fiFyIz1vYXvjr/1jB9
X-Google-Smtp-Source: AGHT+IEwf2ZOietSarGxhgNapmV9HHXQqyjB2l54hQBuI85VhrBNeK1Sv3TWDlSimrU15tCjgcdXXw==
X-Received: by 2002:a05:6602:1d54:b0:7de:7b1:2e60 with SMTP id
 hi20-20020a0566021d5400b007de07b12e60mr579359iob.6.1714419143108; 
 Mon, 29 Apr 2024 12:32:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 dq18-20020a0566021b9200b007d5ec9b77aesm5988402iob.51.2024.04.29.12.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:32:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 09/35] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon, 29 Apr 2024 13:31:19 -0600
Message-ID: <20240429193145.66543-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193145.66543-1-jim.cromie@gmail.com>
References: <20240429193145.66543-1-jim.cromie@gmail.com>
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
2.44.0

