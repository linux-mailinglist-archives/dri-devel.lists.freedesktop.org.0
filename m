Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E87F4A7C0F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2174210E656;
	Wed,  2 Feb 2022 23:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx5.ucr.edu (mx.ucr.edu [138.23.62.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AB010E656
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643846293; x=1675382293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xYvx8fe8wRHtOQTQUEuPl7xZb+NEUT35cy+DHSkqPn4=;
 b=nl6CdCd1O6cVBpcxy6yZAe+oaLy3tD1HBJsTS+6alJx7N43mtj6fnceq
 7uwsZavCo72R/jJ4Lo6anV85yNKO0kWVDCaToeatnepbvkj6ArFFbyxpn
 mBY94OaI5BzcvhO06g7U3ooAuY2RgO0oxjy3ZIe9jv/VNL+sMyoAE37LB
 7eXXvFBU5ZQAw2jr/jQkOR5mHhE1HAO7DV7IGkdkEDpnIcnHHfh7rWL/F
 k5A1jEdMtasNsKM5QUqahBxaw/1TPo80Dbw5UuYdPyChVUlBM9Dvf8gAY
 6vJF4PqldcUEJaROA3poxruYuRj+IdiSea+I65jwe8Zv78pLaartT8hhI Q==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="273441834"
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 15:58:12 -0800
Received: by mail-pg1-f199.google.com with SMTP id
 127-20020a630585000000b0035de5e88314so504936pgf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUOM8bvwC+la2NKqFvk2uI9Asw+K/wrTaRpdb2Kdz7U=;
 b=TOKLi1xV2VoAfEWpE5V83okRjedJuomWMncW4lik6VyhjCpHVot4ZXMBqgkJnTxt/b
 oXGo5UlO9ifjfReoAtoPe2/Nvn8No/cP8rGA+LA1D7RxUjku7PBWdN1Jjc6qECBlrFcO
 rjctdWIycnceaqeE20k2mgo8clQ4zuEqIjG90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUOM8bvwC+la2NKqFvk2uI9Asw+K/wrTaRpdb2Kdz7U=;
 b=0OYLSDqxdbWlfR+WFwxFk+h4k+LZgUyQYIVd8heZT7HkCO0xWkL/0bTfQsg2KW2vXK
 KdL8R/wDwOvf2lTpZ5PS6j8Xs9iVWLXeSfct7V+s2aR75+BK/ljD91iiwFF79fWBp1j9
 DVjp5MEjDlfgxgCrlUxQHQJa/Rbok/RsXHPk9ooNMwkNlJ2BzCz16Y6Qv9IknbeHtkBO
 sBkFw3FEzSAQ/2lnL0ufIw7qJ7TlQ8bIguYnpNCPAKE4+uPI2ZLIxZKFai/yX6Y5/wQ3
 rY6Ax8NekSROZasw55AOBdICcF72VIWyj1JI0bn5PH0/RIZOYDvrcun1+YfuWdjUoL4L
 FMIA==
X-Gm-Message-State: AOAM5310v9DBQR4uIUuhxtCMFYf3cXfs+7luHi6/W7skSCNK/6T7b2SC
 fdIrryGRIIEebmBckX01Wn53eAHdZKJFBBmAHWEkU7N0NpgVfLzADowYSAGsT7PxW3fq12I+QDj
 z2Lac6OHb8z1kxiRSMljkYLz3xmgi8w==
X-Received: by 2002:a05:6a00:1256:: with SMTP id
 u22mr32510710pfi.82.1643846290846; 
 Wed, 02 Feb 2022 15:58:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/rk+2PWsZGJZmsMuI52ixNCJbvxxZXhGBloxQkqqxkDky7OrWs3+DwSaQCwm+soYe+VmaFw==
X-Received: by 2002:a05:6a00:1256:: with SMTP id
 u22mr32510685pfi.82.1643846290619; 
 Wed, 02 Feb 2022 15:58:10 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id
 b22sm27854781pfl.121.2022.02.02.15.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:58:10 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v6] fbdev: fbmem: Fix the implicit type casting
Date: Wed,  2 Feb 2022 15:58:09 -0800
Message-Id: <20220202235811.1621017-2-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202235811.1621017-1-yzhai003@ucr.edu>
References: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
 <20220202235811.1621017-1-yzhai003@ucr.edu>
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
index 0fa7ede94fa6..13083ad8d751 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1160,6 +1160,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
 		ret = fbcon_set_con2fb_map_ioctl(argp);
 		break;
 	case FBIOBLANK:
+		if (arg > FB_BLANK_POWERDOWN)
+			return -EINVAL;
 		console_lock();
 		lock_fb_info(info);
 		ret = fb_blank(info, arg);
-- 
2.25.1

