Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E4874CAD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3EC11376B;
	Thu,  7 Mar 2024 10:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qr8J+ozK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC2F113768;
 Thu,  7 Mar 2024 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709808505; x=1741344505;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=I1OaocZO6q5qDlS1VvIDzGIoQDCebm0dvy3ty/aeExg=;
 b=Qr8J+ozKqT/l85BMajoYZcENwToer8R1wbpBub92WuRiXBu8hfhrIaRO
 mtUsIalu1I94s3n0gyLjg0f/5etKScyoj4ua4ArO0CTyQZzzv1gIkAEgk
 GxHOdHZP16foVNqpSubJWgM5cdbvGXHkB9oTuhcojniDErXHwtAiT9qyP
 GRvxvswtNUqAz9PFc4gXpWqJm+KoPedluP4nDlrS+GjUEawXM4VnAvcab
 9J7sGhrzNy5ZKqPGljcWZEQNdqa5mDyoIZnPabNnz7wmyi2W/irKgD19j
 jNsmd1iSEIbgg8Dv0ssgKrnihpzzEqlxw4txCdMlB9abn3oobz7Mg+YW1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21920195"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="21920195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:48:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="41047635"
Received: from nbint65x-mobl.gar.corp.intel.com (HELO fedora) ([10.249.254.43])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:48:20 -0800
Date: Thu, 7 Mar 2024 11:48:10 +0100
From: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-xe-fixes
Message-ID: <Zema9lLEdtMISljc@fedora>
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

Hi Dave, Sima

A single error path fix for 6.8 final (-rc8).

Thanks,
Thomas

drm-xe-fixes-2024-03-07:
Driver Changes:
- An error path fix.

The following changes since commit 90d35da658da8cff0d4ecbb5113f5fac9d00eb72:

  Linux 6.8-rc7 (2024-03-03 13:02:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-03-07

for you to fetch changes up to a4e7596e209783a7be2727d6b947cbd863c2bbcb:

  drm/xe: Return immediately on tile_init failure (2024-03-07 09:13:38 +0100)

----------------------------------------------------------------
Driver Changes:
- An error path fix.

----------------------------------------------------------------
Rodrigo Vivi (1):
      drm/xe: Return immediately on tile_init failure

 drivers/gpu/drm/xe/xe_tile.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
