Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44A49FFFBA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0310E7B2;
	Thu,  2 Jan 2025 19:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReoKutI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228AE10E7AA;
 Thu,  2 Jan 2025 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735847760; x=1767383760;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mS/FRJ/OgR+ejm1EJ/sWap11rFOmm+rRUVvCq3AVQrc=;
 b=ReoKutI4yvKGolwHsDqgXqgoplcDfHh/usy52Z9xh4VSOjJQi7f6j6I4
 rbGLLGaeI86M2yzh+nTiDhevnUDh9R3f/oWB7dCpdxb/ktonDGe5oCzxZ
 bG0mNfS5FPCFiTNTmhsdTJvr5WHS60DTwgqdr/Z2HDbOXmjFDo2j9JRWO
 iIgR31+cxyMOhxxtpImsUDGeNZsmGdkYuw9eLuRMq7EXF+vwWoWMBoKc2
 Yx8nyo5JNRmvWFRgQaSjt8JhLNgEu5s7TmjZetht6GmnqnuWBNnwWfu2f
 JspXfIj1e4t9WIyy2VrswNcKjYayRgJLzoc71ry/E1UbSq/DdP4d63KZc A==;
X-CSE-ConnectionGUID: qkSsuEEBRoG6x3axG+EdUw==
X-CSE-MsgGUID: 7PMv4gCpSa6tI3D6Bfqt7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36116400"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36116400"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 11:55:59 -0800
X-CSE-ConnectionGUID: Do2v3JIkTtOouKyGHdBfFg==
X-CSE-MsgGUID: lvQ3TCfiT1yeSNlYEyWIhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101448689"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.226])
 ([10.245.246.226])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 11:55:54 -0800
Message-ID: <37009b5cea1e54ad9d6b129bf5d7f600dbc437c9.camel@linux.intel.com>
Subject: Re: [PULL] drm-xe-fixes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Date: Thu, 02 Jan 2025 20:55:52 +0100
In-Reply-To: <Z2mjt7OTfH76cgua@fedora>
References: <Z2mjt7OTfH76cgua@fedora>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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

On Mon, 2024-12-23 at 18:53 +0100, Thomas Hellstrom wrote:
> Hi Dave, Simona
>=20
> The Xe fixes for -rc5.

This PR just got superseded by a new one (drm-xe-fixes-2025-01-02),
that includes also the commits mentioned here.

Thanks,
Thomas




>=20
> Thanks,
> Thomas
>=20
> drm-xe-fixes-2024-12-23:
> UAPI Changes:
> - Revert some devcoredump file format changes
> =C2=A0 breaking a mesa debug tool (John)
>=20
> Driver Changes:
> - Fixes around waits when moving to system (Nirmoy)
> - Fix a typo when checking for LMEM provisioning (Michal)
> - Fix a fault on fd close after unbind (Lucas)
> The following changes since commit
> 4bbf9020becbfd8fc2c3da790855b7042fad455b:
>=20
> =C2=A0 Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://gitlab.freedesktop.org/drm/xe/kernel.git=C2=A0tags/drm-xe-=
fixes-
> 2024-12-23
>=20
> for you to fetch changes up to
> fe39b222a4139354d32ff9d46b88757f63f71d63:
>=20
> =C2=A0 drm/xe: Fix fault on fd close after unbind (2024-12-23 16:19:52
> +0100)
>=20
> ----------------------------------------------------------------
> UAPI Changes:
> - Revert some devcoredump file format changes
> =C2=A0 breaking a mesa debug tool (John)
>=20
> Driver Changes:
> - Fixes around waits when moving to system (Nirmoy)
> - Fix a typo when checking for LMEM provisioning (Michal)
> - Fix a fault on fd close after unbind (Lucas)
>=20
> ----------------------------------------------------------------
> John Harrison (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Revert some changes that break a m=
esa debug tool
>=20
> Lucas De Marchi (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Fix fault on fd close after unbind
>=20
> Michal Wajdeczko (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe/pf: Use correct function to check L=
MEM provisioning
>=20
> Nirmoy Das (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Use non-interruptible wait when mo=
ving BO to system
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/xe: Wait for migration job before unma=
pping pages
>=20
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_devcoredump.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 15 ++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++++
> =C2=A0drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |=C2=A0 2 +-
> =C2=A04 files changed, 34 insertions(+), 4 deletions(-)

