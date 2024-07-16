Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5003A9330FA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 20:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4BE10E850;
	Tue, 16 Jul 2024 18:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XfQldDIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1804410E835;
 Tue, 16 Jul 2024 18:58:59 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7fe8d029fbeso5422539f.3; 
 Tue, 16 Jul 2024 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156338; x=1721761138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/7VuWci/fAdciTJrLUpogyH7arPQhCiQPPhJCx3EJc=;
 b=XfQldDIf6t2WiNTJlUJkT6VIsi4ijSU3SUjjPp13XUv+CvhnnXpw8FBC1HpQ/+ZQJb
 7jsbqnqErkPKu0sqnmvZa5YYC9SCCv3nSo2eHdhaITN5FDjJBMt5iRziVg77ikvdY+zB
 w8LxOXB0UbzHUePH8dwleACWwcCx1BMm/XBy20UyK/chKnhhSSRVmZHTxo+YKwVg5NxA
 7sh0Q3Vv7OA+Aexh61bYkZAXapMknVVZ/MFkLl2d70yhkUE2EiNZfTxiL9+iWyhlz5Oq
 13+7L54t8iW65RH2IpvBNH0lxLiz4q2EsqdUzkn1P5Qbwc3l0wC8ycMvDCoYQoXlXfK3
 ufSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156338; x=1721761138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/7VuWci/fAdciTJrLUpogyH7arPQhCiQPPhJCx3EJc=;
 b=U4PeH/ejWLNYnhUVKwJ3IUQ7z3zaULRsdbl+2ojRFfk956CLEJ+1mf8C0j+e3Gk6u0
 isehk9wElfg8/ZjjnbWXFy/tluZy/1pVRzgGf43GumIYZ3anSGzUMGGl7WVYR3mltoUF
 zkOtVZFX1zjldbOIj8TWUZpOqTTfY2UZm+2p+sEHGV6Mro7hX2JOCZrFaWgc9DDzHYS5
 cGFTZ+xA2N107uy9Myxdqw8won2B9D337qSO+yPDWogTTfLKwOsOLnjKWKQ1OsyUCgAC
 Nlx856QsJANomvm+656y0cInHlRglEWNPaPakUS2fwHLawVB7AleZFdtONMO8kJ9iHHk
 JYNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO19l3PznSGz+wMuw3K9xcT/qh7vnZw/uvQT3OweO9Aa05+lT9j9AfNOonzWnK+ul39n+KCMLPI3hq+KbgKoTmIWDbTAMytiSRaoArMFFP6Ec3OiauyZxOE60ALjUWJnQ/9Lus/cCwmxFMnunOtbN4GBDouKX/P8SBGLUxGt0I9JKRFeXN9CUFsmIba5khhX8lLhONctoy5rzca8XVw6Sc0V1z/J9kX21GmNSkhfTsZ27EVFY=
X-Gm-Message-State: AOJu0YwrMUc6DxDC4EX18hi0DCEYRV4OmzWqOs0Cj3nk8dsyxtWJyJ2+
 nesEge4lKHxCuSSxCtiEHJAzzfQZNmOs6m22OE2/5j4FxeTlVQlz
X-Google-Smtp-Source: AGHT+IHzpE9SbYwkG5siTLQEKUl8Xu5QeKQLe1T8MPzVIFBNpAur8fUdPhqKhgFYHtZREDVfwyEkOA==
X-Received: by 2002:a05:6602:484:b0:809:83e3:a35c with SMTP id
 ca18e2360f4ac-816c33f0308mr46697739f.7.1721156338284; 
 Tue, 16 Jul 2024 11:58:58 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:58:57 -0700 (PDT)
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
Subject: [PATCH v9-resend 26/54] dyndbg: change __dynamic_func_call_cls*
 macros into expressions
Date: Tue, 16 Jul 2024 12:57:38 -0600
Message-ID: <20240716185806.1572048-27-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix it by changing __dynamic_func_call_cls{,_no_desc} macros into
expressions, by replacing the do-while-0s with a ({ }) wrapper.

In C, all legal expressions are also legal statements, as converted by
the trailing semi-colon in a statement-style macro invocation:

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4a9b9cd53eb7..c958085e0df4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -287,20 +287,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.45.2

