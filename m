Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171956D41E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 06:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638C8113371;
	Mon, 11 Jul 2022 04:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91582112D14;
 Mon, 11 Jul 2022 04:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657515125; x=1689051125;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=DrEr0YY0JHDS3YJofqeW5jphPqHQVzUUumdDoE67utM=;
 b=am7f/my+gTejag5qnw2Lm0GFZ0TlwUGTeS56Grfz48puGVq/3mh4i5Di
 ysU96DBd6GJLiEqfZyfDlb6hNqPhmXUMrJcC29joFp1NJqrBYT0tFADUc
 wIWyq3AyhVW5XrjVq7EuqC8HE6lqj0ZHSg9Vt5Fxm2j8X+hqAFnr0egUf
 BThVc/aJItpeeddvT0COsGBARlizDHIja2mZB5YBcDh/bsoaSUY3lsIbV
 a6eztoFpu9ZHgBrFZrOrK36hW2iUxvun1DXQXTtcAtMR55rXKYGPZ8tK9
 CHmUv/OghqzzNLpGusOi6a3SBPO9E96wy+8SGas7+r88SagIvCEcyYCzI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="370884759"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="370884759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2022 21:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="621924301"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga008.jf.intel.com with ESMTP; 10 Jul 2022 21:52:01 -0700
Date: Mon, 11 Jul 2022 12:28:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Fix kernel-doc
Message-ID: <20220711042836.GT1089@zhen-hp.sh.intel.com>
References: <20220524083733.67148-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="s8ux8MQukyWAm3r7"
Content-Disposition: inline
In-Reply-To: <20220524083733.67148-1-jiapeng.chong@linux.alibaba.com>
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


--s8ux8MQukyWAm3r7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.05.24 16:37:32 +0800, Jiapeng Chong wrote:
> Fix the following W=3D1 kernel warnings:
>=20
> drivers/gpu/drm/i915/gvt/mmio_context.c:560: warning: expecting
> prototype for intel_gvt_switch_render_mmio(). Prototype was for
> intel_gvt_switch_mmio() instead.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index c85bafe7539e..1c6e941c9666 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -546,7 +546,7 @@ static void switch_mmio(struct intel_vgpu *pre,
>  }
> =20
>  /**
> - * intel_gvt_switch_render_mmio - switch mmio context of specific engine
> + * intel_gvt_switch_mmio - switch mmio context of specific engine
>   * @pre: the last vGPU that own the engine
>   * @next: the vGPU to switch to
>   * @engine: the engine
> --=20
> 2.20.1.7.g153144c
>=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--s8ux8MQukyWAm3r7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsum9AAKCRCxBBozTXgY
JxqgAJwIrYJXfBQ0XTDldIopiPc0bE4vzACfSD3CAS0q31WF8Kwf4MSEmTIf/Ao=
=BhqC
-----END PGP SIGNATURE-----

--s8ux8MQukyWAm3r7--
