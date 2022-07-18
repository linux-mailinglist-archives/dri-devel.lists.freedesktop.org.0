Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA9E577B57
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCE3A9CED;
	Mon, 18 Jul 2022 06:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F4CA9CE2;
 Mon, 18 Jul 2022 06:38:39 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id o2so4130880ill.6;
 Sun, 17 Jul 2022 23:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZHDzkEhZoFsdqauYBoZorLHVYYv4cPxhPxoqjWUWckg=;
 b=D8GYAvhZhTZeEhHFfnRjiqQ4IebIK9Fcxbj4xbf+4JSCJosgOQJPsiWVTMPDa6Uuvw
 vLoYI4TDQcgxpj3LreTrh0Rb5URwaPNH1FzUTMktRvE5L50HGr5xYZywdat+N2qmIUQH
 phZQ5C1Hat40HNJlClICjNmPyCrMQVxGLyCaPsR1UhsPwbs+CVF5hTaV6CPDfJ3iOhG2
 8HZkDqcwbLTFkf29Ejf08Ivbxr9NKv92N3Y3U3nqXvf5o92iWkdepIladKseAFbgN+sW
 y39MQkpBlqOJxzggQyI0A99U1bHvCJeQsa41WsRdLCz2lJPr4wThzpP5iQE1dH+URjx0
 Ld4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZHDzkEhZoFsdqauYBoZorLHVYYv4cPxhPxoqjWUWckg=;
 b=cSL8s/FdiKw4BpJtDZwoivZcJhZDE5L7y8CXsTd9hXo/UTZRufnqN8QV+fPemZtBwb
 yUWIvk8wpO/gBlposGwvi+4fJTQpZh6tYtEEKZjj1Ah57g3pTYIAZjJgiDwVaUQAemvM
 kpXmbHOIxHi0krDNjDZpN4cdFOZokqLFFd1xVvY/Nprtx2NlKU5HXJowtfg3rYnpfi87
 +vyixvjlLGWeyy3kERpGPQbB0SqkR9/FHJN5YYyCv9igNFZqZXLjp6DwfXc97OmcEyiG
 gS8TMOnR2qhRSeMoNK8MpNcqGCvEJY/E2J6X7F41Do63Bb4DVnFb5SnJnLEjDIGEggO8
 wQIA==
X-Gm-Message-State: AJIora8Ur77f5430CZRUWU4f5+OSErKuUf40Ix1AzvjD33R2ZKnAfM5q
 tMXY5S6lMpSntcMSodWA4JKQpKSD8Lw=
X-Google-Smtp-Source: AGRyM1v2aJ89+/Y57Ak3yg6kmB0cJaOyWHzQUbSRoMReM05StZqRzlIQJDOfGR8Sg+hnD4rWy4tfyw==
X-Received: by 2002:a05:6e02:2188:b0:2dc:7546:1ea9 with SMTP id
 j8-20020a056e02218800b002dc75461ea9mr13622716ila.136.1658126318918; 
 Sun, 17 Jul 2022 23:38:38 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 18/41] doc-dyndbg: describe "class CLASS_NAME" query support
Date: Mon, 18 Jul 2022 00:36:02 -0600
Message-Id: <20220718063641.9179-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
2.36.1

