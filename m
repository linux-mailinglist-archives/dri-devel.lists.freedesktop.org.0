Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885EF3BF1CE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 00:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99A6E1CF;
	Wed,  7 Jul 2021 22:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481056E1CF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 22:02:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id p8so4826719wrr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQ2iwYVGgrNeQxxfjE2NWqtOvDVkonAchKxAlKxB3Js=;
 b=tJgNIX2P5N8aDggORhbtAgy5kES8sTjdnONvJCWC/eG0TlXPTFQvLDjxk+N8kYOMHh
 gqNabiL/ob18aKGONGN55lQa0vD+fv7vXUsZ2Oz5nEklYxzIERZdz6E6POm9YkTix5sw
 qhXDEAAcTE6lu83EmFkDTFgXQnjymVtzw9tlrQSdTwQBY0KtKIEttEKg8HhwuJFbgPez
 4LUxMdmv8dJ4kuAz58SuQdYP12nUWL4QtLBIT6l5InQdx5OZgKnNaXJSG1erHmtDQoij
 BYEsqI7snJy8euG/3Htpj8XT38ie/Koj9xqF2hD/gn7lkO8fg1sK4X1SA3xvGhG35djH
 e20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQ2iwYVGgrNeQxxfjE2NWqtOvDVkonAchKxAlKxB3Js=;
 b=YFss0s5g7enat+Qf4AqW3hKbmiZQhd3xooxOK5++EBMFwznohZJTWu5c2kGUzhs1Hx
 uNQhcq3kUEcq5xJkmL9n/PXiVkI4Vq94/bJdl0c2nIk5az8cN5mcmR5+TtoDf44Ngxy1
 JjhQ42qMXcqU2CvNvkW9kOkiGznyTadlgQIMavzDM6eBoqLCE0IhgN694urYEzL1xpks
 cKaUPTvcyDLMXnDJWGgu1qxy4HlQg//gEtYU+B1LLvssNW7Oeczhh+52TmuIyPo/0EXL
 BYeKaE9F9Cc/pMBFZQX2XHK+TY8uBp3uSRFKLqFZLN1jDRq8HRDOg0GFISOWwSD/ZqZw
 CZ+w==
X-Gm-Message-State: AOAM531y3S3E3av+fWhcQQ3wOmJmbQKVD5dvfHFSJgqZXLP67To77PJM
 zNWw5RYqiwhRaL+RVJHrS27BWQ==
X-Google-Smtp-Source: ABdhPJwWFu7Y5KVTvnnab+Gw6EB6F+xzj8ykrAckgOIK8Bl39tnykIFrNsIcF1AZedtWP8UWG5EQ7g==
X-Received: by 2002:adf:d1e7:: with SMTP id g7mr30575462wrd.142.1625695349964; 
 Wed, 07 Jul 2021 15:02:29 -0700 (PDT)
Received: from gpdmax.. ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id t6sm178370wru.75.2021.07.07.15.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 15:02:29 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND v2 0/2] GPD Win Max display fixes
Date: Thu,  8 Jul 2021 00:02:10 +0200
Message-Id: <20210707220212.4808-1-anisse@astier.eu>
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

The first patch is based on Jani's patch series [2] adding support for
the opregion, with changes. I've changed authorship, but I'd be glad to
revert it

The second patch is just to fix the orientation of the panel.


Changes since v1:
 - rebased on drm-tip
 - squashed patch 1 & 2
 - picked up Reviewed-by from Hans de Goede (thanks for the review)

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

