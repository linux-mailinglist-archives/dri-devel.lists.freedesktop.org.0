Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CC574ED7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A05F10E97B;
	Thu, 14 Jul 2022 13:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7568889C85;
 Thu, 14 Jul 2022 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657804763; x=1689340763;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDkvjpusDmWjSzoK4d3Uj6tqyKAdwDshhWJysv2kTB8=;
 b=BPzc92LSCdzSQ9AigiHI7EDpnfWnvHM98mt3pNBfPxZ0aY+cU01OxBVc
 0rbTOpid5eXGVGb/ZrOVxBCYU+yc0O9fVgVaxY5/z1Mltyfm/1vARGV8x
 iiRS+eI68MlNgTRCMcRYngziyjAfUUOOMC8XPdr2SXeuqOw0vlTQ9NoeI
 jF1si8jeEvmYPfHeZI6OsUtR92X2LyL+u4lck0KkUPi7hnWOLkfbcMOaQ
 9VG4BHeGg31O2qoLBXp/hSj4BSTXKT4dhU3QkYnsQRDBjD92ZYmZiMO6Z
 z+ItMEOO22ApQW31kS6z8eXky8FpWNapLn6gW0Q5ny21ijql7KL//wVrJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="311160534"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="311160534"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 06:19:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="653870183"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.37.128])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 06:19:21 -0700
Date: Thu, 14 Jul 2022 15:19:18 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Message-ID: <20220714151918.29c7a241@maurocar-mobl2>
In-Reply-To: <83d9f973-abdd-3d8b-5955-84cfc3f49eea@amd.com>
References: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
 <20220714145423.721e1c3b@maurocar-mobl2>
 <83d9f973-abdd-3d8b-5955-84cfc3f49eea@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jul 2022 15:08:48 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Hi Mauro,
>=20
> well the last time I checked drm-tip was clean.
>=20
> The revert is necessary because we had some problems with the commit=20
> which we couldn't fix in the 5.19 cycle.

I see. I don't have any issues with the patch itself, provided that drm-tip
build doesn't break ;-)

> I will double check drm-tip once more.

Did a new rebase on the top of:
	bc04f10d22f7 (drm-tip/drm-tip) drm-tip: 2022y-07m-14d-12h-41m-36s UTC inte=
gration manifest

And it is still broken on amdgpu_vram_mgr.c, but now with different issues:

drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function =E2=80=98amdgpu_v=
ram_mgr_new=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:13: error: =E2=80=98i=E2=
=80=99 undeclared (first use in this function)
  465 |         if (i =3D=3D 1)
      |             ^
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:465:13: note: each undeclared =
identifier is reported only once for each function it appears in
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:466:17: error: =E2=80=98node=
=E2=80=99 undeclared (first use in this function)
  466 |                 node->base.placement |=3D TTM_PL_FLAG_CONTIGUOUS;
      |                 ^~~~
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:365:33: error: unused variable=
 =E2=80=98block=E2=80=99 [-Werror=3Dunused-variable]
  365 |         struct drm_buddy_block *block;
      |                                 ^~~~~
cc1: all warnings being treated as errors

Regards,
Mauro
