Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647D3976229
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D231710EAE6;
	Thu, 12 Sep 2024 07:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TcoYqAU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCEA10EAE6;
 Thu, 12 Sep 2024 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jx6wDvfMG3iQc+w1AZtlLnQGbKBuv0KI/qwAv/lAxFs=; b=TcoYqAU07GrGlp4UkPxulb5x3C
 PIMzPkykEukFTNNV/e0YyPHcK0rDcC2BPJb5JhzUiC+QqfjQzzXUhHDUOnxLVx3ss7KGVpIeL89OW
 qpbxjfqH/rH+I6UI9mU1aG5vGrWKHtfRRzpWLlMhcQ98n308T6gWxz6qVegz8GxCn0mK472Mx5w3D
 Eb02Pfyk0X5ApXN9T27AHtUUCtdF6Y0YHrSKeAZFfWuKXq0zWxRIoVfZvg/lS85h7CTdIflbcq8nt
 H01Hhf82NLsy+ydC/3P9FGXpFHrs2WnMxHrC50sOIK9Q821rbeHzRBZJ8LBwPAXPvpA/9FpdUvSPt
 i6mjEK1w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sodvo-00ClMi-Kk; Thu, 12 Sep 2024 09:07:56 +0200
Date: Thu, 12 Sep 2024 08:07:55 +0100
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
Message-ID: <ZuKTN2XngNhBB3z3@linux>
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

It is late in the cycle and luckily the fix in this weeks PR is just
something to satisfy static analyzers, nothing that can happen in reality,
so pulling it is even optional.

Regards,

Tvrtko

drm-intel-fixes-2024-09-12:
- Prevent a possible int overflow in wq offsets [guc] (Nikita Zhandarovich)
The following changes since commit da3ea35007d0af457a0afc87e84fddaebc4e0b63:

  Linux 6.11-rc7 (2024-09-08 14:50:28 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-09-12

for you to fetch changes up to d3d37f74683e2f16f2635ee265884f7ca69350ae:

  drm/i915/guc: prevent a possible int overflow in wq offsets (2024-09-10 08:13:51 +0100)

----------------------------------------------------------------
- Prevent a possible int overflow in wq offsets [guc] (Nikita Zhandarovich)

----------------------------------------------------------------
Nikita Zhandarovich (1):
      drm/i915/guc: prevent a possible int overflow in wq offsets

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
