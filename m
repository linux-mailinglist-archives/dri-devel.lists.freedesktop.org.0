Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1D6D0840
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6867B10EE84;
	Thu, 30 Mar 2023 14:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A27010EE84
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:27:28 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id z18so11401192pgj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680186447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lT1BKGfQqFBUgSJ293/p9fRof3Zd4Kmxm7+XqMUW1Yw=;
 b=iJyOXHNKCdBXBK/TazEMoDQzyTokg0h/SwmbFN3hXJwbXICH2T5W2AU7tv/RuQUoRG
 ztJ6V1vbRB24yil7fx96GQhb9VakUsL1WXyXtgHfyNXPj1dO1gmugDFNVKzY3kp+DRfq
 TPNmv1QTpkdWFJM6GNW6CLXAAAw8pLNd2cLd0vPEo3S8Bc4GCWfe/hyTiJ9Jnmyw55LO
 6GLFMCHZIs3iHs7gLMxbgj0A9vluHvsMtwPoYr9Jo7PoIWfDGS3T96U1L2X4SP23X2pF
 /H4vZxVe3eK8cbVhQFgUaFQBiCgzJOClQHeqVVsfbsghZdnoHhJG4rKUdF5ta3xS1anL
 +SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186447;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lT1BKGfQqFBUgSJ293/p9fRof3Zd4Kmxm7+XqMUW1Yw=;
 b=qX+ORMeDCqVzzEMhjDJ+M3/gc/XdK+fWdlKeBAYdxPwRgIKeb4OcuxnfnPoDBRjcVA
 jS2XjHJ1i0DszDKTT3etw/ppTmVT6I/MbidrPg/LY2wGS+7cKFsdYxBdvKViWeAr7Sjn
 aXfuxXfRgICtGao1AmzvkmxxYZSoyzxTl4ziBzTdKEkA8IfYDIYWQPb/KQ5tpxHFVje4
 O96uK4WNgGMDoJZP0E2gTA+u47XN+gXZ366RJ8j5uglR1jFQtqtliaE3SsJlWNo7QA7q
 W/LRveWTrKOMhqT4kbMAWfBGT0sntkO+lfjyezGaqC9chquna2ann/nXiL3RTJ+kWL8I
 6A9g==
X-Gm-Message-State: AAQBX9fy5yhorJ7VNClElZj9HJJIKdyiyrQ14SuQy2AnUM93dpI1ylkv
 abNX8q3lAWhTHAES9pqkTWgIFeFt0jo=
X-Google-Smtp-Source: AKy350Y7rTtG18MNfmqE4A3kTB8R6xRJGDHDAoNmFmObn5jQOspYcFH6ZMZP7du4K/SydIl/ebTE/g==
X-Received: by 2002:aa7:9597:0:b0:627:df8d:350f with SMTP id
 z23-20020aa79597000000b00627df8d350fmr23098126pfj.4.1680186447492; 
 Thu, 30 Mar 2023 07:27:27 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 h4-20020aa786c4000000b00627ed4e23e0sm21673169pfo.101.2023.03.30.07.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:27:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf/sync_file: Fix doc build warning
Date: Thu, 30 Mar 2023 07:27:20 -0700
Message-Id: <20230330142720.882045-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Rob Clark <robdclark@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Padovan <gustavo@padovan.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes warning:

  include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'num_fences' not described in 'sync_file_info'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/uapi/linux/sync_file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index d61752dca4c6..ff1f38889dcf 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -56,7 +56,7 @@ struct sync_fence_info {
  * @name:	name of fence
  * @status:	status of fence. 1: signaled 0:active <0:error
  * @flags:	sync_file_info flags
- * @num_fences	number of fences in the sync_file
+ * @num_fences:	number of fences in the sync_file
  * @pad:	padding for 64-bit alignment, should always be zero
  * @sync_fence_info: pointer to array of struct &sync_fence_info with all
  *		 fences in the sync_file
-- 
2.39.2

