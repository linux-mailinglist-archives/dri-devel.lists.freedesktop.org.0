Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7207C7459
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310E110E520;
	Thu, 12 Oct 2023 17:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B5510E533;
 Thu, 12 Oct 2023 17:21:54 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7a25040faffso51102739f.1; 
 Thu, 12 Oct 2023 10:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131314; x=1697736114; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=g2M6dEayscJGZNURO0g/0t3jI6Gl6jLVsDsGRxdMufEwIWa+uMR+Q/XFggC3Ilc6BW
 T12URoZ8vFRNi1BDo2/XkPlVOVOf2CZtfz2j6gfRNf/J6EDXks3gfv/JPsVWyLDquV51
 HZA91Us7151lT2PK1a9Z8THRkXdLhjwm4rF7CVqdkuLdD3EccIQhUg+z6WzfrMXUwcqW
 0LRrRFErhhDMG6yDUZRWdlOJSCeZ1uH0SguE46OYCg7JgO5ZXlWOsGnvO/R9cHb42RUb
 jdmieeyviMSHeGtbruewpuyHRKLp/UCuB0LqhSiAHMv6UeUyu/vNa3GDQ8+PqYQ5AhGz
 7zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131314; x=1697736114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
 b=wINn6oXMKJMH/5sM+Rr9GT0XWwTO9+7CtlJjGRP4I9u9mHSVuKHZG51czoqpgRLkZQ
 YjCWOIBdZedNnqL3mQa4ivfQDPs8EgiXu5C/ayB/smDaShHnfftiAQekzBYcQSyn5o7s
 KCFctT1wPeg4kN0dDHWx8HHk0rUyvHk2CtP20K/oFRtMQIw1P2goA4eYDIkRVIdKMqpl
 36JSzpYjLO6ibgtNsRmBGaPJ+wZ9fcUy6xGXJo3ccJSBuektRtT7vZH6hy9G1w6w5F36
 NOKzigxmMKQRRsfY7/2+49l1G6NkaAVFxbs+UoR5KNWVne5CNto7aEpEksGTNa6sQCsX
 0jow==
X-Gm-Message-State: AOJu0Yy/4f4q7PybTvkBvBMcMjS1QZTG50Yd1bpYE49nvO3LNZ2utMNK
 +NT/d7I2s4vGPOCHZyxX3eb4qV88GZcxdg==
X-Google-Smtp-Source: AGHT+IEV/Vrzy7GYGKStkhfIcOPZVQougajUarL/RjBl0TBZoeQlTnUSIKMli3EDdf3vdTIkew3RSg==
X-Received: by 2002:a6b:6f05:0:b0:795:183b:1e3 with SMTP id
 k5-20020a6b6f05000000b00795183b01e3mr27077153ioc.6.1697131314198; 
 Thu, 12 Oct 2023 10:21:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 07/25] dyndbg: drop NUM_TYPE_ARRAY
Date: Thu, 12 Oct 2023 11:21:18 -0600
Message-ID: <20231012172137.3286566-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
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

