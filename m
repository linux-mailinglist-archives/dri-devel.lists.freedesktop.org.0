Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8315672E76
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D85E10E886;
	Thu, 19 Jan 2023 01:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57C610E226;
 Thu, 19 Jan 2023 01:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674092993; x=1705628993;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=z+r26atOHYpjx3EjwFle3hiTih2WoOd+oZxdqvV1Bc8=;
 b=SkUQP+5q68RIKK2kUZZuiIO8J5VcicyVw5kbbj2lLam7pFo7Ujniu9lF
 pvkKxpZgcWHhFXeF1Xo8CGSdHm9/iidQN5qeN3yQ1mHR+BlEInPEDYwEa
 mZZ05c7bTvBaalrXvy2wXygljo6OlWj8i3sMom9+TI1iA2x+ERlzb3hOK
 eqCb0kZWtdTwlq4alP75WhHWiXp4ot6Wu+FOhHVJBEy0xnmgKBlNDQsdJ
 ytG5cXTRFWacCPzbAa2N1hhsl/+QMpgqiTVdH3o1lTovFA+DE+XP2CiHs
 KRrgG/iZwu2BbaiNRUqWRAYKeSBgOspuoVWcD4kZFMCLCBZ0mnM5T7WLW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="313039114"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
 d="asc'?scan'208";a="313039114"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 17:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661957728"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
 d="asc'?scan'208";a="661957728"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 17:49:49 -0800
Date: Thu, 19 Jan 2023 09:28:52 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] drm/i915/gvt: Remove extra semicolon
Message-ID: <Y8ic1B4erlEuWk9V@zhen-hp.sh.intel.com>
References: <Y8LNbzgTf/1kYJX/@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="rBD0G7EoTHOadgGA"
Content-Disposition: inline
In-Reply-To: <Y8LNbzgTf/1kYJX/@ubun2204.myguest.virtualbox.org>
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
 Saurabh Singh Sengar <ssengar@microsoft.com>, dri-devel@lists.freedesktop.org,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rBD0G7EoTHOadgGA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.01.14 21:12:39 +0530, Deepak R Varma wrote:
> Remove the extra semicolon at end. Issue identified using
> semicolon.cocci Coccinelle semantic patch.
>=20
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index a5497440484f..08ad1bd651f1 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -323,7 +323,7 @@ int intel_gvt_create_vgpu(struct intel_vgpu *vgpu,
>  	ret =3D idr_alloc(&gvt->vgpu_idr, vgpu, IDLE_VGPU_IDR + 1, GVT_MAX_VGPU,
>  		GFP_KERNEL);
>  	if (ret < 0)
> -		goto out_unlock;;
> +		goto out_unlock;
> =20
>  	vgpu->id =3D ret;
>  	vgpu->sched_ctl.weight =3D conf->weight;
> --=20

Thanks for catching that!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--rBD0G7EoTHOadgGA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY8ic1AAKCRCxBBozTXgY
J4oSAJ0b42wwImxB+8ewhGLo62rlJ/h5RQCfdBJOl5fRSYVgpckeJlWrImX8bCQ=
=c61Z
-----END PGP SIGNATURE-----

--rBD0G7EoTHOadgGA--
