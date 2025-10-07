Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105ABC0A45
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 10:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2EF10E5AD;
	Tue,  7 Oct 2025 08:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SvjhFkZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3085510E5AD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 08:33:21 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-46e34b0841aso8937125e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759826000; x=1760430800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/5lpEHR2FrKfoBetfp+01yqZYBFD8BaIlepSwlcmXqE=;
 b=SvjhFkZdLPwO/jJGkx4LdUFcZ+3e2zhwfU7gtGBeWYQcqwJt/UKCvnsyjQUTzWaGQC
 VCEq0Ew5RSO8bVuuGsQ2aoIpkrI/5xOY85egi1TbEzO5Hki3myLz9mbdXPktzQ6Pub1V
 gys7pkLSMxy6jAwl27ByV+Y3xotm/jRbC/Cjtb3Pp0PQzzcBm+jCyhgGoO4wHzoQO9v/
 fSct+zeF/td2xhoL+zVu9Y9F1mlmE2L9NPiqb4If4VtKu9Ind53GHrV/dhGQEJwf6VWI
 YJrf6XIpD1Va0OslGTGRqL+8K++sKIkWKGzaOwQ6xrMEtGDuTOLIzC5KCKmoRw1BehWB
 ymDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759826000; x=1760430800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/5lpEHR2FrKfoBetfp+01yqZYBFD8BaIlepSwlcmXqE=;
 b=OfNg1gjWNw14akVUsGmQ95HaixtGmGSmKp0xfRaBnRr7qUzpUCfp5/9gMVyUMsG6ZT
 1+DmshcvEtg23p3lvJ6TGlK2RgwdGnOrxEcxYrdtEuLPt5HksjhoQnuxNNN8TBuJDRaP
 GUaUrCxwh9oFhdSG73r/Erj/lRw7PJDor3kyBprSK3J2cu2NWj6eflLYXcGSrylkYV29
 uWMvqZLlV3kj3hhM3vlZmPCqn/BpwWP9oaFWE43wZRRErKUBBq7xNJa1tNxiQHiIvKwD
 ewySTk2gs+ufPssw4hPpZtWXEHuzh19pnzwJAnDPw0MbtuvyMIwfy0HY8jxXel8hRTy+
 PJWg==
X-Gm-Message-State: AOJu0YzYtkNw+O9bM2Jq5Jb+uCirYYv2d2hFSx82P2TzNiTLmvLDMCzn
 Pqs8E/6uhkcuaWGIntvo6reF6fxWMZ8wndf/fXYHPJB/hOa/B9tWHpGR
X-Gm-Gg: ASbGncscX41nWynKFGDLXEff9SGW9dJgwkbkFrXIdiS5sF+4cX6fDJcBej5GsWvnPvc
 AE4sCHXu/66tEXdQZqJHvTxjqkATijhr8P0DUJQ++pzlDKFkwSyCWSZStMs6dig5P+HZ8Q1Rbwz
 L0w87DrM1DIbE/zz5lbXrAHNS/w+IHHUbTv2Lt1NaRK88hOADnuedSLZnyiQLTWST+iiacB9gXU
 FDYmyzmzsSkjF/74LDF6y6op4Cxa6nAzazkZ706KWPAFmSHGDzZqGDeyLWP78tX0o/yCV4kzFMX
 mYn+xCFnPFX8+yi9ZSdVef4j0Qrv8FLrYd9cEXxC2wL36uSZpz66950OZ7TIboz5fpicucI6m2a
 w3pk1nz3nsXBr0SPwXQmT+NhCgb3hkmwt+F3PmSywsVGibnESvurH6QmE
X-Google-Smtp-Source: AGHT+IHfsj3QYJwF3EIm/+ncIkc3TJT6L6wdnZ1V99H9OeKwvXsmjTC5NTDVxYdVGhOUR7h94+1oiA==
X-Received: by 2002:a05:600c:1993:b0:46e:477c:e4ff with SMTP id
 5b1f17b1804b1-46e711549admr58886835e9.7.1759825999419; 
 Tue, 07 Oct 2025 01:33:19 -0700 (PDT)
Received: from bhk ([102.155.185.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723437d8sm197395365e9.3.2025.10.07.01.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 01:33:18 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mingo@kernel.org, tglx@linutronix.de,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org,
 rubenru09@aol.com, linux-kernel-mentees@lists.linuxfoundation.org,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v3] drm/gud: Use kmalloc_array() instead of kmalloc()
Date: Tue,  7 Oct 2025 09:32:40 +0100
Message-ID: <20251007083320.29018-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
calculation inside kmalloc is dynamic 'width * height'

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes since v2:
-Reversed width and height in parameter order.
Link:https://lore.kernel.org/all/20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com/
Changes since v1:
- Use of width as element count and height as size of element to
eliminate the mentionned calculation and overflow issues.
Link:https://lore.kernel.org/all/20250922174416.226203-1-mehdi.benhadjkhelifa@gmail.com/
 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..c32a798ccadf 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	height = drm_rect_height(rect);
 	len = drm_format_info_min_pitch(format, 0, width) * height;
 
-	buf = kmalloc(width * height, GFP_KERNEL);
+	buf = kmalloc_array(height, width, GFP_KERNEL);
 	if (!buf)
 		return 0;
 
-- 
2.51.0

