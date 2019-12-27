Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEDC12BD36
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2019 11:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1216E13F;
	Sat, 28 Dec 2019 10:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178136E184
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 17:37:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d16so26643637wre.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2019 09:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CgL35F0PbHIPU/xEH/yy9QoMVLs1tW/HJnhHgsc5otw=;
 b=IzRk5AUha85e7ZBCIOmBml/0x7GVSoZe86A4RuekbCtKw9koHk96jYDQzvksMlroIw
 QPo76Lk1FreaiJs+nJlxY+DGPDuAY+IqoHZrnEab+FZNodNyyzGPZuhhZGqNA0ygRsSn
 OvxTJQgLvEO58F9eoYgth4dX9kL9tvBf8pkR4nNOy4ygfr+6ypFaOskRNfV+HjgNjTP9
 SRXFGXA4FjuXIRfJOWUn34EHQSluO7zRj5sm7nGRHcDIecXkNdVEpdLeGYmaKErg5yfQ
 /IVeaOYZu4c7oWdEMsF8yE3bTmR5fv4KWbFol8SVD2OByfCJyKRmC/iD7pBQB5Vr/sho
 9vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CgL35F0PbHIPU/xEH/yy9QoMVLs1tW/HJnhHgsc5otw=;
 b=hyPzuLHC+5hFYIf3LXkCyMuPny0JP6hZ+1u7xjQB0gJUpEcaPW4Kv0snfMvDV0S0mY
 UfE274eDv0tkGlUG7WLL4XPcZnAWJYqr2/W8Bi6xDVPeOqPJa53A1sG0Ex2SMdtYxVaw
 sjbwPfIVeB5Ry3W2cCmq7zt99oJhsjC1NM0t++gAPMEL2iWyxfg6zE8VMyB6LCtC/YzP
 bdK3ViaVvkA9UOKk6mhcJil3ba59EpvVIC0eKd+mxljnd03a/+yNOW/Gf8B0c5xM0fwU
 ho+ntUK856alXXBRJBhLeNj9pcveDkqXSFI/6G5qj7UT77AEykWDjkvK0fRCky1ILbjx
 Wz+g==
X-Gm-Message-State: APjAAAWsj3SOCjXGPd8gEr367cz/egVfWE/8Xx5SPiqKiZ1smTensH3J
 0n281YKC+Hdq0YoksZfqqqE=
X-Google-Smtp-Source: APXvYqy2UYkwMWU2dPVz7z8FO3EUeuKP2Q67lEtRTqjhCkPr42la3j1A1wB8F6mXKYw58lhzPxwabg==
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr41875477wrj.325.1577468265643; 
 Fri, 27 Dec 2019 09:37:45 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f1sm35001776wru.6.2019.12.27.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2019 09:37:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/1] drm: lima: devfreq and cooling device support
Date: Fri, 27 Dec 2019 18:37:06 +0100
Message-Id: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 28 Dec 2019 10:07:14 +0000
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

I am seeking comments in two general areas:
- regarding the integration into the existing lima code
- for the actual devfreq code (I had to adapt the panfrost code
  slightly, because lima uses a bus and a GPU/core clock)

My own TODO list includes "more" testing on various Amlogic SoCs.
So far I have tested this on Meson8b and Meson8m2 (which both have a
GPU OPP table defined). However, I still need to test this on a GXL
board (which is currently missing the GPU OPP table).

Test results from a Meson8m2 board:
TEST #1: glmark2-es2-drm --off-screen in an infinite loop while cycling
         through all available frequencies using the userspace governor

     From  :   To
           : 182142857 318750000 425000000 510000000 637500000   time(ms)
  182142857:         0      1274      1274      1273      1279   5399468
  318750000:      1274         0      1274      1273      1272   5114700
  425000000:      1276      1274         0      1272      1271   5122008
  510000000:      1909      1273      1273         0       636   5274292
* 637500000:       640      1272      1272      1273         0   5186796
Total transition : 24834

TEST #2: glmark2-es2-drm --off-screen in an infinite loop with the
         simple_ondemand governor
     From  :   To
           : 182142857 318750000 425000000 510000000 637500000   time(ms)
  182142857:         0         0         0         0       203    318328
  318750000:        53         0         0         0        21     56044
  425000000:        27        18         0         0         2     34172
  510000000:        27         6        14         0         1     41348
* 637500000:        95        50        33        48         0   2085312


Changes since RFC v1 at [0]:
- added lock to protect the statistics as these can be written 
  concurrently for example when the GP and PP IRQ are firing at the
  same time. Thanks to Qiang Yu for the suggestion!
- updated the copyright notice of lima_devfreq.c to indicate that the
  code is derived from panfrost_devfreq.c. Thanks to  Chen-Yu Tsai  for
  the suggestion!
- I did not unify the code with panfrost yet because I don't know where
  to put the result. any suggestion is welcome though!


[0] https://patchwork.freedesktop.org/series/70967/


Martin Blumenstingl (1):
  drm/lima: Add optional devfreq support

 drivers/gpu/drm/lima/Kconfig        |   1 +
 drivers/gpu/drm/lima/Makefile       |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c | 183 ++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
 drivers/gpu/drm/lima/lima_device.c  |   4 +
 drivers/gpu/drm/lima/lima_device.h  |  17 +++
 drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
 drivers/gpu/drm/lima/lima_sched.c   |   7 ++
 drivers/gpu/drm/lima/lima_sched.h   |   3 +
 9 files changed, 244 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
