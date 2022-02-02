Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFC4A7BC0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CBD10E1A6;
	Wed,  2 Feb 2022 23:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F090A10E1A6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643844840; x=1675380840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uavpFDxmGoKjrnyH0fVmnFMq2r7aGr052ubiJDv8DR8=;
 b=dCWRywTQq0xKthzSJakoV4dzKPy9VPUC+xAWTzqyfDN7THLTayjBWw6A
 xdXXHAiGxKh3heuoGZZUrUlMsU8AcaGP5inAY8exTio1gm48nWrvrsbAa
 +pOeAgSnUYfHT/kc01kBfNISvKw8KWKKMC/hPnjCxQigl8uZXIcm8+SdW
 AndyqnxnKHdej8e/iIQxA6d561yAwV9q3QudwF+i96I7k1VWG2WtWTYbT
 1k+ULxwKmUObOkkNQSknNZnr3au9DnGZHnKzr649Oh/W8NlVNJvZDlWbg
 fWrRmuEPGG2gIKzAxslIM0uPYpWPXOxxJbpp9Su14fZQg+bHn63KDHN6p g==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="102067172"
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 15:33:59 -0800
Received: by mail-pg1-f197.google.com with SMTP id
 t1-20020a6564c1000000b002e7f31cf59fso449539pgv.14
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LoPhiSf2j9AFlf81eKG6xH4TR1F1QmboBbxydv3xQ7Y=;
 b=Vi+u9jBD+QVIbMUO77wQyOqhnpPIQvWmztX0ACI8XT+Izg3ej/xW05bi3EpXKQmC5b
 n2YPYxIV9U/xOb7ZmjQpv3qNoS/YYE8CzEdnpG+tSda1iqZ+zUfQ64mA8a+I0O/SBnbh
 Q5tT4F4wSPQgCi1arxRFL3Dhz5HXvtylb9o7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LoPhiSf2j9AFlf81eKG6xH4TR1F1QmboBbxydv3xQ7Y=;
 b=3Z3YutFdqzB22q+oWcKNlSK0VMzNkRxybonhRlkhjGQEZeENt7q4Du7bqremQByk48
 32YoSwiwn4JFchop1tixqTukgn0GBSm8LxI8tL0RGCn8HPvijYPF+T302zDbGwyEyqIK
 SkFvRhFsyRTizcMZBVHAnZf6tVSP/BGUYNHN+s2aYCExZ2Gr0bBdgoTuLNWwVs+cBTpZ
 5RL4UbCnuF3CrZXolFd+JmTSzTigrZ/uwFV6UZj199IM3sf+jedN4KEzRUe+8nCZpAlp
 1eIkLzGZbyb1qsal2upFTFpuT6grWQjJ0Xo8Psad2W/rqjZnSFpu0KfXUrHbnQEIVyaX
 fjLg==
X-Gm-Message-State: AOAM5334c9UKyGi1wZTqvBBsBdClo7Hz16KBzZtkg/9vDwttwP7likA6
 971alhrfPu6pF3zMv4+Df/TJcxufx7HXNwOlWYt8y1GFM2LBt/WAzEkKi/VBEbofiHPHMCi8fZ+
 QNx3lmKWbDFr2by9dKaN4zewzj/PxAA==
X-Received: by 2002:a17:903:2283:: with SMTP id
 b3mr31859668plh.0.1643844839717; 
 Wed, 02 Feb 2022 15:33:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz4/x8nWtBV0nXYgv98co1MlqgYrtI6GhpsU/PIcCVgrAG4WdSIF+YKtELNEJg4IP2qcHSQQ==
X-Received: by 2002:a17:903:2283:: with SMTP id
 b3mr31859649plh.0.1643844839488; 
 Wed, 02 Feb 2022 15:33:59 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id s2sm26380387pgq.38.2022.02.02.15.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:33:59 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v5] fbdev: fbmem: Fix the implicit type casting
Date: Wed,  2 Feb 2022 15:33:59 -0800
Message-Id: <20220202233402.1477864-2-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202233402.1477864-1-yzhai003@ucr.edu>
References: <83e46d8d-ec7a-6cbd-010e-7f50f88dcf96@I-love.SAKURA.ne.jp>
 <20220202233402.1477864-1-yzhai003@ucr.edu>
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
 William Kucharski <william.kucharski@oracle.com>,
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
 drivers/video/fbdev/core/fbmem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 0fa7ede94fa6..d5dec24c4d16 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,11 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
+		if (arg > FB_BLANK_POWERDOWN) {
+			unlock_fb_info(info);
+			console_unlock();
+			return -EINVAL;
+		}
 		ret = fb_blank(info, arg);
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
-- 
2.25.1

