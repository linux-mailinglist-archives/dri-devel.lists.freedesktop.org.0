Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8821CA803
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3CD6EAD5;
	Fri,  8 May 2020 10:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525E6EAD5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:14:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id h4so9635602wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vSVzsNo/f2HsblA9EhDyIIGLzh8Z4JeTmAlaXX4Bxm4=;
 b=JMFcWPz3oKo6z2O/k/rTcfj414wMLqtRujLQ3nUf2rUVeOk7nef9GjvA/55CeCJTr7
 VM7fqFtA7xHmtHRr+m1Zd/Xnj9HrQHl95HqD7qjSXNVYBDNoOjTAJWnlxS5lq/xnw/hb
 9YDqJL5vCRgbvS5krnmP9L0XRhd5OU/KLgQnVx4jxlGfWADZ3BhYx7aA70CvChSB0RoI
 SWGh5kQvtxBr2rnzg0Ksrfh69bspWnLhX0zY6f1JXfpVDKWivciC85TX89Tz5iLq9dHK
 e5OG4ylP4wfe7i1DvZqzotvxG4Qr76xyHnjQyOcxJ5K6j75BXlIpVI0LHjiO4cw0VL7g
 hnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vSVzsNo/f2HsblA9EhDyIIGLzh8Z4JeTmAlaXX4Bxm4=;
 b=QDOOErJ2q4jKS8PLcHEHcp7KjwtzrtWg4KduNoGkjmCMyfg7QPtkMNLiI9wypJoua9
 kNVl+AJVK15CxbeA6rAPofQLjD9rlaAGNNr8sICHc+iRJ9/bI43ElnP4JmtIMRA0a7Ov
 OM0fmbgfYyAj0wQD2mB1TwWtduGIYCSRA4bJhAYwA9w0DxvtoIJSoJWEOSn2B08oPbDI
 fJDk+80ofDBB9kCjAvsx5aPcbdZmamoq+ELgExA1/vsIW0TC7exL6bghqVJr8XTRkI+a
 WJhtyHQ3T4x0YCVe+a066MWK1wENznXPG27b0JAhJ/OLz4x1llr6U7TMAgvAHYNhLaRN
 x+Og==
X-Gm-Message-State: AGi0PuaFX001TEpMu1JoxJd3Yb7PawW0NMiCkCgSYesPXjg2J3GrxNqH
 4VncawtQh5WNU8ncvi5GRRc=
X-Google-Smtp-Source: APiQypJQNxGUMRRBHHoLIP9X4chOGOOgTS4J3ZHvpJEMuH3vJqu4bC631vKsVd469lBypyffY4xF7A==
X-Received: by 2002:a1c:1d3:: with SMTP id 202mr9291808wmb.145.1588932842798; 
 Fri, 08 May 2020 03:14:02 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
 by smtp.gmail.com with ESMTPSA id 18sm313743wmj.19.2020.05.08.03.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 03:14:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.7
Date: Fri,  8 May 2020 12:13:55 +0200
Message-Id: <20200508101355.3031268-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.7-fixes

for you to fetch changes up to 4010e729349fcab69183f338fe3743df17a473a0:

  gpu: host1x: Use SMMU on Tegra124 and Tegra210 (2020-04-28 11:44:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.7

This contains a pair of patches which fix SMMU support on Tegra124 and
Tegra210 for host1x and the Tegra DRM driver.

----------------------------------------------------------------
Thierry Reding (2):
      drm/tegra: Fix SMMU support on Tegra124 and Tegra210
      gpu: host1x: Use SMMU on Tegra124 and Tegra210

 drivers/gpu/drm/tegra/drm.c |  3 ++-
 drivers/gpu/host1x/dev.c    | 59 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/host1x.h      |  3 +++
 3 files changed, 60 insertions(+), 5 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
