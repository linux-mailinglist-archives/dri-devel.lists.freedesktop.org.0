Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57D78EA53
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797BF10E5F6;
	Thu, 31 Aug 2023 10:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F2710E5EE;
 Thu, 31 Aug 2023 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693478409; x=1725014409;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=akW0+IYPeUwBQwb+49Pe0GizH3HYu1yk9GedAaSTPE0=;
 b=MQ6ttdXenBmW48rBSrHFmL8AODnKpZRtyXsL8Wg+kY/ogFipGtZ38C+Q
 Wjjnz4V47Q0YK/IXVRp9QdsNiaMGDjqyKSHjW3CA9Sn2YzjNM3nP9eIZC
 RMZRTSrkJ2cDOavTgfSQCumg8KONim+EYficnjS+9HtjNmfyUXIrAZ+re
 tqevvwK+1fYFXHZHmSe3aHe20YcR78n3Eijvsh/sZXsrltzSJSCYBS0n3
 xsmfkvzN2DsinxOPj+8w8GGZ5mSB+nX8kH1B4OFQrYjz8Bu04Wt9x672i
 UvVv406cmrko1VmnoFnyS7Vox3+a5rFjwHnoxUcktVuMIiF7wTpMstcUK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="360888228"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="360888228"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804927745"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="804927745"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:40:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 11/12] drm/i915/hdmi: Remove old i2c symlink
In-Reply-To: <20230829113920.13713-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-12-ville.syrjala@linux.intel.com>
Date: Thu, 31 Aug 2023 13:40:02 +0300
Message-ID: <87h6ofjy0t.fsf@intel.com>
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
> Remove the i915 specific i2c-N symlink from HDMI connectors.
> This was added to sort of mirror the DP connectors that alreayd
> had their aux ch based i2c adapter sitting beneath them in the
> sysfs hierarchy. But now that we have the standard "ddc" symlink
> approach provided by the core let's switch to that fully.
> I don't think anything beyond igt depends on this.

I hope nobody notices or cares. I see that you've already fixed igt to
prefer ddc.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 25 -----------------------
>  1 file changed, 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index 6b8754290304..e9dcd3d5f6e4 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2544,28 +2544,6 @@ static int intel_hdmi_get_modes(struct drm_connect=
or *connector)
>  	return drm_edid_connector_add_modes(connector);
>  }
>=20=20
> -static void intel_hdmi_create_i2c_symlink(struct drm_connector *connecto=
r)
> -{
> -	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> -	struct i2c_adapter *ddc =3D connector->ddc;
> -	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
> -	struct kobject *connector_kobj =3D &connector->kdev->kobj;
> -	int ret;
> -
> -	ret =3D sysfs_create_link(connector_kobj, i2c_kobj, i2c_kobj->name);
> -	if (ret)
> -		drm_err(&i915->drm, "Failed to create i2c symlink (%d)\n", ret);
> -}
> -
> -static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connecto=
r)
> -{
> -	struct i2c_adapter *ddc =3D connector->ddc;
> -	struct kobject *i2c_kobj =3D &ddc->dev.kobj;
> -	struct kobject *connector_kobj =3D &connector->kdev->kobj;
> -
> -	sysfs_remove_link(connector_kobj, i2c_kobj->name);
> -}
> -
>  static int
>  intel_hdmi_connector_register(struct drm_connector *connector)
>  {
> @@ -2575,8 +2553,6 @@ intel_hdmi_connector_register(struct drm_connector =
*connector)
>  	if (ret)
>  		return ret;
>=20=20
> -	intel_hdmi_create_i2c_symlink(connector);
> -
>  	return ret;
>  }
>=20=20
> @@ -2586,7 +2562,6 @@ static void intel_hdmi_connector_unregister(struct =
drm_connector *connector)
>=20=20
>  	cec_notifier_conn_unregister(n);
>=20=20
> -	intel_hdmi_remove_i2c_symlink(connector);
>  	intel_connector_unregister(connector);
>  }

--=20
Jani Nikula, Intel Open Source Graphics Center
