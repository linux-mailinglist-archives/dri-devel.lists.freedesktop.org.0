Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24023589A2B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F649390F;
	Thu,  4 Aug 2022 09:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B790693974;
 Thu,  4 Aug 2022 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659606899; x=1691142899;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=5RIWFKoSAkEGflgC6RNjV8O9/LB7SOFSrF3/QfRUi4I=;
 b=LdRi81IUPTKOHZ8w9Z/pGnzYYJGF+uxMNJBbgwRE1kEdvzK2VMN++uj0
 Bdj/S7uO74CsuvSOzktmwmw5ePABPRWIRiosYP6Q8CyxS7Am79gOc5qWl
 T3Wxx2VWbi8jP+GeKfptc/zylYCXAlawqallbPsEirpnyyrHtpS/wpj8T
 +/X7crhr9xP5BH9rtwfw1JZHE85EDgsRaicdJoajR8yKaA5Kpwf3QiNKT
 T0CC0+YjhxVZyN6jnwKeQyJrXiHppso5AMIVAqflEo7+4ldpDsCx/hx4h
 ekEkrjrzro35DXjRZn2crxUBr6TuSnSo2BQHjYi170N2DvV8nCbJab2g8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="291113927"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="291113927"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:54:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="662470867"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.120])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:54:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/amdgpu_dm: Rely on split out luminance
 calculation function
In-Reply-To: <20220719095700.14923-3-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220719095700.14923-1-jouni.hogander@intel.com>
 <20220719095700.14923-3-jouni.hogander@intel.com>
Date: Thu, 04 Aug 2022 12:54:42 +0300
Message-ID: <877d3opc4d.fsf@intel.com>
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Jul 2022, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Luminance range calculation was split out into drm_edid.c and is now
> part of edid parsing. Rely on values calculated during edid parsing and
> use these for caps->aux_max_input_signal and caps->aux_min_input_signal.

Harry, I'll merge patches 1 & 3 in this series through drm-misc-next,
because I think they're good to go, and fix stuff in i915.

Can I get your rb/ack to merge this patch as well, or do you want to
take this later via your tree?

BR,
Jani.


>
> v2: Use values calculated during edid parsing
>
> Cc: Roman Li <roman.li@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 35 +++----------------
>  1 file changed, 4 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3e83fed540e8..eb7abdeb8653 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2903,15 +2903,12 @@ static struct drm_mode_config_helper_funcs amdgpu=
_dm_mode_config_helperfuncs =3D {
>=20=20
>  static void update_connector_ext_caps(struct amdgpu_dm_connector *aconne=
ctor)
>  {
> -	u32 max_avg, min_cll, max, min, q, r;
>  	struct amdgpu_dm_backlight_caps *caps;
>  	struct amdgpu_display_manager *dm;
>  	struct drm_connector *conn_base;
>  	struct amdgpu_device *adev;
>  	struct dc_link *link =3D NULL;
> -	static const u8 pre_computed_values[] =3D {
> -		50, 51, 52, 53, 55, 56, 57, 58, 59, 61, 62, 63, 65, 66, 68, 69,
> -		71, 72, 74, 75, 77, 79, 81, 82, 84, 86, 88, 90, 92, 94, 96, 98};
> +	struct drm_luminance_range_info *luminance_range;
>  	int i;
>=20=20
>  	if (!aconnector || !aconnector->dc_link)
> @@ -2933,8 +2930,6 @@ static void update_connector_ext_caps(struct amdgpu=
_dm_connector *aconnector)
>  	caps =3D &dm->backlight_caps[i];
>  	caps->ext_caps =3D &aconnector->dc_link->dpcd_sink_ext_caps;
>  	caps->aux_support =3D false;
> -	max_avg =3D conn_base->hdr_sink_metadata.hdmi_type1.max_fall;
> -	min_cll =3D conn_base->hdr_sink_metadata.hdmi_type1.min_cll;
>=20=20
>  	if (caps->ext_caps->bits.oled =3D=3D 1 /*||
>  	    caps->ext_caps->bits.sdr_aux_backlight_control =3D=3D 1 ||
> @@ -2946,31 +2941,9 @@ static void update_connector_ext_caps(struct amdgp=
u_dm_connector *aconnector)
>  	else if (amdgpu_backlight =3D=3D 1)
>  		caps->aux_support =3D true;
>=20=20
> -	/* From the specification (CTA-861-G), for calculating the maximum
> -	 * luminance we need to use:
> -	 *	Luminance =3D 50*2**(CV/32)
> -	 * Where CV is a one-byte value.
> -	 * For calculating this expression we may need float point precision;
> -	 * to avoid this complexity level, we take advantage that CV is divided
> -	 * by a constant. From the Euclids division algorithm, we know that CV
> -	 * can be written as: CV =3D 32*q + r. Next, we replace CV in the
> -	 * Luminance expression and get 50*(2**q)*(2**(r/32)), hence we just
> -	 * need to pre-compute the value of r/32. For pre-computing the values
> -	 * We just used the following Ruby line:
> -	 *	(0...32).each {|cv| puts (50*2**(cv/32.0)).round}
> -	 * The results of the above expressions can be verified at
> -	 * pre_computed_values.
> -	 */
> -	q =3D max_avg >> 5;
> -	r =3D max_avg % 32;
> -	max =3D (1 << q) * pre_computed_values[r];
> -
> -	// min luminance: maxLum * (CV/255)^2 / 100
> -	q =3D DIV_ROUND_CLOSEST(min_cll, 255);
> -	min =3D max * DIV_ROUND_CLOSEST((q * q), 100);
> -
> -	caps->aux_max_input_signal =3D max;
> -	caps->aux_min_input_signal =3D min;
> +	luminance_range =3D &conn_base->display_info.luminance_range;
> +	caps->aux_min_input_signal =3D luminance_range->min_luminance;
> +	caps->aux_max_input_signal =3D luminance_range->max_luminance;
>  }
>=20=20
>  void amdgpu_dm_update_connector_after_detect(

--=20
Jani Nikula, Intel Open Source Graphics Center
