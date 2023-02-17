Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78E69A39E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 02:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3980810E0CE;
	Fri, 17 Feb 2023 01:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F0C10E0CE;
 Fri, 17 Feb 2023 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676598893; x=1708134893;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=KxsdkInmDbLs1ts10qe+vX5Ued6X/Q+YDmUjfhe22wM=;
 b=iSe3kfH76Alv5FwkPF7LDPSIfjiOVNQmvdSgoaZDpNLqg33+SGjD0vYT
 iwrE+pvZVZNwEhV1fEAMT3LAltWxWiigUV9ALZYx5GkzFCa1K5MtpZQmS
 K0RS1DS4ax2b/vo3zAFWl/xnXJhQtO0adEE1ebnv/NrUuJJka63cvrzkJ
 UxfP6pfZHuT0Ga7rPP6/pWd4gzRUSrUJreOskvzj/muLYGTSIMJ6hvPGN
 0xTzXcqAfmfaTTi+NKPojdg30Lm/DoT/ESHXsJzTfmGCBQbq/nRledq9O
 4tw08DeSIeFKHIkUuYltpX24YZGS9hKPcWM1VR22mp6XqzNF4BdRU2r8T Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="315600539"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
 d="asc'?scan'208";a="315600539"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 17:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="779620659"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
 d="asc'?scan'208";a="779620659"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.159.40])
 by fmsmga002.fm.intel.com with ESMTP; 16 Feb 2023 17:54:49 -0800
Date: Fri, 17 Feb 2023 09:52:47 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm/i915: move a Kconfig symbol to unbreak the menu
 presentation
Message-ID: <Y+7d7xKjjzRnV9eI@debian-scheme>
References: <20230215044533.4847-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="5hYsGdP+X0l/BA8e"
Content-Disposition: inline
In-Reply-To: <20230215044533.4847-1-rdunlap@infradead.org>
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5hYsGdP+X0l/BA8e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.02.14 20:45:33 -0800, Randy Dunlap wrote:
> Inserting a Kconfig symbol that does not have a dependency (DRM_I915_GVT)
> into a list of other symbols that do have a dependency (on DRM_I915)
> breaks the driver menu presentation in 'make *config'.
>

I'm not sure what's the actual failure in presentation, I'm not quite famil=
iar
with Kconfig, could you help to elaborate?

thanks!

> Relocate the DRM_I915_GVT symbol so that it does not cause this
> problem.
>=20
> Fixes: 8b750bf74418 ("drm/i915/gvt: move the gvt code into kvmgt.ko")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/i915/Kconfig |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff -- a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -118,9 +118,6 @@ config DRM_I915_USERPTR
> =20
>  	  If in doubt, say "Y".
> =20
> -config DRM_I915_GVT
> -	bool
> -
>  config DRM_I915_GVT_KVMGT
>  	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
>  	depends on DRM_I915
> @@ -172,3 +169,6 @@ menu "drm/i915 Unstable Evolution"
>  	depends on DRM_I915
>  	source "drivers/gpu/drm/i915/Kconfig.unstable"
>  endmenu
> +
> +config DRM_I915_GVT
> +	bool

--5hYsGdP+X0l/BA8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY+7d6wAKCRCxBBozTXgY
J7p1AJ0dpqaZlCp0zdaSe3bAKO9rzkAeCACfV8FiMvxk2oTD7qWMr14oNevlGlA=
=2r4O
-----END PGP SIGNATURE-----

--5hYsGdP+X0l/BA8e--
