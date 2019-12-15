Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32711FFCE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9EB6E455;
	Mon, 16 Dec 2019 08:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709F86E151;
 Sun, 15 Dec 2019 21:12:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f4so3580308wmj.1;
 Sun, 15 Dec 2019 13:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3g/A/VhKALqZSKzxwKBBQCqFaLT6bu0ReDrDf4DLQc=;
 b=ZCtFipn4ACffkMmwhawkSiNoVgx0+1I/zetuvwljhG+tWyZ0QQPaYyTf0tYB3xkngk
 6Zdhi3lnfLaSVuaQ1DqhKu1f/SKPj5x54V3ruUFI3TrsEfeMqsB2gcJLKV59QYW9WVrS
 Tf8W2Vez+GWK2BdLTjqd69ZTyInxjiH22HRxCj3h2cYInl4jj2OhyBxX+t1t8OIcaBPU
 d8YwQjidrlvmNzBDYimEfKgMzxiXGIffGNSy509VGvm+HlZ5Yy9P3bC9XKTeKsS2VAR5
 tuUCD+Wzn/d1Wq8Qko4UIOccdH5ozey4wwt1KKWzVwWjaCUvOt2jN1q22S5O/YmLQMQR
 GrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3g/A/VhKALqZSKzxwKBBQCqFaLT6bu0ReDrDf4DLQc=;
 b=baojGatrzT8h4odsEge6XwLYJ+yWQJcXi+Q5Jd50w/kiLs0OdbsQeNHx4icN0llQXI
 Kwi7ql0kFO9UfOmWPeHr1SnAZFReD2S1cxBZVJyUg5deu+s01MlrV12BtX3xSsLaEAei
 GIrax9IFsT7R3a94AYSywYczyFnJgE2W6m09j26/QCWY41ND5bOzwn+QGIMz6j55ZF0h
 BsVwxT1Tp+EGQbjKFRVK+attTnIvQQt2eKQ+Yd0lF39aPIDVs/MfJSX50TK2NA/TBPWL
 T/10aQqtrGj6+0y82ey32/jkgTpiVSf1a+M9bhmCMqxxDYltgeyHvE8Cq4A2HK0jsc02
 d6kQ==
X-Gm-Message-State: APjAAAUNMqiP59asxQ7LY16PuVodj98q449Qygu6T9D5055i66bsjZG0
 0gDZZf0WfIJ77G6+hYMG8ms=
X-Google-Smtp-Source: APXvYqxJS/WP2zOOmRW0orqTzZD1jmdig6IvEjlAtgAQFwQIvIMmtkBtCQxOdm7tqfX0VPIRQxJT0Q==
X-Received: by 2002:a7b:c342:: with SMTP id l2mr27920141wmj.20.1576444354953; 
 Sun, 15 Dec 2019 13:12:34 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1370FCC00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:370f:cc00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j12sm19888598wrw.54.2019.12.15.13.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 13:12:34 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [RFC v1 0/1] drm: lima: devfreq and cooling device support
Date: Sun, 15 Dec 2019 22:12:22 +0100
Message-Id: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is my attempt at adding devfreq (and cooling device) support to
the lima driver.
I didn't have much time to do in-depth testing. However, I'm sending
this out early because there are many SoCs with Mali-400/450 GPU so
I want to avoid duplicating the work with somebody else.

The code is derived from panfrost_devfreq.c which is why I kept the
Collabora copyright in lima_devfreq.c. Please let me know if I should
drop this or how I can make it more clear that I "borrowed" the code
from panfrost.

I am seeking comments in two general areas:
- regarding the integration into the existing lima code
- for the actual devfreq code (I had to adapt the panfrost code
  slightly, because lima uses a bus and a GPU/core clock)

My own TODO list includes "more" testing on various Amlogic SoCs.
So far I have tested this on Meson8b and Meson8m2 (which both have a
GPU OPP table defined). However, I still need to test this on a GXL
board (which is currently missing the GPU OPP table).


Martin Blumenstingl (1):
  drm/lima: Add optional devfreq support

 drivers/gpu/drm/lima/Kconfig        |   1 +
 drivers/gpu/drm/lima/Makefile       |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
 drivers/gpu/drm/lima/lima_device.c  |   4 +
 drivers/gpu/drm/lima/lima_device.h  |  11 ++
 drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
 drivers/gpu/drm/lima/lima_sched.c   |   7 ++
 drivers/gpu/drm/lima/lima_sched.h   |   3 +
 9 files changed, 217 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
