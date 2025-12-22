Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0259CD4FC3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBF610E575;
	Mon, 22 Dec 2025 08:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Brjw5unT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A92510E575
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:23:00 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7b7828bf7bcso4176494b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391779; x=1766996579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
 b=Brjw5unTzSHDsmO8miQo7SuVGXWhpnHe8uK4Llhf4P+Ah/vxasi986m80Ij17e909g
 YLiLZI6m0xYGqQ+oI6fum0WYyYFjbxaVdMBVB+bxjg+hmL3e5+zYnF5SONQsYkDZ1rP9
 5z5089WXBijkuVrQh6wSPE+QzPXIuSEO8vboUiqDANJERjspRYm9D/aWiBPdQfyUCnDh
 BdeCHPrr1gPePOudj8l4PlgNTKoC3/SLqzN+HZoZe46+m01I3VJtnXO7G6li6hYpLGp6
 RRLHedrd1c5kySrAK3lh8XI6kZaLgztsoGmB4i3ITo9l8GHS3MUFanCCCFdtmBFF+HlM
 T3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391779; x=1766996579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
 b=hjCY9zV1squcWk7K1NkRuzFu62FT6POIWPlXincXtQ7IGnLA5BOUnngSB3/KfWJxhr
 cdD6iD5dNoEHj3u/sQ1FF/5hvR3hu+5Yjkg6muX+IvKuZb+JUfKxryEhTmTObMK4FovW
 D9f/OcHFL/5o/t2a2fVxxRR8uStOdBtegUPHoY9oNI6j/lM5rmTWjKnIKJuZjkSa5/gv
 d1h3fwyRKGS5/87nlv1gZmYUlx920LgZQIB7FmdJkIRbcim1xpHx8csC79qOvUOAxep1
 rDXY3QN5eJ6zNIyfurR5tQkso9un7GycSGFiPO9rX7JZcvwp9P1ennEtsS36pN5bImyp
 TD9A==
X-Gm-Message-State: AOJu0YwUqTM0bNi2vRjy+SVoXcc0UpPuILlnc30Rc4+c3KxbOsnY3BGC
 B+sUo4ddwKX8e0nfwfqQk0vDO8cCvepPNfRP+B/wtkiqALWf8fVQVR48
X-Gm-Gg: AY/fxX5RfKEkPUXjeyTwfmfGbdGpsafxnSV8LOxzS0epb3HxpDtWWYY+j73i9WyI1rQ
 7BVygpi47tIz6ael3CDF/jPeS/gLSDdTJK8DlbAdQ0NVUB1/8jdGuagL4P4Z+yvVL63onMVxbJY
 I+jUIOEcpUyZ2BJe2UAn2Vq6htr+9dg4Tnnb05ayIEQ3pNHF/OkgWcdAPK2iqzczrpnRO9MKKs2
 QnactN71uojLzrpwXghSrFX9vc9esBUCUbESSRWKKd+IREsZPHB/8tRL5lboS3iqvsMJisGyeMY
 go/1GljvSoP1b8l75RMIj60f+wl9et0ZBv1GxGtsyGjCJ2DRFVjKnYnNmuM71mpg6IPV7FeZPN5
 ol+9bGjxxHZ9PipY9IcAfulvDD+sUVcQDaQj1WF6TAWvsPZfb2OW6aUE2aCv5iRgkyrx4zFX+YN
 MamhdtnTS6HHllEWA/pLM=
X-Google-Smtp-Source: AGHT+IGPhjVEd8hFCFWSuzrJ6/8E9Tcr4jw08Ck32qa0ZVNPKd3V6Hm2f6vkNyl5Idf/bQen/LCS2Q==
X-Received: by 2002:a05:6a00:b902:b0:7a1:49f7:ad04 with SMTP id
 d2e1a72fcca58-7ff642154b6mr9938622b3a.14.1766391779554; 
 Mon, 22 Dec 2025 00:22:59 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Mon, 22 Dec 2025 21:20:26 +1300
Message-ID: <20251222082049.1782440-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d2ff203d0873..21c1db7e8705 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0

