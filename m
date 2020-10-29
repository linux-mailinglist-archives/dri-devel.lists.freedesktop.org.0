Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA729FFC5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C6E6ECE3;
	Fri, 30 Oct 2020 08:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6C86E8CF;
 Thu, 29 Oct 2020 19:04:14 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n16so3104784pgv.13;
 Thu, 29 Oct 2020 12:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E/YO8QhrBtgOUHxaIDNankNBd/9HmVJuOo7AD36126w=;
 b=PLfkqocEdos35ZQHCQz/KTCSR/zMAv3dAbZfuP5kApLSMaTsx7PFKmmwIEBMuJFbFC
 qC9PdeAhCfMDVWkvy7mrzdhGx8oHpIjCVqULqOklNfRAXVfXVA2r8nPjl2mFopa9IxIp
 bGQIykKdYgDlBFjJHtGKn43D02lpYwtRVslmiIVm4XXBTr+RbE5XUwGb+k3LOCthAz7g
 cv6P2xhzPjSwC8fWDCToPqu0kJOxC3WT8a/sp7Xb7gq40x9A64votvET4rP2ylYSwn+a
 CNl1LQvuP93+p+ZbgI0roqCVTxygv6KD7V3x6aedt6LifnYrTC8MXqvj7SIP+7AR51fj
 OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E/YO8QhrBtgOUHxaIDNankNBd/9HmVJuOo7AD36126w=;
 b=I17UTYGbB76ZiQR0ys0gst+KpZxCGO96j4Mc9i+2oRRJJsSkmq36sXzRFaXMdW+o3f
 YhUUmiZw53oIhF0e0t68XXD32TxGTeIJB7RCms3mRy56Zmk7fcQc79tp6a528hmPjeB5
 8+7fhOr7qieeTn5PkVTeJPsXQ7hTohyf2lFB3/C2enZOF354IAXUcXkA1abW6e1pY7wG
 I/3DiRAa1Jfc39/lmPKfw+ajOhHu8Yya/jT/evNLPGigQBECY/7r7c/D0WfHm1iGnArj
 5PHTVhyHiAuLtbD7sxjzBQ/8XTVQkQ77N+jyqdOAC5Ow/+Ocw1a+6cI9qMjluxB6GFO/
 JOnw==
X-Gm-Message-State: AOAM531SwASnV2Tt044698vydteI1DodOAXrZev7bwViNgkJp7Gf28lS
 8VlF0+2zn46vkLIhJim0zNI=
X-Google-Smtp-Source: ABdhPJw9nDFNuKk/faRep1zMYuYjpRmAzLiIeyJ73bCvjZKMjBLsJZ2uz8PYM+c8gd4OhgIEGjyrHA==
X-Received: by 2002:a62:e113:0:b029:152:69aa:6a08 with SMTP id
 q19-20020a62e1130000b029015269aa6a08mr5770954pfh.14.1603998254180; 
 Thu, 29 Oct 2020 12:04:14 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id ne17sm547478pjb.44.2020.10.29.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 12:04:13 -0700 (PDT)
Date: Fri, 30 Oct 2020 00:34:08 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2] drm: msm: adreno: improve code indentation & alignment
Message-ID: <e196c426de9e12f149492a92c0a8d92b6106f27c.1603998014.git.mh12gx2825@gmail.com>
References: <9ca2c2e4cbd9ebb282b90f742305fd9b481aacc2.1603998014.git.mh12gx2825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ca2c2e4cbd9ebb282b90f742305fd9b481aacc2.1603998014.git.mh12gx2825@gmail.com>
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Align instructions split across multiple lines as per the coding
standards. Issue flagged by checkpatch script.

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please note: This is a project task specific patch.

 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index ffe1fb9be155..ac9296f314be 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -20,7 +20,7 @@ static void pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
 	for (i = 0; i < 36; i++) {
 		gpu_write(gpu, REG_A5XX_CP_PFP_STAT_ADDR, i);
 		drm_printf(p, "  %02x: %08x\n", i,
-			gpu_read(gpu, REG_A5XX_CP_PFP_STAT_DATA));
+			   gpu_read(gpu, REG_A5XX_CP_PFP_STAT_DATA));
 	}
 }
 
@@ -33,7 +33,7 @@ static void me_print(struct msm_gpu *gpu, struct drm_printer *p)
 	for (i = 0; i < 29; i++) {
 		gpu_write(gpu, REG_A5XX_CP_ME_STAT_ADDR, i);
 		drm_printf(p, "  %02x: %08x\n", i,
-			gpu_read(gpu, REG_A5XX_CP_ME_STAT_DATA));
+			   gpu_read(gpu, REG_A5XX_CP_ME_STAT_DATA));
 	}
 }
 
@@ -46,7 +46,7 @@ static void meq_print(struct msm_gpu *gpu, struct drm_printer *p)
 
 	for (i = 0; i < 64; i++) {
 		drm_printf(p, "  %02x: %08x\n", i,
-			gpu_read(gpu, REG_A5XX_CP_MEQ_DBG_DATA));
+			   gpu_read(gpu, REG_A5XX_CP_MEQ_DBG_DATA));
 	}
 }
 
@@ -63,7 +63,7 @@ static void roq_print(struct msm_gpu *gpu, struct drm_printer *p)
 		for (j = 0; j < 4; j++)
 			val[j] = gpu_read(gpu, REG_A5XX_CP_ROQ_DBG_DATA);
 		drm_printf(p, "  %02x: %08x %08x %08x %08x\n", i,
-			val[0], val[1], val[2], val[3]);
+			   val[0], val[1], val[2], val[3]);
 	}
 }
 
@@ -155,5 +155,5 @@ void a5xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
 				 minor->debugfs_root, minor);
 
 	debugfs_create_file_unsafe("reset", S_IWUGO, minor->debugfs_root, dev,
-				&reset_fops);
+				   &reset_fops);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
