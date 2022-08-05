Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9858B22B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E4EAD01E;
	Fri,  5 Aug 2022 21:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32B712B500;
 Fri,  5 Aug 2022 21:54:40 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id p9so733087ilq.13;
 Fri, 05 Aug 2022 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZSrYcW0n+hMGbP13qtU8Pp8sbnMOwvc1NQla3G+MVBY=;
 b=pPw4i+VqbQa25X7qFM0wRNJ8nxyDnFuNDaCsDun2ttngNr71qRrGr4k8NyN7xsD80B
 7OEIqPTiLY9pjqLlMqCA6IqcQ4HOo+XNP1ix9evPlP7vO7Y4Inyr2r4bjjSX+Y7R5zKj
 HBqzGMZzxBa4+4ptNMHk1htpzfhYtw+mflA0z/piZ8WMUwb2U1ZqHiU3Imd97+NRj9ky
 9s+6OnPcOXDsdoVQnqcU89Epq/rxnhZWvYbGfrNLUGI18PpSQORnjRdXOq31ZhCtjElZ
 5vcklUbLM0pu+LW/VNKLMAEWqRA+MegMEmVcJXzQkN1+nedaHwzujL6llty5ACx/1Dp4
 s4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZSrYcW0n+hMGbP13qtU8Pp8sbnMOwvc1NQla3G+MVBY=;
 b=6zH9RNvAcK068u9eqYAWq2/+lwr1TSnv/YaqXORzBUjokUEFDzdrrN91pgkra+DcuI
 3qDx5MXhRnxQXxOWzVPO4JzD4L4MYvnnSLgyj2byEdikP2D8/705cDaQULXn1/t6y8d9
 WR/dJKpCHjz8gGlK/XWXB2AIg+hLKHEkPpGdPHFw4+GV04G2oSczJBgprBMoud+X72wa
 1vRUWDpLVJ3a34HrlN9ZMa0+SWWi1okBJyxbleWNArOfmaKEccRmvlC4czKf/8Id5ZTx
 0w6iI+emXYebTV9+0rFTgVH7lhtVkae5wp+Qy0woK8A7rppiSsQkQeTEkRr1EF30FbIL
 JZSQ==
X-Gm-Message-State: ACgBeo1yXnV1KuievOcdB2zQE9UCNH5FB/vk/roGmexjB4VCv6rpgk4X
 GYYtpNU7y8TI6x66mqoXwTw=
X-Google-Smtp-Source: AA6agR6G2mXKbweLP8JJH09ZIwf4toE4HNTDaPGGZAufMuf4+BUTj0JP+37VK2t41KmICClDFLB/DQ==
X-Received: by 2002:a05:6e02:2164:b0:2de:e996:b8f with SMTP id
 s4-20020a056e02216400b002dee9960b8fmr4037903ilv.0.1659736480406; 
 Fri, 05 Aug 2022 14:54:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 18/33] doc-dyndbg: describe "class CLASS_NAME" query support
Date: Fri,  5 Aug 2022 15:53:40 -0600
Message-Id: <20220805215355.3509287-19-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
2.37.1

