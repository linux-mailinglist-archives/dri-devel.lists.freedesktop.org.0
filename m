Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA8578D5C9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2FD10E519;
	Wed, 30 Aug 2023 12:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746B910E518;
 Wed, 30 Aug 2023 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397309; x=1724933309;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Pezkknh9eBZjrEqZqEb3ROA+yTH+rDTTY9132k2aaZ0=;
 b=VusV0g1ZQ8oIoZK68Mk6w9A9EyZlyhDxqI4fytQLg7XmsoW+Q8VfZ91A
 Jo/WgAzRgHR2ztc4vgax3kKjXqX21upL6fu8Dz+Bg2cHJG9WyRNWZxjAm
 XgN6brkMbjC7IxbLq+wyqYP0+LW/N8sQ14n6b6/NVAGN5sF8cKG4RXyf0
 OEV5+EQTP17AQH6ZMK0j9MY6F3QhvZycOhjQrGV147RLffOL/LsDjlclp
 069LX/6DMIjxnqYcRfiRqDrYcmDBD0U664urnn4LnqGCAh4OezN0lJPSQ
 ApldqQ9VgnhtIQJ2QjDTFKtDu5wKVHWkLutUoH60vfyCF/9A8ONVJewcS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406622523"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="406622523"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912765664"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="912765664"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:08:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 08/12] drm/i915/mst: Populate connector->ddc
In-Reply-To: <20230829113920.13713-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-9-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:08:10 +0300
Message-ID: <87edjkzqad.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Populate connector->ddc, and thus create the "ddc" symlink
> in sysfs for DP MST connectors.
>
> TODO: test that this actually works

:)

Seems legit,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3605
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 2d1c42a5e684..0bf02a29e371 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1104,8 +1104,10 @@ static struct drm_connector *intel_dp_add_mst_conn=
ector(struct drm_dp_mst_topolo
>  	drm_dp_mst_get_port_malloc(port);
>=20=20
>  	connector =3D &intel_connector->base;
> -	ret =3D drm_connector_init(dev, connector, &intel_dp_mst_connector_func=
s,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret =3D drm_connector_init_with_ddc(dev, connector,
> +					  &intel_dp_mst_connector_funcs,
> +					  DRM_MODE_CONNECTOR_DisplayPort,
> +					  &port->aux.ddc);
>  	if (ret) {
>  		drm_dp_mst_put_port_malloc(port);
>  		intel_connector_free(intel_connector);

--=20
Jani Nikula, Intel Open Source Graphics Center
