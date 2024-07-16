Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54589933100
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BB210E852;
	Tue, 16 Jul 2024 18:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YQNxYeb6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DCE10E82A;
 Tue, 16 Jul 2024 18:58:55 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-8076708e8ffso5027839f.0; 
 Tue, 16 Jul 2024 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156335; x=1721761135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXTp2HWUUrTrRl4eZ7svqhTsXgDwW8WuleRWg/xTtcY=;
 b=YQNxYeb6c4/F6/Z0u+yxP+GH9RDc+2VGYl96+XQCOpZp6lSyWsbfFraqqd7OphK4O6
 yAfEo134x0nbBXSPHSLj4FT6v8XYehH2Wi7kMKOgIlz8eijoVDYKGQTccraguZmjiDFi
 tU9s0Lkn6y0dl4SCBnN8DF/UGNfwMNld+doMfpNOMP0z4UkCecg76tUkqNwf/ghvz5YV
 fR6BLegHeTJaqxvSK5Hs8UU78FOtEtkXObOVBLW4S5wfq6vqCKPWusPq/+2iiOe6sWun
 jxvmr0tdwxK6gHSTeqAwY110L55J/krBh6k8VbHjh6Z/jJ4WK9f2ChSJhHjlggKmtuqY
 IAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156335; x=1721761135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mXTp2HWUUrTrRl4eZ7svqhTsXgDwW8WuleRWg/xTtcY=;
 b=gxE5x4Wsc89VAQM82gPuwWe99mij5upuSqEgaFHag07bDoEIsXiCoBA1k395Dgqvcj
 XJifIAtcQ9sLYupqnFGYJ8NGs8SHbQYmoGoMwmKN+pToc6FAZ1Hk9hfqiZb1vEU27VDa
 lFH0TE0a6tKm3prf9W9vbj1LrJvunyKla8H9F1G6Ajzb25zQfxEfK5gZgK2TD60gJgw/
 wpiDVhPKhgzbPhxfpxBrtHBOxyUq/qppL0JKceqwmXt5Nj/YyA0kO7INFFLDHSOYglBc
 w7m2YwQeXpoCEErkZobjn8yVKq2W3A6NKR/npx96u6QJSyDTaDsUD1eE7UsJLOx9GKhk
 jPCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ldwqFFMNUmu34oWIXRU/5IIK7T1WP619jaKRBA5KxLtjFfSUAFXZdHn8rC4WbcWxfGMFhcbsjQCRxDtc5DiesvJxZZMMKvwTIH1sTj+2Z8A38BIteweRGnSqI/jNzmudtW3NF9T5VLIKTkMyB3AOnOvpR4Pnp39E2uonG3qtO4Q5mJRj8I/cyHZXiY3JW33pjvlOgeW4hhkXCUx8e/qhs1gx4Cis4mYeFDZWuH+XE2ryH4s=
X-Gm-Message-State: AOJu0Yz8IHWZeqhbQuKX4z/qs/vev7SqPtYnExcGzh3PyuQaV3KpM2+J
 2PFjxD5QVY2m/mBBZebfhYDO/X5Lg+Lvh2r1ufq6JauAYrgLbJys
X-Google-Smtp-Source: AGHT+IH2C/cO4EXdioXS3mRKkhPmm4/Juz5I1U0b++x+rWSnGrySgsdsPc6Js5tCOzBXgxSZ2aDSeA==
X-Received: by 2002:a05:6602:3ce:b0:7fb:790c:a317 with SMTP id
 ca18e2360f4ac-816c32c9ademr47925339f.6.1721156334626; 
 Tue, 16 Jul 2024 11:58:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:54 -0700 (PDT)
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
Subject: [PATCH v9-resend 23/54] docs/dyndbg: explain new delimiters: comma,
 percent
Date: Tue, 16 Jul 2024 12:57:35 -0600
Message-ID: <20240716185806.1572048-24-jim.cromie@gmail.com>
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

Add mention of comma and percent delimiters into the respective
paragraphs describing their equivalents: space and newline.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst        | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 742eb4230c6e..7b570f29ae98 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -73,16 +73,18 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
@@ -104,7 +106,6 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
 A match specification is a keyword, which selects the attribute of
 the callsite to be compared, and a value to compare against.  Possible
 keywords are:::
@@ -128,7 +129,6 @@ keywords are:::
   ``line-range`` cannot contain space, e.g.
   "1-30" is valid range but "1 - 30" is not.
 
-
 The meanings of each keyword are:
 
 func
@@ -153,9 +153,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
+
+    Examples::
 
-	module sunrpc
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
-- 
2.45.2

