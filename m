Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A3581C47
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 01:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F2BB20FF;
	Tue, 26 Jul 2022 23:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FA9B2137
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 23:09:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l22so466181wrz.7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IXBbfu9mH+3+82kkU4IAZXAEpzI0pj7x/+D2ozToh5w=;
 b=NPv3yuIQbsQLMH7RsnBBqh/qdJLdGbIa0IDae1WJu0k0Lgagakni4QySN5ufrp9P4O
 sif0hRkblEt+rTBcvEIy4EXFb1WBRinXkxxKwELgZhAuF3wt8CKBGG60r8oI4LgsWdGP
 87+sKBoWp94lRiKoeqTo44xD4MmmfXXtpdRi8GKy9rSfSgQWGzDuh31GY4qmgQZxoYpO
 iJBEqJlUr+iGd0uacoQAaB/ovVyJ2T5cAa9lPce8RRqiVa7ygPtXQynKgkTZKmrsfAls
 jOPBIt5JfsDT8Yo3z8LFnLmWpOwRXB7JJqC0dlmEUGgML9uCFX6kpCaN7FHfsfW1Mq5E
 VASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IXBbfu9mH+3+82kkU4IAZXAEpzI0pj7x/+D2ozToh5w=;
 b=vwPZGz/Mf4qffbN5I8ZFG0Q5/oLYna9F+0qP9u+uKcbTmhtA95L03roMvVbOIDs1MH
 Iycs15gN8K46vAEYKJstensDfDrjWyrJzp0ZNRWWMIIO4n/DS9xn5hEx9YEYhnW0CwbY
 Lz9aEZIA5ajy+zjOp5YGL/Q2LzJiFy6gXH7aU+O8qR7ISS8ycjjNCuggjPv6/aI4rDbv
 8SILQ+JaqpvS6vv73A13a0/2t75lqgCtHQVn+FRJz+sqrX39Y8OXbVKsn5g409DTFKkh
 HQrl0pFm7PWw7LyafVUedwO/ZEn6JzBc9VH/vR0j5vsThqaPoCMLImTS8gGj7MK8mTYW
 y/5w==
X-Gm-Message-State: AJIora/HqXlNaVI0SnhZfSig03F9xf0jnRzlsf1LuuJPh3hz5x810Zu9
 7Zdu36LB/6HIItd3Shw6o0s=
X-Google-Smtp-Source: AGRyM1tWEYsb37uk6QjZIBeHdz8zdF3zgTaiG38PwXMzYHyAoZm5sRjiG4hj2tmDVSOwHofPYB7brg==
X-Received: by 2002:a5d:64ec:0:b0:21e:92fe:ac77 with SMTP id
 g12-20020a5d64ec000000b0021e92feac77mr5802206wri.24.1658876972259; 
 Tue, 26 Jul 2022 16:09:32 -0700 (PDT)
Received: from localhost.localdomain ([94.73.33.57])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0021e86504736sm7278533wrb.16.2022.07.26.16.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 16:09:32 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 2/4] drm/format-helper: Rename test cases to make them more
 generic
Date: Wed, 27 Jul 2022 01:09:14 +0200
Message-Id: <20220726230916.390575-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726230916.390575-1-jose.exposito89@gmail.com>
References: <20220726230916.390575-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tests available at the moment only check the conversion from
XRGB8888 to RGB332. However, more conversions will be tested in the
future.

In order to make the struct and functions present in the tests more
generic, rename xrgb8888_to_rgb332_* to convert_xrgb8888_*.

Tested-by: Tales L. Aparecida <tales.aparecida@gmail.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index eefaba3aaea2..97fccd0a948b 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -16,7 +16,7 @@
 
 #define TEST_BUF_SIZE 50
 
-struct xrgb8888_to_rgb332_case {
+struct convert_xrgb8888_case {
 	const char *name;
 	unsigned int pitch;
 	unsigned int dst_pitch;
@@ -25,7 +25,7 @@ struct xrgb8888_to_rgb332_case {
 	const u8 expected[4 * TEST_BUF_SIZE];
 };
 
-static struct xrgb8888_to_rgb332_case xrgb8888_to_rgb332_cases[] = {
+static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 	{
 		.name = "single_pixel_source_buffer",
 		.pitch = 1 * 4,
@@ -126,18 +126,18 @@ static u32 *le32buf_to_cpu(struct kunit *test, const u32 *buf, size_t buf_size)
 	return dst;
 }
 
-static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case *t,
-					 char *desc)
+static void convert_xrgb8888_case_desc(struct convert_xrgb8888_case *t,
+				       char *desc)
 {
 	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
-KUNIT_ARRAY_PARAM(xrgb8888_to_rgb332, xrgb8888_to_rgb332_cases,
-		  xrgb8888_to_rgb332_case_desc);
+KUNIT_ARRAY_PARAM(convert_xrgb8888, convert_xrgb8888_cases,
+		  convert_xrgb8888_case_desc);
 
 static void xrgb8888_to_rgb332_test(struct kunit *test)
 {
-	const struct xrgb8888_to_rgb332_case *params = test->param_value;
+	const struct convert_xrgb8888_case *params = test->param_value;
 	size_t dst_size;
 	__u8 *dst = NULL;
 	__u32 *src = NULL;
@@ -163,8 +163,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
-	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test,
-			 xrgb8888_to_rgb332_gen_params),
+	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

