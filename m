Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4FC83DB8A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28A210FAB6;
	Fri, 26 Jan 2024 14:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFF810FAA2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 14:12:35 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6db0fdd2b8fso206080b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706278295; x=1706883095; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DQlVzK5S0SZ8xLgogJiclZtODcnjOBeJZwV+6P0khw=;
 b=MIbbD3JfBKrVsy71QrZx6AIaF+sz6ADt+2L9iw+HGyuW7k50OxG8xaXtESeegFGR6V
 Ng5LwyjZgJyjWZYpFL3zhM4nSdYeVcHJcH+IiSQ5c+OnJMHyJg2SchgR+nT4I195KQtf
 FBfYL9eJETw6K50N3tG657XE/Glc0lnGnyuutsMLOzDCcGTU1+qOfZ02DXBW1XdrVQNl
 ytwJW+WY54BC0TXquBkX7smREZsLcDvWDZ0+ZoFHU0TLAfEa7MvxWh4TxzSFCWiec0cd
 IzW6HsOpCLv0ia33VEot/QHQeJzEdpQ/kFuQfixfDPY+nZF0nRmoTls03mEK6YeTgK2f
 vm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706278295; x=1706883095;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5DQlVzK5S0SZ8xLgogJiclZtODcnjOBeJZwV+6P0khw=;
 b=Vz8/Vh2ZToK3Hss+mUM9HUd/yj7nxrDdMVVNpvAlswWhfQkpqamxdDQHX87zYmqs+d
 QpgsIT98Hszrs3Kosv9jUZ/2SDo7Dtb8hyM7xsm0l32SvurcRgE9Gyia9zFC09CbLDOV
 1no7fnIWA5BuWknL8EYiL6ZZv7vxN7XHpNY2P9L5E3T/BCP0vO461Ee0XHGmA1m5Pgql
 pxmcOxBS/uD1nWxBykZs0vzQaz0QF5PUHYnQu0IB18L2sByPXns1lthzd7FU0+9DQeAT
 slUVbZ2/F8rVPmOP91F2CMCXfk4nlmpvUH6RF81HH//54fITWV5JwJBvdVeKdCh+DAD3
 +rTw==
X-Gm-Message-State: AOJu0YwB+Bm5IicdJY4GIkUWcQubB06ZAvhJuvWTMETI9WMqhncPzsj+
 +ZmdaNvFJIUzPueCdtjaJs3+A2iFTym/udimdyt/t/X6u+he8zxVrVu4df74wBUfjg==
X-Google-Smtp-Source: AGHT+IGnlmTXNCkdfD8LAjE9foXlMwyd/et0ZdQ5i7Uirv391URClm3cosbQwHR39kAlKZ6YiZ2FMw==
X-Received: by 2002:aa7:9dde:0:b0:6dd:a118:9082 with SMTP id
 g30-20020aa79dde000000b006dda1189082mr1508080pfq.29.1706278295303; 
 Fri, 26 Jan 2024 06:11:35 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 gu7-20020a056a004e4700b006db105027basm1125511pfb.50.2024.01.26.06.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 06:11:35 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [GIT PULL] drm-misc-fixes
Date: Fri, 26 Jan 2024 23:11:30 +0900
Message-Id: <20240126141130.15512-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just one regression fixup to samsung-dsim.c module.

   I attempted a pull request on the drm-misc tree but encountered
   a permission issue. In response to this, I've created an issue[1]
   on gitlab.freedesktop.org.

   Therefore, I added the drm-misc tree as a remote to the drm-exynos tree.
   This pull request is based on the latest drm-misc-fixes branch of
   the drm-misc tree.


   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

[1] https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/1151

The following changes since commit 27d19268cf394f2c78db732be0cb31852eeadb0a:

  accel/ivpu: Improve recovery and reset support (2024-01-25 10:17:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/drm-misc-fixes-for-v6.8-rc2

for you to fetch changes up to ff3d5d04db07e5374758baa7e877fde8d683ebab:

  drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE (2024-01-26 22:48:47 +0900)

----------------------------------------------------------------
One regression fixup to samsung-dsim.c module
- The FORCE_STOP_STATE bit is ineffective for forcing DSI link into LP-11 mode,
  causing timing issues and potential bridge failures.
  This patch reverts previous commits and corrects this issue.

----------------------------------------------------------------
Michael Walle (1):
      drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE

 drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)
