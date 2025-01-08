Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE6A06435
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F311C10EC5D;
	Wed,  8 Jan 2025 18:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H2l0rVTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AE610EC50;
 Wed,  8 Jan 2025 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7bPFexfyl2E9vg03GhDgGsD/6hKiZPvlak9kT5kHh9E=; b=H2l0rVTcYn3DGxzkdtyGTbm8iA
 g/NXAMcSF/165WL5g6GlpjMQByT3e50JlWYQsnhOz48x49xqDBYOnq6/ts0uff/69gVzU/pg+IxQI
 Yy5GP7JDKGuOxwjQOxyk4rpeUfX48g+0MQ5J4ChM9U/Nf8o1iPwZphjIcAr2+A5VLj6kZXOU6MVk1
 gA0UGNJBzOwF9QpAawQO4JDmLEuVujJnPK4S29qK+aiSAzWq/0T2OrBSXOC+EXuauydCrA9poZ4Pf
 JZFtT02FaVxu/0MfG+vQd5bl2Y57TbmfASJDb7MYNTki5BUTEhRmAXNHmdXpEOjgNhcQ3J7tkUNdG
 mm37QGtw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVacz-00DEud-56; Wed, 08 Jan 2025 19:18:01 +0100
Date: Wed, 8 Jan 2025 18:18:00 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <Z37BPchEzY0ovIqF@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hi Dave, Sima,

Just one fix this week - a revert to unbreak HDCP compliance.

Should be fine but with a disclaimer that no testing happened. It appears
CI is on fire due rc6 being severely broken somewhere in the vmstat code.
Which dumps a large warning on boot in the whole CI farm.

Tvrtko

drm-intel-fixes-2025-01-08:
- Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link" [hdcp] (Suraj Kandpal)
The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-01-08

for you to fetch changes up to 77bf21a03a2ad45cf66f73f13154b1669d9cf52a:

  Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link" (2025-01-08 08:53:35 +0000)

----------------------------------------------------------------
- Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link" [hdcp] (Suraj Kandpal)

----------------------------------------------------------------
Suraj Kandpal (1):
      Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"

 drivers/gpu/drm/i915/display/intel_hdcp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
