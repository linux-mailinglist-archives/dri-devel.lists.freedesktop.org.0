Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C134997E28
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 09:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F056810E87B;
	Thu, 10 Oct 2024 07:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WO3kbthG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3249510E2C2;
 Thu, 10 Oct 2024 07:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728543749; x=1760079749;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=dr0h6FzQjFzjUqCp0EFfweNOpBlRwgchgFaUs3yLRHM=;
 b=WO3kbthGYaphA53oCg4FS/CoNDb2Rp246ICaDcca+TskndW7BF4nynPV
 ha22wbQj0vwtgdaoz7Irau3AAauXrhhRGtLFSVfWpd1b4YkUfa+ciZVAz
 vDhyvfve98dpPn40moNXtliIJ56AxvKS9wLicucnVnBUSuDYvyubDfQbQ
 u1GTiXzpCh7MDUN8OES9xbU49a28OH1zP+40TXEwjwAGll8lCuiFmJvtQ
 uM9klUTY4RWwR2r5h/NAg1/lF9HXTYxHHV7L664+c0AFJpAgo664AbI6O
 /rDhhtWNmw4mpUq0baygs4nB3Y/4zW0QOnQbUFzIXB+XOOlFlhaJDw9CV w==;
X-CSE-ConnectionGUID: wtI0GP/FROSBEcDUQKU+jQ==
X-CSE-MsgGUID: HI7KKRF4R2q/Wr1RJUcTWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27327837"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27327837"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 00:02:17 -0700
X-CSE-ConnectionGUID: 9T9PnEPbSmOcDKu9eu1IAg==
X-CSE-MsgGUID: rj6Aos9TSmuYBd5mj+lP6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="81316813"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.168])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 00:02:13 -0700
Date: Thu, 10 Oct 2024 10:02:09 +0300
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
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
Message-ID: <Zwd78Tnw8t3w9F16@jlahtine-mobl.ger.corp.intel.com>
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

Hi Dave & Sima,

Here goes drm-intel-fixes PR towards v6.12-rc3.

Just one HDCP refcount fix.

Regards, Joonas

****

drm-intel-fixes-2024-10-10:

- HDCP refcount fix

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2024-10-10

for you to fetch changes up to 4cc2718f621a6a57a02581125bb6d914ce74d23b:

  drm/i915/hdcp: fix connector refcounting (2024-10-07 06:18:46 +0300)

----------------------------------------------------------------
- HDCP refcount fix

----------------------------------------------------------------
Jani Nikula (1):
      drm/i915/hdcp: fix connector refcounting

 drivers/gpu/drm/i915/display/intel_hdcp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
