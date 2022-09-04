Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D45AC6FE
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EAD10E2C9;
	Sun,  4 Sep 2022 21:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24CB10E12F;
 Sun,  4 Sep 2022 21:42:27 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id 62so5673985iov.5;
 Sun, 04 Sep 2022 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ka8KRcp96RIs3WOVwaYMps+w4bs0E4mB3tU6nT4x+Cw=;
 b=GxYiBhtnCCLvIcjhtx8t6SNtIL7IN9FTRLpFWPEgQwmEChr7Li1YPuQJ9uzL52Yj6A
 cgqwOnKPTkhyNLE0ZRZ71TysRmVMnqOnOuIZy+W7qyW1e5LLWRS5QYdy3aifvqzwysH4
 6lBOaERL6zccFDJfBmPhlj41W7qOzgatR/sLszHd+5qrcHenG/kiPqGelWghMXTumLSf
 wFRbcjMRbogjvc9bqHIzD2/qSvsiQjcw0SYznzSLJ7jTTu+kn1HauuURN6n5y/Y3xzEP
 XBYr4ufLmOy1cM38/VKtTZMrK2mJrrVShrlX+MdWlctqxmtxNnUASO0irSsXn081Wpp/
 hmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ka8KRcp96RIs3WOVwaYMps+w4bs0E4mB3tU6nT4x+Cw=;
 b=gt/ZyEjc+0qs5vVFhShBDgaVAl+wy+FrRCyFKwhrxVvMD8cfx/JyGjU0Q/ATWkJf6t
 HEJLk6N0okIBdXS9L9BPYAznT/ACtUxSwLhH5hU14/83MRj1SoTbjbXMNred5HdaoCAR
 fMB4slgo1lyypjgTaVqCv4Io4ozYZ7e0p8779ZYvGV7Hlexo70ONOtVTWeLpz/KSr7j3
 hc5ypeMFXWIzbQ/oRL5zC1tSGwX66h53sfYh1Ri5LtTOxlV5SgACMIUZByTZiaKW/SZ6
 yvzF/K5SV1hffS4gtjREZ4AT3oyiNSBgRmqHgNMZcn4NtjbKf7HAIE25bP4fktIccQ1+
 k7mA==
X-Gm-Message-State: ACgBeo1gt/kXnJ+DTeKIGd5hVj9VSJD6vMehyS5WKqtZKQAc7G87DXjL
 rs9X7BXAv43yPAJ/GM4jDr4=
X-Google-Smtp-Source: AA6agR5AUEVpUfSPOxmk4wGZ/zK2tirYmhJ7zb9Jqld8zfrr8gDhVIB8ywXi+kyB8PgF4y+5mK88yQ==
X-Received: by 2002:a6b:5f19:0:b0:688:2173:1ae3 with SMTP id
 t25-20020a6b5f19000000b0068821731ae3mr21256805iob.12.1662327747322; 
 Sun, 04 Sep 2022 14:42:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:27 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 18/57] doc-dyndbg: describe "class CLASS_NAME" query support
Date: Sun,  4 Sep 2022 15:40:55 -0600
Message-Id: <20220904214134.408619-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an explanation of the new "class CLASS_NAME" syntax and meaning,
noting that the module determines if CLASS_NAME applies to it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index a89cfa083155..d8954ab05c7b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -35,6 +35,7 @@ Dynamic debug has even more useful features:
    - line number (including ranges of line numbers)
    - module name
    - format string
+   - class name (as known/declared by each module)
 
  * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
    which can be read to display the complete list of known debug
@@ -142,6 +143,7 @@ against.  Possible keywords are:::
 		 'file' string |
 		 'module' string |
 		 'format' string |
+		 'class' string |
 		 'line' line-range
 
   line-range ::= lineno |
@@ -203,6 +205,15 @@ format
 	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
 	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
 
+class
+    The given class_name is validated against each module, which may
+    have declared a list of known class_names.  If the class_name is
+    found for a module, callsite & class matching and adjustment
+    proceeds.  Examples::
+
+	class DRM_UT_KMS	# a DRM.debug category
+	class JUNK		# silent non-match
+
 line
     The given line number or range of line numbers is compared
     against the line number of each ``pr_debug()`` callsite.  A single
-- 
2.37.2

