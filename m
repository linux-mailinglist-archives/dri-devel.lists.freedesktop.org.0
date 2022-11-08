Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904276209F2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 08:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3165210E21E;
	Tue,  8 Nov 2022 07:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355AD10E20B;
 Tue,  8 Nov 2022 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667891838; x=1699427838;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6t23h1hLiPCwHNEIaCNYABDtZi21XuJ+LzVlZVwKpE0=;
 b=VOhmCZT+UMHzovh7KaZCK+7A2uplqx1z/07yALjnVhxS1glRe37F6hFc
 t38hKpmhDZngLFYLR1o5pY+wO4EGmHTE1R24meFbO4QnNWCT1nArdWvPO
 Vkto9DJQcJBiObSKtyhdpiRYyNfbnpnJ07E5ge8SvlnhT5/2u9s36bzCZ
 SpRE2u+exQ1D02ovIBaC6RfQ4KKXigYYN7dP3LaAVZuZxBtXSYm37z9mU
 +0bg7wdikFX0E1kd80HkvwDyYrFJreBFIqbylBW5IfniAl1RDJhvWta8y
 VxwgVyGw7kQxJR17Dr0lukrOvtsxh+x8axIG8v7OAr5fNh3e8SR2xufc2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308246849"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="308246849"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 23:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="667487694"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="667487694"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga008.jf.intel.com with ESMTP; 07 Nov 2022 23:17:14 -0800
Date: Tue, 8 Nov 2022 15:16:49 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: wangjianli <wangjianli@cdjrlc.com>
Subject: Re: [PATCH] drm/i915: fix repeated words in comments
Message-ID: <20221108071649.GL30028@zhen-hp.sh.intel.com>
References: <20221022061327.65275-1-wangjianli@cdjrlc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="FoLtEtfbNGMjfgrs"
Content-Disposition: inline
In-Reply-To: <20221022061327.65275-1-wangjianli@cdjrlc.com>
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
Cc: tvrtko.ursulin@linux.intel.com, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FoLtEtfbNGMjfgrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.10.22 14:13:27 +0800, wangjianli wrote:
> Delete the redundant word 'the'.
>=20
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index b4f69364f9a1..7b29ef36941a 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2785,7 +2785,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
>   * intel_gvt_clean_gtt - clean up mm components of a GVT device
>   * @gvt: GVT device
>   *
> - * This function is called at the driver unloading stage, to clean up the
> + * This function is called at the driver unloading stage, to clean up
>   * the mm components of a GVT device.
>   *
>   */
> --=20
> 2.36.1
>=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks

--FoLtEtfbNGMjfgrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2oCYQAKCRCxBBozTXgY
J03KAKCWc57J8MDsLqa6/e4MQM3RDcGPXACfaKzldTcojTbuW2sk813a+6qgXTE=
=48ZN
-----END PGP SIGNATURE-----

--FoLtEtfbNGMjfgrs--
