Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0A394B8E
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA996E5C5;
	Sat, 29 May 2021 10:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25D56F627
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 20:30:53 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f12so6841620ljp.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EyvgwRI+ps+5cZkOoI1nKyi/eTvA8tNSToZ1i/xJfHs=;
 b=pZtHbzfNZT0l32ly8ZjAkBQBqTYRrsBOsrvg9W43j/9U5fUtyPPQakbfC5+eN6OXzD
 Tz/RcuK3FNFKeMGNYTrmtMkkL4q8QE1r8hk1KG7tHvD242nwimuzt1sy988vSyhq2jAX
 Ur+HWapaE0Ps+LNQm3AkXkwEOiwLiDhU3hmwWjmrG+M8/3VGRrJXanxtIacfSNvHnj0E
 fSw1Q5dOjQE47KNonictsJ0Z4sHuuSVHeM1N45TpazX25VeTB5MXBFmgKjAaSu+UqxHH
 PApAyMonACbTzGCzuvvlCdWJ8YmG7KU2E5OjFiFtEuDnK7CX8UxDa1CCUngLtI0PGOcL
 KqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EyvgwRI+ps+5cZkOoI1nKyi/eTvA8tNSToZ1i/xJfHs=;
 b=XL1HXiSDXFT4484RzJkzuRMuUZrFXdWkYnegGkdkUaLHk0/AvXI5kXCj1wgtdAVZ9/
 T1ngfacd1b331tptA26evwEnHAHXLuJzZZbmUP+f5uCgGmYIsgRi9+hXhFYuo3VfN2M6
 A5GvtW3krhAMCwnauHZOo/+MJGEOLAJfmxqgVMA/j1PYT3u0ovoTvwkeaRjwxIhMxUS9
 hUCBCLqdwX2XSFIXuzo5GfOR5AySsICgiEtQM4kYD5SOkQcT04bQaJpjl7fjUPstRo8m
 R1YiPAlnHirfIUmLXBZjgTLnfv9GQHMD64TUP5B7LRclbuMG4vOs6Epw3VEXCH4Y+M9H
 2JVg==
X-Gm-Message-State: AOAM532O6urX8bdzNBTkmYEjrb9blEgAO4aY+s5Ru1vAHGNARies6WzC
 +fPzCeOjMrD0hTdPL/ku5Mg=
X-Google-Smtp-Source: ABdhPJx5zcOiUuDL6xseZn6lzPS63Y1BXiSrMEjSU2d2O8NQ4SzN/viQhRsxgmJNXs9MkmZLu0kalQ==
X-Received: by 2002:a2e:9d8f:: with SMTP id c15mr7932970ljj.111.1622233852168; 
 Fri, 28 May 2021 13:30:52 -0700 (PDT)
Received: from roman-S500CA.. (72-28-179-94.pool.ukrtel.net. [94.179.28.72])
 by smtp.gmail.com with ESMTPSA id a12sm655820ljk.34.2021.05.28.13.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 13:30:51 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] drm/sun4i: Set mixer frame to display size for DE2.0+
Date: Fri, 28 May 2021 23:30:34 +0300
Message-Id: <20210528203036.17999-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: megous@megous.com, jernej.skrabec@siol.net, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset fixes corrupted display picture when primary plane isn't
full-screen.

Please review/merge.

v2:
- Split commit in 2 parts
- Add Fixes line to the commit message

v3:
- Address review comments of v2 + removed 3 local varibles
- Change 'Fixes' line

v4:
Resend (author's email changed). Reword commit message.
Drop fixes line to allow more testing before back-porting.

 drivers/gpu/drm/sun4i/sun4i_crtc.c     |  3 +++
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 ------------------------------
 drivers/gpu/drm/sun4i/sunxi_engine.h   | 12 ++++++++++++
 4 files changed, 43 insertions(+), 30 deletions(-)

