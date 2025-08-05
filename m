Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15312B1AFA5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871B010E608;
	Tue,  5 Aug 2025 07:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yu9hQ993";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2B10E604;
 Tue,  5 Aug 2025 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754380141; x=1785916141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QXtJMi3ZyVAJtV6tOmRIQ2v1AY1U7SrTuLVtFD9bNZA=;
 b=Yu9hQ993zVYlF8oiGscHktaN2+20fnWUcC9DTJED+w84VempEU1/qqJ0
 FtxkVlrV4mMDIuBchwMLFdevgw6YdkORTdpyTWXCZwfrcWjzZo3yWrCBh
 PD4jHkFXbqFqh7KxZr4pWk0qwxOq/TRXB7J+I+StqSZnfWcMXvJU+lVFV
 M3a9b7MVSv09a7aAwmjw4a0A8W44AUWcdI2bl179VqVIhd0jFo/2DcZYN
 MC+RSSK4+phc/EJaFtmFAbzCzKhzqI2HfR5ZawGLa2GsH4PdiwSknpLTS
 LiojbuDvGWl2zLeX7/qHS+ta/Iw1P14dHLXOfcTnsMW3LpQd4c3DFF5Tx Q==;
X-CSE-ConnectionGUID: NU9xCr+MR82mU5W1l+dCEQ==
X-CSE-MsgGUID: eP84ziYsT2KubRRMMMQVOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="44254391"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="44254391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:48:59 -0700
X-CSE-ConnectionGUID: Vb6hoBIGQ5aC5WH+BN6OPQ==
X-CSE-MsgGUID: vn5dVw1sQtG063OG+cD5yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="169685727"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 00:48:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 05 Aug 2025 10:48:52 +0300
Message-ID: <e1147bede8f219682419d198022cfe8d9d4edc28@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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


Hi Dave & Sima -

Some fixes for the merge window.

drm-intel-next-fixes-2025-08-05:
drm/i915 fixes for v6.17-rc1:
- Fixes around DP LFPS (Low-Frequency Periodic Signaling)

BR,
Jani.

The following changes since commit ba0f4c4c0f9d0f90300578fc8d081f43be281a71:

  Merge tag 'nova-next-v6.17-2025-07-18' of https://gitlab.freedesktop.org/=
drm/nova into drm-next (2025-07-21 12:56:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fi=
xes-2025-08-05

for you to fetch changes up to 5a569ef4d4ab184a481dd8ecb58f464a89b44d2f:

  drm/i915/display: Set C10_VDR_CTRL_MSGBUS_ACCESS before phy reg read (202=
5-07-29 10:20:33 +0100)

----------------------------------------------------------------
drm/i915 fixes for v6.17-rc1:
- Fixes around DP LFPS (Low-Frequency Periodic Signaling)

----------------------------------------------------------------
Jouni H=C3=B6gander (4):
      drm/i915/display: Write PHY_CMN1_CONTROL only when using AUXLess ALPM
      drm/i915/display: Avoid unnecessarily calling intel_cx0_get_owned_lan=
e_mask
      drm/i915/display: Ensure phy is accessible on lfps configuration
      drm/i915/display: Set C10_VDR_CTRL_MSGBUS_ACCESS before phy reg read

 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

--=20
Jani Nikula, Intel
