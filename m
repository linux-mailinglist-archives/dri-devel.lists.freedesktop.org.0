Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5E577B40
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405D9A9CA9;
	Mon, 18 Jul 2022 06:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3DA9C7E;
 Mon, 18 Jul 2022 06:38:31 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id x64so185987iof.1;
 Sun, 17 Jul 2022 23:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ujNUtXONPnMVcLXef+++mbRuDWoeb2nKdw2O66vA/k=;
 b=ko+9SQ+Mx8lzHSoaU1/W8VK/thk6faL5I1vM+CEYL9mse05V82UyAlv8hJsvAWqHNS
 sFq++DltWFERA/iWIDzVh/GWacBrw+0+W2orwIbbv17khZwCdwIKYDzseA7jepOvJvzr
 aaq6oZWFoYU2MjbX8zH1X2Fy5ih842KjPxRyAKDvD7fkzbUc6qsU65mikqlYuqyzXSOj
 a4eNmPKJoFiR+0cltiuSNzXFPDcaWGLIUDZmRrSSBR+mmj3KiBPahSUDo6bvjQt5rIbC
 W7+vhPG2ZeMx3INM0bCud5riq/zp0o0S5DOVi0pZpUwpYEeJE7BVDNjoRMAhMUeE6x5m
 2ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ujNUtXONPnMVcLXef+++mbRuDWoeb2nKdw2O66vA/k=;
 b=Xx6W2jRRrGxDV3Qfxxl/ZujNANP47ObEP5z3IvVyFPKoC6KC5TmjGNe/ZM0+bZ13bf
 dUyNBb1BJUjpfbW1HqIiD5Qj7GyJ7k2RUBg2OTGyHqGYFv4194iPPLF50SQGfPUVGcCr
 7ItWtobRgFtQOi/EWz3Qeo92uCcxzQ+iDxH0kwWmm3/LbENanLCBkIRXEhNCYqWXfi5D
 0ESLK917SfBucP8XLTfYSJVFypzYkAXxnx/3aVJ+ut/ML+2brswRtrKCBsomF8VDkvvT
 wa7EW1x+oyXiIRzFPK5Mhlsc5wf8qivh+t3HYNAoyFTTkQMvcu4LYNZ6bUo/6bFNBRGz
 SIbg==
X-Gm-Message-State: AJIora/N7SRYLvMOYpgxLrhsgEyncZIGKY5xaU92dyXX6VAtO3M+UJ8A
 zqU/SsSUkBw7/mZc/WqKMDg=
X-Google-Smtp-Source: AGRyM1vqJLNoW+hOCe5R53Ho6OITKvBwfVG57WL1FmItF9hMW4fV4T98yxSciyQ776pHQ9MV6e0Xyw==
X-Received: by 2002:a5d:9c56:0:b0:67b:e426:a514 with SMTP id
 22-20020a5d9c56000000b0067be426a514mr6442226iof.71.1658126310287; 
 Sun, 17 Jul 2022 23:38:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 11/41] dyndbg: add __pr_debug_cls for testing
Date: Mon, 18 Jul 2022 00:35:55 -0600
Message-Id: <20220718063641.9179-12-jim.cromie@gmail.com>
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

For selftest purposes, add __pr_debug_cls(class, fmt, ...)

I didn't think we'd need to define this, since DRM effectively has it
already in drm_dbg, drm_devdbg.  But test_dynamic_debug needs it in
order to demonstrate all the moving parts.

Note the __ prefix; its not intended for general use, at least until a
need emerges.  ISTM the drm.debug model (macro wrappers inserting enum
const 1st arg) is the baseline approach.

NB: it does require a builtin-constant class, no __pr_debug_cls(i"",...)

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d1429812be2e..0f7ad6cecf05 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,6 +217,13 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 				   KERN_DEBUG, prefix_str, prefix_type,	\
 				   rowsize, groupsize, buf, len, ascii)
 
+/* for test only, generally expect drm.debug style macro wrappers */
+#define __pr_debug_cls(cls, fmt, ...) do {			\
+	BUILD_BUG_ON_MSG(!__builtin_constant_p(cls),		\
+			 "expecting constant class int/enum");	\
+	dynamic_pr_debug_cls(cls, fmt, ##__VA_ARGS__);		\
+	} while (0)
+
 #else /* !CONFIG_DYNAMIC_DEBUG_CORE */
 
 #include <linux/string.h>
-- 
2.36.1

