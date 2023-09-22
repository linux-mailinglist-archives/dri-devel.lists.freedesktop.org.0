Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A327AB831
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D350D10E6C9;
	Fri, 22 Sep 2023 17:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E72F10E6C9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:51:39 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so20925335ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695405099; x=1696009899;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=twFznqPJAzdntzHByi/iGsaxmBX3ZQhIhF3BInh8ZW4=;
 b=D+/Mldxi1jGR8vvTKKse2+FXvwq9b7WGmWF40CvvtUtvy+6poVLSfKPXfRGbYgOj9x
 dLIO8hCGMtG3/vxVvKWxyj9Eh9KbDF4U5V5sA9RQaPYUHTV1CeohIENNT8ZoNWhN9cV8
 gkIAEQ/bEN0uo7cfISihStkrHAu7N32EueinY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695405099; x=1696009899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=twFznqPJAzdntzHByi/iGsaxmBX3ZQhIhF3BInh8ZW4=;
 b=EeWAxYvs+AcYfcKfNXN7YPM09Ol5y+b0mR4SrSHYpUaTYNpCZlTFjqMa8Co0zP75BP
 qgUX/J0bHtZNCSICUxqHHFSd65lhbF/j/Nq+dEnuWrqNpu6HpWMJ2Yz28OwQ/aNrRHn1
 yY9/L4E/CGh7JuQQD+ublyLaXbgmpIqWXgg1pGZ9JqtuNQE7qVx4MGsKFy5RYmNs/mp1
 kWMPH0W8C2GpVpfWhNmDRX7SARfEOABFI2oi8rsb4GHAwrWtY0Wq3aG8I2XsBguX0aYc
 29x0BLOWjsJMsEe05VGHGgqSbsfNBMRoMRwHTMod0CZHbonfJ13XD9GMkon+C7BpOYKy
 lWtw==
X-Gm-Message-State: AOJu0YzGqdHBMazsG8BNyhgRa8aaulTrzJlM++HWRBN3628Bw8187EZk
 pC6l0ntdrNqaHwXxz1/rtaujrA==
X-Google-Smtp-Source: AGHT+IHB34HabKxPxhlVK2seBKatLPFUq6kU/+85gP5fTKuuek7ZguwnwQJ5Z9ew9kyzRDNm5r1Vvw==
X-Received: by 2002:a17:902:c409:b0:1c3:ed30:cdf4 with SMTP id
 k9-20020a170902c40900b001c3ed30cdf4mr268638plk.4.1695405099157; 
 Fri, 22 Sep 2023 10:51:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 y24-20020a1709027c9800b001c3267ae31bsm3752412pll.301.2023.09.22.10.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:51:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: mmp: Annotate struct mmphw_ctrl with
 __counted_by
Date: Fri, 22 Sep 2023 10:51:37 -0700
Message-Id: <20230922175137.work.062-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221; i=keescook@chromium.org; 
 h=from:subject:message-id;
 bh=n796F6gX1K105GWhE1qUnocaNksGRQXNbRMxIxep6mI=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQpfO6l85dcFKBvYH3iqyyXKMRFw4FsqlSgo
 l0M82mlouCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UKQAKCRCJcvTf3G3A
 JmosEACKrvk+R5bxR/JWhJvcODkoIL4vvUwiWD0CFpi5Eymp+XCYI6ln5AmRkbBljl2C+DOn9lP
 /xGwXy7Cldh8FdZeGkKIveevk2iaNkfiRfUYIe8FtSoT3+Ot2WLc7oOVp/w6rRDhnM4XFwfvawe
 ZpJLfH5kaiJOjyeBi82kQMkZ7UI2C8mT8OuPyWgNnsOFn6zsREp4WT6n2vsY8er/KNCNVlz2Z7A
 X5E2TU039VS17sTVtcJPPHE+RR0Uhrtk4dIE8LVq0gQ4e4xcpZbQ4uebgTfEkfmdyZ99ifS0bFf
 Eg41SJykV3lWoJAoubku8CFdF8gJTaAf6Cu3WuSCRdnYBJLieTTvidvMeFxZNvikF0n61qp1N0r
 4NuEuRqdYuoV+2yADJzRVU/jGEop6VKrfo4D5WSyeCZgXU/R7O+sUlKUyhqUY1RJWm64VCosD8/
 3fg8BzxzcGNhSCXl6rOP9eLOW4uybKcDn73YoWnLbebH7U2uljs3qa082E7FLcVFByIvFKVH77Q
 g6KXVDWHGrsiJlrNJHDoFHlFAR9Ew7cD/GI6uNA9bWm+ggsZCUhTcRXT1peqy0nWTznTL+3Gav3
 ocDpFhl3eFcdHGCnBW42PofiKK0C/IhdUL2mYalkf1nGk3IzI0GfA4F0/rvJvBjQoCW/FDOHvZM
 5TiuKMR MK5e3B+w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mmphw_ctrl.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/video/fbdev/mmp/hw/mmp_ctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
index 167585a889d3..719b99a9bc77 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
+++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.h
@@ -1406,7 +1406,7 @@ struct mmphw_ctrl {
 
 	/*pathes*/
 	int path_num;
-	struct mmphw_path_plat path_plats[];
+	struct mmphw_path_plat path_plats[] __counted_by(path_num);
 };
 
 static inline int overlay_is_vid(struct mmp_overlay *overlay)
-- 
2.34.1

