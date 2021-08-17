Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6593EF395
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 22:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04773897E9;
	Tue, 17 Aug 2021 20:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93892897E9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 20:43:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q6so19005811wrv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 13:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=suykTtn8L9b2vCrN/hQSQGbGRTW4fM25XHTOuiQ2dSM=;
 b=TUvThoXq0AY9rnYfWxlEzlHg4g3+HwhM6JvaSmgkIG/JGRsFx7Xk1RnMUSkmj4kfIw
 yaxiTlDrP9eElc58wh4Pwc02hFcMfh5BNZJbZ+pEMDOqeijPEcIQ+b9U2rO2VJ/JyX0L
 0rgVluTPGXZUSsr+NWqEmgF0uxG744EVpcGZ30+H/o9NABHYnjvCF2/3dki7ZmqWX6nN
 69m0EEr3hCfI78eUzbieajumc94eudkMs28tz/+akf6A3NxBDIRr98/U4fw2f7sYcOIi
 HG1ZjNAjcqo+TyDCWYzbieclEuTF1pAk+YmcN6HR0z2HHHwGz+TCldp1HNokQ0b5wSOH
 GQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=suykTtn8L9b2vCrN/hQSQGbGRTW4fM25XHTOuiQ2dSM=;
 b=crMHQp/gtneMhVvNFxfOxEG3rXVmIzCsbH9Pz7JgyqoRqgruAhmOgLNDMV25zN9nWo
 yPUflHwINsKyUBF5tdCAxbfyA4RxIVFml388f1evek1KipBmAAGVZ0BQmc6GpWI9wF3V
 +Bgk6+tcTqwmWBHBIkRJfvI3nBxsuKWANAXo7LwQAcqvYGkzZ5pKevMnH8D3RNUAPHDk
 nD2DqVtOHNdirJcqR4Ju9G2BlDyNiBf/ZCPrp7jWsroerv07jgW6hPDdi7NTTis7TcN/
 RtMy4QSqugDGTJOBwjEbnSvSNUQJrHK7cTAuFbgW4toeTjC1LfggNrWa+TMG7wobJYPs
 i5bA==
X-Gm-Message-State: AOAM5308dnqQ/kQyQjY89G8sLjz6oSvSd1n/fswVaq0eEDHaPTyldruz
 ZqFUaLJcqudZiqFaEMUFcjC3og==
X-Google-Smtp-Source: ABdhPJw3FhV5TBRJx1W3VTN9iKNWemS1DBfaiSU+Cm+VIxF3fsEs9hZhSvs7PnDhyiEAmfUd+TcrRQ==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr6247314wrq.377.1629233016107; 
 Tue, 17 Aug 2021 13:43:36 -0700 (PDT)
Received: from gpdmax.. ([2a0d:e487:15f:f479:6202:d4f7:9ddb:b07c])
 by smtp.gmail.com with ESMTPSA id e10sm3540332wrt.82.2021.08.17.13.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:43:35 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>,
 Anisse Astier <anisse@astier.eu>
Subject: [PATCH v3 0/2] GPD Win Max display fixes
Date: Tue, 17 Aug 2021 22:43:27 +0200
Message-Id: <20210817204329.5457-1-anisse@astier.eu>
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

The first patch is based on Jani's patch series [2] adding support for
the opregion, with changes. I've changed authorship, but I'd be glad to
revert it

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

[1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
[2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051-1-jani.nikula@intel.com/
[3]: https://patchwork.kernel.org/project/intel-gfx/patch/20210531204642.4907-2-anisse@astier.eu/


Anisse Astier (2):
  drm/i915/opregion: add support for mailbox #5 EDID
  drm: Add orientation quirk for GPD Win Max

 .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
 drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
 4 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.31.1

