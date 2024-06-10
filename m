Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C6901BFB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 09:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7B310E2D1;
	Mon, 10 Jun 2024 07:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C5nwolJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4586210E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 07:38:45 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1f61f775738so34411985ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 00:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718005124; x=1718609924; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEeYczgmKxylMukshxG6mWi27nmS4L72/ofau0FaVSI=;
 b=C5nwolJLFloPZWbCyXv1MTD6Il4D290c/D3Aaxf0cG6yfk+nghr2n4z8gaaCkxpRvd
 R1A1MO8jDF8Xu4/Y+cL3KeVSqppe+cDtwMY/gjWR2qrHda0jk9Z9iisSaQypZlHyxll7
 5OCnV93bqSxkNW+oh5gw+8GHQ41r1Fvn5eyxK/wU47rEzV5tp4Q7cxFQyX0Pu4Y12IJX
 efnmIpGPXNLAth8SGaqjG2XAKNwn448Ugu9Oa0VoH4qnI0g628vkFgQaCyty6Hl0Igv6
 EZQsx7MQwk620MMvHZWv6NUpjXCOh+WpwRNp9lMZalP/+Z3sxBrDCSqTlLsGc8jcQBfq
 gsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718005124; x=1718609924;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fEeYczgmKxylMukshxG6mWi27nmS4L72/ofau0FaVSI=;
 b=H6CkfCTzcs5PDfUFxJj53zaXB995adGW4u1fVDjPP45YtUpbRzTS1TYe/CwmLBT1sU
 sOw+Zkz8jU6goq1nnUvP8au41p0nNw6+1LUXJu63cysKSw+t6gi7KMqEcZs8uR7ePUNl
 nWeCFMNvD2CgPuTiv2H8o5NXXTNiKR4Xn0l1ZyyfSG1FPghjwg0JlcytVYD7TmNKIA02
 kcmJrthmCJM3jg6fNzkD3ct31oykQ6PJa2DVB+Y1o/Wd6VYTtoM2q+jvqL6WoPC6iX6/
 RoE6kfOnGRE30b9ACLZrUWBB2Xw7nfNslKvnWGKeDBnuAXa/DodC6b8iqcwgusQIEQ3f
 trlg==
X-Gm-Message-State: AOJu0Yyo6FGarfwQBtIz2TBB2wMylCspYLLf12jys5R3TzlfnpIB3V6c
 DSxY08O7jr+XGOjunPgJcXRhM7ed8MaSAjkKLZbY0avwKm1F0Ey3
X-Google-Smtp-Source: AGHT+IHzTtNYHQERotEFnvwdsciHAGRVrrOcRqC4zBx7IkWX/kCXL7BDT1ZwLHdaBUAHJknASlMROw==
X-Received: by 2002:a17:902:d4d2:b0:1f4:b702:f143 with SMTP id
 d9443c01a7336-1f6d02dda45mr89178495ad.15.1718005123325; 
 Mon, 10 Jun 2024 00:38:43 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd7e5cc4sm78276175ad.235.2024.06.10.00.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 00:38:42 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 10 Jun 2024 16:38:39 +0900
Message-Id: <20240610073839.37430-1-inki.dae@samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Two fixups - one for an regeression issue and other for memory leak - and one cleanup.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit eb55943aab89be99a26e34fc2175ebb3583a2778:

  Merge tag 'drm-misc-next-fixes-2024-06-07' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes (2024-06-07 08:40:58 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.10-rc4

for you to fetch changes up to 38e3825631b1f314b21e3ade00b5a4d737eb054e:

  drm/exynos/vidi: fix memory leak in .get_modes() (2024-06-10 15:05:43 +0900)

----------------------------------------------------------------
Regression fix
- Fix an regression issue by adding 640x480 fallback mode
  for Exynos HDMI driver.

Bug fix
- Fix a memory leak by ensuring the duplicated EDID is properly freed in the get_modes function.

Code cleanup
- Remove redundant driver owner initialization since platform_driver_register() sets it automatically.

----------------------------------------------------------------
Jani Nikula (1):
      drm/exynos/vidi: fix memory leak in .get_modes()

Krzysztof Kozlowski (1):
      drm/exynos: dp: drop driver owner initialization

Marek Szyprowski (1):
      drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found

 drivers/gpu/drm/exynos/exynos_dp.c       | 1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 7 ++++++-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 7 +++++--
 3 files changed, 11 insertions(+), 4 deletions(-)
