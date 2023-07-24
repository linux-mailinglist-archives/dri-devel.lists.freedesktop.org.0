Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F275FA2B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 16:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6055B10E19D;
	Mon, 24 Jul 2023 14:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315CA10E19D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 14:50:28 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-668730696a4so2409058b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690210228; x=1690815028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y9FgIAEGGUhV8Bu4h5u2096wjTv+qpp9D0lv6o0X1Os=;
 b=ptc2BUxx3eJRL2ESeln4TMtMZ5o5saooTWv+0/B6wgK4hw10z0yrHD9Nw2fsBXrQ1H
 oX0MT/nKxyWaS3YlZTNku5c4nK9gfkZa4BgbfvItSgMG+J+F1tPBd8zbDb74QdfEzhIb
 jZ5sybePeyeHF8Rijwb1EGTw8cQJLsbRROaxQgcXn3sdBuwTgVB8PV5aqiAVKqrebhrb
 tpIz0rA0PtyAY9yoRA/kdSw98AoDU+wd3qJyArnDu5zCbxhid29NK9Xwz4BbzSBrO1f0
 1YUeMTqXTR0XY8zTDeeG1p4QlDHHRCrgc3XW0s3eMuJyakFvOGHei7QXVF4Y2lKUSqLb
 UdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690210228; x=1690815028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y9FgIAEGGUhV8Bu4h5u2096wjTv+qpp9D0lv6o0X1Os=;
 b=AtQ3klHAwHYTU/Gdyih2OanxTchS56CuOWbMcibQveP13Y37s9P4wA5/C0O2yoGLDA
 GzogFEP7+csX7bDn4PIQ8I4slnY6J8oecL7HmaTNcJFOv6DblZb7oybR3+nsMKqfRD+q
 uonbqh18xvwT1E5hIBaxEyVCKUx1lWPfZbgWOrdabVZm8xgNCFDkUc6/qa2amVD/gTjv
 DZdKW9lBgumse27D9xo8YDJJx1X915t8QhCZJRk/V2RDYCRp+Lmnd7at+hPHYk559R9i
 siMMRxILA5ir1jRibAS9lhyGtoVdlKM0z4f3LbzjsO7Zimn4sAz+lC12JhP85LE90fSw
 AFAg==
X-Gm-Message-State: ABy/qLb8rhzcZHB2DZqYOHdfThCquwVe5ifd3Uq0p3FInNNAWI1WJ59y
 zzbI2XTKYLwV/rdhka5AFt0ce8M1GeQ=
X-Google-Smtp-Source: APBJJlFMZ8RANdQoPHnukFjFwlUwTdQ6RXBdcsp7hN2KNRuVwIr+EPpPeq8lz2UMrzl55cgy1/5Emw==
X-Received: by 2002:a05:6a00:a8a:b0:643:aa8d:8cd7 with SMTP id
 b10-20020a056a000a8a00b00643aa8d8cd7mr8363957pfl.32.1690210227606; 
 Mon, 24 Jul 2023 07:50:27 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 7-20020aa79147000000b0065980654baasm7805653pfi.130.2023.07.24.07.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 07:50:26 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf/sync_file: Fix docs syntax
Date: Mon, 24 Jul 2023 07:49:41 -0700
Message-ID: <20230724145000.125880-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org,
 Greg Hackmann <ghackmann@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes the warning:

  include/uapi/linux/sync_file.h:77: warning: Function parameter or member 'num_fences' not described in 'sync_file_info'

Fixes: 2d75c88fefb2 ("staging/android: refactor SYNC IOCTLs")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/uapi/linux/sync_file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index 7e42a5b7558b..ff0a931833e2 100644
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
2.41.0

