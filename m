Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4CF78D5CE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076410E51D;
	Wed, 30 Aug 2023 12:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FADF10E51C;
 Wed, 30 Aug 2023 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397364; x=1724933364;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=m9T/RfVlCDLNHRMudrOHy0on/jpFrVDKtt/L0COUhdU=;
 b=AA2bGZsM0G6ntzbkLXCGQeoxGBqKma7VekNBOkELemC58eDkH6BzCuik
 4CxkgkIIJjJiHjVtD1zktbmOiAHBjitWpw82RPVZY8xKzMrfekbS2o4Qr
 XWso9e+KETu3tw7A9kGqOeY3w+j1ubHUyphKHC0bL/gAWHJuP5JeLOVXo
 7hOMTRvsdyY9kGVqnFlraxeAxCLpvWsbDkx2+xuAEWNVp0QNfFcEiPe9/
 WLUtZkckpMzxdJsSBM3rvczR4qz+KEqd4PyuOblFodL9BUTLP6g69rgRG
 bbowEn1JPzwY2E3J0E2O54ADiYorSt1qwnumTvEEVnGkp+4I1kJDMDlSL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379374443"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379374443"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882732311"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:09:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 12/12] drm/i915/sdvo: Constify mapping structs
In-Reply-To: <20230829113920.13713-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-13-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:09:20 +0300
Message-ID: <878r9szq8f.fsf@intel.com>
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
> We aren't intending to mutate the SDVO device mapping structs,
> so make them const.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_sdvo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/=
i915/display/intel_sdvo.c
> index b988e05274c1..0bd815bf2e69 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -2579,7 +2579,7 @@ intel_sdvo_select_ddc_bus(struct intel_sdvo *sdvo,
>  			  struct intel_sdvo_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(sdvo->base.base.dev);
> -	struct sdvo_device_mapping *mapping;
> +	const struct sdvo_device_mapping *mapping;
>  	int ddc_bus;
>=20=20
>  	if (sdvo->base.port =3D=3D PORT_B)
> @@ -2602,7 +2602,7 @@ static void
>  intel_sdvo_select_i2c_bus(struct intel_sdvo *sdvo)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(sdvo->base.base.dev);
> -	struct sdvo_device_mapping *mapping;
> +	const struct sdvo_device_mapping *mapping;
>  	u8 pin;
>=20=20
>  	if (sdvo->base.port =3D=3D PORT_B)
> @@ -2647,7 +2647,7 @@ static u8
>  intel_sdvo_get_slave_addr(struct intel_sdvo *sdvo)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(sdvo->base.base.dev);
> -	struct sdvo_device_mapping *my_mapping, *other_mapping;
> +	const struct sdvo_device_mapping *my_mapping, *other_mapping;
>=20=20
>  	if (sdvo->base.port =3D=3D PORT_B) {
>  		my_mapping =3D &dev_priv->display.vbt.sdvo_mappings[0];

--=20
Jani Nikula, Intel Open Source Graphics Center
