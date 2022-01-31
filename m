Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9757A4A3E0D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 08:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249C310E7D1;
	Mon, 31 Jan 2022 07:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 31 Jan 2022 07:04:07 UTC
Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CA610E7D1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 07:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643612648; x=1675148648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eEsk92A0ZXPnX2Ki88PFE3IgBq8wg+0W/+nONtlHHnA=;
 b=X9+UIu5m1hI20VCj9tWabKh4TCaa6riVuyu9A9bXDFEb7DQWKe2jofi0
 O+c5PFM9JGJZk11Oiix1hlXFMt1y7uL1N0yl8uZb2KQLA0wNsIU8dHRc/
 /fQ/x7dnrJVfhVEZpOtIyM25HowJsvBGbztLn+JPDp5ulDtSPaRGm9mYl
 J+X4EeTox1ezxaRvQLgPWgrgmy11N0aVtXlhDpUHafM+VCT4GfL+kK7bk
 anbU5+cbIt6q9Zlku1euVS/GdqlYGn4eGOqeQzeEkjrLDOlP/U1NAqWDj
 1E5BFA8bmtCBbIwLoPNojDilkfdNMrYwmSSQDwpYjVEWioibhzQRK2Y6O w==;
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="101198239"
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jan 2022 22:57:01 -0800
Received: by mail-pf1-f197.google.com with SMTP id
 m200-20020a628cd1000000b004c7473d8cb5so6978311pfd.5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 22:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N9mTVzsHAHJ5mTM22d2IAe55DJRgo8Pr7F09OYCu4c4=;
 b=dEYxCn3BfV+JihG8ONV/WUGd8IamJ2JvzSSyxN0Yc69fn81moYaQ7zA8iO84UMQDkP
 uhUF08FkXagVOD5CW2tvG0POmWwZjo4ZdNbloTwew5BnwG9z64bC6i7JLYIlTLgUkphJ
 +ztQFc98NYZfDzfi41jfdivXxHpiLrzU8f/cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N9mTVzsHAHJ5mTM22d2IAe55DJRgo8Pr7F09OYCu4c4=;
 b=jDQMqFsE9Wl33DTz0TIl0GsmX8KXA8ioenV/jsd464wgFBnrrv88DrZbBHv9pBq5x+
 DEJc0iTiwwJw12YjbroDM/5bRwwCBgG4RQjlLOMY5R10rPwWnyHf3PzYMIlhsgklwRi4
 HYqtTFFTBTs4A8evyimi8WQ3jnWZ6P8Obm4LdruB5xzLk+xTgXTWlbBaesdwXTdqhlzV
 ayR3n/no8ch+CTsj5ddhbupHaz5ix3MMfvAQc8Yrx7DcTTY7HaYRzvKsUZvO1uYVLluv
 Mxu74pl/KF15WaL2Q6m7OHMSg7MuXI3eEejY53afel//2Gq1SyOLSe194cGds312Wtiq
 jKUQ==
X-Gm-Message-State: AOAM530c+xJnGKTf2YdGXDc6PVPM/eKydUystHqblokEpgVMCIWBBDkS
 k0nbPKtmjxXq5KOGXDOSMlW8Fp0metVH/PkiDoQ4gozE5USwIB8wEY759IGg6KH9cZ6j6jNSr1/
 ia/vdLLOBwRsKF1YZGjAemcgAp1fA6g==
X-Received: by 2002:a05:6a00:1394:: with SMTP id
 t20mr19171347pfg.70.1643612219931; 
 Sun, 30 Jan 2022 22:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYqb47bfhGvFHVqHFtNpiuYQ+NsZNuHIRbT+5N2iRk9p02bVcswfTGcUNfips3vZNzbIN8WQ==
X-Received: by 2002:a05:6a00:1394:: with SMTP id
 t20mr19171333pfg.70.1643612219691; 
 Sun, 30 Jan 2022 22:56:59 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id h3sm9641434pfo.66.2022.01.30.22.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 22:56:59 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH] fbdev: fbmem: Fix the implicit type casting
Date: Sun, 30 Jan 2022 22:57:17 -0800
Message-Id: <20220131065719.1552958-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function do_fb_ioctl(), the "arg" is the type of unsigned long,
and in "case FBIOBLANK:" this argument is casted into an int before
passig to fb_blank(). In fb_blank(), the comparision
if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
"arg" is a large number, which is possible because it comes from
the user input.

Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0fa7ede94fa6..a5f71c191122 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1064,7 +1064,7 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 EXPORT_SYMBOL(fb_set_var);
 
 int
-fb_blank(struct fb_info *info, int blank)
+fb_blank(struct fb_info *info, unsigned long blank)
 {
 	struct fb_event event;
 	int ret = -EINVAL;
-- 
2.25.1

