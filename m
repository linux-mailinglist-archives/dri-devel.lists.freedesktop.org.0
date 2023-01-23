Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B7677809
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2C910E210;
	Mon, 23 Jan 2023 09:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA65610E210;
 Mon, 23 Jan 2023 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674467987; x=1706003987;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ePDWwgcnlNm7XgLa0k+WDGWgsGFUAD6LL0d9v4m8XAE=;
 b=RGJ43OH7TsQLzHYTXy8y9sNhp/a2Dz8DDfQh2epjeUm4wqKA5OPYp1jB
 RtWxS9/6neCcG0Jxemx0USQ7yX4a1i7o5pRB4J4gKSx5Ynt+9KDsgimCS
 1+mnEr8J2nF0P4QfCJ2JKCd1odzk3FO7E5GgVl9vNBcrkW4eEShhHN0/m
 F5ErWQCbhsx0XiALQFsXEtYp4/TK3Wa+TVniZsX1AO894+iJdVNeIWBhG
 1Ty/IS6RW5lkRfsKEJth/iDti0w7tM3BFPoHAYAH8h39b0cUnmnnVClvD
 tvcKshdBdcsVNRCGkcA1qt0Dv6l1fW599Jdq/1YfCNTNsdVGpmWRM+3d2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="326040460"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="326040460"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 01:59:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="835412129"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="835412129"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 01:59:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 4/8] drm/edid: remove redundant
 _drm_connector_update_edid_property()
In-Reply-To: <712cc299afe33d8f6279a15d5b0117aeeab88bb4.1674144945.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1674144945.git.jani.nikula@intel.com>
 <712cc299afe33d8f6279a15d5b0117aeeab88bb4.1674144945.git.jani.nikula@intel.com>
Date: Mon, 23 Jan 2023 11:59:43 +0200
Message-ID: <87r0vl8tbk.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Realize that drm_edid_connector_update() and
> _drm_connector_update_edid_property() are now the same thing. Drop the
> latter.
>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the reviews, pushed 1-4 to drm-misc-next.

BR,
Jani.


> ---
>  drivers/gpu/drm/drm_edid.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d0c21d27b978..3d0a4da661bc 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6784,24 +6784,6 @@ int drm_edid_connector_add_modes(struct drm_connec=
tor *connector)
>  }
>  EXPORT_SYMBOL(drm_edid_connector_add_modes);
>=20=20
> -static int _drm_connector_update_edid_property(struct drm_connector *con=
nector,
> -					       const struct drm_edid *drm_edid)
> -{
> -	/*
> -	 * Set the display info, using edid if available, otherwise resetting
> -	 * the values to defaults. This duplicates the work done in
> -	 * drm_add_edid_modes, but that function is not consistently called
> -	 * before this one in all drivers and the computation is cheap enough
> -	 * that it seems better to duplicate it rather than attempt to ensure
> -	 * some arbitrary ordering of calls.
> -	 */
> -	update_display_info(connector, drm_edid);
> -
> -	_drm_update_tile_info(connector, drm_edid);
> -
> -	return _drm_edid_connector_property_update(connector, drm_edid);
> -}
> -
>  /**
>   * drm_connector_update_edid_property - update the edid property of a co=
nnector
>   * @connector: drm connector
> @@ -6823,8 +6805,7 @@ int drm_connector_update_edid_property(struct drm_c=
onnector *connector,
>  {
>  	struct drm_edid drm_edid;
>=20=20
> -	return _drm_connector_update_edid_property(connector,
> -						   drm_edid_legacy_init(&drm_edid, edid));
> +	return drm_edid_connector_update(connector, drm_edid_legacy_init(&drm_e=
did, edid));
>  }
>  EXPORT_SYMBOL(drm_connector_update_edid_property);

--=20
Jani Nikula, Intel Open Source Graphics Center
