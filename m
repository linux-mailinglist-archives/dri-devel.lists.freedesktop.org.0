Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C548173E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 23:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFC889ACC;
	Wed, 29 Dec 2021 22:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E85789A1E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 22:22:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id s1so46908301wra.6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 14:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhj1S0J8wc1iLzfXDQwvDj0pr7d3d+5NBuTeqfwzTSU=;
 b=w9gSI6DsiWaQVsqXGfjZz84c7pe90bJUqxTtBLZApQ54Y7YkNjPm8bDmEgXdWCSe8h
 DUWCEi7z+ma2s+cj5jLQRz505CUafc9bFgbJa1HqOB9F9yiP5lCEf32VAf/PSjgCammY
 K0lllpJE8KY3+CxFT/JeBg+Qo4ILZaPsdCutTmn8Eq5aOIdwSLrR4yErXVvhANiUwMyM
 oVq45fG+e9/b5KLvPJtak/C1d9eKlx76jsDlu7J6nlW5Ld72LhXEfnhqQ7TXhzUGW2GB
 R/IqJ0FhSmn1kqNh5HaH+bMAuMmcj8v02uxs8XfDukV6oavgW2+EqfpwO4puzOtSbAgl
 s3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhj1S0J8wc1iLzfXDQwvDj0pr7d3d+5NBuTeqfwzTSU=;
 b=vp8PmfrkM6WqUJmXKMkUFD/m8MQOUg1JHC6gNlHtJuBTvSfqPDOqQg11I3vgQ9MDRi
 +1N2WeUq4PZPNPHCiA9YPcubMme751RaHyc0aOj2W75K1og7Ijt3KUC54HS/V1aUciC4
 HhMqGDRyIvLazrIkLi7KL+suv82o2IEeGtNvrx+gOVUpbItboURaBhl/wFuV1NrJhR/X
 v6wMeWgQ+Sfl/B57aAfbM0IiE5zbjWpC104xXOx/O2ACEkOhIDdD12Dc+903t1M6bZXN
 2wpgbTL52hfJ4vdjfPmuJTjGQ/Dt1N3Ea1RzbzByA6m4T2qPzKMz/xY53xC2BCdvr6Ak
 pCKQ==
X-Gm-Message-State: AOAM531JPeZhEzNz07GgM872Zo2i1v1FWnMj0gOySQA9x7kIfA56mQRS
 yQz/I8r1cvAYGkuNgZWlFlTWKg==
X-Google-Smtp-Source: ABdhPJxIMBbqDSLz2qRS7eVIFr4qwgwXZu6QojykL8JwCMWTn/Mbv63s8pAlJwwtEQFmmdTzdELrVQ==
X-Received: by 2002:adf:c182:: with SMTP id x2mr22740853wre.646.1640816524927; 
 Wed, 29 Dec 2021 14:22:04 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id m5sm19700686wml.14.2021.12.29.14.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:22:04 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] GPD Win Max display fixes
Date: Wed, 29 Dec 2021 23:21:58 +0100
Message-Id: <20211229222200.53128-1-anisse@astier.eu>
X-Mailer: git-send-email 2.33.1
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
Cc: Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Anisse Astier <anisse@astier.eu>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>
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

Changes since v4:
 - checkpatch.pl fixes
 - rebased on drm-tip
 - Note: patch #1 is incomplete, still missing Jani's signed-off-by


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

