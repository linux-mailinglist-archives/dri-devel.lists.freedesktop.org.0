Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF624A7B97
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15FF10E634;
	Wed,  2 Feb 2022 23:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAED10E634
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643843845; x=1675379845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XA4HzDe0AEvwI/VRCaorqRe1KBJyowOMBeCxGfa6hn4=;
 b=RYGSZ8zv3ITIOjgDjJ8slDBjBbOHHtZ5odt60X8gi+e1dtGoJ5RIZh0X
 cgmLQ999y6X2IFhJTdYtfpwqgxvvlnL0Cv0ys+R7Bfot0DIbyGbjevw81
 0bvk9056Rj3HZNeCqF4VEOrcunbJ8EpvDuhcFwJyhO91brrNYi2gizOdE
 +KMWR9u21R4W4syKY3PwrEmewj9kpmrl0aJLwpY5o6XTzzrO3kttMPXjD
 c7FpydZLEyzCbTsk8oR3cdcxkJV7zIQfYQ6Lx63zNPqSovKNAKFhGzp9o
 mFmyx22mze0Nse9XJQIQ1sx8evyr1r7SNZm3q8PxoiRI7v3zYoXFBz6va g==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="273432924"
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 15:17:25 -0800
Received: by mail-pl1-f198.google.com with SMTP id
 p5-20020a170902bd0500b00148cb2d29ecso147477pls.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0gpjDLXaul+KimMP/te05qJYZBYJvmQ+lbw67iuhZI=;
 b=FLTFy7FMQp58INHLttCuIHz294nTMtd3aPRvSF4FjqWZkgzHuAVT593n57gr6D3wr9
 4So2/UsjM0gDmRsmqeuunUSEgE4Kov61tpxCHiUoF4ry6ArVAmuwNLKe8BL9PEdP3Ru3
 MjqLnU4S6ttaaqm14Expc2Ep0ssiU9Ny3LUTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x0gpjDLXaul+KimMP/te05qJYZBYJvmQ+lbw67iuhZI=;
 b=LcTdkXUEwfNcfoEuYVyzzA8XTyCxUY2YVQJxrIy/wQs3z/4kWhtF/LYV9kDp1ZJZt5
 kVN1GkNFQwYimbbc//HO1lfsXMu8cQv81k6kALFRVuPFuXSJ17eQkcktA+GjRCHVQ+JO
 V9Gp68XjRXD4qwZ+OlzRVdyEP8AhAcdiSwQE9I62Y74rXiCTyvxH2YxzZZ1qEU7DqZ2c
 yTDAwP1BNIcgGxW1xraP4+kMjHmNAkiz6ub6TMdcR/JrMy+OgKboT26mu5Cx0qNeeClE
 WtDeGOjFBi11en1DF2DIQLITaTeDhKVyXhfbdzBZxzCijU/iasrH/XmcG0ZncGJ7RFob
 xH0w==
X-Gm-Message-State: AOAM533sylqK94BDcUrmE2A1B9vZg4msMVKs666/EzoNVbcxSmal5oFg
 QMdE6kD+utKSZADzzF9W+r/S34/sqIlV7NXCiCerj9/D2AyTNAHNdnV8P0xI2tTUc8hwt0PCRET
 oo9Dm7blD2RP7opfFVYvMuYOunAU/0w==
X-Received: by 2002:a17:903:2307:: with SMTP id
 d7mr34166962plh.52.1643843844240; 
 Wed, 02 Feb 2022 15:17:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxysLdmzckR8L/Q+cSNZ4JMxUGdQpQyEn+58bq1m8yYLz88d/OhDa7N65YARWKJRnqVgxOtgA==
X-Received: by 2002:a17:903:2307:: with SMTP id
 d7mr34166950plh.52.1643843844033; 
 Wed, 02 Feb 2022 15:17:24 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id
 j14sm27383525pfj.218.2022.02.02.15.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:17:23 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v4] fbdev: fbmem: Fix the implicit type casting
Date: Wed,  2 Feb 2022 15:16:34 -0800
Message-Id: <20220202231636.1433050-2-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202231636.1433050-1-yzhai003@ucr.edu>
References: <882bfe4e-a5b6-2b2c-167b-eda8c08419e3@gmx.de>
 <20220202231636.1433050-1-yzhai003@ucr.edu>
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
index 0fa7ede94fa6..b3352e23caaa 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 	case FBIOBLANK:
 		console_lock();
 		lock_fb_info(info);
+		if (arg > FB_BLANK_POWERDOWN)
+			return -EINVAL;
 		ret = fb_blank(info, arg);
 		/* might again call into fb_blank */
 		fbcon_fb_blanked(info, arg);
-- 
2.25.1

