Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5F924A6F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E63310E6DE;
	Tue,  2 Jul 2024 21:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="flxSH+D8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3EA10E6DC;
 Tue,  2 Jul 2024 21:58:46 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7f65715fe2cso34948539f.0; 
 Tue, 02 Jul 2024 14:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957526; x=1720562326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlDKvAdBKoPRv/bIs38+uKi/tkvNJDzr4jduq2zKdbM=;
 b=flxSH+D8KmbVhPjqwmkFs4Zjew1GLvCq2f5JqM0lq2GttBpUeWE46hkqI718Ty8cMr
 V7N4xSVkxrpSW1VA7FWNGkLUTVYM1A+2EzliGpzCO2cM6Xs6uVBE2FZ1qTmwtlSFrxgX
 DyjiUShUUr2GjK17avrVmX28FMhsShMsOMGcVcn9/LPUYq1vR6VEM5GvGfrFhcd/a16f
 /HQIjSZ3n42jE/xAbfS8L2yu1r+DVQ1XOw0ksyt9cBuPPF80U7Ui7ERA/dJtDSUuQ0a7
 /uIfX3eL9MqEsjYrDJkwYdzoLuz1cCc6CWk2OQmfMKdw9AESvMVaFttsqLdNIGkVeBHr
 mv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957526; x=1720562326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlDKvAdBKoPRv/bIs38+uKi/tkvNJDzr4jduq2zKdbM=;
 b=rmn4ARhN/my5FHjegTj1AF0N6ckhCfbsOl9519rppgDy+VneZyLg7DlaXywjbZ9DnS
 Ik9ndvMlfiGCMXF+HHN5hHtgDbAUvAcyOHdpTfJlWPstP9m9fI5Uxc72T7DUC85LDkDY
 MUhb2nG9Wp+424zID91CS2bvImR/LMPrwxtcS4jE2eXtGC7G7TPZ1N5Z+pRdDLtkRDU0
 eUPvY4OErboAxosv03v8fbltp5ZIQ6ltOwbCOG/vAMyDa096gfcFw7y33F9jZQTedkBL
 H5OKTwTc94ePI8Rto+zRKZlnYElgXTgEHh1ScETzy2JsWj7hdzczZ+X10+KBdKAG0ePt
 0kSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwtn13TfHcSRqaXtWDTBtY21E0jOxtenYiIAgRxwef1AYBdJYCb/BEKDFcc0RNnMOFooNsbeQOrZPsBAeIewR92TdwTeghR4h1YHt3swZvcvEcTk4cUs9OfL3dKLgJozGCPdk28EYkrESvprGaanHIL0uLpVzE2cdjnKkb577brA10bKqGZO4AwzZZaKxHnG/TM2/HeiuRg3Zy2sRyvRFRyhwwkcP4FTVX/XWMfwd+t0c95Z0=
X-Gm-Message-State: AOJu0YzkJuGMnH4lML3PgkEQJ9AGODpdXUbBAB0q7+NqRiI/nQs3nlS1
 +29+LnsYxMViMu9t9bZ59UXCeID9nNJdVoNLirPDlz+SouAzIk9h
X-Google-Smtp-Source: AGHT+IEykACPg8Yuh6xy1PBNO3lKJQHFEEJ8ReiFUL2QHWIsQS/wu8Ny162mn5gSs3mLVbeCJLAYLw==
X-Received: by 2002:a6b:ce01:0:b0:7eb:7887:a496 with SMTP id
 ca18e2360f4ac-7f62ee118a2mr1185180239f.4.1719957526148; 
 Tue, 02 Jul 2024 14:58:46 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:58:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 26/52] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Tue,  2 Jul 2024 15:57:16 -0600
Message-ID: <20240702215804.2201271-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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
index 19f959f9a6b4..121a66b0ca25 100644
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

