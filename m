Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99857BA54
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E608F458;
	Wed, 20 Jul 2022 15:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A3E8F2AD;
 Wed, 20 Jul 2022 15:33:18 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e69so7024064iof.5;
 Wed, 20 Jul 2022 08:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZHDzkEhZoFsdqauYBoZorLHVYYv4cPxhPxoqjWUWckg=;
 b=Dja2UkKDPW71ayxf3vHJr7iOBZSZF0C5/hhTqLWKtJ0/dtnvJfi3599UJ9sqDWKcCQ
 CZVjvGNpr2mo1HM1YTxQQijvmnRg6EaohMnGAzgTo0rcn7poMH6BUVZnUj1LblOi7btS
 IIP6tcPO3mjZERBH+2Gw8/icz9sVK/gUJZXZj/WB+s+1J50t48vdwNHhubv/qUy3RU5L
 mn+7fix4fSwpOl5KhHaTyUd8p7VwKNBjwGULj5da7mgmv8EwrpRpY2byq5TYZp9OmKgg
 9ZcaHDo+5KfXqvs/rTNNbRDXqIKJ82kTIXbExJDEsQmGdwBcXxCyb5f+qX/XAfxn4HWK
 YGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZHDzkEhZoFsdqauYBoZorLHVYYv4cPxhPxoqjWUWckg=;
 b=QUIEaV/QImsZaFNItsMIobDKqO0JeGCbNu/CGbEFH6q0CohPjqqySj/+lzynUmmYbu
 NXBctkK1rF849h30Jzx2HbAyyltJokm7BNb69qCvz4CTrVJj3U3fl57GZhCxHfzBX1rn
 MFbfytwo6gcG/2oNEuamXtmSMg8k3EWnLDB22qIT4lq0024PBMtMRvB3dOnwiQZqgm83
 eSRqkbV/zp1GPYuvraJxTuXK7nbldlK+Hek5kfAmk8g4QNmQytRQkSLE3OQXKtqeUJ6u
 snue/K2aaDOHj/UM6jioLS87VHNQHPGst6D7ckVbquiH3Vk4rGq55fUUq9MbmieGvEjr
 ilbQ==
X-Gm-Message-State: AJIora8WLHeIhZZm63Cyk9AQ+jS3HupUxmnUnXGv4/+P5NvDDH2QSqKx
 9GfVgLTA/quT8lZtJfar7+qBlhdz3and1g==
X-Google-Smtp-Source: AGRyM1t4773yD6yWKlBfmX+NVK4lEVLSgWtkftGvBXTzzGqZjj1E7prZFFtJe/0emwwdGKFFnJmvkQ==
X-Received: by 2002:a05:6638:3807:b0:341:709f:31a7 with SMTP id
 i7-20020a056638380700b00341709f31a7mr8695948jav.206.1658331197235; 
 Wed, 20 Jul 2022 08:33:17 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 18/41] doc-dyndbg: describe "class CLASS_NAME" query support
Date: Wed, 20 Jul 2022 09:32:10 -0600
Message-Id: <20220720153233.144129-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

