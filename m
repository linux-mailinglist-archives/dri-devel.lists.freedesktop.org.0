Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0F38FB6E
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658D56E0C2;
	Tue, 25 May 2021 07:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDDF6E8CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 16:47:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n2so29320348wrm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=di505kkRqDSik9WYJX+bh+gzE7K7u5Z12HF0qqOqyv4=;
 b=f5LwgmU9uBz5xIBg2EmWqUfyu8LTeLGDrXaf1Srkf/XVZ8hqbaFF5KazU6lNy6Vb0M
 ueO3d9fSwojEQAOAULyb3RquXh6TqWpTo31Hzsu+Ch/bmAgsfo5L2YzbRihDmOfYfzxF
 OBqu9RHKFvxWFyidrVrx5MD6FkSGcgIVumn4KSLLsrIiaKMQ95fWRWTOyfB27TCvXgJE
 1opq1nB8noa6SXdI9Qls2vyVacH1cqOLk0zAzMH0AJkJtlgdfMSFX1kXdK4UeBCwrFLf
 V7RkVHxlZL7n1bWmSaQemUfO9TZm83CwLjNrfwwjgSCsW9vMvakCeiss/A9Ap/t7hGZR
 UvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=di505kkRqDSik9WYJX+bh+gzE7K7u5Z12HF0qqOqyv4=;
 b=U0vnzGcQUYInoqIWgeZCYPqgzuaN+Nta+vW6YINv3NRc8NZ/BGahMp8y9Hg3k2tGKR
 C9wdHF86M5hhchMl2J2U88p4tRG7Cvy3bu/Rq99Mk17seoMYDVJYeTVd6ft3ftpLCCoC
 yxbBnm1NNBFSNEN33Oo0C4LcIgjnCmNxa5o9MM1VHV5x4+LrZRrZGmG+teCgTHY4yBBY
 DhhVJDyID90P0MQMsVtcydlRo0sgwxHt6Y45GHSRYpZU7FrfaatpcXiKgefmWnW2Ks6o
 1tnm0U32J3cfRdkdLZYE1VvFKbP2dKmNCVRsTYu8Jfa90A4zlJNPw+fUrUiDUKF/KGVw
 aJcg==
X-Gm-Message-State: AOAM5323PhmjfRDlmUn8rc6z1iwyy4ZDoK2EXhPEPBzLemNBg123xKfV
 htP5Ly+nHc0/+Yq1Rk1rJxUEFA==
X-Google-Smtp-Source: ABdhPJxDLcvlzd9XfyituJ0FHQibKJpPthdqryNaGFsrkmN9pI2/+OCMphq2zYUscS53yiYJXAnmcA==
X-Received: by 2002:a05:6000:c2:: with SMTP id
 q2mr23575392wrx.288.1621874868769; 
 Mon, 24 May 2021 09:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 b10sm15226358wrr.27.2021.05.24.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:47:48 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] GPD Win Max display fixes
Date: Mon, 24 May 2021 18:47:16 +0200
Message-Id: <20210524164719.6588-1-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 May 2021 07:09:22 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Anisse Astier <anisse@astier.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series is for making the GPD Win Max display usable with
Linux.

The GPD Win Max is a small laptop, and its eDP panel does not send an
EDID over DPCD; the EDID is instead available in the intel opregion, in
mailbox #5 [1]

The first two patches are based on Jani's patch series [2] adding
support for the opregion, with minimal changes. I've change authorship
for the first, but we can revert it.

The third patch is just to fix the orientation of the panel. For some
reason it does not work at boot when an external display is plugged, but
I doubt this is specific to this hardware.


[1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
[2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051-1-jani.nikula@intel.com/

Anisse Astier (2):
  drm/i915/opregion: add support for mailbox #5 EDID
  drm: Add orientation quirk for GPD Win Max

Jani Nikula (1):
  drm/i915/dp: use opregion mailbox #5 EDID for eDP, if available

 .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
 drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
 4 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.31.1

