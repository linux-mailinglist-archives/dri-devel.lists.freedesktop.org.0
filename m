Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30634A2EB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 09:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579C46E128;
	Fri, 26 Mar 2021 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E68B6E128
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 08:05:10 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id f10so4062257pgl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NwKF2Id58T0+Q4X2V9aN9037qk0PD32MTro/1e/Ds88=;
 b=ZLXpn/oZ49bMlmklfTI2k7sZhQ+0C9OeZ7VXB+Hywup9pWjxk5oRbgO8TE1cpoXC8C
 +PRsUv6OLr73zUTDgV/s/2KA51K0qJ97XZmtkNtZWSyR/HLsii8rLG+YF8Rs1vvwdwSC
 UgUjQHeCCAwU35QikQCNYIVc05SPPIrrvKCW9CHBVAk1i74czU7Agj8+73b5aRqmP/Kb
 M9ndBgKXOklbs5T5PYSqansXI8FoIy4FnVb78PHHKz/zUk5FpQQRT/OAktsr8Jxq9at8
 iWCFAf36ESjbFMIDmHO88JJuySpmwkFHIGCCLpjLjq6CfebDTL9yrBTy8fUmMWpDa/TV
 WQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NwKF2Id58T0+Q4X2V9aN9037qk0PD32MTro/1e/Ds88=;
 b=NI+OulYxdQyG9NhZCt/JtIBhSjVGkcZ9pCTSj4QRS1JOfRWlszwvGoMsAw1BJi2+FK
 Y0ij0jTJ+gN2T71lzwVSx3hiWejpgWP59TICpZZvDi7cjgEnRgoRLzX+fBH3/4zeFIZq
 nxWP9jlgF2jKEEGEq4m9+oJS2lY2UqoW2CbEvHXlAvPtpnavlrFvRVcIC5Ts9o69s2PD
 LIHeMvBiMnHvzHXFqvTX8nfLHdD3aJVmhXN/U4tg5Rw7/CS/LzUHkjYS5r+xFzsHnIBt
 LcvLond/rC199chZCUtboI9moD2ZE2i6xv0gUGgHotiC9F4J7JRJz9zYEgfq/Nn+saip
 yaNA==
X-Gm-Message-State: AOAM532PFFe35AhjgERCB6who0FeJaQem0vtMvU8gep/tFdvKRwyBtvj
 QGVz+AICGLhjevpHBcm4ZH0=
X-Google-Smtp-Source: ABdhPJzwYrWPBCp71W6OTSt/+NtkvOrHJVunRMdCWyg0J4RMLKpEsesX58sJxFEsq5BjNvX4Ogxlrw==
X-Received: by 2002:a63:4842:: with SMTP id x2mr708260pgk.229.1616745909929;
 Fri, 26 Mar 2021 01:05:09 -0700 (PDT)
Received: from bf-rmsz-10.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id d8sm8661064pfq.27.2021.03.26.01.05.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 01:05:09 -0700 (PDT)
From: Carlis <zhangxuezhi3@gmail.com>
To: gregkh@linuxfoundation.org,
	zhangxuezhi1@yulong.com
Subject: [PATCH] staging: fbtft: fix a typo
Date: Fri, 26 Mar 2021 16:05:15 +0800
Message-Id: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Carlis" <zhangxuezhi1@yulong.com>

Change 'tft' to 'TFT'

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4f362da..44e7acb 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -775,7 +775,7 @@ void fbtft_framebuffer_release(struct fb_info *info)
 EXPORT_SYMBOL(fbtft_framebuffer_release);
 
 /**
- *	fbtft_register_framebuffer - registers a tft frame buffer device
+ *	fbtft_register_framebuffer - registers a TFT frame buffer device
  *	@fb_info: frame buffer info structure
  *
  *  Sets SPI driverdata if needed
@@ -873,7 +873,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 EXPORT_SYMBOL(fbtft_register_framebuffer);
 
 /**
- *	fbtft_unregister_framebuffer - releases a tft frame buffer device
+ *	fbtft_unregister_framebuffer - releases a TFT frame buffer device
  *	@fb_info: frame buffer info structure
  *
  *  Frees SPI driverdata if needed
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
