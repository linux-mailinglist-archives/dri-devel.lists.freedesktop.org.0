Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7002C683D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067C6EE0A;
	Fri, 27 Nov 2020 14:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6506EE0A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 14:53:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 3so3044192wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 06:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSLIhPoSzJ8v/zeWOZ+q40NwwHppqFUPh/1r9R00iuM=;
 b=IDOU0FBbGISgX76xSKKRc47xLJ6nqzIfNtUPRKJU8e4TiQki1Qritlz9Er+zAXKSUf
 n6giqCfC9ilY3xlMDFA7Z/TX7HNCXIhzSBadPp3UufgbJrXQIbavVPoCe7pmG0Gc4iKU
 Hdo8m/IQLlCu9bgRmnFqrpaLdapt8BD2QBsS7NqQV4TVEKBhAIwo2A80DB4WvFMWWhCx
 eCaJbaSzTovrwnnhvomfzPcSq9M7o18uuWlsM0lDc0RBkt1bcqw4RWY+menhbh/fBw7L
 7mPxH0X/yYxeQCMw3/Le8zv+cdchog/fOkEYEo2XRmazrZ7zr27p0P0VNM8fQq5skGoU
 6QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSLIhPoSzJ8v/zeWOZ+q40NwwHppqFUPh/1r9R00iuM=;
 b=qtPp0SPJ4nyRMna7oCL4RJQeSYINIpL/uMhw0kfOrdV+7TtCcnFuUD57Y+kOmpoBbw
 OR1q72gbetdl381RZtKrM3CE8cT9NzGXg7ePKB6agJ+nzvFQO5wXSN8F/O/Mk+4yrYBZ
 rwP6fE3JEyugCQ6ntalwFZ3Jd0zK+arHVewHjhHq91eUc3adsT4oaqn8V++DkrweqymI
 HzhgSEHr2B1MzbHqzHVB9tcZG8lUBr+8Cy6oWylBIT0hOth+xjZmbVSVjBHA/qjtctAS
 RPVBE3GNpLlPTgKCxSJlee1CaQZLSF0g+z5gV10unfsWiGkGKUlBx3uw1EGBsHajAlyX
 DfTg==
X-Gm-Message-State: AOAM533+fEwBxrzgIB6TEo6ID9l9oPE0cDuXv5dV7Dduac89dyjTIxG2
 jEWHbsRL9yGI8RGKtZ0MtAQ=
X-Google-Smtp-Source: ABdhPJxQvWeN0LvLzyUkDiYSvT11qEthbU1xvhOrzeoKmVz5xEy54BEjZaJ8wNguLQEcrH3bjckH5g==
X-Received: by 2002:a1c:a185:: with SMTP id k127mr9810130wme.23.1606488805904; 
 Fri, 27 Nov 2020 06:53:25 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n9sm13410275wmd.4.2020.11.27.06.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:53:25 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Subject: [GIT PULL] drm/tegra: Fixes for v5.10-rc7
Date: Fri, 27 Nov 2020 15:53:24 +0100
Message-Id: <20201127145324.125776-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
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

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.10-rc7

for you to fetch changes up to bf3a3cdcad40e5928a22ea0fd200d17fd6d6308d:

  drm/tegra: sor: Disable clocks on error in tegra_sor_init() (2020-11-26 18:44:48 +0100)

I don't have a feature pull request for v5.11 since nothing really on
the Tegra DRM side that was ready. The only thing that I've had in my
tree were these couple of fixes for minor issues. They are mostly for
non-critical bugs, so they don't necessarily need to go into v5.10 if
you're not comfortable with it. However, they're all fixes, so they
qualify and I didn't see a reason why they shouldn't go into v5.10.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.10-rc7

This is a set of small fixes for various issues found during the last
couple of weeks.

----------------------------------------------------------------
Deepak R Varma (1):
      drm/tegra: replace idr_init() by idr_init_base()

Jon Hunter (1):
      drm/tegra: sor: Don't warn on probe deferral

Marc Zyngier (1):
      drm/tegra: sor: Ensure regulators are disabled on teardown

Qinglang Miao (1):
      drm/tegra: sor: Disable clocks on error in tegra_sor_init()

Thierry Reding (1):
      drm/tegra: output: Do not put OF node twice

 drivers/gpu/drm/tegra/drm.c    |  2 +-
 drivers/gpu/drm/tegra/output.c |  1 -
 drivers/gpu/drm/tegra/sor.c    | 76 +++++++++++++++++++-----------------------
 3 files changed, 36 insertions(+), 43 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
