Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF992CC37
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 09:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C8D10E6A5;
	Wed, 10 Jul 2024 07:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="ofri7lUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D200210E6A6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:48:56 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52ea2ce7abaso8190550e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 00:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720597735; x=1721202535;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GNsDfIDnf4EzGjKDdcme11QFsKS3nMXn+3RFV1TKwBQ=;
 b=ofri7lUb/qIiVgnFnRxitDCn4mkG7ceRAVdwEPP6om/RistzwHEXRyJp2xM85ZHa6K
 aoS2jPHfBPRS2aAjklmTmClrOkQZuU6OhDZSQmlxBwUOvYuCs2rDkX7QWSPGruo1HJDB
 SqcNLQebU/y/qi54T+nCy02hNSdS8EAuIdF9Y0a4qzmf8l2eBTbAmTm5Ktwb692oMb85
 +6obYfbG1WRQDav2jorrLHzK8aN2o+XFiSR8P7SId+yo07JJZdOCp18lrfP7wFZQRgBB
 kKrRZC/0IxR2dzrOOFdSLDColgRd42qJiYJdk8UePnT8TYAA392MGk2u9z1zJhq6Y+Ri
 WjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720597735; x=1721202535;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GNsDfIDnf4EzGjKDdcme11QFsKS3nMXn+3RFV1TKwBQ=;
 b=LCQ9vlpx9iM+rcAxPb+dLUNw2qPkUlsFcoQ2P9N0fKHRF0OKHJlJ8dNLxHqa5pI1vA
 Hb6t4ZX7bkYXsYkt6EsqdzxHAXazBMEBahxLiQwllE/CKeQVrQTEBcnk09dFPQuMLHne
 GNeDQpilqCDUC+6C7X2y1/5fseagPFE5QhxE3e5/PVePWiJw/t04EOhmyyBPLR7EjwfN
 ZYZYpMQrJgJMvdpiXRrP5PKf/hv75JHVK8tvDYwGESeEGhQXzj1nCaHo9BAW6qVQSON4
 929dRjsnOXNIv7dZQtiVo55FFYjXC50cQGmxtWNHttVv1NUulZKjSA+P0GLGtrBaGzG6
 ceqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUbJkRyhb1FVY46u6EXKfdaH6ynqWv+R7QQlVFvBjmhoRDjUlxy56IKbLEY+u02Sb+Kcja7NjlfJVUIdgAsW1VPTkuc+qGwwMgEO4MdzB8
X-Gm-Message-State: AOJu0YwYhlBPxzYiohTkAgNe62jdd1BKaFjIxC8286kGscrj7cGDt4Ch
 OWyGvqprZUahtVCBYx4MMbZTXuNtDC+WoYGjMYuvblZ4LIYKNCVspgy5VF4jTdI=
X-Google-Smtp-Source: AGHT+IG80H6A817GZXvHI9egaLq2gNkzKl5Ws5DDQve3aWxctuque2YrycdsMJ8ERJDon1+bu1hJ2w==
X-Received: by 2002:ac2:5544:0:b0:52c:db0a:a550 with SMTP id
 2adb3069b0e04-52eb99d2025mr2795508e87.42.1720597734730; 
 Wed, 10 Jul 2024 00:48:54 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de.
 [82.135.80.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa06absm4537414f8f.80.2024.07.10.00.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 00:48:54 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/i915: Explicitly cast divisor to fix Coccinelle warning
Date: Wed, 10 Jul 2024 09:46:51 +0200
Message-ID: <20240710074650.419902-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
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

As the comment explains, the if check ensures that the divisor oa_period
is a u32. Explicitly cast oa_period to u32 to remove the following
Coccinelle/coccicheck warning reported by do_div.cocci:

  WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0b1cd4c7a525..24722e758aaf 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4103,7 +4103,7 @@ static int read_properties_unlocked(struct i915_perf *perf,
 			 */
 			if (oa_period <= NSEC_PER_SEC) {
 				u64 tmp = NSEC_PER_SEC;
-				do_div(tmp, oa_period);
+				do_div(tmp, (u32)oa_period);
 				oa_freq_hz = tmp;
 			} else
 				oa_freq_hz = 0;
-- 
2.45.2

