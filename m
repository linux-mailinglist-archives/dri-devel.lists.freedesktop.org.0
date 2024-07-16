Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09A9330DA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9460010E82E;
	Tue, 16 Jul 2024 18:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L23nUUxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853CB10E841;
 Tue, 16 Jul 2024 18:58:29 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-7eee7728b00so5285439f.3; 
 Tue, 16 Jul 2024 11:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156309; x=1721761109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvLBNvSR6x2dFu6EXQC/pHFuGqsHWoHN3dOHeNiP27s=;
 b=L23nUUxQwBRf9kGCKiuIBPfYDO8eJ7fbi0Oc5myhhxOY3nyrZWFS/+Th8KqQOAL3AQ
 G0JvmhZqq6E8zYm9/5pTFCxxZRrwHZ+uPZcTRH5oCdw0WQwa2OCTsJP5oZAUN+JMEKSj
 pAaqKC4wmyamx4yyq2+4zTd1Y45v3/7xiQ12NTmE0dnHfAnowprmx6Hj9ZftEzFaE108
 5hRsJAh806V2UglY3MuLOpAjppOeVgt+Kue3Pm6UNKMTp50viV6tTrWlWUKuSc5rYik7
 1875Abalbi1CXGllt4v0lEB2y1zUxehzqDro+uREm9TZFTtSt+6zbEjjDhJKtJzOQrnA
 cnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156309; x=1721761109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvLBNvSR6x2dFu6EXQC/pHFuGqsHWoHN3dOHeNiP27s=;
 b=qMVhKfjdPzBVY72nUuDaXc6dGWOO8A9sQP3tcRvcNRGDQHq1gFl1oxNfl3GKK930WH
 9H3AFR/XYu58waoWlrUTY7PzhtNk2i6AOm91+wXJQj6j/h0MrjC1i2A5df0Ed+giiPVX
 /XtJBHHW9YmvFOUZgkDhsqsVi4n+kzgByql9z5tLoNyqZhTLuM4xLGArCHQ/I6IYEcCR
 aFiM4StBOfFjeBIYXn3015T7N7kOPE7OqOrqPFufs/8m2P5vpZXgZY9TWcbW18tQQRlG
 8hpSpK8dLMmmzImHFpUX0J9dzTsjm8+dGZzQlT532lU/UvwfDOCHVlizOLFGfe7QLest
 9Z2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNqmvsxin72zUMsCY5KW/fJY61w+63ApKBgwnHp2SyRxr9+9i8SrxdWWEjPN1Rf+GVs45lG15Fvw7euJVcEo1WkCusTJ32YuaIniFZ0Cm6KGOcokBs8h1wGuPtZRwmTb5B+MDDJU340uK5QC+5bH+r0vAnZtOY8c88bfeB72andQcsZctfGhjaSnJEZPQxQMHY0p6FCYBhryAm94WRNbGnPftnZEQVCweOpXYoeUPcNe69fno=
X-Gm-Message-State: AOJu0YxTXbia3YhibLgSf2QjubvS7uEmOh7orOo9QJMdlgbqLNPA1rrd
 P2Zx3hd5PoJb0/u5Q5HqfV1iN0dUPsQoFBVSle1smhhW2pe2/HOT
X-Google-Smtp-Source: AGHT+IGpNXIDlFHBUcOjDfaz0mC3FKPHX1JcD+bIso8rqUAdibcBvxkqUwoIZnd4OgAitjHBItH6jA==
X-Received: by 2002:a05:6602:6d0e:b0:7f6:83da:dd12 with SMTP id
 ca18e2360f4ac-816c52c0398mr41748139f.11.1721156308751; 
 Tue, 16 Jul 2024 11:58:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 08/54] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue, 16 Jul 2024 12:57:20 -0600
Message-ID: <20240716185806.1572048-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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
index 2b0057058ecf..e458d4b838ac 100644
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
2.45.2

