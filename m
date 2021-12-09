Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54C46F658
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EE710E384;
	Thu,  9 Dec 2021 22:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7DE10E384
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 22:00:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v11so12026221wrw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 14:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrAV5YvyAi4BWNSVBDlvp4X8duBIlEpTg5hQkVgtrrc=;
 b=UCofwBRk5kDal5GCbjX9iBjwOSnKnOEc9QpGoOmhStEzjkfbZGknqSBfGcpCThcfAi
 q8KoHwxGXURrKM2RPJDtesaCJlPyKZnPPD38b+8p8nFa+WcPQig47KDk4Gjit9lr14SH
 fkcsKgwKi/zaTrN3GJ8fsk6bMbK6o6fiyf02JzAH24ynhKKfrhYis3Bh2nzWi8lFdsLO
 uGr4zdqFrSQcyyUaf07ebqn5exZawrsm1LW13HgYpGOQYyEb8TjBVEQcmXbms5ZXg4bN
 ntL83SV+cuyC2TzV5IACPsrA05Jrl3SGl0nHhCauXNSAL4i4cL7pPmCruQt2g15u76Yr
 GYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nrAV5YvyAi4BWNSVBDlvp4X8duBIlEpTg5hQkVgtrrc=;
 b=TCEhFfmnt15EgTduT+kjnOSIr6YBGhsO3p0ybDS7tbpo77EMcBAX0EQJuJoVsqdDb6
 VGSapvpAIffZLFenoC+DLNHIy7gHDHKJDBtvGrSqIbcSrYbcYUG2w70si/HYI6XvdPmH
 G7aQ88Fi6BQwG1NgqgaVTHnkVXARWgXsWQkFpZraL8g1T11PsdPPs5viqFteIm8bVW+J
 33tyUozIh6fbOMCnttUXa1gYJZGkvYvCmCHBHo9Lle9nf4S/5aDySqpyPQNwGA9uKceJ
 9radIV8WojIq1MfAZ2TLPbeeKSaLMExlo18YrHg1WM2N2ZnJu0kFS6B3ayRJl7z/BY7I
 KCXg==
X-Gm-Message-State: AOAM533VPnBIj5rk16D/vf1W7t/orrAc5fl6WDLcdScEknpoZlIe5aFm
 EmLRE06PQIT8cbJ/mTfizU1RzA==
X-Google-Smtp-Source: ABdhPJw/aEOJ05rlG5s0JJm8C8w+saTm1HBwcZH5wZio4X++fjxL9LwiSpgAXhDM7AeH4XD95KZZ/w==
X-Received: by 2002:adf:ed52:: with SMTP id u18mr9305920wro.609.1639087256115; 
 Thu, 09 Dec 2021 14:00:56 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id f7sm1061524wri.74.2021.12.09.14.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:00:55 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 RESEND 0/2] GPD Win Max display fixes
Date: Thu,  9 Dec 2021 23:00:40 +0100
Message-Id: <20211209220042.310848-1-anisse@astier.eu>
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

