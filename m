Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F95A1C180
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FA810EA65;
	Sat, 25 Jan 2025 06:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JbX/feOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78B710E2CF;
 Sat, 25 Jan 2025 06:47:17 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3ce873818a3so24594585ab.1; 
 Fri, 24 Jan 2025 22:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787637; x=1738392437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R20pJusVAFn+0eRwjuybzN3XQmUoFo5g9xIXn//WdwU=;
 b=JbX/feOLHWePv122M5u7gl2tXq9qqLu/LRQC04X42YSWvQshkZct42k0F84ePLTfYz
 6b+cwReCaSo+b2zedpifwYx6T7+wG+C0Fr7/ijrSrGTAi8iX7qy4OaR+Pt6Z/NgDaQeG
 9lejJJTj6xabjwoKBrF7bXcHBo/zyZ2qJJT480MPbhN5ITrFCEWKLoFebrUGaLd6ryLr
 9PgxVMaN5ZOlVmhRGS6NDo5o+w1ljN9LyLuj6HiVIT7uZb7w98xIh0+pBXR96UXXwSiZ
 nNNFfBA+R0Wgt4lUb9RuuxHbii5q5AaE/glm56f+KMdlQ+K8uVX4JgNjK+vrQfR9Da/1
 5Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787637; x=1738392437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R20pJusVAFn+0eRwjuybzN3XQmUoFo5g9xIXn//WdwU=;
 b=ph327RIyQtHSkuuZzgCwINMafp2ERPaqHlQhOqVCAAiPNV5E4QSGPjHk7N0e2gxkzH
 jHz6fje+n4Ydtjs8KYLruiJcsYriP3MzyPclEca3lapjobV1oUkelElC5xKMUedR15zc
 eSzIfFzmuCtHsb8+Px+H/Gpuqa5lmvCSLmD4KL7669VHwzgAlUytwugtxufn+SPB+OuA
 jEVDWJCtQ4lB7BZ8nceLDd5H8xAof2ykJz2OGsldgBEA5uWChbMAb9Zug3s0bTo4Kt5o
 hn7o00ua2EPEsP6UBhJlL86E4g1XgF5//frCsk2DTb5p9cY3i1DzEngJoEb4xoNNkQj8
 LY/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN95PtVmxz+QOVEMWejPhiNI4nq9VZiSfSSg9wKwbaCjOgPVLVWN0hR0LOZK6vKMFH5yyGYEDFLXpg@lists.freedesktop.org,
 AJvYcCWOffyfFmKzmhRUXxmDd6qEzxYzJJdglhyxS9aW6Ft6ZjNO5VoGJTUNtD0ltMLzTIgq9HkeRBbP@lists.freedesktop.org,
 AJvYcCWV7u3i/pf0+sxV7Sw7UtHB3/OoEHvWxp/pTt2s0ZSwzNOfegO1smUdn8DpDnxH7GBRcE3+IBGKRQTD@lists.freedesktop.org,
 AJvYcCWrAhwBv9oojKJuagT3QOaD9PzlMoKPW5h8tyE+8UqNCyZRWi/5DwWaHJTy6WNt6aL+7A1ByJgwI4F/J683Dw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBODRXsN5zdL/gWgT84sXPP1ZM64Ce+SJsTFszER/jQfV3gFHz
 SSJoHjz90kW2/yX3tJwmXvGaAu74kJEd/b4i1fic1EsTZXBtX+1MrFwZIg==
X-Gm-Gg: ASbGncu35ZMQByKl4+K+6gOheaJu9QBGTW2+HKy+pCuf4zPz9wInuUpgYWu1/ebFDP6
 X+OSZLNHqXh6cbuRScbdiYC4nrt7HGVJq/s53xdX9nrbgSO9BeRVAWOcl4MhDBTg16oUG4DAdr8
 VMK/X7yN66q3sIEZ7Uu2ZQVfXTVnP9jbKbovE5XFMpdJ1giEHPCHIYPZubHP7o+4AkOZ9NMkv3v
 0mYBRk1K+DPCHtxFRjysG7leBqKkz3mhpfDcnYIb9bXejOPDEU8dZK0YzEOK9YtC51bxs4l6rRr
 0WjRCKdgsKOuFwOygh/DoWz7b8LrLe0lqom76w==
X-Google-Smtp-Source: AGHT+IFhqHjUjw9cNO0qk0/umRlKp25sKTeEZ9PGaxIK1gOwxXhslLtN+M7fQRx/uvI7gn1cs6FAKA==
X-Received: by 2002:a05:6e02:3f03:b0:3ce:87e3:c26c with SMTP id
 e9e14a558f8ab-3cf743df88amr329678925ab.5.1737787636967; 
 Fri, 24 Jan 2025 22:47:16 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 37/63] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Fri, 24 Jan 2025 23:45:51 -0700
Message-ID: <20250125064619.8305-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b47d1088b7ad..1ff7bb6210cf 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -331,20 +331,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(&id, ##__VA_ARGS__);			\
-} while (0)
+		func(&(id), ##__VA_ARGS__);			\
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
2.48.1

