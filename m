Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA372CD0F2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B586E9AC;
	Thu,  3 Dec 2020 08:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x264.google.com (mail-oi1-x264.google.com
 [IPv6:2607:f8b0:4864:20::264])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDAC6EA20
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 09:08:39 +0000 (UTC)
Received: by mail-oi1-x264.google.com with SMTP id l206so833710oif.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 01:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V4idFGquiUXOkAc94/NmXxjQ6gkldevHuT9OINnY+Bo=;
 b=SkGdRemI5tcyrXqI/jkk5YaTTIvdv24kwbJh5pBa7CmdOUMFr0qPW0wsjMRnxTqkQb
 +RFEvpyd/NJvRbzd3uzmAPJQ8cGQrS/KlpG2IRuFRfRIz7O6d11Xw9+PgNIY4zesgKzl
 /CJQQ0GIDyzoyT1X5YSe6TayD9H4qf1qaJ9H4dBiczg0wmvm4K7scpLkNyQcZIkQwlOo
 MSe/HWaUwQN3vIIK1c/5beWT0rQ4lXg1tJj5EYf2m7A7kh05PC8ZNBJE+N5iZBl9cqdK
 UV5QBIPG9hcHuRZ6lj2JH6rT4VH5ePteNBeQEit5lYI+a9nb/fQ98dmYGyUjQzbC5dj8
 yrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V4idFGquiUXOkAc94/NmXxjQ6gkldevHuT9OINnY+Bo=;
 b=gcgcJS31SPVeLATiXmtb/v60BrOl/pKVO0APQzgBE1kCFWhwMQ4vjzMx6Mp52aqFix
 U9uyYI/NHy5I5Rl9/J1LrZIqv3iS0zjgmHTYZLsAZLrAZ+19fEfnifs54/rDWOhvGqYw
 RFsNpY2DJtg8dSIM+QSOcs6sFcFTkz/SYyy2/pStx1kHeLity+xEHxazK4Ms8ic6nGw1
 /l/aanSOwJzpbu6nT5dyomFOlSB8bn1+BJGQr+jcCPL7k8r/KJfWnviZnLpim1w697Wi
 /m/CYuvFe0755wILBNuK9O6He+h1F6suU8hohAuH8bipPwLvHVq+XBzLKr5bP1l7Ifde
 y5ow==
X-Gm-Message-State: AOAM530SIXPGYzUeQjvyY+Tq09mjlb/HdJ6CFAYj1bAoQQV4CD54LBIY
 BoBz57X9rpv2V9PdavaLUM7YZSLwSgR/wi02+JoDvjZ5ycf7eQ==
X-Google-Smtp-Source: ABdhPJyhAxvgatgjuvv+ieru1G2RtGJ6VZN1CuOmgBB/wT6Y3oJQqAzXZE76qDu9SM9zyvEZtMGBOsvg+Zq2
X-Received: by 2002:aca:5286:: with SMTP id g128mr917427oib.91.1606900118984; 
 Wed, 02 Dec 2020 01:08:38 -0800 (PST)
Received: from DESKTOP-G3VVM7A.localdomain (c-24-5-176-39.hsd1.ca.comcast.net.
 [24.5.176.39])
 by smtp-relay.gmail.com with ESMTPS id l13sm198262otb.10.2020.12.02.01.08.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:08:38 -0800 (PST)
X-Relaying-Domain: lagfreegames.com
From: James Park <jpark37@lagfreegames.com>
To: contact@emersion.fr,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Fix drm.h uapi header for Windows
Date: Wed,  2 Dec 2020 01:07:16 -0800
Message-Id: <1606900036-126-2-git-send-email-jpark37@lagfreegames.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606900036-126-1-git-send-email-jpark37@lagfreegames.com>
References: <xOk1dXNl1GdnDlbmgZsJHYWhW2KQB2oQCBLJ9NvRfmjr7mLqEtX2Bn85XMOWwagoS9diq7pu0EddxiiPncxxN-ZrY8KoueFO67kmqiw1CdM=@emersion.fr>
 <1606900036-126-1-git-send-email-jpark37@lagfreegames.com>
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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

Signed-off-by: James Park <jpark37@lagfreegames.com>
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
