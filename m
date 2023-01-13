Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE066A341
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AF110EAEE;
	Fri, 13 Jan 2023 19:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E616510EABB;
 Fri, 13 Jan 2023 19:30:48 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y205so6365199iof.0;
 Fri, 13 Jan 2023 11:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpVmv1h4fPy7xv9D1lk2U93L73H6vXkFF3YkrgZSyFU=;
 b=gFUquBpFFu+HxDwgXo2T7EYvrJWxXCrd1buhezZ09V2hbi5S1BKEdRMtdlhLOAkV6h
 CbplhtQMj3XxYm+uO9scNEFGWh2aBYnlDKwjfmx7FSV3CjXdyt5JaYzgnzr4BNRzCu/8
 5NdHHcLhPyaJCq2v5glPcalnBcf4QlnLw2MpnwmWdhjCVdneaDRkYuUWA95X6ts+D9PW
 VqvO5JmqXxi5U+aEfJWiKN1mel1MkAd939pDrEn8+rQnvfiDPXni5X3IBtN1XvL8hDmI
 FzQpFi6FmrIld0rYG6M09QnDte8qZp4AS3K3aJyNa1hv83c/39gnId7Czd6yKPLDyIvr
 PSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WpVmv1h4fPy7xv9D1lk2U93L73H6vXkFF3YkrgZSyFU=;
 b=G9kjCxkwDW8cYb4mzWINNWrlRP77AqHZm3zUJYaQXkTarq91bdtneLV7vSwudvUsBA
 PwG9ddNwexM5BWaQ3Vx+M+WMB4NpZRqlW6bsQzCeSPtdjUWuTGuIZepAfqbRAqsmA4Mv
 IFd9J/A6fxCVlgRazwkkGrZYQtBLtqImcN6XEZNmPd/7ivR5weGnpVA7dzmH4ZScsGXD
 Pi+lx0fOrXc6N9ZZhKaZAP8gNaicQNtUjQBclsEtQpX9f7vbBTn12RRk1YkLwWsEGnmS
 uBtYhIytU7uvXvl/KM8GbobzRO34nIOE2ZIOH1BZ1YPhRahiLO6vgh3t4S3xidLKvBKQ
 /DrQ==
X-Gm-Message-State: AFqh2kqBUIuoakwA0V7GAZHQ+u6Bx7eZ3G5HtOEOsPU9QlIk8J992M1G
 WpHp2/8HRyHAsgoUqbJoPgk=
X-Google-Smtp-Source: AMrXdXvn4tS2uVrgMipElARhcLYnJJmJiUsrVzXuu5YXxTVLwT5HxYgCx4hh/+ZwI64J3mnDtR0ncQ==
X-Received: by 2002:a5d:9801:0:b0:6e4:eab7:8c67 with SMTP id
 a1-20020a5d9801000000b006e4eab78c67mr53011199iol.14.1673638248128; 
 Fri, 13 Jan 2023 11:30:48 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:47 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/20] dyndbg: drop NUM_TYPE_ARRAY
Date: Fri, 13 Jan 2023 12:30:02 -0700
Message-Id: <20230113193016.749791-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
2.39.0

