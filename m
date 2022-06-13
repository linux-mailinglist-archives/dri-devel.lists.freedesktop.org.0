Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825635499A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429610E5C5;
	Mon, 13 Jun 2022 17:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E76C10E58C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:17:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so4951975wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oTgKLvjLuTzO7UM/mQsy+9BhRmEEwbTxiHwdzXn+Bis=;
 b=GCqt0jHDbbSAEtN+nQobnMYuspNmhWO31Jlw3BkNbBf4JuoBPhaTz0IqkCqndu0yTD
 XEwFvO18vMq2x/zYuP5VPzM6C0GXCH1I+T7FuwfX+Xm/eS0o66cQKMSnc9vGmcbtS3qn
 kVUxCXGnNvfc20nSneMcBtPI3GxeM/pWq5php6GklT52+D+OYf4wSJ0j8sFvUd0b46UK
 TB2d/JBO3OhcD1A0VMlyA89+trntVh6ygLkNqYmxKlw3kzPSlyfyry7hzFAm7Z6D7oGF
 inGWMPjHahuf5WdtUGZsdgXaytjRrsEafpH3TYIMSbmAWjV4EudB7pPINesAvIhvdcth
 rzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oTgKLvjLuTzO7UM/mQsy+9BhRmEEwbTxiHwdzXn+Bis=;
 b=iYqE6+UvWyxqWorcZOwrkMvNnvqVafE2u+llnyYBq02uqFm2UmMPuEPKvlr7dhYiz9
 jSFafEOTYNIZDCobo5GgnLcdqN866c4klFz3zXaT3oPwx2fKtPI75kzi2OaYLTlWVM2y
 udjyUhNPmMlDsU7H87vB5Qzx9MrQ89nSSTQh8Fbrcue/jL4WTlgp0N7hWezHVoNCXcWb
 QbyiKKHnDlY9mI3dPvLaXRzPRxS1G34ZqTFUkGugwxIVArLtT08xRvSLZOYZQU332URn
 QJDqSffRazvPjk0jAeyskvLeQyQqTcnBpgV6BTn3F0KRzMSj7vX78JPjpLNHPn8DCfgv
 h+1g==
X-Gm-Message-State: AOAM531h6VJiVyDb37EEKl0aBkLt9UpvIVVP3/S9COK4RiLp7honXP+y
 O5yxwq9nydTf9P59Yi9ZGzQ=
X-Google-Smtp-Source: ABdhPJzigC+Zu4VdUjf/vJ/zZ+ckaaLhD1Hmrd5dgKce1PLsqWQFWFA/i0izU2+UeTXMvSspFJJtgQ==
X-Received: by 2002:a1c:7901:0:b0:39c:4252:d7f1 with SMTP id
 l1-20020a1c7901000000b0039c4252d7f1mr537938wme.178.1655140667601; 
 Mon, 13 Jun 2022 10:17:47 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056000100a00b0020d106c0386sm9016129wrx.89.2022.06.13.10.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:17:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 1/3] drm/rect: Add DRM_RECT_INIT() macro
Date: Mon, 13 Jun 2022 19:17:36 +0200
Message-Id: <20220613171738.111013-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com, airlied@linux.ie,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper macro to initialize a rectangle from x, y, width and
height information.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 include/drm/drm_rect.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
index 6f6e19bd4dac..e8d94fca2703 100644
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -47,6 +47,22 @@ struct drm_rect {
 	int x1, y1, x2, y2;
 };
 
+/**
+ * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
+ * @x: x coordinate
+ * @y: y coordinate
+ * @w: width
+ * @h: height
+ *
+ * RETURNS:
+ * A new rectangle of the specified size.
+ */
+#define DRM_RECT_INIT(x, y, w, h) ((struct drm_rect){ \
+		.x1 = (x), \
+		.y1 = (y), \
+		.x2 = (x) + (w), \
+		.y2 = (y) + (h) })
+
 /**
  * DRM_RECT_FMT - printf string for &struct drm_rect
  */
-- 
2.25.1

