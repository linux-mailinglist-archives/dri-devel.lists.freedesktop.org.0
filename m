Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A173B56C949
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 13:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E747112EB5;
	Sat,  9 Jul 2022 11:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746D5112EB3
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 11:58:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l68so658678wml.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dHq8eIN5kbK/6ZDjIj/3D1vTFqSkXTQkrho9nQ1d6+o=;
 b=lnYomu7TWcBNGp4X4XxO9j/KkPMVpk9ajD4O5axwDO/Tpr5yj79EUpdiyG4UG81N1s
 sq9aOoGpnRezRctUpnBoyTVFMaVQ/BD1mQLZXBQ+YBpligjqiMtBAY/Ina+C28dPHyPU
 bdmxeOc4juBrXH6ZXnihWiJk+qaBWrszd0++CFGMDkY5lqNNMDEkNDDUxmOrNKz5Abzq
 pDwTqGl82rdMM4Zdrm3B1wcHw+MCy3ymHEiu6qpA/S5FBzm4lhY0UKzOvUUl27t2NXMi
 PQdxztKrsj0OxFUKm0nGHCg+HoB56KWy6AA82KOCgZdDP+sDc3/6fjLDmXfUpLioakLo
 wd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dHq8eIN5kbK/6ZDjIj/3D1vTFqSkXTQkrho9nQ1d6+o=;
 b=j6lxhswncdF5B6RTsKZmB1Rwx2GumFPlumRunAWjEZb/418RpeBf6hlUotWxaDUY6a
 6YvzOC9cAegauNBqnh+31NBrlKF6+JzSMPXNegNB8+iP2KGo9aJT6CwIP9HTDsKuKpru
 f+4RBVOKqKGYOZLauSGwxsaZmszw5y45A/Io+0QTZEi4sCc4O1boXpXpmg/st9wVoNdK
 l31L61hyBsPT45NHhAjGujWWuKre6oPZXIRp8iPm8L4AqGvloJDw9c65ixXTo320W8S+
 jNqmpt2yiXNu6i+YjzxWwS8ljjj/3zj21hbR96ZeMC9aX981yFaEuOnA0ZpZFxy5OflB
 P3gw==
X-Gm-Message-State: AJIora+uG34n22ViXgHGE7SFbiyhQOerhvXzZsQD8WBandKx17En+Fhm
 Fvooa6M8L440RpFvIPa8EjU=
X-Google-Smtp-Source: AGRyM1v2/yU5e9CVpXAuQmo186YPK77B9a21RT4A0gSk/R4S3OtSDgaJtTvEVmX9OSElSkkT5+zyZA==
X-Received: by 2002:a05:600c:4254:b0:3a1:6c19:f3aa with SMTP id
 r20-20020a05600c425400b003a16c19f3aamr4993203wmm.205.1657367927979; 
 Sat, 09 Jul 2022 04:58:47 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.185])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b0021cf31e1f7csm1199494wrb.102.2022.07.09.04.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 04:58:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v2 2/4] drm/format-helper: Rename test cases to make them more
 generic
Date: Sat,  9 Jul 2022 13:58:35 +0200
Message-Id: <20220709115837.560877-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709115837.560877-1-jose.exposito89@gmail.com>
References: <20220709115837.560877-1-jose.exposito89@gmail.com>
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
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 davidgow@google.com,
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
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 4d074c2e48bf..f66aaa0e52c9 100644
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

