Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2448B629A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B879410FFAC;
	Mon, 29 Apr 2024 19:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hLeEBPjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169F310E514;
 Mon, 29 Apr 2024 19:39:34 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7da09662332so160424339f.0; 
 Mon, 29 Apr 2024 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419573; x=1715024373; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXI+MXWRKKGIldf/Embfy128LRyyxhcJagthHMuW3ts=;
 b=hLeEBPjcoyCX05xdi9mqHM3Q9YWLDWpzICx09gne3Ikzrn4UCjnjrjG/tpgum6rH91
 lVC8e4CWOgUmzd0hguGAExVigetFTqim8MRVg9yOuZnj0zDclp6wcgtb5jrBFmuCibMT
 zbtnJ2b2J2XBOkEZHhUqSekUobuBHUWahix1m9IW7iWsBeFqUFyUcidW5ph9PyK36qsI
 NG/7jCn4Bb1oiaZTSj/zVu+ovtSp0MUUS8Ek9moIwGIzX0xXmwBRCB3U2JU+Wl2KCz0P
 uYRHYVTBnvC9cIgasNS5U5FKb4GFWWBudLoAHMzRdLTCTKlViUeLrmbfN6IeWoIQ5DoU
 TRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419573; x=1715024373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXI+MXWRKKGIldf/Embfy128LRyyxhcJagthHMuW3ts=;
 b=NTE5WT29xebakZAHpmgUDDme+nufnwgYGD4xIwjT6ObMv2NizHInZKH/D40K5GAdQ4
 3ATg8PFukpsQ65UU1M/YfYfrOuN2IAJnh8ErttILFONTDT0eWXTSqaxmAGcMTUsF0I0N
 10fx62aWqUsC61oyR6ZYeWKDzWFTOEsLyhBA7SWUDxHzjqp5boS+m+e9YeeOY6iIjMGq
 KX19Xvl4tPSFaMxAFMElU8EeuvN3GivTHeDKuCRrZ/tRScdisLkVP6rn8RJa/p49tvNc
 IDMW8U7iYoY2+M3ykTAMFaiAoI7T0jIxixG73WfD9LsMTOiIkzinDzYpxGxnSQHaHZIr
 605Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCpAZNNPP6cm9IHWf4Jq1H9gbOEtavaX3OmJbBo25yFul8VU/h6HLJzS9fHvWPd11Sobcsa2KWC+HpKIvP81y/23RLQRg8fUOMF3ugLePWBitUN6AFjVYYOLQ/Eea0OCe4VlK+FfkAwlNYVPS5sF9uSaqP5aaTAv1kobbeGT58ADNnoIzeYvsz4kEJQAFe4kthwSFHxhQuCi+dRwVo0QlTX33toXP2/ZeN2A1NWYRYc/Z3/eg=
X-Gm-Message-State: AOJu0Ywz00BpiKRRJbZT6P7ab8zHo40d9jm7PWuB0aqsChXyA1oGNz9b
 pbHEmv18BuliWwZlDvzqQXpzk87hRbV3gxiik7sp8O3oXhOcDxR8fpp9Mck6
X-Google-Smtp-Source: AGHT+IGWpfjvznK6WhTujjscD4YN6L0AQxbNzmm1AE5SspjD0rno7TIevntaxjo8L0b9AeQnuOA3fw==
X-Received: by 2002:a6b:db05:0:b0:7da:1a22:e832 with SMTP id
 t5-20020a6bdb05000000b007da1a22e832mr584954ioc.0.1714419573239; 
 Mon, 29 Apr 2024 12:39:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 25/35] docs/dyndbg: explain new delimiters: comma, percent
Date: Mon, 29 Apr 2024 13:39:11 -0600
Message-ID: <20240429193921.66648-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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
2.44.0

