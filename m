Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC684011B3
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 23:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26789A1A;
	Sun,  5 Sep 2021 21:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE1489A0F
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 21:12:30 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3535352wms.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Sep 2021 14:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FF+skFtA1xrcG7OJvwrLeQElay/ih9xMB4sa/bVfEI4=;
 b=bxuLl/fNR/0RkDvy8EYAV3oyKeegmRQZqQ6Fsp8g7gQMSFy6l2adS0pE6Ud5gbEGv3
 nv7Pe/ZDRZglgBPR6NQvc9cGiSFUAiUehl5xmTnk57N549lSKohLgKFSJSklZ0epPdhi
 0+51KZF2JxhGyNKCEWoja9dxG/8QUCiQwzaLjvh0BkjiNpXwV1qO3/u9NEDIeBlISjsF
 0FG/miOSJ+sDOXFO7qEn/5/FBlExjvNCVWTbbJyxmM+evFjpzy9UVMFaM73RtDLp6arR
 ijrP+l39ntg5AXfb2g1RvXvZnP/O1fPoE8HZYe5fOuFN2sgJBcQ6abJRCX+YLJQvR2K5
 Fsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FF+skFtA1xrcG7OJvwrLeQElay/ih9xMB4sa/bVfEI4=;
 b=P+PK2X8iDv+Xk/CGCxJqC2H2UyDl7Wep8OS/gQF4xRpnyfD4AEsM4MEnMpQWxkFWDc
 1TtSaUO5oMiUY8CPqW9yfGjkoKaiz1rcxV050pnnrpL2vh0NuoebVKLJOhdihZ6MgtTA
 Cx3zDuLj1RyKyR4lNqNUipHjZDfJ/LfuGtPWEhTauJ5V6HKWsVpkKuY5MloeJfubId4T
 cfkoR/+dSbYG0bq/BgzlJxZQXDJV2RHG7+MEhF7v7lsmy0dGLYskAG+xzVMItvXsJ/0N
 yI0kaAgrIBMkRICL67shpf1RHQzkD3fG6Fp6Novn+Wo+yn0FGDLSq+iMJ+J89SvnIEBa
 9rgA==
X-Gm-Message-State: AOAM533x2WqQV9kNPWq54mrfCirZ88Fec3xtKz+9MYiSy1n6HtAqAEvt
 rf1wHME/8/TNoQH1Mt+Cj/ozIg==
X-Google-Smtp-Source: ABdhPJwWJREmar9Qcbvl51DiQtS7R1gked7NxtDYPVhaD+A0jbXqJcZqyh47RF71IMk9zBZADlVVfw==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr8381524wma.125.1630876349353; 
 Sun, 05 Sep 2021 14:12:29 -0700 (PDT)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:2488:d453:b017:99a])
 by smtp.gmail.com with ESMTPSA id m3sm7210512wrg.45.2021.09.05.14.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 14:12:28 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>,
 Anisse Astier <anisse@astier.eu>
Subject: [PATCH v4 0/2] GPD Win Max display fixes
Date: Sun,  5 Sep 2021 23:12:24 +0200
Message-Id: <20210905211226.3525-1-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This patch series is for making the GPD Win Max display usable with
Linux.

The GPD Win Max is a small laptop, and its eDP panel does not send an
EDID over DPCD; the EDID is instead available in the intel opregion, in
mailbox #5 [1]

The second patch is just to fix the orientation of the panel.

Changes since v1:
 - rebased on drm-tip
 - squashed patch 1 & 2
 - picked up Reviewed-by from Hans de Goede (thanks for the review)

Changes since v2:
 - rebased on drm-tip
 - updated commit message

When v2 was initially sent [3] Ville Syrjälä suggested that it might be
a good idea to use the ACPI _DDC method instead to get the EDID, to
cover a wider range of hardware. Unfortunately, it doesn't seem
available on GPD Win Max, so I think this work should be done
independently, and this patch series considered separately.

Change since v3:
 - edits following Jani's review:
    - The EDID from the opregion is now only used as a fallback: if we
      cannot get any edid from the edp connector, then we attempt to get
      it from the opregion. This works for the GPD Win Max.
    - all other remarks should have been taken into account
 - rebased on drm-tip
 - added Co-developed-by
 - reordered signed-off-by and reviewed-by in second patch (thanks
   Maarten!)

[1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
[2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051-1-jani.nikula@intel.com/
[3]: https://patchwork.kernel.org/project/intel-gfx/patch/20210531204642.4907-2-anisse@astier.eu/


Anisse Astier (2):
  drm/i915/opregion: add support for mailbox #5 EDID
  drm: Add orientation quirk for GPD Win Max

 .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  7 +++
 drivers/gpu/drm/i915/display/intel_opregion.c | 55 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h | 10 ++++
 4 files changed, 77 insertions(+), 1 deletion(-)

-- 
2.31.1

