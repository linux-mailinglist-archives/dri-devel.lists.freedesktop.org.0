Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B35A67D64
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423D110E4C3;
	Tue, 18 Mar 2025 19:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gkK2P1G1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CD010E257
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 18:20:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5499c5d9691so6356994e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742322021; x=1742926821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P7OecC4DAg+MsM1VQ20M8byz+5h2pRm2mp88QPs7J7o=;
 b=gkK2P1G18/vmcwCFfmx0Zsh0FrBBs25XMjsD4f0Xu+ayonWlU9KnQA0+2w8vklebPq
 8DNDZwU1esdVwRiQbTCE507MhpmudK31VSJqLiHlBbgWWyUcvwYwRamV3QaP1DzwwDKV
 cbc1bxmilGKkYBMceKSMHuTon+tdp9EtixK6dulBtzS3vXAOD6zCx7qchWNG0aEbTAc5
 9TtiCoub3ePBS5CnnNRutyDRK76L0+YgIjQk/iJE0850GbcZwmChsFuxNc5H8N7Mnonv
 VHYZnKI5yDJaC+ZVLdDnwuFnIiunNfCDZEovp3+qaX2D1kJpjzlpxjN2Jf7DFpHndYzM
 /GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742322021; x=1742926821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P7OecC4DAg+MsM1VQ20M8byz+5h2pRm2mp88QPs7J7o=;
 b=u5mJKq0gYdGwPKUgD0ODtEp8XBcKEdSZD0oxDK6wc+cPJn84iXD2CGYHiPEF0eB3MV
 /02ZiIzdes/ZZ4P1hRQkm6/H8JX/TrcvLERLmbp3olCC+CTG1CpyIR+2aT51s13mCi8H
 JiLUTyn9Q0PQoc7JEWwT5EP307wM4ny1J2/vJfmd/wdKkwkE1eVdITBIzh27VvbeHTXh
 kyQqGS5MER13QIKdUECXtVFFlBOQONmFgpbCiOT4pFUF//xaKfftJiDqFHgscOoaGZ0X
 PZGKo3SBWFysTTa0hkC+Nph/M1g29l4zHQTeC1qPtT63zZ+7Fzb53uk7Fyr8UA1q6RLc
 sBYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBuKCrhwmssGWmzDRp0uS9WhUH01hPSXnFNlaEJLOKB7uHZvaNJl5VW7I6ZgX81fvrd6UmHJ/6dTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ6Om6Zm9KVoM36ekL9O8LJeqUQq/CN11FJCp49NV1ZpKG2gVU
 JklbTwqgAnqibmqKBJVTDT6F+XBV+3QxNZKbsQxOgQFwwQK4Cael
X-Gm-Gg: ASbGncvY+szb8bAj4DEmZTUlizJ6W16MoqEbcnBEjPZ2l1oND7lYTLwcnha0szyvMiT
 ww9MiNosS/WZf273MR4m4AZA1ZWEmE2wVoHKzxE/egOFZSq6RU85MzZVB0PIRirnE1+H7vD0YJk
 EwGfQVR5aYJ4QdVse+D/+ulR70YRBoDRhFsz+88KC4jT9vIMJbjlEE++ZDkHOCj+wmJwoBh/LGa
 eXEEzP5a3tSqnHUYq1fMewVDCIUHee9Cz5zYYzmTcDvJN7rf0+QUqFqLf02/sV6isBptOS0WCZe
 u+f2g56uBahARDA96ttPQ5vwfH9TqHnegac3+C+wp4ns6g==
X-Google-Smtp-Source: AGHT+IHPX6HT7hSFxyVpA0b9mgdNwPC79Sanp/rYFaB6q9h9RNj2SkgKzH41KR42nto49Hx5XubV4A==
X-Received: by 2002:a05:6512:e97:b0:549:8fc0:bc1c with SMTP id
 2adb3069b0e04-54ac9cc3733mr33583e87.53.1742322020710; 
 Tue, 18 Mar 2025 11:20:20 -0700 (PDT)
Received: from leo-laptop.. ([85.89.126.105]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a84desm1780577e87.46.2025.03.18.11.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 11:20:19 -0700 (PDT)
From: Leonid Arapov <arapovl839@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Leonid Arapov <arapovl839@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH 1/2] fbdev: omapfb: Remove writeback deadcode
Date: Tue, 18 Mar 2025 21:19:51 +0000
Message-ID: <20250318211959.8557-1-arapovl839@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Mar 2025 19:55:27 +0000
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

Value of enum parameter 'plane' is initialized in dss_init_overlays and
cannot take the value OMAP_DSS_WB. Function dispc_ovl_setup_common could
be called with this value of parameter only from dispc_wb_setup, which has
never been used and has been removed in commit 4f55bb03801a
("omapfb: Remove unused writeback code"). The code in the if-branch is
unreachable.

Remove unreachable branch.

Found by Linux Verification Center (linuxtesting.org) with SVACE static
analysis tool.

Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index ccb96a5be07e..8db074862824 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -2659,13 +2659,8 @@ static int dispc_ovl_setup_common(enum omap_plane plane,
 	row_inc = 0;
 	pix_inc = 0;
 
-	if (plane == OMAP_DSS_WB) {
-		frame_width = out_width;
-		frame_height = out_height;
-	} else {
-		frame_width = in_width;
-		frame_height = height;
-	}
+	frame_width = in_width;
+	frame_height = height;
 
 	if (rotation_type == OMAP_DSS_ROT_TILER)
 		calc_tiler_rotation_offset(screen_width, frame_width,
-- 
2.45.2

