Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB31AD9A3D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 07:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F64B10E201;
	Sat, 14 Jun 2025 05:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="em7iHAhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92C310E201
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 05:29:46 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-70e40e3f316so20624357b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 22:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749878985; x=1750483785; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KRKrDObQhMPQFf9PTLf1A+HaIc9XWYs9GuKdkW/pSkY=;
 b=em7iHAhNnIOXkSYioJt7L5QKpjbI4SJYuyIf/Z0d1UleRvHjy4qEizLwqU+MuoUVX+
 ADXRIjqFEtmf2GdY6U64EAieCxswopen4FhNmzj2u5UY4TwaqMLKU/to29YcolOOye+E
 ukZRoK8Tce40uJ6Snfnzca268qNc/vketSIRq1RgaPfZm7XIU5SZp3dQ8+Em5qcYxdRs
 4swHFMofK9JyM3/6bSkirygnNJK9f1eBc0lYCYWpTqBSgPnzgFfxBhFylGBzMF5WSa36
 0UgB8yvbKG7g6g2mRDJJBAf2H/QvEDOMHn0CFZalfzIZ52B5vpJGcQ7u0aH033s5MbXb
 Tdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749878985; x=1750483785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KRKrDObQhMPQFf9PTLf1A+HaIc9XWYs9GuKdkW/pSkY=;
 b=Ciyj3GFT4mmBpU55aDQKMH5uZT8sBKQ2Sw/qStvGWQbUfa+GfPbEr9nEz6ISPMW9/y
 WcPvMrcL0Dz3L2KP/VlMHNgimreZQX2/LDEkKhTHZs7fvzAzZ41Nqg6Wg72lS42YvK/L
 Z1dFSrEMsepbIYU8Z5QQFhzM8+PiJRa8nwM24CeOxEa8OOyO38XLsiWJVINzPPoHKW8f
 6dmMAn/UqUFGs0VaD9TjrvrKEy4azHC5UfAf01rVYJkaFdznFKgLamgWGFLzn3ynQ/kS
 qeCGeQ+JFnQKypIgq+tzaSvy2zv0Gx+xLUakjudSmaeVyShZOnoUUVtbM6lzT+Ozln55
 kpcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7jVxrkqZ13a0jdxjGn32orspkhUM/RV24e9puSYxQaI84yKDb+v7GO4k8fKhdcIbKxNeKss19SQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVCNB2z3Rzw3PRpfaf7d+Ww0sKkwStS66LK6z/cXKolHLfZ00U
 MoxEtZQjp7icONXkaKorIqqj0QwcllFR8yhX+lkqHG8Ys5Y1fjyUDHs9PuYoqw==
X-Gm-Gg: ASbGncupUmb+D4SbbPyYRNK4Ao8mDxz1B6k6x68K2Diks2BDi9UrhnlAHilitu4E6Pv
 Zxp7LijEVg66WqeqbYtnRDwHX9zcTEfM01XJ2Aq+EHwUtU7BENLzohoLXpLm620ucbz3IXB9wZo
 VD7x66EL1ne2ypl99jrNUTVYr6fF/12+oGVF8/H9RbkAhHMCRarj4yM71HBOLYTqP3z5Dl40CGy
 +BVr+erjRDBzGZ/fFsyPyepbxsvPvR00Yl5/r3N8mkX/LBBlctku+gexPa9LlPAVej06PcQSKBN
 BxuzKFXFw08HZ6ZUesjTFMtFUlH1MIVkMyEPI8r03TpngMwZSyqMWlwIy1qz5Ux6aFJhc4iQdxa
 Q
X-Google-Smtp-Source: AGHT+IFP4qmmzvwCoLSm0orXL9x/zDHgGPO3E4RSSJPSZGS4TypQ6nZnCTxfPpGHPX4C8NHliBZi/g==
X-Received: by 2002:a05:690c:7083:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-7117544d5cfmr28014767b3.30.1749878985301; 
 Fri, 13 Jun 2025 22:29:45 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7115208b1efsm9080217b3.38.2025.06.13.22.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 22:29:45 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Fix potential divide by zero
Date: Sat, 14 Jun 2025 01:29:42 -0400
Message-Id: <20250614052942.3551870-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Variable var->pixclock can be set by user. In case it equals to
zero, divide by zero would occur in acornfb_validate_timing.
Similar crashes have happened in other fbdev drivers. We fix this
by checking whether 'pixclock' is zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/acornfb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index f0600f6ca254..2dc0e64137e5 100644
--- a/drivers/video/fbdev/acornfb.c
+++ b/drivers/video/fbdev/acornfb.c
@@ -421,6 +421,8 @@ acornfb_validate_timing(struct fb_var_screeninfo *var,
 	 * No need to do long long divisions or anything
 	 * like that if you factor it correctly
 	 */
+	if (!var->pixclock)
+		return -EINVAL;
 	hs = 1953125000 / var->pixclock;
 	hs = hs * 512 /
 	     (var->xres + var->left_margin + var->right_margin + var->hsync_len);
-- 
2.34.1

