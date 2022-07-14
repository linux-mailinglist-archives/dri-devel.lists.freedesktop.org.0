Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BFB5743EA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 06:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6446A1BA7;
	Thu, 14 Jul 2022 04:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3D2A1BA6;
 Thu, 14 Jul 2022 04:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657774021; x=1689310021;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=tQabWDHm5mUWj7HdtljK3PgAxXDNA1HKUQKgEYI3PlE=;
 b=FaWN+UQ03ucoGDoiT+oVhoET4W/oSnwPf/A1jm8clayTg+1ChA0C4q6P
 s7+xch6tq8KbDWYM8928nnnIxB1E0qcy0nhoBnCbyf+H2l7ZCczmzCjMr
 Y1qOMx3DcCbCve8ZnNOOhEWX3RoDm0MtLjBVG505jIQLwYSm1XLuNRYZZ
 jVQb799AS+b/15VAu6Eu25MGeROC8Qg4PxmLvtPWyeaTi4fEiFwxQ32xf
 GNtOUeZaFIdOrT3yA+sVUcFc7vvWP4+xNTfYbMw+jYFujwb72uB98+eiX
 eKJY282xbiEm5FWgwvS8I2eGx9T5sDnh/o2caRmVhlKItZ5yAO4pJ5SIA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="371726106"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
 d="asc'?scan'208";a="371726106"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 21:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
 d="asc'?scan'208";a="599992536"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2022 21:46:57 -0700
Date: Thu, 14 Jul 2022 12:23:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 07/39] drm/i915: gvt: fix kernel-doc trivial warnings
Message-ID: <20220714042326.GY1089@zhen-hp.sh.intel.com>
References: <cover.1657699522.git.mchehab@kernel.org>
 <375c0c0ca2ef414f25e14f274457f77373a9268d.1657699522.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="CCAbHT5wTCfICpGW"
Content-Disposition: inline
In-Reply-To: <375c0c0ca2ef414f25e14f274457f77373a9268d.1657699522.git.mchehab@kernel.org>
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
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--CCAbHT5wTCfICpGW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.13 09:11:55 +0100, Mauro Carvalho Chehab wrote:
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
>=20
> To avoid mailbombing on a large number of people, only mailing lists were=
 C/C on the cover.
> See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git=
=2Emchehab@kernel.org/
>=20
>  drivers/gpu/drm/i915/gvt/cfg_space.c  | 2 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.h     | 2 +-
>  drivers/gpu/drm/i915/gvt/page_track.c | 2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c       | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/=
gvt/cfg_space.c
> index dad3a6054335..a0fc6d356588 100644
> --- a/drivers/gpu/drm/i915/gvt/cfg_space.c
> +++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
> @@ -243,7 +243,7 @@ static void emulate_pci_bar_write(struct intel_vgpu *=
vgpu, unsigned int offset,
>  }
> =20
>  /**
> - * intel_vgpu_emulate_cfg_read - emulate vGPU configuration space write
> + * intel_vgpu_emulate_cfg_write - emulate vGPU configuration space write
>   * @vgpu: target vgpu
>   * @offset: offset
>   * @p_data: write data ptr
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt=
/dmabuf.h
> index 5f8f03fb1d1b..3dcdb6570eda 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.h
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.h
> @@ -48,7 +48,7 @@ struct intel_vgpu_fb_info {
>  	struct intel_vgpu_dmabuf_obj *obj;
>  };
> =20
> -/**
> +/*
>   * struct intel_vgpu_dmabuf_obj- Intel vGPU device buffer object
>   */
>  struct intel_vgpu_dmabuf_obj {
> diff --git a/drivers/gpu/drm/i915/gvt/page_track.c b/drivers/gpu/drm/i915=
/gvt/page_track.c
> index 3375b51c75f1..df34e73cba41 100644
> --- a/drivers/gpu/drm/i915/gvt/page_track.c
> +++ b/drivers/gpu/drm/i915/gvt/page_track.c
> @@ -120,7 +120,7 @@ int intel_vgpu_enable_page_track(struct intel_vgpu *v=
gpu, unsigned long gfn)
>  }
> =20
>  /**
> - * intel_vgpu_enable_page_track - cancel write-protection on guest page
> + * intel_vgpu_disable_page_track - cancel write-protection on guest page
>   * @vgpu: a vGPU
>   * @gfn: the gfn of guest page
>   *
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index 46da19b3225d..8e71cda19995 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -205,7 +205,7 @@ static void intel_gvt_update_vgpu_types(struct intel_=
gvt *gvt)
>  }
> =20
>  /**
> - * intel_gvt_active_vgpu - activate a virtual GPU
> + * intel_gvt_activate_vgpu - activate a virtual GPU
>   * @vgpu: virtual GPU
>   *
>   * This function is called when user wants to activate a virtual GPU.
> @@ -219,7 +219,7 @@ void intel_gvt_activate_vgpu(struct intel_vgpu *vgpu)
>  }
> =20
>  /**
> - * intel_gvt_deactive_vgpu - deactivate a virtual GPU
> + * intel_gvt_deactivate_vgpu - deactivate a virtual GPU
>   * @vgpu: virtual GPU
>   *
>   * This function is called when user wants to deactivate a virtual GPU.
> @@ -348,7 +348,7 @@ struct intel_vgpu *intel_gvt_create_idle_vgpu(struct =
intel_gvt *gvt)
>  }
> =20
>  /**
> - * intel_gvt_destroy_vgpu - destroy an idle virtual GPU
> + * intel_gvt_destroy_idle_vgpu - destroy an idle virtual GPU
>   * @vgpu: virtual GPU
>   *
>   * This function is called when user wants to destroy an idle virtual GP=
U.
> --=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks! I'll put in queue with other gvt fixes.

--CCAbHT5wTCfICpGW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYs+aNAAKCRCxBBozTXgY
J9jlAJ0SBHiGlVnl69HpQC7DoBtaBEcTKwCaA5E4YFCilATJ34RgabNyuY5uV0U=
=ZLap
-----END PGP SIGNATURE-----

--CCAbHT5wTCfICpGW--
