Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C04A5AB3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815A910E809;
	Tue,  1 Feb 2022 10:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx6.ucr.edu (mx.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69D110E809
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643712962; x=1675248962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N87/Yfcs/eolC23BLtRDzeHlHtMpAA1EhSMYLZCuSgg=;
 b=JlNMx/SSCHAwpC0QlVnQyIuTMtiDpmfUYmYrsbGmc8ExpbA6/Z9vmOYK
 XF3nLxDYdGUS7odkLZNY/HSBXVeyhyiEoA0thl6TucVb7+hB7dhPbADYv
 ngN6V8swzKnjMEFuUZjS3VigjRJVHsFvQSNfL7PycG8qk3g7+BGXefljO
 vK1+XhcA/H9dAhmvrIkf0QCu2ogtG9N6PyjbWRQCc8SfXoYPjD1Dl/wMa
 IJE17B7tCrVYyrfpAI/lCHNNAczO58DEda9P7zKBp3eNDbwHWCZFd5wGa
 fB2+aLEZNGsXeG08S6+A18Xj/3oRqo9dShRWr56SqWB1qEWJxiPLI90Wd w==;
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="277699236"
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2022 02:56:02 -0800
Received: by mail-pf1-f198.google.com with SMTP id
 z20-20020aa791d4000000b004bd024eaf19so8971486pfa.16
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 02:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQBU+rnQ5my6cghLd5mHteSqBsmjbcfDnGbLH9g2K+8=;
 b=Kp+L/NXLOT26so2b9sKhMnvfFfAOWX2LvoHcv+Y79qAJpkTqghLmqcuxSdhQq4LvKc
 sFDd6zoymWPC37y2O0KKu+BDk+7xTDK+4VvFJ9ELAUbXMwgNtOcas2ir9izjxhd9RklV
 Oinco7mkkofgTbTvtdOMWBxc04FCfIqk8RnmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQBU+rnQ5my6cghLd5mHteSqBsmjbcfDnGbLH9g2K+8=;
 b=iHPJIQrZmLSh1PPVEegJxL6CHm46ZUPFVpfXDzS1RLnccnouSkF/wuJiwh5zzw3LS/
 p7KJZynN94DbIjpgRjnoUEg58s5USHNROFLkbzfU+F0t4Gdrz7VkUOAnYG8UAN4FVq78
 SdbRu0vc/Y6BUNSdJRmLT6IGKIh/h15yLhEcda+7VSjKTHFBlwixHnqRdW2w/A3KDgoP
 YlprloSAp60Ts7seAoB2CX6AN+OfExCPwVUIdn5XH/W4+R2FTGwxbXIXd0alRjnKa//D
 BCy2LlnvE6uR/I0bcNTkJWpYNu+cNN/EAk9Ek45/Xnvda2A1hcbVrS2CyzofVLETwEJ+
 6dKg==
X-Gm-Message-State: AOAM530FV1c92xr4YN+vddAQ4NHrvzu+p1o/k2oylF6J8cYyv+r7UhqK
 qA1gm+ITfNACeMh+YiiSpPFIEjEa11jHg2nYQLjJAoNCZcjLGHwx+odo3TsNz83st93uYVJ98GN
 KpUMKhhVz4h6c5zF/bA7rxbzdzTzsiw==
X-Received: by 2002:a17:902:e5d1:: with SMTP id
 u17mr25442895plf.40.1643712960609; 
 Tue, 01 Feb 2022 02:56:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+4Bx2r2dBQG35mt2wEHOqbwiXd+lGZCO+bfqdjhApNLkZyLU6LTpemTtlr9KBpq1jXc4xRQ==
X-Received: by 2002:a17:902:e5d1:: with SMTP id
 u17mr25442869plf.40.1643712960369; 
 Tue, 01 Feb 2022 02:56:00 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id b6sm22349723pfl.126.2022.02.01.02.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 02:56:00 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v3] fbdev: fbmem: Fix the implicit type casting
Date: Tue,  1 Feb 2022 02:56:08 -0800
Message-Id: <20220201105610.2975873-2-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201105610.2975873-1-yzhai003@ucr.edu>
References: <202202011802.cpmdbzHR-lkp@intel.com>
 <20220201105610.2975873-1-yzhai003@ucr.edu>
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, linux-fbdev@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Yizhuo Zhai <yzhai003@ucr.edu>, dri-devel@lists.freedesktop.org,
 Zhen Lei <thunder.leizhen@huawei.com>,
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

