Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E04A7C06
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3C10E650;
	Wed,  2 Feb 2022 23:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx-lax3-3.ucr.edu (mx.ucr.edu [169.235.156.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524E710E650
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 23:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
 t=1643846287; x=1675382287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xYvx8fe8wRHtOQTQUEuPl7xZb+NEUT35cy+DHSkqPn4=;
 b=XTwqyDMPUvipi5OAfjVMLANO54AgAW+qEkH9m72P3WAdpTZmh3A+fmlS
 9m6CI0TrrOTM5rXNQf3jYF9auhWswWdZqGRawnL7sgIUGPrEAC85U78KI
 gqdJR8Wxt6GNncLsMPZkEcAA3ZkC+x58yWyNOxxkvCwVsS5Xt5dbyYhgv
 YhcUE0Oa1eC/aM/HKj3mb12K319mixco++9B4BzmKVmk4O1u8OM7r9E3V
 DeCuzp7s7qeJxGoPI/dDU30ADRT8U6vAJ5ixzbFMrb3oFjpaC9ImLHj+X
 IDY4j8ZmMq9KRRowb4CTv16mOiqPVQ4r3L/NhbEwaIYUGE95zG1ZZZqQL g==;
X-IronPort-AV: E=Sophos;i="5.88,338,1635231600"; d="scan'208";a="105399199"
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by smtp-lax3-3.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2022 15:58:07 -0800
Received: by mail-pg1-f197.google.com with SMTP id
 r9-20020a6560c9000000b00343fa9529e5so468725pgv.18
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 15:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucr.edu; s=rmail;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUOM8bvwC+la2NKqFvk2uI9Asw+K/wrTaRpdb2Kdz7U=;
 b=HrYsDT4AbEktOiXWlPEMn/m7e6zv2dsefdTeMC5C2hJLezPbv+I1/ftDBXrJt6Un0z
 GqSD3kzgEw3q1pfOdDoOgKDJvmgHKg8NIkh4s4COvIsupoE4p/b9lbZQZ4gbhXZtj7sK
 4vUh0ntfzQGjCKF3AZQ0GIBqkvnKIMkIts8xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUOM8bvwC+la2NKqFvk2uI9Asw+K/wrTaRpdb2Kdz7U=;
 b=vmojhQ+w3m2zm0AQRedhsAPQbbVYd/1Q6yVT/bheX2Mu/QSgSfcU/GwgIw4rwx5w28
 n11ovZUYDQLraD/Nc1KNA3sGiKKcVkxnQWIyxHbP9P6G0VGeDmTZ9qZ7lhDkwdkbvr8w
 ShJpRbE4zFOdfCJdcSf7tA03i5Fg6nAXZmysZdHbUvX9erMTnq+jkw/QgaC9+4vESaeU
 kMPyKsroZtQBsBkFh4c/s8F1uB45txrYQnfkscHOBH09/LMzuNXYKnGgK5pq875jMlyM
 /E1liTA68a6AJQN3yIQr8Z11/WFb94buCTPuTZpLsIBX/+iXc+z5VStfhbfUHpd4iLwR
 B+iQ==
X-Gm-Message-State: AOAM532ZyifKoAO03/Gn9822b5EHzAakHqBukPyUqPHz70RJBb3fK8mQ
 rBPvbEt7/IocvGpE4x6gaw6zmocse371Knu+pBf2mJ4Ta0vXyroxKqv3sSr9TuMCSfhzYLffG/U
 VCXTVm+vkgQeIPNWzSbN+WCgynUdvNA==
X-Received: by 2002:a17:903:2310:: with SMTP id
 d16mr33430912plh.20.1643846285916; 
 Wed, 02 Feb 2022 15:58:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZKL++WYDLmSn9xU1SSYz871Lo6pf/fCV7Hf709Wi2UHiygHMvfWHZxapRrgqd4vPTs3zu2w==
X-Received: by 2002:a17:903:2310:: with SMTP id
 d16mr33430902plh.20.1643846285669; 
 Wed, 02 Feb 2022 15:58:05 -0800 (PST)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
 by smtp.googlemail.com with ESMTPSA id
 b22sm27854781pfl.121.2022.02.02.15.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 15:58:05 -0800 (PST)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Subject: [PATCH v6] fbdev: fbmem: Fix the implicit type casting
Date: Wed,  2 Feb 2022 15:58:08 -0800
Message-Id: <20220202235811.1621017-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
References: <f3b28143-5f59-ad77-f2b8-6274a6edbfdc@roeck-us.net>
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

