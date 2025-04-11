Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC45A86478
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 19:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9605510EC5A;
	Fri, 11 Apr 2025 17:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XKRlE1WR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14F10EC41
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 17:18:05 +0000 (UTC)
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net
 [88.217.226.44]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 79C3B2FC0055;
 Fri, 11 Apr 2025 19:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1744391882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=NyVZJW2evaHgtQ9r9PhHJ1mjUqOm15rHIODTnDeP2QE=;
 b=XKRlE1WR+vCbKsn8N8zDxBRE4HN5QNfzn+h2KNJ5Kx8Awv8CfwOyKpntQDWX6du/OgyMkC
 f+K4GtzemR9ou4IgsA8StiloOH+Cr5cuqRi4G3DWHlnUbHZV7F2XGpYbDqbgdRikJuAysI
 hU7GBikI5DPKcfDeN+bo86bj6MGGHjE=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 0/1] drm/i915/display: Add quirk to force backlight type on
 some TUXEDO devices
Date: Fri, 11 Apr 2025 17:55:07 +0200
Message-ID: <20250411171756.142777-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

This is a quirk we currently manually apply via our installer via the boot
parameter, but we don't have this exact device + panel configuration in our
archive anymore so I could only test the qurik moking in other ids. This is
the same situation we have here:
https://lore.kernel.org/all/20250409163029.130651-1-wse@tuxedocomputers.com/

Werner Sembach (1):
  drm/i915/display: Add quirk to force backlight type on some TUXEDO
    devices

 .../drm/i915/display/intel_dp_aux_backlight.c | 14 ++++++-
 drivers/gpu/drm/i915/display/intel_quirks.c   | 42 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.43.0

