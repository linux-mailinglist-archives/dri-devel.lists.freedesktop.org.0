Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129094A5AB1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ADB10E7F6;
	Tue,  1 Feb 2022 10:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8C10E7F6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643712948; x=1675248948;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N87/Yfcs/eolC23BLtRDzeHlHtMpAA1EhSMYLZCuSgg=;
 b=OOuxIn/LseLRPuxUZNIhzFkLS16PlPndBpmf6dHWdRIODpJuFxkAF7Vq
 9HBGPlQBRaNCCEUFol56BIo/Htr2oosUKihNByrO1mFNEZ8LH/YCuX9yM
 KDE5aV4CPOMFFQy8jLmS2MSVuVb/H8BIqVapCr4SDqTLbupMRHYPwBa3F
 qjB1MumCejnLcsdsGEKzu+9RX5IdG8Y/anyaGT2FbZQSLVK5L0SfDyIEE
 WqZMHdsyhBev/iOjGkdrd87JbqfMGgT5YdlGxv775VNv5ca0zOVxcMcGa
 GGMHJLi4yef1ZopXvjwYSS+NlRe/BxPeffHraJ1R/0i4KxbXL7OG9gK7G A==;
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="272921082"
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2022 02:55:47 -0800
Received: by mail-pf1-f200.google.com with SMTP id
 o194-20020a62cdcb000000b004c9d2b4bfd8so9017026pfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQBU+rnQ5my6cghLd5mHteSqBsmjbcfDnGbLH9g2K+8=;
 b=BwhVCD5gApUnEMgR2x6gnBOuitDGWagg6hwNd5yCWlvrOYE0V3sK17saP7f+Yc16+1
 G3pRKrhlsqIilqa46HHPg5D6XG36N0Z3ALHPq+0c0RxMv7mmY4MZlPZ7W22rw1/XBYOD
 Eu5zRLrWCD44RW63WrPWEyk1zTrRCt+dI8dzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQBU+rnQ5my6cghLd5mHteSqBsmjbcfDnGbLH9g2K+8=;
 b=38lVitUXF4OuUtrYltYNjqBFYXeml2DEWBy+bpj1bK/WfEiVv0t0kVPmI5ovqM0xCx
 aL8jc6uX38/cQrhFW5VUfktUZFr657X6foTyRPpPs/VYEbPt6oxg7nG0UaedECakUc7V
 1AxSyK53Yp7+8GlnRjVhlNIDK7/OU5+qXgtyAjQ9+tkIP/YyPweQ5bi1oCSYpJ63Xg/s
 FY0jFg+igB+6V7PBHxGdo8ks/W0Elh7aRGJE22jb939l54O4J4d5TRYI/6TDSl6YKptl
 QNWG1p0y6sncEYkXoQTWioUCZ5rb1KQT2VBKk02xcV5vN3DT3mY8nxxvI1oE7G1RL59D
 8JNw==
X-Gm-Message-State: AOAM531EJ/LPrR12MyA7fPYJxabBmlWVSAfHxQrpgZHSe8QD18vZn5ZU
 v75X8giRKCCE05Z79VIwYoTKpolvXLqJfitFXt712LZ8fjFFBwBWJG3iD55XZWJQVNNHifn8daj
 ej3gSMYIDo8Y05lOJuxHTAWuxw+ljxQ==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id
 kb16mr1639594pjb.128.1643712946647; 
 Tue, 01 Feb 2022 02:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR+51ZW666OWygVPyo83ZYuqOoW9d83uUD1rNUB7qxA4cSjb97vUb10lngV7jgl6wSo1FrUg==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id
 kb16mr1639572pjb.128.1643712946369; 
 Tue, 01 Feb 2022 02:55:46 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id b6sm22349723pfl.126.2022.02.01.02.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 02:55:46 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v3] fbdev: fbmem: Fix the implicit type casting
Date: Tue,  1 Feb 2022 02:56:07 -0800
Message-Id: <20220201105610.2975873-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202202011802.cpmdbzHR-lkp@intel.com>
References: <202202011802.cpmdbzHR-lkp@intel.com>
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Yizhuo Zhai <yzhai003@ucr.edu>,
 dri-devel@lists.freedesktop.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function do_fb_ioctl(), the "arg" is the type of unsigned long,
and in "case FBIOBLANK:" this argument is casted into an int before
passig to fb_blank(). In fb_blank(), the comparision
if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
"arg" is a large number, which is possible because it comes from
the user input. Fix this by adding the check before the function
call.

Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
---
 drivers/video/fbdev/core/fbmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0fa7ede94fa6..991711bfd647 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
+		if (arg > FB_BLANK_POWERDOWN)
+			arg = FB_BLANK_POWERDOWN;
 		ret = fb_blank(info, arg);
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
-- 
2.25.1

