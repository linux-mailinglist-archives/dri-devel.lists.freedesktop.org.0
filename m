Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED377D4E87
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 13:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CCD10E343;
	Tue, 24 Oct 2023 11:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6955810E343
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 11:06:29 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ca85ff26afso8196875ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698145589; x=1698750389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=23rjfcSzUOb0fq4nIpR4TxeCtFbF+IJB/egGkVRPYqI=;
 b=WMpn7uVDLMYu368PgFg0bPRem2f6GsP+JdzVBuQAwzmNAlHPvzenKqp2GqkBqqzhyh
 vTTJkcjh8afGB5de8OQ6+bj+tVaRT5AzL+UP7puV66ZM2TvR1om4tEqo4PG7Bec97F5p
 wF9HEpb1yrOaIRXsL2xIaMq9cUb63wj0vK6c1gwQ/pW0iH3Q3CbA8POCMN17vwLd4kj5
 W9BKhUAvsdOO3dsvWU6KVcI9bB/BQ+Dts+AKidFn8HWHHnWTIiw3a1esUwtsFfJNP41j
 QN7iALLrYe8ihj4FqgkhYlNbvd3x12ZlH7dHCNN1RTpX0VEUbCdWkalixGuEVdj/D+0b
 6Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698145589; x=1698750389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23rjfcSzUOb0fq4nIpR4TxeCtFbF+IJB/egGkVRPYqI=;
 b=gMdjgNO7OfUebiVljRj1gLKwHNVFzgolNaqWv6ZsWUqQdQGQhA6pMp+/hAm7gbUdWf
 b8G0lqM/eiTACFca8C6SfXO0kvtrF1l+DIZ2rjkgmDwR9P1d5sxdzgRqh5QWcXW4PQyC
 Xiih34nL5ELWBsHxxpURaVmuSozmzREfE3zhoZzvNALa6uKx7ZyTVAUW8oSN/EqcLNrL
 r6d7GyqMvs8ABG5qcjXZg+OBO3ITeBZFCb+JF52EqR+ThCdkS1aCcrMLuP4CgJLliPKx
 hr5beEI98l4twb9cTs3sRx+m7oehwnvIl7045ejZGnNrUuuy4wLZKIToJ0wY5lUDxXNk
 IZmQ==
X-Gm-Message-State: AOJu0YyMcEabWB9MVWnbd07Ph/jA1LrfQCzvlGOn4V9bdFEWVHz3wdzH
 KjwKnDhY5rs80t8qUm2hMZ/G2Re5TJHK4LDy
X-Google-Smtp-Source: AGHT+IE9S3Ix5Fw915tnVw1E2pRKrVIBPS0MgBnUMvMxeAGTOwlhbka+V0dIbLyKNWbk+5MDOv1zWg==
X-Received: by 2002:a17:903:6c7:b0:1ca:85b4:b962 with SMTP id
 kj7-20020a17090306c700b001ca85b4b962mr11413136plb.4.1698145588778; 
 Tue, 24 Oct 2023 04:06:28 -0700 (PDT)
Received: from fedora.. ([2400:2200:74c:7eed:5855:5fc6:625a:57c3])
 by smtp.gmail.com with ESMTPSA id
 iz22-20020a170902ef9600b001c771740da4sm7257472plb.195.2023.10.24.04.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 04:06:28 -0700 (PDT)
From: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm: use correct name in comment
Date: Tue, 24 Oct 2023 20:06:20 +0900
Message-Id: <20231024110620.793307-1-nakayamakenjiro@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Kenjiro Nakayama <nakayamakenjiro@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As drm_vma_node_is_allowed() searches @tag in the list,
this patch corrects the comment.

Signed-off-by: Kenjiro Nakayama <nakayamakenjiro@gmail.com>
---
 drivers/gpu/drm/drm_vma_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vma_manager.c b/drivers/gpu/drm/drm_vma_manager.c
index 83229a031af0..7b41b0f8c283 100644
--- a/drivers/gpu/drm/drm_vma_manager.c
+++ b/drivers/gpu/drm/drm_vma_manager.c
@@ -393,7 +393,7 @@ EXPORT_SYMBOL(drm_vma_node_revoke);
  * This is locked against concurrent access internally.
  *
  * RETURNS:
- * true if @filp is on the list
+ * true if @tag is on the list
  */
 bool drm_vma_node_is_allowed(struct drm_vma_offset_node *node,
 			     struct drm_file *tag)
-- 
2.41.0

