Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EFAD9A2C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 07:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B90310E1FB;
	Sat, 14 Jun 2025 05:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UFQ4+yT2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EB810E1FB
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 05:18:41 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-70b4e497d96so26016177b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 22:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749878320; x=1750483120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UMjPr38MMTrzz/Xm8WMGiTwr8Bo8oZuUFexoEu0yLi4=;
 b=UFQ4+yT2U+zJbLr6s2qC7PWJN+nGfz9FldmywsltM7ZL48Ex8WpFzTtdVNx4JL0NsT
 vJECAQprAXG5FJaR3Re5zjtXwi8ba/JW+F2XYac38EKBtBeppEfqWqq/Vk/Fn8d79g40
 JpdUyhhFgvh9/km5j7OL69TO3Kds4j/dlspClb/SnUJ9s9v1RCfL3Tf0IOA8C871HYzG
 +i5ShrqB1yTVqJTYxg2jlHNoTrNZBq9tCRjikk1eZb5Jn7SjpInuqShQFEh2x1PHrDUA
 yKepEWPxCMPA8SqcBzbbBWIuH/HjxH2iOTK9duUujqDmmPOxRjeCCKejDSf2a5BHwKer
 nY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749878320; x=1750483120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMjPr38MMTrzz/Xm8WMGiTwr8Bo8oZuUFexoEu0yLi4=;
 b=s3FUXbZTiJhRWJYbco0lxHYzSZGEDHhTLFWF+ogdkl/xDj4cHCW1mApgJw3d9KmeC/
 9HaeOQ5OQapLXVVAmEA7nXz2goJVJnavRq2YsIMTyA5feWF3xCqinltdwTkBtAdNon7k
 4iQ3ZmTh4zhFA2cYvgTtg+TViYo3CI7WtPYIkdPOsir9fj6oSJSl6IMvOcySOnj+9zEw
 gKZeKp6RzlCEXnSqmRMQ14kHlK+A8OtGWz6boxr0op9SZJSHcaQ39XtfniTDTIvWXhPZ
 gJqlMGAut/QLqi/P2uGdPCKoimSdBVMDOdKLEQjmPzMVHP3K8XNzAw28AMXQrqQ6lxTh
 klTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXclRgc6hTzO7fgC2JX06OKBWvEKNiv8RE3/lI86VRQHl+GPTRgRftR9ODE7SEmQVoZ0fAaCsHWOdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOdha8/1th8SpZyPRqgpYrKCDqGN2pibXaPqu5QwPayVM2svj1
 4urOSBwG4sR9YmOL2ZRrqAiLHIv7BGI33xBspG7WEiJHlLZBUUmuQYD37uCxgg==
X-Gm-Gg: ASbGnctYPM1ms2sp2AVcbe57BdQQulXsygRFwNnIhluOHKILJyNJPGjbXuGNqR+FS75
 pdAgB8tuhFAmhVYl/+RV9E0DF1Z+o6KLGCQ9Xg2Vaka5kcbPFPsUhVSniDO+RVq0aYG9ACVPbY+
 5LS/sbfnaAJ4SfATMUZQPrCcNL46u1xOrZui2iFH1t/UVyZmspD/eEqvPGe2f4lo6anwP1YnTR4
 GICNvxAii9CvBNm1+RBXxsyc+5NZMCuk4ZQLLmrASJfw9Pj0vMMEBOncS9b3f7Vtbxj661YMj/9
 i5ld1l4wANH6H+cEl+XPuW0gSSX8nV8GMpNlpWdvp87CQlpPpHE7nXpL8mc8gc80U5zUjkIKIN/
 h9fdYscZLzXw=
X-Google-Smtp-Source: AGHT+IHPPNCglDojXqakv009x9m4y56MpUvTI1MTS11AFS5I1Ld+rh425NrfRt5ZeZpbopndV4+Qcg==
X-Received: by 2002:a05:690c:680d:b0:710:f39f:4d43 with SMTP id
 00721157ae682-711753a1ba2mr27302607b3.7.1749878320216; 
 Fri, 13 Jun 2025 22:18:40 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71152793e12sm9004537b3.64.2025.06.13.22.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 22:18:39 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: i740: Fix potential divide by zero
Date: Sat, 14 Jun 2025 01:18:37 -0400
Message-Id: <20250614051837.3544959-1-alexguo1023@gmail.com>
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
zero, divide by zero would occur in 4 switch branches in
i740fb_decode_var.
Similar crashes have happened in other fbdev drivers. We fix this
by checking whether 'pixclock' is zero.

Similar commit: commit 16844e58704 ("video: fbdev: tridentfb:
Error out if 'pixclock' equals zero")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/i740fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 9b74dae71472..861e9e397b4e 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -419,6 +419,10 @@ static int i740fb_decode_var(const struct fb_var_screeninfo *var,
 
 
 	bpp = var->bits_per_pixel;
+	if (!var->pixclock){
+		dev_err(info->device, "pixclock must not be zero\n");
+		return -EINVAL;
+	}
 	switch (bpp) {
 	case 1 ... 8:
 		bpp = 8;
-- 
2.34.1

