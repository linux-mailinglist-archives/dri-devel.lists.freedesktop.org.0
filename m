Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8556D422
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 06:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B8510F2D5;
	Mon, 11 Jul 2022 04:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAEA10E534;
 Mon, 11 Jul 2022 04:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657515200; x=1689051200;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=d6/ngeTVNk998Ig8RGaNDRrOoPTixlzEU/yTANqW8Fk=;
 b=QKRGT5NpMMN610l1tHDxmDPfIox5B/wQ2eS+zZNXI623cPcRr04YlGeW
 T9XFoDwdD90dyqJxiYlJCH+x6XSGxFdpr3AUUeE1TFaXjwi8ZsaZ8a8Zj
 W9sAZx7R5RBlJ37fzHZLf0AZTStOU9AxCs9sAuFHWXkuQicwgHjwQ4/Ag
 B4GW89UEib46HKSJCBnliVdYt5UWJBXuoTVyWMDbe9K6AVc8X+6xo49ue
 zsBg3JLDpwHiuOmmfpmybwQzDlE9BFg+h7A8+psSVmD0H2MpJ64RX73lH
 VxzmXm+AhV1mtF2ncf93/EIMemWUXgldqCOGhg68uOm9Tff7DZDvTlrrH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="348556369"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="348556369"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2022 21:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="598911385"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2022 21:53:16 -0700
Date: Mon, 11 Jul 2022 12:29:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix kernel-doc
Message-ID: <20220711042951.GU1089@zhen-hp.sh.intel.com>
References: <20220602073519.22363-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="NqXz6hVRMdSFrLFa"
Content-Disposition: inline
In-Reply-To: <20220602073519.22363-1-jiapeng.chong@linux.alibaba.com>
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--NqXz6hVRMdSFrLFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.06.02 15:35:19 +0800, Jiapeng Chong wrote:
> Fix the following W=3D1 kernel warnings:
>=20
> drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype
> for inte_gvt_free_vgpu_resource(). Prototype was for
> intel_vgpu_free_resource() instead.
>=20
> drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype
> for intel_alloc_vgpu_resource(). Prototype was for
> intel_vgpu_alloc_resource() instead.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/i915/gvt/aperture_gm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i91=
5/gvt/aperture_gm.c
> index 557f3314291a..3b81a6d35a7b 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -298,7 +298,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
>  }
> =20
>  /**
> - * inte_gvt_free_vgpu_resource - free HW resource owned by a vGPU
> + * intel_vgpu_free_resource() - free HW resource owned by a vGPU
>   * @vgpu: a vGPU
>   *
>   * This function is used to free the HW resource owned by a vGPU.
> @@ -328,7 +328,7 @@ void intel_vgpu_reset_resource(struct intel_vgpu *vgp=
u)
>  }
> =20
>  /**
> - * intel_alloc_vgpu_resource - allocate HW resource for a vGPU
> + * intel_vgpu_alloc_resource() - allocate HW resource for a vGPU
>   * @vgpu: vGPU
>   * @param: vGPU creation params
>   *
> --=20
> 2.20.1.7.g153144c
>=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--NqXz6hVRMdSFrLFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsunPwAKCRCxBBozTXgY
JxhDAJ4k/6vczxEcG5rUQ4LYbrk0JcAieQCbBmYAN+bZ+WtisN1xVouxnZnQ4RY=
=Fs2v
-----END PGP SIGNATURE-----

--NqXz6hVRMdSFrLFa--
