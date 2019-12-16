Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F1120159
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 10:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C1289AB6;
	Mon, 16 Dec 2019 09:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B06889A77;
 Mon, 16 Dec 2019 09:44:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 01:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
 d="asc'?scan'208";a="212170178"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga008.fm.intel.com with ESMTP; 16 Dec 2019 01:44:29 -0800
Date: Mon, 16 Dec 2019 17:42:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH] drm/i915: Remove unneeded semicolon
Message-ID: <20191216094243.GK21662@zhen-hp.sh.intel.com>
References: <1576467845-60920-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1576467845-60920-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0718139609=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0718139609==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZOudaV4lSIjFTlHv"
Content-Disposition: inline


--ZOudaV4lSIjFTlHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.16 11:44:05 +0800, zhengbin wrote:
> Fixes coccicheck warning:
>=20
> drivers/gpu/drm/i915/gem/i915_gem_region.c:88:2-3: Unneeded semicolon
> drivers/gpu/drm/i915/gvt/gtt.c:1285:2-3: Unneeded semicolon
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_region.c | 2 +-
>  drivers/gpu/drm/i915/gvt/gtt.c             | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm=
/i915/gem/i915_gem_region.c
> index 2f7bcfb..d50adac 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -85,7 +85,7 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_obj=
ect *obj)
>  		}
>=20
>  		prev_end =3D offset + block_size;
> -	};
> +	}
>=20
>  	sg_page_sizes |=3D sg->length;
>  	sg_mark_end(sg);
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 4b04af5..34cb404 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1282,7 +1282,7 @@ static int ppgtt_populate_shadow_entry(struct intel=
_vgpu *vgpu,
>  		return -EINVAL;
>  	default:
>  		GEM_BUG_ON(1);
> -	};
> +	}
>=20
>  	/* direct shadow */
>  	ret =3D intel_gvt_hypervisor_dma_map_guest_page(vgpu, gfn, page_size,
> --
> 2.7.4
>

Thanks for catching.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ZOudaV4lSIjFTlHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfdRkwAKCRCxBBozTXgY
J+sxAJ0X/KTLS6VxCBOiaGAUEzq9HGybrACgjbqshO13YwuRLTjRIWf9G+wiRe0=
=QA8j
-----END PGP SIGNATURE-----

--ZOudaV4lSIjFTlHv--

--===============0718139609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0718139609==--
