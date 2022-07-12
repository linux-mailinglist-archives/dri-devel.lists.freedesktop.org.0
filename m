Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4B5711D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 07:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3095C112603;
	Tue, 12 Jul 2022 05:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A447B1125B0;
 Tue, 12 Jul 2022 05:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657603462; x=1689139462;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=IKMxtPSIRnCmNZR9bULecM4pIW9bVVxojRNmONEGgc4=;
 b=F8VfWKOtMNR5gcorcEVf5biWVdBB/j3v036sz+jq2JXxWT0kHbEQZaTt
 coxPQxfSDDoIhsoqPeuhaG6tXlWe1gUW+bnZB4RAJo3NubxEr8nTLezVD
 GKgphizLEB/TKVUrH5zyzVGK6ZVIPu26RN+tK6e3/eOExnE2jJMl6dyRw
 uk1YlzXeqgkx0xSHtTTTt1XKTcJvQ/OZBr26aSmVvteIucmScm+ph4pWL
 rqmF5x77iGM0h34kAAArxmrQtYVSL90pG69dXfEPOKb+llEmrtScYJ5Zf
 ZonCze/VH3iQ4NznflSPe/TdZKpCZmL2emjARtZHgq7a4+wIqubbNAOSe Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="264630752"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
 d="asc'?scan'208";a="264630752"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 22:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
 d="asc'?scan'208";a="599267727"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2022 22:24:18 -0700
Date: Tue, 12 Jul 2022 13:00:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 04/32] drm/i915: gvt: fix kernel-doc trivial warnings
Message-ID: <20220712050051.GW1089@zhen-hp.sh.intel.com>
References: <cover.1657565224.git.mchehab@kernel.org>
 <15fc6317ef5eb4ad7123d627c58c4aa04a4eae87.1657565224.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BYl/BInBdgsQr4gH"
Content-Disposition: inline
In-Reply-To: <15fc6317ef5eb4ad7123d627c58c4aa04a4eae87.1657565224.git.mchehab@kernel.org>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--BYl/BInBdgsQr4gH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.11 21:24:49 +0100, Mauro Carvalho Chehab wrote:
> Some functions seem to have been renamed without updating the kernel-doc
> markup causing warnings. Also, struct intel_vgpu_dmabuf_obj is not
> properly documented, but has a kerneld-doc markup.
>=20
> Fix those warnings:
> 	drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype=
 for inte_gvt_free_vgpu_resource(). Prototype was for intel_vgpu_free_resou=
rce() instead
> 	drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype=
 for intel_alloc_vgpu_resource(). Prototype was for intel_vgpu_alloc_resour=
ce() instead
> 	drivers/gpu/drm/i915/gvt/cfg_space.c:257: warning: expecting prototype f=
or intel_vgpu_emulate_cfg_read(). Prototype was for intel_vgpu_emulate_cfg_=
write() instead
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or mem=
ber 'vgpu' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or mem=
ber 'info' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or mem=
ber 'dmabuf_id' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or mem=
ber 'kref' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or mem=
ber 'initref' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/dmabuf.h:61: warning: Function parameter or mem=
ber 'list' not described in 'intel_vgpu_dmabuf_obj'
> 	drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype f=
or intel_t_default_mmio_write(). Prototype was for intel_vgpu_default_mmio_=
write() instead
> 	drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting prototyp=
e for intel_gvt_switch_render_mmio(). Prototype was for intel_gvt_switch_mm=
io() instead
> 	drivers/gpu/drm/i915/gvt/page_track.c:131: warning: expecting prototype =
for intel_vgpu_enable_page_track(). Prototype was for intel_vgpu_disable_pa=
ge_track() instead
> 	drivers/gpu/drm/i915/gvt/vgpu.c:215: warning: expecting prototype for in=
tel_gvt_active_vgpu(). Prototype was for intel_gvt_activate_vgpu() instead
> 	drivers/gpu/drm/i915/gvt/vgpu.c:230: warning: expecting prototype for in=
tel_gvt_deactive_vgpu(). Prototype was for intel_gvt_deactivate_vgpu() inst=
ead
> 	drivers/gpu/drm/i915/gvt/vgpu.c:358: warning: expecting prototype for in=
tel_gvt_destroy_vgpu(). Prototype was for intel_gvt_destroy_idle_vgpu() ins=
tead
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---

Hi, thanks for this, but there're already several fixes in queue right now,=
 e.g
https://patchwork.freedesktop.org/series/104302/ and
https://patchwork.freedesktop.org/series/104640/, but looks there're other =
uncaught issues.
I'd like to submit current in queue first, then maybe you could update for =
others?


--BYl/BInBdgsQr4gH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsz/+gAKCRCxBBozTXgY
J4vQAKCMH46gTKH1fklSj9leE4TwPisR4QCeO3K7++guiaV79LrJuEyXo9VDYGI=
=vaK2
-----END PGP SIGNATURE-----

--BYl/BInBdgsQr4gH--
