Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A222F1E88
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210CD89CD8;
	Mon, 11 Jan 2021 19:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFDF89CD8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:06:00 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id u4so106563pjn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=ANBjRwqH1HoPchWIW+dbJvfbLYPMTGo/1NpZE7xk2Pk=;
 b=ctAuKNyW/b4XuZsUgM+xIQoeRnGzABubNTZ2QL9o59sKoo2JJo9C9AiBhBJUDvTt7R
 BzWYfEQwZtbEEO0eZ4ovwhNKyuieCI5+7oHhRvvJLPGUhspd+eXpcjKi4wRQJXm7TYK3
 jf8y1mPTcavtn5NMk2BECr2s4s3t30EyeFHjUH7O3CgauML1wEDZmepjaD2eCu1JWYPi
 JH/BoPKEC40rlfy7LSorzXcciIhs70XpsEJMvUNqacSNa4J+qMreDhx5q1N46aYzA5sw
 9iJC4Q5fPK80xl/ajiGK5pnsZPT2EHRMCUhu4MmpNuTS+WJitrz2XchqGximLT7pKDzh
 F/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ANBjRwqH1HoPchWIW+dbJvfbLYPMTGo/1NpZE7xk2Pk=;
 b=Zh98wvdVssJK2N7uBN7QIuFQB95YGp2RYmYOwFsR6pVTnqkWnJ160vnMdLHN/dwdzL
 mibO8GXAJX1T3SNxZGDTthjNVxaZauZy7dRQWEfAZqSbTZd9mS+I8OaXoBqgU0s0w1H2
 TX4xgU1Y2BUgI86ZZaY7+H2r9cnYWUyJa9buAMEcpDPuLrLUCvWznIoyyJKFl/ivsId8
 V227kvYhlYJp6gqS2YnD2yBaJliUTuLv+7Erp/JEUNHGkJswYiNRzHusN4YzZgPgokjC
 UpEWYnMJeO7XT/9m4lm//QV10901WyLB0vRy/08l9Kx0Jr7N63SikGGLrCGYilhoyFdD
 oLxQ==
X-Gm-Message-State: AOAM531qnVhWIzUlFspQcWhY1MtJ4QQTPRiMlNj/EaGddg9s6NI70730
 //Js+9BjA1Q7N3/4PxbmsU4=
X-Google-Smtp-Source: ABdhPJwWNGOgwovchwndU22WdKcsLn0ITUAiEQwHOmkGZw52WuV/NiJBK0nV28kcTbEsYCO6Aq9bxw==
X-Received: by 2002:a17:902:aa45:b029:de:2fb:995 with SMTP id
 c5-20020a170902aa45b02900de02fb0995mr1122547plr.81.1610391960420; 
 Mon, 11 Jan 2021 11:06:00 -0800 (PST)
Received: from adolin ([49.207.206.164])
 by smtp.gmail.com with ESMTPSA id gg24sm144979pjb.32.2021.01.11.11.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:05:59 -0800 (PST)
Date: Tue, 12 Jan 2021 00:35:54 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V5 0/3] Decouple config data for configfs
Message-ID: <cover.1610391685.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset aims to lay down some prep work before configfs can be
implemented for the vkms driver. The first patch in the series adds a
new type vkms_config to track device configuration. The second and third
patch add module testing support for writeback operations.

The first patch is developed by Daniel Vetter.

Daniel Vetter (1):
  drm/vkms: Add vkms_config type

Sumera Priyadarsini (3):
  drm/vkms: Add vkms_config type
  drm/vkms: Add support for writeback module
  drm/vkms: Add information about module options

 Documentation/gpu/vkms.rst         | 12 ++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    | 45 ++++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.h    | 13 +++++++--
 drivers/gpu/drm/vkms/vkms_output.c | 13 +++++----
 4 files changed, 68 insertions(+), 15 deletions(-)

---
Changes in v2:
 - add Co-developed-by tag
 
Changes in v3:
 - correct usage of Co-developed by tag(Melissa)
 - add enable_writeback_feature(Melissa)
 - modify commit message(Melissa)

Changes in v4:
 - split previous patch into patchset(Melissa)
 - fix checkpatch issue(Melissa)
 - update docs(Daniel)

Changes in v5:
 - modify docs patch(Daniel)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
