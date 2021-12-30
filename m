Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB577481E8D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E12910E28F;
	Thu, 30 Dec 2021 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC9610E2DF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 15:52:04 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e5so51197962wrc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfSEh+kMWcMB2oG20OjNOZJx52OyGLAU5iACdztgHAM=;
 b=LSe1c8wx29G4o6EHIysvSVoWfm8jbpRdfXqi/Sn96bwLYHcxEIPZj+58H5hzp9nxxN
 zel2M2/KB4eyjXt473MV8NzT/+bnQNccGzNvt+IR6EIUxDlgEamcQg9KFgUR+vclHNYG
 cW8NC4dpSq3YrXfs+ZCCTBs1h9Gyzci6VIhMzoAtJfMawtLoJYA6qEx4OCQVbQUsTpEF
 BPzqxwzjN8IVp2ZT/Pe826g61sr1VpRPs+a3oRuZc0BOXwTQkx/YZ9MZ3oFpYZMRKBHB
 5otKQqiTb35RreN0x2M1D2qwsK8Ik1t9fCBvKMyMd3MoF5kibR2ZnUxOJ7kIbMT+orCv
 JN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfSEh+kMWcMB2oG20OjNOZJx52OyGLAU5iACdztgHAM=;
 b=acdO+5TZvjTzan+Dd5YjVml1eM8NS5UOjdF0UtQqFWUL8Nrg3lI06jbMG9QFPgS1a6
 /W4jxxrmnf0Gz69kQp8eUgEf7hT5Zc4rMTmpUe2v4eFblgaMYObGeIORlfjtcMr7AIoX
 ndQnH+zvwUJrnyU++ITsDI6tJ3aK4z83u+oh23GehRuqpD3hyrIvtrlU1ijHbzbKWLAN
 ss0itn32DKXTaadrctUC2BEOtZFBsZzj7PwyhcXCLAYjdFOOFsLOUMoMuzwAZJM5Ht1T
 Ze6j8I+tWl5uJzvkuZ3zXNu0mwSERr75DckyYicDWuzJLHaRRQxtcwdeuZRH54V5OmSg
 ht2Q==
X-Gm-Message-State: AOAM533FNXk3ZLzE94g9IXmkah5Aja5vp2EwPCTWFhbh03Ntbar+PBm/
 MWX0rOz4kq61zMWSCUnRqIo=
X-Google-Smtp-Source: ABdhPJyBVYh0Oove2VBiz9Jd/MdVtDP9KyAEL3OOxOiMXWn2lKi2LyJM0+xNP1ys/VrHP42WIlCNVA==
X-Received: by 2002:a5d:4dca:: with SMTP id f10mr25977728wru.595.1640879523053; 
 Thu, 30 Dec 2021 07:52:03 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id l12sm29750798wmq.2.2021.12.30.07.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 07:52:02 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>, Zheyu Ma <zheyuma97@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] video: fbdev: asiliantfb: remove redundant assignment to
 variable Ftarget
Date: Thu, 30 Dec 2021 15:52:01 +0000
Message-Id: <20211230155202.355336-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable Ftarget is being initialized with a value that is never read,
it is being re-assigned a different value a little later on. The
assignment is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/asiliantfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 84c56f525889..f8ef62542f7f 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -110,7 +110,7 @@ static const struct fb_ops asiliantfb_ops = {
 static void asiliant_calc_dclk2(u32 *ppixclock, u8 *dclk2_m, u8 *dclk2_n, u8 *dclk2_div)
 {
 	unsigned pixclock = *ppixclock;
-	unsigned Ftarget = 1000000 * (1000000 / pixclock);
+	unsigned Ftarget;
 	unsigned n;
 	unsigned best_error = 0xffffffff;
 	unsigned best_m = 0xffffffff,
-- 
2.33.1

