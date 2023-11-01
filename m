Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCEA7DD9E2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2AD10E606;
	Wed,  1 Nov 2023 00:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6598910E5E3;
 Wed,  1 Nov 2023 00:26:27 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-35942cb9ef4so690995ab.3; 
 Tue, 31 Oct 2023 17:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798386; x=1699403186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=eGBG0cssa5i0mIAS+OAqadQc9a/V8Li3olZWui3izu7pBlBnKzLS8vcD6WscwTriP7
 bZP9TbO1vT0CTiVLhwItldXF5S0cNIy8SLQ1IkiOSEP4kXhk47tWlacczSuZecW4atVc
 AyIiXxdgsLeldOuU0tJpq9M+yv8hdKMbcR92MoUj1b8ZGxndy1KUEr8ySSuiYZLjV2kd
 k9ZL+E2lzZ4xTTt+cOxUr4SOV/p1hBFC4zA/I8LvROokKHAU+ZthxszsIjdQdFrjwPoZ
 zkxBnfVpCqE2Tt/6JjL2SC4Ur3DUQXcmabL/T+g/a3EcJzccI0SXmemc6phG/ueGU0Tt
 2kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798386; x=1699403186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=VWQejZ63yYYz5ZIoqB/Oqv2ON70tYfThlMzyCDHESdyBISHZAAFDTTcN7p2r2ezzwN
 TWZ801amiXplF87CVHx/IJ2iQKCjupq+Hs+FJdRfdbNwOOk0WOslAfVphZ1nj8ExvB43
 8iOveXupw+dqdQQUQXwXVKBuEFZ2jbMGasybc9SlagLqBbXe03jvUWhXBJuXNt6aD7Yq
 lj8TJdZNHnQ24vkVAP2uaGMNrD4+viHDaN+yIbn3Y+ptMGJJv2DPHApOai7+yewUWI6W
 /FvrR3Y80FEasuGeE/7ssDokovtboZNk1iBC/5TIgm63cOy60QLIz0ZsovBf7BFXCb62
 Fp/g==
X-Gm-Message-State: AOJu0YzFEt6QJlajLEJeQFlZHOubluJUUKTsjmQ+DPtRP4DE28LtEbL3
 2yFZ1GaKsYV4q7rdUCfihS0=
X-Google-Smtp-Source: AGHT+IGW/P6Lyy1k1xploc5OiJyydd9ZuaB2/mgYqrBD+pI+YXg4B1s3psMImKHRBlH7Jvw3Omhuow==
X-Received: by 2002:a05:6e02:3888:b0:359:4199:1fe2 with SMTP id
 cn8-20020a056e02388800b0035941991fe2mr965074ilb.8.1698798386644; 
 Tue, 31 Oct 2023 17:26:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 07/23] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue, 31 Oct 2023 18:25:53 -0600
Message-ID: <20231101002609.3533731-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
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

