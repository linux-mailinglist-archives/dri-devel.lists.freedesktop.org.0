Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17B77EA5D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 22:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828B10E3AE;
	Wed, 16 Aug 2023 20:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EF010E3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 20:05:38 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d27ac992539so7433591276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 13:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692216337; x=1692821137;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=q1zJRByobygJmxlGcPsiWYXWmw/Kpo9bqoSIzYxrAMA=;
 b=MvPkkBqm010VBxFPljzdSSPqlYrL8FgyrZXAzR4r/xUWdpnYPgVERfx8PD+azrvKMl
 Js7XhKSo8fj8XcptTE0E8pWWmyKo3pBi3WP/7Uel1U9kKiaIcdi8S5tVhOEWG5VcaN6A
 h11A4j0lWRy59IKfGN17uP3iQTnUOXWOYRdyeyH5MBshW43kG8mNr5nffVj8jAma8FSZ
 n/7yyNPZwsq2rmZ8lbIvE6JOXSsoOco0qR0T3OEm1L9JedF3oEp8/QAAYaBsJ18RjXI7
 xFpgDy00CW7OfeR1XAbQ+MbVeAcZOSjbrFKteZn6bpY6/ZZvAB1Fq4eVytP78qiojp/Z
 slJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692216337; x=1692821137;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q1zJRByobygJmxlGcPsiWYXWmw/Kpo9bqoSIzYxrAMA=;
 b=PQqyq4gDBfRRQYH7a8JHWhQa984Z/RDRpxLimNC0vpIg3mfGY6xl3mI646U94uqxgf
 RI47taiKyJXqpas7LsENZTX67n3ixBhAM9wWDU2KtClqQKmCKQTvZR+CtMZFmDbKJEQR
 oHIWewDNl5sG30YvynT9EKL+Oklkq+YoxF9U4PYWAiXjyymdaSYYLg7Ys4OdIBuv9fRS
 kbcULKnmGHgon/y/w92ggmXwrJ/Sc4RDssXK/obUC4zlF4+TnMr7dFLPPhxbsxMFe/8X
 RwnD+udWYUdQQfRH0u/LxJF+oNh8eu0RHnz9cCGjEIeFLXjBd7X2NdsSNefR8I4jqYZv
 s7KA==
X-Gm-Message-State: AOJu0Yy80htS9o7lZu/j1ClDJTa0e6IwRHYRoc3r9LnCQPknQsMSdyRu
 USLVTz6fcGYPGvvpIldFf6icVeFxO+C8DSmR/g==
X-Google-Smtp-Source: AGHT+IFNaJOEypbhXqhScLpEC21mUN+AtwIEQNf0srEs8ajqHsvV56K3cjHMN0wUd+cCbRBCQpzv2iN90laIwSR5Jw==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1828:b0:d47:4b58:a19e with
 SMTP id cf40-20020a056902182800b00d474b58a19emr41135ybb.11.1692216337708;
 Wed, 16 Aug 2023 13:05:37 -0700 (PDT)
Date: Wed, 16 Aug 2023 20:05:37 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABAs3WQC/yWNUQqDMBBEryL73YWslrb2KkVKTDZ2wWrY2CCId
 29sf4Z5PJjZILEKJ7hXGyhnSTJPBehUgXvZaWAUXxhqUzfmRhfMs3j0Kpk14RA/pb8xjkT0z+c
 h7CIj47npybQu2Kv1UAajcpD1d/bo9v0LTho/FHwAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692216336; l=2252;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Tnc4+dz64T+fPs7aJDSgBftKnogFsH+GQZIzMyR+1bk=;
 b=LmuyjatrHL0EddGvQOBipnyOHLraxks6AybfPQDU72+ioz+pYbqw78aaPi1gn/pyT0iIiNkrp
 6c9T6yj2kV8D6dO05mfCKTBd9A8PmgzKtR6YY3xoWYuebZApiZ+d0gS
X-Mailer: b4 0.12.3
Message-ID: <20230816-void-drivers-gpu-drm-pl111-pl111_versatile-v1-1-92125dd9e6d4@google.com>
Subject: [PATCH] drm: pl111: fix clang -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Justin Stitt <justinstitt@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building with clang 18 I see the following warnings:
|1.     drivers/gpu/drm/pl111/pl111_versatile.c:487:24: warning: cast to smaller
|       integer type 'enum versatile_clcd' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         487 |         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
-
|2.     drivers/gpu/drm/pl111/pl111_versatile.c:507:26: warning: cast to smaller
|       integer type 'enum versatile_clcd' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         507 |                         versatile_clcd_type = (enum versatile_clcd)clcd_id->data;

This is due to the fact that `clcd_id->data` is a void* while `enum versatile_clcd`
has the size of an int.

Cast `clcd_id->data` to a uintptr_t to silence the above warning for
clang builds using W=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/gpu/drm/pl111/pl111_versatile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 00c3ebd32359..d6fd9e51377e 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -484,7 +484,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		return 0;
 	}
 
-	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
+	versatile_clcd_type = (enum versatile_clcd)(uintptr_t)clcd_id->data;
 
 	/* Versatile Express special handling */
 	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
@@ -504,7 +504,7 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
 		np = of_find_matching_node_and_match(NULL, impd1_clcd_of_match,
 						     &clcd_id);
 		if (np)
-			versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
+			versatile_clcd_type = (enum versatile_clcd)(uintptr_t)clcd_id->data;
 	}
 
 	map = syscon_node_to_regmap(np);

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-void-drivers-gpu-drm-pl111-pl111_versatile-43b109cfa7ad

Best regards,
--
Justin Stitt <justinstitt@google.com>

