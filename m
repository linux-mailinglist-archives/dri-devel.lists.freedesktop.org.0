Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB1946152
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB7510E192;
	Fri,  2 Aug 2024 16:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="DWPPxiAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662C010E193
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:03:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ef2cce8be8so103283771fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1722614635; x=1723219435;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vWX0mheMHoq/ICPp8r+x9QWJESTdzniHyuoFDx+Vayc=;
 b=DWPPxiADVjYWSSHnSQii1tn+4UhE98+Lo/G8vg1tTqwYJ85O8trKymvwyI8Ac8lYNE
 cIg1r8brEcnW0WTY0r9Ggwat1GAhEBA270y/tAjpQ7Tz7UOCkHyQadbEdzjiRiiy6TI3
 NFVdLUPkcG9yAObaUXbNRV7tmYxdQipLqV6AIeroYA4j/qcLSb5c9WXG7V3peMBLsloc
 qc+NCyZ9G+GchSIVaPuKboWeFB8WfoSJOMr/ce65U9wbOv5QAghavFh+I/GTGQpxRZK7
 g+KgCBylOigHwtRvTKTlzVUWJdVCshzhiHYQQleX+XOogBOv/8d/L81ZDASPmVB3saD5
 zwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722614635; x=1723219435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWX0mheMHoq/ICPp8r+x9QWJESTdzniHyuoFDx+Vayc=;
 b=bQmfbVpmLcGGdAO467i3hvCp6naE3OqowevDNWE00e/W7sNPoo/5ENkQxrTgS8JRxy
 un2zxB7gyiPW+rFxjLlXpkLjPqz48FOAZNtl6kwndgEDCjHw37/4PyY9lRJAYPK814OY
 TFDEdzdZDRbo6dq3P9r+gY1sbH7GwERMvUGZq77pysuRMrEuA5lkyL/HpMiielTEKCLX
 3xFkBwyYxcz5Mjz8BgNUKAuJO53tt85vptWFTXGkj++tMvDgxJ9MDXj+l5G060HJOvg9
 9NZ51oB0Ejid6HmJXuBCwZ+XLTtigodAtbmQioKeq9ikJKnY5DcAzGTzWjdscO8ykbk/
 vVRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTY112E9u8YN7pABOnRVjrkhoiE2Q9NAnV+S3udO3fBgIgRmoU6jSgbiKUuJbT9AsJ9d10Z3LO8TXl53pmbKXH1c5VdGzZQejhekY+H1Cc
X-Gm-Message-State: AOJu0Yzvw41jQsSlanIzrYO+8Mst7Dn06VTEMoQGNvfywKQb4MwqXdbi
 mEOaQcY46zI89rtu3Ach/8u1HT8ZFNzGQP3c4qDe9mDWbaYQ7k/8Bje8MZ/rm0Y=
X-Google-Smtp-Source: AGHT+IHWMAsctgqofI5c9OnE2DkE2XnE2nCF4IAIqFKxoTDbkmHYkLOn8gZfpr7W3peLpSgzogberA==
X-Received: by 2002:a2e:2418:0:b0:2ef:3258:4961 with SMTP id
 38308e7fff4ca-2f15aa9919cmr26771621fa.15.1722614635006; 
 Fri, 02 Aug 2024 09:03:55 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de.
 [82.135.80.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6cd8d67sm38603285e9.0.2024.08.02.09.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 09:03:54 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH v2] drm/i915: Explicitly cast divisor and use div_u64()
Date: Fri,  2 Aug 2024 18:03:23 +0200
Message-ID: <20240802160323.46518-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the comment explains, the if check ensures that the divisor oa_period
is a u32. Explicitly cast oa_period to u32 to remove the following
Coccinelle/coccicheck warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Use the preferred div_u64() function instead of the do_div() macro and
remove the now unnecessary local variable tmp.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
Changes in v2:
- Use div_u64() instead of do_div() after feedback from Ville Syrjälä
- Link to v1: https://lore.kernel.org/linux-kernel/20240710074650.419902-2-thorsten.blum@toblux.com/
---
 drivers/gpu/drm/i915/i915_perf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0b1cd4c7a525..f65fbe13ab59 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4096,15 +4096,13 @@ static int read_properties_unlocked(struct i915_perf *perf,
 			oa_period = oa_exponent_to_ns(perf, value);
 
 			/* This check is primarily to ensure that oa_period <=
-			 * UINT32_MAX (before passing to do_div which only
+			 * UINT32_MAX (before passing it to div_u64 which only
 			 * accepts a u32 denominator), but we can also skip
 			 * checking anything < 1Hz which implicitly can't be
 			 * limited via an integer oa_max_sample_rate.
 			 */
 			if (oa_period <= NSEC_PER_SEC) {
-				u64 tmp = NSEC_PER_SEC;
-				do_div(tmp, oa_period);
-				oa_freq_hz = tmp;
+				oa_freq_hz = div_u64(NSEC_PER_SEC, (u32)oa_period);
 			} else
 				oa_freq_hz = 0;
 
-- 
2.45.2

