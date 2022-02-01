Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E93C4A5554
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 03:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3758810E673;
	Tue,  1 Feb 2022 02:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 01 Feb 2022 02:42:44 UTC
Received: from mx6.ucr.edu (mx6.ucr.edu [138.23.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A9B10E669
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 02:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643683365; x=1675219365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q7G0r3sT1MHBeLXqshEFeURJWbJGybewYjiLKBDF12A=;
 b=QhjYjSZMKZpePY18t+pUQV1mDb+iYv38cJTOBx+wvoNXnzU8Iqidl3jP
 OtCnfnF34CTelLtxU2Cyx8BGEJtk9WSOUvoFrJ5hJVBOQ0GyYkXHQHWBt
 PyPcZ7g2Q57TA41uZaD+qb2WoMytWnyli78GQp+ymiDilqZuQ4HixyYh7
 1+mjUdFswN60GwQl3eMDAUl/M9NsHPL7zCiJCFnnVBxjCkjj/U1wqm6gS
 fvdkbG1YowZkianHxCqaVF6XWG/ty4MNt625SVXQBCjJfr5YFRHU4563i
 ExHslcG9LmWbJ9in860K9m5O1b9/CORmEyLhzs/uHzIQN4P3YXiBsgEoZ w==;
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="277657815"
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Jan 2022 18:35:38 -0800
Received: by mail-pg1-f200.google.com with SMTP id
 u24-20020a656718000000b0035e911d79edso9618737pgf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSa2J7js34wpdjauwfhqRxuvRU1TQ5o8RuxTIvDH3Cs=;
 b=d+GKQPnu9sR+as+Dvt+t9kLxoUDj0AOCQ88bxnUZ1ZmN/OJIeRDt5oGyCLVrP9H1yK
 +9Z50pGEpQ1XuWd6YK8UDEwQw7l0MfzsatDiBLn1TD/TdZZ/Y2hKgEGiQXBirm1lBYcV
 uSTbZx7J6eJOcScJQWhFq3UwERSqjHNHM+fys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSa2J7js34wpdjauwfhqRxuvRU1TQ5o8RuxTIvDH3Cs=;
 b=4quIQo7i0xY1nbSCA2/Mdl2roqe8z6kRwnsmlrXWkKGx6umJI90x7dmISd6wwynp83
 aFnGDSf/Nx3ptCnF3zzmI2Yt/6MvKFqa5lna5SQnd2OadZwfbmu0UQtPcWhlzvYKX+wC
 fSmFHbO11N//3QZmXMLdhVfBl6cU3iP2iL1L3Onqnwkd2fO+7/aQSXfpUye06U5X6R9B
 fn1T9AoxHh/F2FU+NVzKXXs5xk9BquWn9GINwcPK0vyUEz4SITLyCa5QbyvA7evVzpN+
 s5hgzB7Emj3SK/qUYrZLM9ELYaqPYaPUKLe7jrJcr5XhcgFs7eNW3pQBZ6HsB3g11+Qq
 x3lA==
X-Gm-Message-State: AOAM530MpCokndCiRSyoMlinvF089KSvlz3ZnZZ4nraal8+dpFfTanrC
 qRGvXqq9dTd+avhnjSL1tcHe5V5giWc0Qn97Iv3hIGbCl4kVuXvIm3BB6Y8/9Z+usQBV2gkjhDJ
 w1KDLg1AyC/5LcD+Ne/LRWVHbtgWSOA==
X-Received: by 2002:a05:6a00:98d:: with SMTP id
 u13mr22561445pfg.83.1643682936940; 
 Mon, 31 Jan 2022 18:35:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQjGWejUV92C73WZlbo37LitJ/aFNM3AcfTSBcRBOYPWcQdX8WwT1o2NE9voSONanMEb9GWQ==
X-Received: by 2002:a05:6a00:98d:: with SMTP id
 u13mr22561430pfg.83.1643682936703; 
 Mon, 31 Jan 2022 18:35:36 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id d1sm20083105pfj.179.2022.01.31.18.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 18:35:36 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v2] fbdev: fbmem: Fix the implicit type casting
Date: Mon, 31 Jan 2022 18:35:57 -0800
Message-Id: <20220201023559.2622144-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202201311943.VXU6K1gH-lkp@intel.com>
References: <202201311943.VXU6K1gH-lkp@intel.com>
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
index 0fa7ede94fa6..f08326efff54 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
+		if (blank > FB_BLANK_POWERDOWN)
+			blank = FB_BLANK_POWERDOWN;
 		ret = fb_blank(info, arg);
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
-- 
2.25.1

