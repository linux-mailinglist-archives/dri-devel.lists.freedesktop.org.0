Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69F9D48F3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B4810E410;
	Thu, 21 Nov 2024 08:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dBsgoE3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A939B10E410;
 Thu, 21 Nov 2024 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VtBi+f20ClxPstpY1s34ETTNl1yj/o2tuMHXizWHhj0=; b=dBsgoE3hqpU8Z/qnmEvukyl159
 Ox7tzTF4IPnVC+bfk+kVWAH7lHYsjyqYfVvLi4Q4uq1PDNqoiow/ty5ufiCB3VOOK/vRYhdBHuUC3
 UjJCRlmDf51FQDt1CkoUiK64YJIOlu2WLYmMyQ6L0+FKKxTdewxk5bna6DeprTOwEciQgxtcJh6aR
 QmSgxzzUNlJ+Yl6YpJwD79nrCQt4Xm9V/mXE4EWYGwRPUZo4ecBpxE7RUFLSD+MuN2ldJJGkBEMCY
 kQFvNZKhsbwTUPOu7VLAjR1I7Fud+9A3IJ4m/mEpAe/PcQ8ymEkRhysqjMGXS8m+8GiapYNwAdBTB
 zgZBVKMQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tE2h8-00AJd9-Cg; Thu, 21 Nov 2024 09:37:46 +0100
Date: Thu, 21 Nov 2024 08:37:45 +0000
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
Subject: [PULL] drm-intel-next-fixes
Message-ID: <Zz7xWbodMn9zZD_C@linux>
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

Just one fix for the merge window this week - fixing the HDCP flows on
HDMI connectors.

Regards,

Tvrtko

drm-intel-next-fixes-2024-11-21:
- Fix when the first read and write are retried [hdcp] (Suraj Kandpal)
The following changes since commit a163b895077861598be48c1cf7f4a88413c28b22:

  Merge tag 'drm-xe-next-fixes-2024-11-15' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-11-18 13:38:46 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2024-11-21

for you to fetch changes up to 376a33c4a0d8344bb575e1a6eeb748ee4d4675d3:

  drm/i915/hdcp: Fix when the first read and write are retried (2024-11-19 08:11:11 +0000)

----------------------------------------------------------------
- Fix when the first read and write are retried [hdcp] (Suraj Kandpal)

----------------------------------------------------------------
Suraj Kandpal (1):
      drm/i915/hdcp: Fix when the first read and write are retried

 drivers/gpu/drm/i915/display/intel_hdcp.c | 32 +++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)
