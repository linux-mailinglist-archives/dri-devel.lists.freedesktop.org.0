Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937A92CB6A5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEC06EA0A;
	Wed,  2 Dec 2020 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe63.google.com (mail-vs1-xe63.google.com
 [IPv6:2607:f8b0:4864:20::e63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C396E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:03:16 +0000 (UTC)
Received: by mail-vs1-xe63.google.com with SMTP id 128so584314vsw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 02:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Tf4BNwPZVCDQqTYJXSff2QjTFdZMI3QqwgcnCg3ZkwU=;
 b=BAjQ8aMgCNd4sJ751HwtQQoePSxxMNw8oiWEh9Qr1QW3OPxUshUeLLC5aCAf2eHml2
 nfjEA1UJ4WJo8BX8IPY+JamcnVdHMlMUmhI4/LsSoQRSok+aMqIvYafAZ/TzVZA0fRZ2
 +gMlTp/mN2gKG1L6a4tSJh4oNrxuzYEi3PTXKL5k1LZUeXcHAmlTnexsZF9Cne6Gr+jo
 lRUqMXVtERZX22GBg/1g1c8ex32cJGqOlKw+9QxSd93Nk3b1LhFkxlkYnQJpdXz1/9eZ
 Jd2AjGihxRjVgJrUUjeYxxW6r1upNRIIR2D1SaigjwWTp+zbN52URUUTTLiRgp4iJxTL
 IafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Tf4BNwPZVCDQqTYJXSff2QjTFdZMI3QqwgcnCg3ZkwU=;
 b=gUnhX5TSa9KwZitFZi7JT4KDiSQ0PZjl0p49dMlZwGoO7AbtTXnnL3/IIIxtSEaMBb
 5D85r2N8NMY3h7GgqrCUngdianjImFUKNIY7Imuw7ZSoBoU/+U09xpqcbSITjXsBBdj9
 zAaP4OPOXdp0AU5+aw07IELhW38AZr8A3c+buwk0oL8JhSVhvZGvwQBzupdF83GOrUWe
 2wkYhp+Nhv5KF4ie229BiUQIuNZtm6cxlk+5+0DvgMt0Au7QqW721X+hOBz8/TyqDbs3
 uEuwRrO2XT2KGgFDm+mABQ/f595ibnicn/aWNt6O1y7kPhZi2ayI78CmnvK9eaUKO5iT
 9KnQ==
X-Gm-Message-State: AOAM533+SulCcs+hpoQxA69XE7d+NmVZHZwJhsx5HLLWU5uO1+2f52BN
 jP6b3PxJe6T5xyF40OtgEfFUMmXZoqW8VOHMYlDD/Y+3KdzCVQ==
X-Google-Smtp-Source: ABdhPJzazIEhlvuGiJito3lKWRcmmM07KEHbtT85SsAIx9VT57UdkmqNWtnkso3QfA0htOML7DttH1Dndfz1
X-Received: by 2002:a67:ec3:: with SMTP id 186mr1714964vso.14.1606816996033;
 Tue, 01 Dec 2020 02:03:16 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id e67sm206279vke.13.2020.12.01.02.03.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Dec 2020 02:03:16 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix drm.h uapi header for Windows
Date: Tue,  1 Dec 2020 02:01:56 -0800
Message-Id: <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: James Park <jpark37@lagfreegames.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will allow Mesa to port code to Windows more easily.

Hide BSD header and drm_handle_t behind _WIN32 check.

Change __volatile__ to volatile, which is standard.
---
 include/uapi/drm/drm.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a..53dc3c9 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -48,10 +48,9 @@ typedef unsigned int drm_handle_t;
 #include <asm/ioctl.h>
 typedef unsigned int drm_handle_t;
 
-#else /* One of the BSDs */
+#else
 
 #include <stdint.h>
-#include <sys/ioccom.h>
 #include <sys/types.h>
 typedef int8_t   __s8;
 typedef uint8_t  __u8;
@@ -62,10 +61,16 @@ typedef uint32_t __u32;
 typedef int64_t  __s64;
 typedef uint64_t __u64;
 typedef size_t   __kernel_size_t;
+
+#ifndef _WIN32 /* One of the BSDs */
+
+#include <sys/ioccom.h>
 typedef unsigned long drm_handle_t;
 
 #endif
 
+#endif
+
 #if defined(__cplusplus)
 extern "C" {
 #endif
@@ -128,7 +133,7 @@ struct drm_tex_region {
  * other data stored in the same cache line.
  */
 struct drm_hw_lock {
-	__volatile__ unsigned int lock;		/**< lock variable */
+	volatile unsigned int lock;		/**< lock variable */
 	char padding[60];			/**< Pad to cache line */
 };
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
