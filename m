Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A4E64D730
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 08:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A73C10E4EC;
	Thu, 15 Dec 2022 07:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6249110E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 07:19:11 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so1836432pjr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 23:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gNNEXVu8wt2zuNH1k1KAp/j5xACVIRsF33hCTFu+i90=;
 b=ke0PMAQli34KzagT/iZlwE1G+uKztUSLuFSo0o7cOv4AecrTSxBF0OO4UpjcehSj/K
 GWr83LJSbCF0siXy0+Tsc2J/2grwXzEZKtYThtuyh7cQb7Vls/Lr8TiwN81ocJrvHxdO
 er59dswgGOeFX51hSVWXvbvh5mYpqSYRSUPnzk2BMSWktH+7E+ih+OXq0uXwIfNSVRDO
 u31QH8N0sDTDQIfnKM0vxnH177cIRN1Dj6DUdVv3MX9vKqCYtj6D/2+Eq4CKs2TU0Y2F
 Wme02BGLglHiiGcCjNkAnh9XF/SvGLNwXji90UU+BdWKxVzrGs2kWBpszuBQIPAmwKnj
 FO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gNNEXVu8wt2zuNH1k1KAp/j5xACVIRsF33hCTFu+i90=;
 b=RRu8a0GTEfjGNVsCqJg4TTK+pJbiCMnfL6gwYESkrjCa7pewqjrs2jXNvTY6Kpx8DE
 xaUT+wUvOkzIjIL/kgH4CNYD/4nho/aiqDE1AqhLCbErSiqI+BZl0Z6YKHVtA6ZDcGmm
 e9RJAjTjByFcRiSow9RIgtW6MD6kKN74/zm5xRM/6maVQbGhy/P0HD6bKONSPj1+hqX2
 ISL4ym2Wv0iqsYliNQ/9R/4imiuLNbsCM/W3fTQbyZhH1Uzov2yBIZNSnYhq427xm3II
 vT4iFGPDLMWVBaOXOBKWWRjBpYliPNXme61G0nSLwfosoivnHmI4hdzb+5XFqNug2VRH
 iiQw==
X-Gm-Message-State: ANoB5pl/QUZivgcNO/Fe6VMC28tvoMTrG8UpQcWRvzFeZ8U51uwd8Mvo
 BJ1PMXcBFMOuLTE8yivnR+Y=
X-Google-Smtp-Source: AA0mqf7MmXmaf/L+wigAXaOlCY44BwYrdpA2K+M67FvUPZ85+eGbZGssAOusmVHwWAkIDEiiIKdAcg==
X-Received: by 2002:a17:903:24e:b0:188:8745:35af with SMTP id
 j14-20020a170903024e00b00188874535afmr49943612plh.63.1671088750984; 
 Wed, 14 Dec 2022 23:19:10 -0800 (PST)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 j14-20020a170903024e00b001897bfc9802sm3046141plh.93.2022.12.14.23.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 23:19:10 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: backlight: Fix doc for backlight_device_get_by_name
Date: Thu, 15 Dec 2022 11:19:01 +0400
Message-Id: <20221215071902.424005-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

backlight_put() has been dropped, we should call put_device() to drop
the reference taken by backlight_device_get_by_name().

Fixes: 0f6a3256fd81 ("backlight: backlight: Drop backlight_put()")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/video/backlight/backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index b788ff3d0f45..6eea72aa8dbf 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -501,7 +501,7 @@ EXPORT_SYMBOL(backlight_device_get_by_type);
  *
  * This function looks up a backlight device by its name. It obtains a reference
  * on the backlight device and it is the caller's responsibility to drop the
- * reference by calling backlight_put().
+ * reference by calling put_device().
  *
  * Returns:
  * A pointer to the backlight device if found, otherwise NULL.
-- 
2.25.1

