Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CF6B8CD4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 09:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6376A10E71C;
	Tue, 14 Mar 2023 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2810E6D6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 04:21:50 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17711f56136so15994832fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 21:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678767709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zcNOhyIBIY62vXkGUUKvlSX48JPloj3aRT+aHCyiEXk=;
 b=UM9e8epHsIJQquz35OqXTU+Wx4tFPahSFBuRJ17e+cDJMVuH8Dj3PT2GuJrWEfjwZp
 DNJ3WwEvHoxkIzWlxuxijh21YK99NK/mqmWopidcXXGwoik4b7/P8IH3xeut35ETp0M2
 3pw9TMQVTGona7VeYcMCoV1QF9AYY/2wXQRx46Y+wmcbN9OUqyPPFNSnWEIsgQzg7/CT
 IshQmJj1jyseR/EHSarw0fqczkXqOA/qYrE+XUdbzzRxSCA4OabTwfxwPJHnxaWL//Lw
 CF1nBV9FRVUZfVNwsOijEUgDeOVpUzkvMLJtCkTl/UoGLW1XB4kTuMO9Hw2Wbg+IMNkm
 k/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678767709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcNOhyIBIY62vXkGUUKvlSX48JPloj3aRT+aHCyiEXk=;
 b=aVnJ6Br7fBwIiAQ7rBEBRaoycbZk8x8Q3P5YKW3HiaIPDSQKelfKg79PM82e0uv0b3
 7pEnsA6sK47XCuMgRqjVcwBPFNqJfJCvoOMO6dlwLli6DQlSJDRBFbKcNy+AgRzjcShR
 8ukvw1qRiwv7aY8VII62BoYgAMma7YgwBB7ZREBkT/3WzyJ7OVSsxlssbUwS180EbSof
 753BsldmwQXKFHMloWJxYW3nZT2jchJw/iIK8mZA0+3wwj4+e72lp1rpr87jAghczAD4
 sdKcJGlmotk+eDLd4l3WqWo+MvUjfUDwaYfZBNsCQPi/C21qZT2yA6SU3+NzhKlr73GN
 wiwg==
X-Gm-Message-State: AO0yUKUFJhYMnTvTJcHRH/HiZWbqTQpYsia0fxYOjtq+IsQT4bbczr09
 4s32YdDEOWzSPsDJ57hda5mGzzmtSDG6Pw==
X-Google-Smtp-Source: AK7set93FAhxeb86iTIRqEoGiLVAtKQM6EV7tf63wtWMqSjG5vOJul/RBLMCJbEiQWoz52aryoChbg==
X-Received: by 2002:a05:6870:eaa8:b0:177:8fc9:91ea with SMTP id
 s40-20020a056870eaa800b001778fc991eamr5709890oap.2.1678767709140; 
 Mon, 13 Mar 2023 21:21:49 -0700 (PDT)
Received: from localhost.localdomain ([187.57.115.85])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a9d4b19000000b0068bcd200247sm516771otf.75.2023.03.13.21.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 21:21:48 -0700 (PDT)
From: Yussef Fatayer <yusseffatayer@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Fix excess doc paramater warning in ttm_bo_mem_space
Date: Tue, 14 Mar 2023 01:20:47 -0300
Message-Id: <20230314042047.92954-1-yusseffatayer@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Mar 2023 08:16:08 +0000
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
Cc: mairacanal@riseup.net, mcanal@igalia.com,
 Yussef Fatayer <yusseffatayer@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename documentation parameter from "proposed_placement" to
"placement" to avoid the warnings of function parameter not
described and excess function parameter.

Signed-off-by: Yussef Fatayer <yusseffatayer@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 459f1b4440da..8284f4d0ab21 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -748,7 +748,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  *
  * @bo: Pointer to a struct ttm_buffer_object. the data of which
  * we want to allocate space for.
- * @proposed_placement: Proposed new placement for the buffer object.
+ * @placement: Proposed new placement for the buffer object.
  * @mem: A struct ttm_resource.
  * @ctx: if and how to sleep, lock buffers and alloc memory
  *
-- 
2.39.2

