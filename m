Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF72D32F03
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEFA10E8BA;
	Fri, 16 Jan 2026 14:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fcoab8Yt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC11710E856
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:57:57 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-81f4ba336b4so1712440b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768557477; x=1769162277; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z9cPCZbEtZqLhkXtHvfyAqgg+9cdVAULaffu1JjYDN8=;
 b=fcoab8Yt4ERiF6RQh4jy0dtwVrsWONjC9S2f223kjcmMw/kkZJ9GVYacHFFPQ47yup
 TkSlxH5v16t4hFs77PkD6TN7IeAd2+0477/VZ1ZYL7cXgSPu4XC5kIhriHambgRwd8Oo
 Swrgzu8eIjB9ON07zP8QrGDFvS1ZjZLzMgyW+2f6ZMPYH8Ut9i6cUwn3wDID/zrHxlZL
 X91weRTO8gVJRYwbjVe8FMkrs9RiH3RrvglY0YZdCB9l9CLmKQU+paXGhPTez42LElFQ
 tR/KJNBiB+xIEOQ2RNAGt1ffya7psQC0gd7wHUfSNd+i86cgtlf2lI5zuCOfg6fbO/V8
 FInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768557477; x=1769162277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9cPCZbEtZqLhkXtHvfyAqgg+9cdVAULaffu1JjYDN8=;
 b=QtmSdvNAd9I0zxVCUDePHYkXk3crtjbKiLyiS0kP6JVMH1iUP3+bw7bM4zApERzVuz
 LSiQd/c8mGiKytz6btIL7BrpLon5BqAMTZ33JfYhy/+t6Ysg8vR68Thi+8Wk+QQRfMRE
 ruCSF9/QPY1bZEng+Qn0rDVwWIDCCaQQwkHjfkku8sr4i5q29EqsixM6D1y9aWAds2ka
 mW5HDwxJV8/ETB6hqApn1RCVKdsgkIMHdK+bFw2c+OBNUksKaZgYyfk8Ls/+dCPt2NeW
 1EduFi8YPzk0ymIQm6pP/l+cQxzSOxsxv/OfkVedLgpWutpSx6KmNCQgaHw64P5U+a1a
 TUnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh07srTZu/RMFP82Qq3uxVUb50hfkIW+CGGdZmKUDTiGalsM5pYTyFDkNCYK/K0GQZ48SSt6JhRhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaStz++lY0yRr3BpaS1VNwO+TFRo/JJHjvCp7sC+X22k6EJnGn
 MVHtB009kvUYVLckWCgKTWQZpQqB6GuzImQTLRG26ZQJUXCIDoMXlLJN
X-Gm-Gg: AY/fxX4fXoA/HrsSW4JBOCy/YQzqQqRUOdMB4+am/AmvqgDvqnxLU6slPws6qXsRCp6
 zZ9JqxmbfZGjqffp92imfOgKUGM6VEAf2WW5Nr1m2nWJPUkr8zRN7PC0AChF+Mf5ZunvygWc1CG
 LpuCdxpyNDiw1zfhu02sWIuIGS4EYWnueSv/40EqRHy00dCMrLLozr5vDnjGq/KYIw2PsT+VmAL
 2B2IEHjy8CsuygCT8HS8ug+AYxPtkVwCZS48qMgJNmVF/iWQiYtg7FX/kn8FeGGpWtU9vuWyzG6
 tc14kxJxOnwy6T20HQiMyl3y2o3bvzTTqgH00rrvYZWFGqjKRVWvvzhtBk+kN0GZ79kum34pCDj
 fGe5WM3ImXX1kqMp4XXcWCkCb6aVrQhwsBmvQ9hVLQAxzzgSQOqa2CquCoklYw/H3klv2SsMxuJ
 MYMRkftNnDO67AvgxXY46hgkccVJY4+YPoGFJusbBKg1IVH9ygKdfl9cC6Ug7PYjAUw7m0CL9SC
 7W3Mni/7YSMYteLYqpjZc2533uwtkf/BZ3VlLexYwmRCO4=
X-Received: by 2002:a05:6a00:4c86:b0:81f:4063:f1ef with SMTP id
 d2e1a72fcca58-81fa03a1fe2mr2502376b3a.54.1768557477372; 
 Fri, 16 Jan 2026 01:57:57 -0800 (PST)
Received: from c8971f1abf06.ap-southeast-2.compute.internal
 (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa108b252sm1645230b3a.7.2026.01.16.01.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 01:57:56 -0800 (PST)
From: Weigang He <geoffreyhe2@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Weigang He <geoffreyhe2@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] video: of_display_timing: fix refcount leak in
 of_get_display_timings()
Date: Fri, 16 Jan 2026 09:57:51 +0000
Message-Id: <20260116095751.177055-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 Jan 2026 14:55:55 +0000
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

of_parse_phandle() returns a device_node with refcount incremented,
which is stored in 'entry' and then copied to 'native_mode'. When the
error paths at lines 184 or 192 jump to 'entryfail', native_mode's
refcount is not decremented, causing a refcount leak.

Fix this by changing the goto target from 'entryfail' to 'timingfail',
which properly calls of_node_put(native_mode) before cleanup.

Fixes: cc3f414cf2e4 ("video: add of helper for display timings/videomode")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/video/of_display_timing.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index bebd371c6b93e..1940c9505dd3b 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -181,7 +181,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 	if (disp->num_timings == 0) {
 		/* should never happen, as entry was already found above */
 		pr_err("%pOF: no timings specified\n", np);
-		goto entryfail;
+		goto timingfail;
 	}
 
 	disp->timings = kcalloc(disp->num_timings,
@@ -189,7 +189,7 @@ struct display_timings *of_get_display_timings(const struct device_node *np)
 				GFP_KERNEL);
 	if (!disp->timings) {
 		pr_err("%pOF: could not allocate timings array\n", np);
-		goto entryfail;
+		goto timingfail;
 	}
 
 	disp->num_timings = 0;
-- 
2.34.1

