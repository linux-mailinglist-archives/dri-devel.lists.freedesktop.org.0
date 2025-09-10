Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB5B51421
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F6E10E8C9;
	Wed, 10 Sep 2025 10:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SQPKF5k1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F410E8C4;
 Wed, 10 Sep 2025 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jftWcmtuDH54JdrPOJMYghiwn9/+zNCn9jAjHMJV4v0=; b=SQPKF5k1kLh/LqN4uCoJ64TQFi
 Ryr2KZGIDHBXMUUutezYQrqIEP7DuZeNjRbwbv+v6uHpkbXd0JlXk/mR5hTbhVyyyWjAmB2CkZhie
 uobWIsbvfOWN9JSSQ+WAJQUtKFh5wyqCBeY/Gr+1sv5dKglLrkUYO/9YmQNC9ARSVAtGHDCVNJLrF
 odFgPerDTNbyOpahSObmTl2rgqKZl0U8aDp6B34RCyTa/gx+l5U9ZViESdP8Ux1sQMf9oh2cLsDeW
 oR/6DD0sYLZvn0oyxk0No2bXh0TLaP8Pz9dLJggeQznlyJTRlzXTBL2gat58G/phtj9O2LocC9PGx
 bPJogFig==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uwIBq-009LXS-Jb; Wed, 10 Sep 2025 12:36:38 +0200
Date: Wed, 10 Sep 2025 11:36:37 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <aMFUtRdJ46qK-EXl@linux>
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

Just one fix this week addressing a a theoretical problem in the display
power handling code.

Regards,

Tvrtko

drm-intel-fixes-2025-09-10:
- Fix size for for_each_set_bit() in abox iteration [display] (Jani Nikula)
The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2025-09-10

for you to fetch changes up to cfa7b7659757f8d0fc4914429efa90d0d2577dd7:

  drm/i915/power: fix size for for_each_set_bit() in abox iteration (2025-09-09 09:08:37 +0100)

----------------------------------------------------------------
- Fix size for for_each_set_bit() in abox iteration [display] (Jani Nikula)

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/power: fix size for for_each_set_bit() in abox iteration

 drivers/gpu/drm/i915/display/intel_display_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
