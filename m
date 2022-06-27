Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5C55BB01
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 18:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07D010E943;
	Mon, 27 Jun 2022 16:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6DA10E149
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 16:13:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q9so13766830wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pDNBhiLmVfVV+Ne/LbE/267jCUJxvNsVJYjt8/p09X8=;
 b=NSZPuSAPNl3/J0a/ww1tySEBOpRdxoi0GTHu14n97sUfgnnInXMiWim3dXIZF2//vS
 kzJfJwQJBhGcx9Wp1xLt390KArSmPba0zTcSewvF65CHYFnBc8HLyKnb6VezoPNuQGZ8
 WC8Evuv5b7L3vPSWXWfeldHCecGJHNIUanbkYrxxIeZgYCJWHXdiosK+W5pVGDcn9S3i
 JYNhw6TuSTgQPM+bDn2Oby++SC6VYXENStbHDLNMBGSCF10efi7QPO4OyAIbwwvxMMfh
 Y2y7r5yal7oRs0jymS903iXMzV8N0842Gf+bUnTjq5h2nVTPs+XcaZnrk35cdtmVhNRf
 JCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDNBhiLmVfVV+Ne/LbE/267jCUJxvNsVJYjt8/p09X8=;
 b=AMS54bI0zS/T3obl4PqV1O5VSWVWLagharFSnSDRQpPvS64u/LkSkS9PMpH+cbED4Q
 JbUKnYYv37ezfy48nuaH0+BZm0Zrs7FVoa/F3mu4pqbvo0sqPPkhl3ROqDBSqYmc7QQ9
 8bCG7GAQyvnpFoVcraUdGc6jiROQbVM3E/zNgWj3f/heOpFfnCcEa3/f0ifTf5rwlLAM
 j1I15i3qrK2n/isZ20H+d1lASOGv1cNrZ89txA15xvfOBazHDD2GXI5p/9I9LiZt0xgo
 AdLXBjkgBN8sgJbnqL8l0cbeqvReqNw9L0G782lU/MfezNzkHnq4A6RJmyyvByjXXcGJ
 bl/g==
X-Gm-Message-State: AJIora/+rLu6Lp/ZstJ6NLHLu7fVYRBWoPamN8Xh/bya/Ey6ca+oh2K+
 /gss5RH7/ep1SnE7qb7kQOg=
X-Google-Smtp-Source: AGRyM1slA7u8TabruKXHhU8WYvPoHJ2BflQEkj8mUaP8ATALqTre8paJHdfYQayhYw6aS2fi93jPEw==
X-Received: by 2002:adf:dc08:0:b0:21b:bcaf:8500 with SMTP id
 t8-20020adfdc08000000b0021bbcaf8500mr12257540wri.133.1656346386572; 
 Mon, 27 Jun 2022 09:13:06 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm10883600wrs.31.2022.06.27.09.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 09:13:06 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH 1/4] drm/format-helper: Rename test cases to make them more
 generic
Date: Mon, 27 Jun 2022 18:11:29 +0200
Message-Id: <20220627161132.33256-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
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
XRGB8888 to RGB332. However, more conversion will be tested in the
future.

In order to make the struct and functions present in the tests more
generic, rename xrgb8888_to_rgb332_* to convert_xrgb8888_*.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 .../gpu/drm/tests/drm_format_helper_test.c    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 98583bf56044..de8cf525109e 100644
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
@@ -111,18 +111,18 @@ static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
 	return dst_pitch * drm_rect_height(clip);
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
 
-static void xrgb8888_to_rgb332_test(struct kunit *test)
+static void convert_xrgb8888_test(struct kunit *test)
 {
-	const struct xrgb8888_to_rgb332_case *params = test->param_value;
+	const struct convert_xrgb8888_case *params = test->param_value;
 	size_t dst_size;
 	__u8 *dst = NULL;
 
@@ -144,8 +144,7 @@ static void xrgb8888_to_rgb332_test(struct kunit *test)
 }
 
 static struct kunit_case drm_format_helper_test_cases[] = {
-	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test,
-			 xrgb8888_to_rgb332_gen_params),
+	KUNIT_CASE_PARAM(convert_xrgb8888_test, convert_xrgb8888_gen_params),
 	{}
 };
 
-- 
2.25.1

