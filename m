Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14BDA4FF4B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8CD10E792;
	Wed,  5 Mar 2025 13:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eUMYEq6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619F10E29A;
 Wed,  5 Mar 2025 13:01:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21F88A44ED8;
 Wed,  5 Mar 2025 12:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A555C4CEEF;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179663;
 bh=ikzWSj1HbxQhBxPji1We0SLfPqx/Aoj/ffciStixdSE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=eUMYEq6wypbOv8IFG1gEhNOl6YTt0QuJ4GWgZf82h8P5QCfWfUKLYfLz7K+icYAkW
 CM+VhzdzTz+PQxDDNPSQMO5lyWHpHP8AyS2IwnygOg/acR2nOayHKyLjWoeOiFhnhN
 8UhRki+LmkcG7Z30otmWMI7SiH51zmvuEMkmSlLxV8M9mWIugFWd+5iHk9nlxr5ZoU
 2oP2/XNAocmS9SdYT+a5vTjbhYGcxF/B1JiZhpW/JOCiroMKTcs2v8oNxt8+SSsK5Z
 eJV2eaxRJSrP1CMygGTjBK4QHfNBFqrS2XdcJi4vZf3ivNntvTy2zFj6Ej2lZ9dbwF
 jbP5efy8oQGJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD0BC282EC;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 05 Mar 2025 22:00:16 +0900
Subject: [PATCH v4 4/8] bits: introduce fixed-type BIT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
In-Reply-To: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=AAHYKqB1XplF8NNiJahWBMhq9FUpKnWjsSv30RtK2yM=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOknvBmCvylL6VydVHK1KubQpfktd+//S3gWrd5eMvXE6
 Z2bt7Os6ChlYRDjYpAVU2RZVs7JrdBR6B126K8lzBxWJpAhDFycAjCR+VYMv9mkZ9/XURfYcWyy
 onvW6QTuSzvd4rTf5/w/GPD10bpQi8UMf8Vk8o9mhn3WXB93TWM6I9PS/F+ibmcvZcqudDrdwsp
 ixwsA
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

Implement fixed-type BIT to help drivers add stricter checks, like was
done for GENMASK().

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changelog:

  v3 -> v4:

    - Use const_true() to simplify BIT_INPUT_CHECK().

    - Make BIT_U8() and BIT_U16() return an unsigned int instead of a
      u8 and u16. Because of the integer promotion rules in C, an u8
      or an u16 would become a signed integer as soon as these are
      used in any expression. By casting these to unsigned ints, at
      least the signedness is kept.

    - Put the cast next to the BIT() macro.

    - In BIT_U64(): use BIT_ULL() instead of BIT().
---
 include/linux/bits.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index f202e46d2f4b7899c16d975120f3fa3ae41556ae..1b6f5262b79093a01aae6c14ead944e0e85821cc 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -68,6 +68,22 @@
 #define GENMASK_U128(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U128(h, l))
 
+/*
+ * Fixed-type variants of BIT(), with additional checks like GENMASK_t(). The
+ * following examples generate compiler warnings due to shift-count-overflow:
+ *
+ * - BIT_U8(8)
+ * - BIT_U32(-1)
+ * - BIT_U32(40)
+ */
+#define BIT_INPUT_CHECK(type, b) \
+	BUILD_BUG_ON_ZERO(const_true((b) >= BITS_PER_TYPE(type)))
+
+#define BIT_U8(b) (BIT_INPUT_CHECK(u8, b) + (unsigned int)BIT(b))
+#define BIT_U16(b) (BIT_INPUT_CHECK(u16, b) + (unsigned int)BIT(b))
+#define BIT_U32(b) (BIT_INPUT_CHECK(u32, b) + (u32)BIT(b))
+#define BIT_U64(b) (BIT_INPUT_CHECK(u64, b) + (u64)BIT_ULL(b))
+
 #else /* defined(__ASSEMBLY__) */
 
 #define GENMASK(h, l) __GENMASK(h, l)

-- 
2.45.3


