Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A563516B6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 18:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7CD6E10C;
	Thu,  1 Apr 2021 16:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885B76E10C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 16:33:27 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b16so2641995eds.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfFpqI43eJgDiJE4Cw9nOr2GFi0mzVDy5zrF8LXVf+0=;
 b=CFJD+VPr916K0gehBZFqH8bQGo8WTKTP31fbZvSFlLTVGKwaBe/DTSx+6zQ5aQyUf0
 yosjwFcrp1uKyQ2vcNVGbwFHz0b/rCWm6uuGtFw26ypI2l0h4DyYAJhyBqijAt/k3SUM
 uw/FUh56Qx0jUABI2r77x3+WLe0th9nN9MAwQx7srdxbop6lMWagadQgNbp+2vDe6Whx
 GYRTndqN+hB5V68H26tIOPVfdOzEm+sFrJ6P8OQ9kkrL2QggUrD2gVm0J5TZ/QbRhCg5
 0B9RA4GvNfBWgefXy9VcD1eXyjjuSojJOh7TBIqagwx5MUZf5i+QwuepJjIQKhiBxhIc
 tSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nfFpqI43eJgDiJE4Cw9nOr2GFi0mzVDy5zrF8LXVf+0=;
 b=TlIuLNJJEzQfOnSBnrj99AMvfSHu+AKl2SnyfTCTfcRAiPXoYk0kts5WPVOtXfoGjW
 pzOyBii+IaOpbzfLfS2NzksW8WbQ3BBQ9LSwioE+J+yyeC1rOybrN7eh8Vbc71jr16cb
 djRx+ygmLlgc/wlizzBkTZpruAqXI0HasF5ajpwoY7eXlysEOOKOeG+J3Gk+lr0wjcvb
 iW3QL52jeRmcIjHvBB8yfYNpYX0lIhWFaCnhO2Bag3yrwwjsLlTYJwEHXUCcTJeKmT64
 mr06SI9Oa5d2HLb+pwhWcsd8yP4lp8weHXP+pCzcVKWHTLuHPd3BTdHOEqZ6kx4K2dkH
 DLqA==
X-Gm-Message-State: AOAM533SG3RT81ZpGwJEoAV0D0dR4eSFIXG5v9FuAOiBXh7UbJz0+jk1
 RraYq/j0hwyDHXfhsRNh6DIwR5v6AA4=
X-Google-Smtp-Source: ABdhPJy9X2kL/rAMLcFBwpaXEzx4be0cmrVI1XATJ4YBuUp7KPU3K4BY+1azqmitwoigIukeyAT/Gw==
X-Received: by 2002:aa7:c150:: with SMTP id r16mr10710923edp.96.1617294806265; 
 Thu, 01 Apr 2021 09:33:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id q16sm3927233edv.61.2021.04.01.09.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 09:33:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.12-rc6
Date: Thu,  1 Apr 2021 18:33:52 +0200
Message-Id: <20210401163352.3348296-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
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

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.12-rc6

for you to fetch changes up to ac097aecfef0bb289ca53d2fe0b73fc7e1612a05:

  drm/tegra: sor: Grab runtime PM reference across reset (2021-03-30 19:51:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.12-rc6

This contains a couple of fixes for various issues such as lockdep
warnings, runtime PM references, coupled display controllers and
misconfigured PLLs.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: dc: Don't set PLL clock to 0Hz

Mikko Perttunen (1):
      gpu: host1x: Use different lock classes for each client

Thierry Reding (2):
      drm/tegra: dc: Restore coupling of display controllers
      drm/tegra: sor: Grab runtime PM reference across reset

 drivers/gpu/drm/tegra/dc.c  | 30 +++++++++++++-----------------
 drivers/gpu/drm/tegra/sor.c |  7 +++++++
 drivers/gpu/host1x/bus.c    | 10 ++++++----
 include/linux/host1x.h      |  9 ++++++++-
 4 files changed, 34 insertions(+), 22 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
