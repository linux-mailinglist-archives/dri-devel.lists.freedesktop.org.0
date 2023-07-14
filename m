Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E628752F27
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 04:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412F210E7B6;
	Fri, 14 Jul 2023 02:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ACD10E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:08:51 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R2FJY52j5zBRSVX
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:08:45 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689300525; x=1691892526; bh=Fzq7xxyEDs/i9LXK669wVX2YP5w
 0Q7ZOsHaKtuIRCLQ=; b=sNuOf+9cAzbEQvOb1DuzNo6+j9t1TGLpwpsxSrpGCCY
 bjVGka3k27cJl2/xIcjTKVGsal+0BTKsoAE3Sh7XIU2bg64i9KCs6ksekYKwD6Vi
 zxZnYNOolukLwtnQkMJkbAO1ryiQdX+yMwNjKLngS6BamIkh+dnGz9HEXu6fMxSn
 wuEr0ojdrl48R23BQY2uMudgEJxK2y89BOheaT/I7Wer6bsXMjwZckTRjTnt+Zek
 Hy51VGgonJI6OJ1AVoxeWRigREZi1z3nZh7rfKPX92a0tLex3N5baPvlmy84P/an
 4w9F52AqOGqAGT6K7FFDZiOfjNz33foEI0rE8l1rV6g==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1CFioN7fAlKW for <dri-devel@lists.freedesktop.org>;
 Fri, 14 Jul 2023 10:08:45 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R2FJY2hgfzBRSVQ;
 Fri, 14 Jul 2023 10:08:45 +0800 (CST)
MIME-Version: 1.0
Date: Fri, 14 Jul 2023 10:08:45 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: add missing spaces after ','
In-Reply-To: <20230714012736.13031-1-xujianghui@cdjrlc.com>
References: <20230714012736.13031-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <79709251a62a1d58947d96a363e82d58@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing spaces to clear checkpatch errors.

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/include/nvhw/drf.h | 80 +++++++++++-----------
  1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/drf.h 
b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
index d6969c0e2f29..a14f8d5663bb 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
@@ -33,58 +33,58 @@
  #define DRF_MX_MW(drf)      drf
  #define DRF_MX(drf)         DRF_MX_##drf
  #define DRF_MW(drf)         DRF_MX(drf)
-#define DRF_MW_SPANS(o,drf) (DRF_LW_IDX((o),drf) != 
DRF_HW_IDX((o),drf))
+#define DRF_MW_SPANS(o, drf) (DRF_LW_IDX((o), drf) != DRF_HW_IDX((o), 
drf))
  #define DRF_MW_SIZE(o)      (sizeof((o)[0]) * 8)

-#define DRF_LW_IDX(o,drf)   (DRF_LO(DRF_MW(drf)) / DRF_MW_SIZE(o))
-#define DRF_LW_LO(o,drf)    (DRF_LO(DRF_MW(drf)) % DRF_MW_SIZE(o))
-#define DRF_LW_HI(o,drf)    (DRF_MW_SPANS((o),drf) ? (DRF_MW_SIZE(o) - 
1) : DRF_HW_HI((o),drf))
-#define DRF_LW_BITS(o,drf)  (DRF_LW_HI((o),drf) - DRF_LW_LO((o),drf) + 
1)
-#define DRF_LW_MASK(o,drf)  (~0ULL >> (64 - DRF_LW_BITS((o),drf)))
-#define DRF_LW_SMASK(o,drf) (DRF_LW_MASK((o),drf) << 
DRF_LW_LO((o),drf))
-#define DRF_LW_GET(o,drf)   (((o)[DRF_LW_IDX((o),drf)] >> 
DRF_LW_LO((o),drf)) & DRF_LW_MASK((o),drf))
-#define DRF_LW_VAL(o,drf,v) (((v) & DRF_LW_MASK((o),drf)) << 
DRF_LW_LO((o),drf))
-#define DRF_LW_CLR(o,drf)   ((o)[DRF_LW_IDX((o),drf)] & 
~DRF_LW_SMASK((o),drf))
-#define DRF_LW_SET(o,drf,v) (DRF_LW_CLR((o),drf) | 
DRF_LW_VAL((o),drf,(v)))
-
-#define DRF_HW_IDX(o,drf)   (DRF_HI(DRF_MW(drf)) / DRF_MW_SIZE(o))
-#define DRF_HW_LO(o,drf)    0
-#define DRF_HW_HI(o,drf)    (DRF_HI(DRF_MW(drf)) % DRF_MW_SIZE(o))
-#define DRF_HW_BITS(o,drf)  (DRF_HW_HI((o),drf) - DRF_HW_LO((o),drf) + 
1)
-#define DRF_HW_MASK(o,drf)  (~0ULL >> (64 - DRF_HW_BITS((o),drf)))
-#define DRF_HW_SMASK(o,drf) (DRF_HW_MASK((o),drf) << 
DRF_HW_LO((o),drf))
-#define DRF_HW_GET(o,drf)   ((o)[DRF_HW_IDX(o,drf)] & 
DRF_HW_SMASK((o),drf))
-#define DRF_HW_VAL(o,drf,v) (((long long)(v) >> DRF_LW_BITS((o),drf)) & 
DRF_HW_SMASK((o),drf))
-#define DRF_HW_CLR(o,drf)   ((o)[DRF_HW_IDX((o),drf)] & 
~DRF_HW_SMASK((o),drf))
-#define DRF_HW_SET(o,drf,v) (DRF_HW_CLR((o),drf) | 
DRF_HW_VAL((o),drf,(v)))
+#define DRF_LW_IDX(o, drf)   (DRF_LO(DRF_MW(drf)) / DRF_MW_SIZE(o))
+#define DRF_LW_LO(o, drf)    (DRF_LO(DRF_MW(drf)) % DRF_MW_SIZE(o))
+#define DRF_LW_HI(o, drf)    (DRF_MW_SPANS((o), drf) ? (DRF_MW_SIZE(o) 
- 1) : DRF_HW_HI((o), drf))
+#define DRF_LW_BITS(o, drf)  (DRF_LW_HI((o), drf) - DRF_LW_LO((o), drf) 
+ 1)
+#define DRF_LW_MASK(o, drf)  (~0ULL >> (64 - DRF_LW_BITS((o), drf)))
+#define DRF_LW_SMASK(o, drf) (DRF_LW_MASK((o), drf) << DRF_LW_LO((o), 
drf))
+#define DRF_LW_GET(o, drf)   (((o)[DRF_LW_IDX((o), drf)] >> 
DRF_LW_LO((o), drf)) & DRF_LW_MASK((o), drf))
+#define DRF_LW_VAL(o, drf, v) (((v) & DRF_LW_MASK((o), drf)) << 
DRF_LW_LO((o), drf))
+#define DRF_LW_CLR(o, drf)   ((o)[DRF_LW_IDX((o), drf)] & 
~DRF_LW_SMASK((o), drf))
+#define DRF_LW_SET(o, drf, v) (DRF_LW_CLR((o), drf) | DRF_LW_VAL((o), 
drf, (v)))
+
+#define DRF_HW_IDX(o, drf)   (DRF_HI(DRF_MW(drf)) / DRF_MW_SIZE(o))
+#define DRF_HW_LO(o, drf)    0
+#define DRF_HW_HI(o, drf)    (DRF_HI(DRF_MW(drf)) % DRF_MW_SIZE(o))
+#define DRF_HW_BITS(o, drf)  (DRF_HW_HI((o), drf) - DRF_HW_LO((o), drf) 
+ 1)
+#define DRF_HW_MASK(o, drf)  (~0ULL >> (64 - DRF_HW_BITS((o), drf)))
+#define DRF_HW_SMASK(o, drf) (DRF_HW_MASK((o), drf) << DRF_HW_LO((o), 
drf))
+#define DRF_HW_GET(o, drf)   ((o)[DRF_HW_IDX(o, drf)] & 
DRF_HW_SMASK((o), drf))
+#define DRF_HW_VAL(o, drf, v) (((long long)(v) >> DRF_LW_BITS((o), 
drf)) & DRF_HW_SMASK((o), drf))
+#define DRF_HW_CLR(o, drf)   ((o)[DRF_HW_IDX((o), drf)] & 
~DRF_HW_SMASK((o), drf))
+#define DRF_HW_SET(o, drf, v) (DRF_HW_CLR((o), drf) | DRF_HW_VAL((o), 
drf, (v)))

  /* DRF accessors. */
-#define NVVAL_X(drf,v) (((v) & DRF_MASK(drf)) << DRF_LO(drf))
-#define NVVAL_N(X,d,r,f,  v) NVVAL_X(d##_##r##_##f, (v))
-#define NVVAL_I(X,d,r,f,i,v) NVVAL_X(d##_##r##_##f(i), (v))
-#define NVVAL_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVVAL_X(drf, v) (((v) & DRF_MASK(drf)) << DRF_LO(drf))
+#define NVVAL_N(X, d, r, f,  v) NVVAL_X(d##_##r##_##f, (v))
+#define NVVAL_I(X, d, r, f, i, v) NVVAL_X(d##_##r##_##f(i), (v))
+#define NVVAL_(X, _1, _2, _3, _4, _5, IMPL, ...) IMPL
  #define NVVAL(A...) NVVAL_(X, ##A, NVVAL_I, NVVAL_N)(X, ##A)

-#define NVDEF_N(X,d,r,f,  v) NVVAL_X(d##_##r##_##f, 
d##_##r##_##f##_##v)
-#define NVDEF_I(X,d,r,f,i,v) NVVAL_X(d##_##r##_##f(i), 
d##_##r##_##f##_##v)
-#define NVDEF_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVDEF_N(X, d, r, f, v) NVVAL_X(d##_##r##_##f, 
d##_##r##_##f##_##v)
+#define NVDEF_I(X, d, r, f, i, v) NVVAL_X(d##_##r##_##f(i), 
d##_##r##_##f##_##v)
+#define NVDEF_(X, _1, _2, _3, _4, _5, IMPL, ...) IMPL
  #define NVDEF(A...) NVDEF_(X, ##A, NVDEF_I, NVDEF_N)(X, ##A)

-#define NVVAL_GET_X(o,drf) (((o) >> DRF_LO(drf)) & DRF_MASK(drf))
-#define NVVAL_GET_N(X,o,d,r,f  ) NVVAL_GET_X(o, d##_##r##_##f)
-#define NVVAL_GET_I(X,o,d,r,f,i) NVVAL_GET_X(o, d##_##r##_##f(i))
-#define NVVAL_GET_(X,_1,_2,_3,_4,_5,IMPL,...) IMPL
+#define NVVAL_GET_X(o, drf) (((o) >> DRF_LO(drf)) & DRF_MASK(drf))
+#define NVVAL_GET_N(X, o, d, r, f) NVVAL_GET_X(o, d##_##r##_##f)
+#define NVVAL_GET_I(X, o, d, r, f, i) NVVAL_GET_X(o, d##_##r##_##f(i))
+#define NVVAL_GET_(X, _1, _2, _3, _4, _5, IMPL, ...) IMPL
  #define NVVAL_GET(A...) NVVAL_GET_(X, ##A, NVVAL_GET_I, NVVAL_GET_N)(X, 
##A)

-#define NVVAL_TEST_X(o,drf,cmp,drfv) (NVVAL_GET_X((o), drf) cmp drfv)
-#define NVVAL_TEST_N(X,o,d,r,f,  cmp,v) NVVAL_TEST_X(o, d##_##r##_##f   
, cmp, (v))
-#define NVVAL_TEST_I(X,o,d,r,f,i,cmp,v) NVVAL_TEST_X(o, 
d##_##r##_##f(i), cmp, (v))
-#define NVVAL_TEST_(X,_1,_2,_3,_4,_5,_6,_7,IMPL,...) IMPL
+#define NVVAL_TEST_X(o, drf, cmp, drfv) (NVVAL_GET_X((o), drf) cmp 
drfv)
+#define NVVAL_TEST_N(X, o, d, r, f, cmp, v) NVVAL_TEST_X(o, 
d##_##r##_##f   , cmp, (v))
+#define NVVAL_TEST_I(X, o, d, r, f, i, cmp, v) NVVAL_TEST_X(o, 
d##_##r##_##f(i), cmp, (v))
+#define NVVAL_TEST_(X, _1, _2, _3, _4, _5, _6, _7, IMPL, ...) IMPL
  #define NVVAL_TEST(A...) NVVAL_TEST_(X, ##A, NVVAL_TEST_I, 
NVVAL_TEST_N)(X, ##A)

-#define NVDEF_TEST_N(X,o,d,r,f,  cmp,v) NVVAL_TEST_X(o, d##_##r##_##f   
, cmp, d##_##r##_##f##_##v)
-#define NVDEF_TEST_I(X,o,d,r,f,i,cmp,v) NVVAL_TEST_X(o, 
d##_##r##_##f(i), cmp, d##_##r##_##f##_##v)
-#define NVDEF_TEST_(X,_1,_2,_3,_4,_5,_6,_7,IMPL,...) IMPL
+#define NVDEF_TEST_N(X, o, d, r, f, cmp, v) NVVAL_TEST_X(o, 
d##_##r##_##f   , cmp, d##_##r##_##f##_##v)
+#define NVDEF_TEST_I(X, o, d, r, f, i, cmp, v) NVVAL_TEST_X(o, 
d##_##r##_##f(i), cmp, d##_##r##_##f##_##v)
+#define NVDEF_TEST_(X, _1, _2, _3, _4, _5, _6, _7, IMPL, ...) IMPL
  #define NVDEF_TEST(A...) NVDEF_TEST_(X, ##A, NVDEF_TEST_I, 
NVDEF_TEST_N)(X, ##A)

  #define NVVAL_SET_X(o,drf,v) (((o) & ~DRF_SMASK(drf)) | NVVAL_X(drf, 
(v)))
