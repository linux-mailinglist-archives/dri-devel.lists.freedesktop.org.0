Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6A312C27
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 09:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AAD6E831;
	Mon,  8 Feb 2021 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965EA6E439;
 Mon,  8 Feb 2021 08:46:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10981AC43;
 Mon,  8 Feb 2021 08:46:12 +0000 (UTC)
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210205234515.1216538-1-lyude@redhat.com>
 <20210205234515.1216538-11-lyude@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RFC v3 10/10] drm/dp: Extract i915's eDP backlight code into DRM
 helpers
Message-ID: <edfff017-ce20-86fb-19c7-46092d89b1e8@suse.de>
Date: Mon, 8 Feb 2021 09:46:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205234515.1216538-11-lyude@redhat.com>
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
Cc: greg.depoire@gmail.com, Jani Nikula <jani.nikula@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, David Airlie <airlied@linux.ie>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0142710742=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0142710742==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IE94HpZiONIVHINY0OjwrFETuiMonLP1F"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IE94HpZiONIVHINY0OjwrFETuiMonLP1F
Content-Type: multipart/mixed; boundary="03KLH75abdG9mExSuxpYgNOxfvRYAa8LA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, greg.depoire@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Message-ID: <edfff017-ce20-86fb-19c7-46092d89b1e8@suse.de>
Subject: Re: [RFC v3 10/10] drm/dp: Extract i915's eDP backlight code into DRM
 helpers
References: <20210205234515.1216538-1-lyude@redhat.com>
 <20210205234515.1216538-11-lyude@redhat.com>
In-Reply-To: <20210205234515.1216538-11-lyude@redhat.com>

--03KLH75abdG9mExSuxpYgNOxfvRYAa8LA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.02.21 um 00:45 schrieb Lyude Paul:
> Since we're about to implement eDP backlight support in nouveau using t=
he
> standard protocol from VESA, we might as well just take the code that's=

> already written for this and move it into a set of shared DRM helpers.
>=20
> Note that these helpers are intended to handle DPCD related backlight
> control bits such as setting the brightness level over AUX, probing the=

> backlight's TCON, enabling/disabling the backlight over AUX if supporte=
d,
> etc. Any PWM-related portions of backlight control are explicitly left =
up
> to the driver, as these will vary from platform to platform.
>=20
> The only exception to this is the calculation of the PWM frequency
> pre-divider value. This is because the only platform-specific informati=
on
> required for this is the PWM frequency of the panel, which the driver i=
s
> expected to provide if available. The actual algorithm for calculating =
this
> value is standard and is defined in the eDP specification from VESA.
>=20
> Note that these helpers do not yet implement the full range of features=

> the VESA backlight interface provides, and only provide the following
> functionality (all of which was already present in i915's DPCD backligh=
t
> support):
>=20
> * Basic control of brightness levels
> * Basic probing of backlight capabilities
> * Helpers for enabling and disabling the backlight
>=20
> v3:
> * Split out changes to i915's backlight code to separate patches to mak=
e it
>    easier to review
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: greg.depoire@gmail.com
> ---
>   drivers/gpu/drm/drm_dp_helper.c               | 332 +++++++++++++++++=
+
>   .../drm/i915/display/intel_display_types.h    |   5 +-
>   .../drm/i915/display/intel_dp_aux_backlight.c | 285 ++-------------
>   include/drm/drm_dp_helper.h                   |  48 +++
>   4 files changed, 412 insertions(+), 258 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_h=
elper.c
> index eedbb48815b7..04cb2b6970a8 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -3082,3 +3082,335 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm=
_dp_aux *aux, u8 color_spc)
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
> +
> +/**
> + * drm_edp_backlight_set_level() - Set the backlight level of an eDP p=
anel via AUX
> + * @aux: The DP AUX channel to use
> + * @bl: Backlight capability info from drm_edp_backlight_init()
> + * @level: The brightness level to set
> + *
> + * Sets the brightness level of an eDP panel's backlight. Note that th=
e panel's backlight must
> + * already have been enabled by the driver by calling drm_edp_backligh=
t_enable().
> + *
> + * Returns: %0 on success, negative error code on failure
> + */
> +int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct d=
rm_edp_backlight_info *bl,
> +				u16 level)
> +{
> +	int ret;
> +	u8 buf[2] =3D { 0 };
> +
> +	if (bl->lsb_reg_used) {
> +		buf[0] =3D (level & 0xFF00) >> 8;
> +		buf[1] =3D (level & 0x00FF);

Maybe 0x00ff and 0xff00 for aesthetic reasons.

> +	} else {
> +		buf[0] =3D level;
> +	}
> +
> +	ret =3D drm_dp_dpcd_write(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, =
sizeof(buf));
> +	if (ret !=3D sizeof(buf)) {
> +		DRM_ERROR("%s: Failed to write aux backlight level: %d\n", aux->name=
, ret);

Since you're adding this code, you should probably convert to drm_err()=20
helpers as well. Here and elsewhere.

> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_set_level);
> +
> +static int
> +drm_edp_backlight_set_enable(struct drm_dp_aux *aux, const struct drm_=
edp_backlight_info *bl,
> +			     bool enable)
> +{
> +	int ret;
> +	u8 buf;
> +
> +	/* The panel uses something other then DPCD for enabling it's backlig=
ht */

'its'

Best regards
Thomas

> +	if (!bl->aux_enable)
> +		return 0;
> +
> +	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &buf)=
;
> +	if (ret !=3D 1) {
> +		DRM_ERROR("%s: Failed to read eDP display control register: %d\n", a=
ux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +	if (enable)
> +		buf |=3D DP_EDP_BACKLIGHT_ENABLE;
> +	else
> +		buf &=3D ~DP_EDP_BACKLIGHT_ENABLE;
> +
> +	ret =3D drm_dp_dpcd_writeb(aux, DP_EDP_DISPLAY_CONTROL_REGISTER, buf)=
;
> +	if (ret !=3D 1) {
> +		DRM_ERROR("%s: Failed to write eDP display control register: %d\n", =
aux->name, ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_edp_backlight_enable() - Enable an eDP panel's backlight using =
DPCD
> + * @aux: The DP AUX channel to use
> + * @bl: Backlight capability info from drm_edp_backlight_init()
> + * @level: The initial backlight level to set via AUX, if there is one=

> + *
> + * This function handles enabling DPCD backlight controls on a panel o=
ver DPCD, while additionally
> + * restoring any important backlight state such as the given backlight=
 level, the brightness byte
> + * count, backlight frequency, etc.
> + *
> + * Note that certain panels, while supporting brightness level control=
s over DPCD, may not support
> + * having their backlights enabled via the standard %DP_EDP_DISPLAY_CO=
NTROL_REGISTER. On such panels
> + * &drm_edp_backlight_info.aux_enable will be set to %false, this func=
tion will skip the step of
> + * programming the %DP_EDP_DISPLAY_CONTROL_REGISTER, and the driver mu=
st perform the required
> + * implementation specific step for enabling the backlight after calli=
ng this function.
> + *
> + * Returns: %0 on success, negative error code on failure.
> + */
> +int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_=
edp_backlight_info *bl,
> +			     const u16 level)
> +{
> +	int ret;
> +	u8 dpcd_buf, new_dpcd_buf;
> +
> +	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &d=
pcd_buf);
> +	if (ret !=3D 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read backlight mode: %d\n", aux->name, =
ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	new_dpcd_buf =3D dpcd_buf;
> +
> +	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) !=3D DP_EDP_BACKL=
IGHT_CONTROL_MODE_DPCD) {
> +		new_dpcd_buf &=3D ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
> +		new_dpcd_buf |=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> +
> +		ret =3D drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_=
bit_count);
> +		if (ret !=3D 1)
> +			DRM_DEBUG_KMS("%s: Failed to write aux pwmgen bit count: %d\n",
> +				      aux->name, ret);
> +	}
> +
> +	if (bl->pwm_freq_pre_divider) {
> +		ret =3D drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_FREQ_SET, bl->pwm_f=
req_pre_divider);
> +		if (ret !=3D 1)
> +			DRM_DEBUG_KMS("%s: Failed to write aux backlight frequency: %d\n",
> +				      aux->name, ret);
> +		else
> +			new_dpcd_buf |=3D DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
> +	}
> +
> +	if (new_dpcd_buf !=3D dpcd_buf) {
> +		ret =3D drm_dp_dpcd_writeb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, =
new_dpcd_buf);
> +		if (ret !=3D 1) {
> +			DRM_DEBUG_KMS("%s: Failed to write aux backlight mode: %d\n",
> +				      aux->name, ret);
> +			return ret < 0 ? ret : -EIO;
> +		}
> +	}
> +
> +	ret =3D drm_edp_backlight_set_level(aux, bl, level);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D drm_edp_backlight_set_enable(aux, bl, true);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_enable);
> +
> +/**
> + * drm_edp_backlight_disable() - Disable an eDP backlight using DPCD, =
if supported
> + * @aux: The DP AUX channel to use
> + * @bl: Backlight capability info from drm_edp_backlight_init()
> + *
> + * This function handles disabling DPCD backlight controls on a panel =
over AUX. Note that some
> + * panels have backlights that are enabled/disabled by other means, de=
spite having their brightness
> + * values controlled through DPCD. On such panels &drm_edp_backlight_i=
nfo.aux_enable will be set to
> + * %false, this function will become a no-op (and we will skip updatin=
g
> + * %DP_EDP_DISPLAY_CONTROL_REGISTER), and the driver must take care to=
 perform it's own
> + * implementation specific step for disabling the backlight.
> + *
> + * Returns: %0 on success or no-op, negative error code on failure.
> + */
> +int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm=
_edp_backlight_info *bl)
> +{
> +	int ret;
> +
> +	ret =3D drm_edp_backlight_set_enable(aux, bl, false);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_disable);
> +
> +static inline int
> +drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_bac=
klight_info *bl,
> +			    u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_S=
IZE])
> +{
> +	int fxp, fxp_min, fxp_max, fxp_actual, f =3D 1;
> +	int ret;
> +	u8 pn, pn_min, pn_max;
> +
> +	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
> +	if (ret !=3D 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read pwmgen bit count cap: %d\n", aux->=
name, ret);
> +		return -ENODEV;
> +	}
> +
> +	pn &=3D DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +	bl->max =3D (1 << pn) - 1;
> +	if (!driver_pwm_freq_hz)
> +		return 0;
> +
> +	/*
> +	 * Set PWM Frequency divider to match desired frequency provided by t=
he driver.
> +	 * The PWM Frequency is calculated as 27Mhz / (F x P).
> +	 * - Where F =3D PWM Frequency Pre-Divider value programmed by field =
7:0 of the
> +	 *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
> +	 * - Where P =3D 2^Pn, where Pn is the value programmed by field 4:0 =
of the
> +	 *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
> +	 */
> +
> +	/* Find desired value of (F x P)
> +	 * Note that, if F x P is out of supported range, the maximum value o=
r minimum value will
> +	 * applied automatically. So no need to check that.
> +	 */
> +	fxp =3D DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driv=
er_pwm_freq_hz);
> +
> +	/* Use highest possible value of Pn for more granularity of brightnes=
s adjustment while
> +	 * satifying the conditions below.
> +	 * - Pn is in the range of Pn_min and Pn_max
> +	 * - F is in the range of 1 and 255
> +	 * - FxP is within 25% of desired value.
> +	 *   Note: 25% is arbitrary value and may need some tweak.
> +	 */
> +	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_m=
in);
> +	if (ret !=3D 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read pwmgen bit count cap min: %d\n", a=
ux->name, ret);
> +		return 0;
> +	}
> +	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_m=
ax);
> +	if (ret !=3D 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read pwmgen bit count cap max: %d\n", a=
ux->name, ret);
> +		return 0;
> +	}
> +	pn_min &=3D DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +	pn_max &=3D DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +	/* Ensure frequency is within 25% of desired value */
> +	fxp_min =3D DIV_ROUND_CLOSEST(fxp * 3, 4);
> +	fxp_max =3D DIV_ROUND_CLOSEST(fxp * 5, 4);
> +	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> +		DRM_DEBUG_KMS("%s: Driver defined backlight frequency (%d) out of ra=
nge\n",
> +			      aux->name, driver_pwm_freq_hz);
> +		return 0;
> +	}
> +
> +	for (pn =3D pn_max; pn >=3D pn_min; pn--) {
> +		f =3D clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> +		fxp_actual =3D f << pn;
> +		if (fxp_min <=3D fxp_actual && fxp_actual <=3D fxp_max)
> +			break;
> +	}
> +
> +	ret =3D drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
> +	if (ret !=3D 1) {
> +		DRM_DEBUG_KMS("%s: Failed to write aux pwmgen bit count: %d\n", aux-=
>name, ret);
> +		return 0;
> +	}
> +	bl->pwmgen_bit_count =3D pn;
> +	bl->max =3D (1 << pn) - 1;
> +
> +	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP) {
> +		bl->pwm_freq_pre_divider =3D f;
> +		DRM_DEBUG_KMS("%s: Using backlight frequency from driver (%dHz)\n",
> +			      aux->name, driver_pwm_freq_hz);
> +	}
> +
> +	return 0;
> +}
> +
> +static inline int
> +drm_edp_backlight_probe_level(struct drm_dp_aux *aux, struct drm_edp_b=
acklight_info *bl,
> +			      u8 *current_mode)
> +{
> +	int ret;
> +	u8 buf[2];
> +	u8 mode_reg;
> +
> +	ret =3D drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &m=
ode_reg);
> +	if (ret !=3D 1) {
> +		DRM_DEBUG_KMS("%s: Failed to read backlight mode: %d\n", aux->name, =
ret);
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	*current_mode =3D (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
> +	if (*current_mode =3D=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +		int size =3D 1 + bl->lsb_reg_used;
> +
> +		ret =3D drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, =
size);
> +		if (ret !=3D size) {
> +			DRM_DEBUG_KMS("%s: Failed to read backlight level: %d\n", aux->name=
, ret);
> +			return ret < 0 ? ret : -EIO;
> +		}
> +
> +		if (bl->lsb_reg_used)
> +			return (buf[0] << 8) | buf[1];
> +		else
> +			return buf[0];
> +	}
> +
> +	/*
> +	 * If we're not in DPCD control mode yet, the programmed brightness v=
alue is meaningless and
> +	 * the driver should assume max brightness
> +	 */
> +	return bl->max;
> +}
> +
> +/**
> + * drm_edp_backlight_init() - Probe a display panel's TCON using the s=
tandard VESA eDP backlight
> + * interface.
> + * @aux: The DP aux device to use for probing
> + * @bl: The &drm_edp_backlight_info struct to fill out with informatio=
n on the backlight
> + * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
> + * @edp_dpcd: A cached copy of the eDP DPCD
> + * @current_level: Where to store the probed brightness level
> + * @current_mode: Where to store the currently set backlight control m=
ode
> + *
> + * Initializes a &drm_edp_backlight_info struct by probing @aux for it=
's backlight capabilities,
> + * along with also probing the current and maximum supported brightnes=
s levels.
> + *
> + * If @driver_pwm_freq_hz is non-zero, this will be used as the backli=
ght frequency. Otherwise, the
> + * default frequency from the panel is used.
> + *
> + * Returns: %0 on success, negative error code on failure.
> + */
> +int
> +drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backligh=
t_info *bl,
> +		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP=
_SIZE],
> +		       u16 *current_level, u8 *current_mode)
> +{
> +	int ret;
> +
> +	if (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> +		bl->aux_enable =3D true;
> +	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> +		bl->lsb_reg_used =3D true;
> +
> +	ret =3D drm_edp_backlight_probe_max(aux, bl, driver_pwm_freq_hz, edp_=
dpcd);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D drm_edp_backlight_probe_level(aux, bl, current_mode);
> +	if (ret < 0)
> +		return ret;
> +	*current_level =3D ret;
> +
> +	DRM_DEBUG_KMS("%s: Found backlight level=3D%d/%d pwm_freq_pre_divider=
=3D%d mode=3D%x\n",
> +		      aux->name, *current_level, bl->max, bl->pwm_freq_pre_divider, =
*current_mode);
> +	DRM_DEBUG_KMS("%s: Backlight caps: pwmgen_bit_count=3D%d lsb_reg_used=
=3D%d aux_enable=3D%d\n",
> +		      aux->name, bl->pwmgen_bit_count, bl->lsb_reg_used, bl->aux_ena=
ble);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_edp_backlight_init);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drive=
rs/gpu/drm/i915/display/intel_display_types.h
> index 16824eb3ef93..03051ab75d30 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -263,10 +263,7 @@ struct intel_panel {
>   		/* DPCD backlight */
>   		union {
>   			struct {
> -				u8 pwmgen_bit_count;
> -				u8 pwm_freq_pre_divider;
> -				bool lsb_reg_used;
> -				bool aux_enable;
> +				struct drm_edp_backlight_info info;
>   			} vesa;
>   			struct {
>   				bool sdr_uses_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/dr=
ivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 813f6c553156..286eb337448e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -270,114 +270,19 @@ intel_dp_aux_hdr_setup_backlight(struct intel_co=
nnector *connector, enum pipe pi
>   }
>  =20
>   /* VESA backlight callbacks */
> -static bool intel_dp_aux_vesa_backlight_dpcd_mode(struct intel_connect=
or *connector)
> -{
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> -	int ret;
> -	u8 mode_reg;
> -
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_R=
EGISTER, &mode_reg);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read backlight mode: %d\n", ret);=

> -		return false;
> -	}
> -
> -	return (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) =3D=3D
> -	       DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> -}
> -
> -/*
> - * Read the current backlight value from DPCD register(s) based
> - * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
> - */
>   static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *co=
nnector, enum pipe unused)
>   {
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> -	int ret;
> -	u8 read_val[2] =3D { 0x0 };
> -	u16 level =3D 0;
> -
> -	/*
> -	 * If we're not in DPCD control mode yet, the programmed brightness
> -	 * value is meaningless and we should assume max brightness
> -	 */
> -	if (!intel_dp_aux_vesa_backlight_dpcd_mode(connector))
> -		return connector->panel.backlight.max;
> -
> -	ret =3D drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_=
MSB, &read_val,
> -			       sizeof(read_val));
> -	if (ret !=3D sizeof(read_val)) {
> -		drm_dbg_kms(&i915->drm, "Failed to read brightness level: %d\n", ret=
);
> -		return 0;
> -	}
> -
> -	if (connector->panel.backlight.edp.vesa.lsb_reg_used)
> -		level =3D (read_val[0] << 8 | read_val[1]);
> -	else
> -		level =3D read_val[0];
> -
> -	return level;
> +	return connector->panel.backlight.level;
>   }
>  =20
> -/*
> - * Sends the current backlight level over the aux channel, checking if=
 its using
> - * 8-bit or 16 bit value (MSB and LSB)
> - */
>   static void
> -intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn=
_state,
> -				u32 level)
> +intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn=
_state, u32 level)
>   {
>   	struct intel_connector *connector =3D to_intel_connector(conn_state-=
>connector);
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> -	int ret;
> -	u8 vals[2] =3D { 0x0 };
> -
> -	/* Write the MSB and/or LSB */
> -	if (connector->panel.backlight.edp.vesa.lsb_reg_used) {
> -		vals[0] =3D (level & 0xFF00) >> 8;
> -		vals[1] =3D (level & 0xFF);
> -	} else {
> -		vals[0] =3D level;
> -	}
> -
> -	ret =3D drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS=
_MSB, vals,
> -				sizeof(vals));
> -	if (ret !=3D sizeof(vals)) {
> -		drm_dbg_kms(&i915->drm, "Failed to write aux backlight level: %d\n",=
 ret);
> -		return;
> -	}
> -}
> -
> -static void set_vesa_backlight_enable(struct intel_connector *connecto=
r, bool enable)
> -{
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> -	int ret;
> -	u8 reg_val =3D 0;
> -
> -	/* Early return when display use other mechanism to enable backlight.=
 */
> -	if (!connector->panel.backlight.edp.vesa.aux_enable)
> -		return;
> -
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGI=
STER, &reg_val);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read eDP display control register=
: %d\n", ret);
> -		return;
> -	}
> -
> -	if (enable)
> -		reg_val |=3D DP_EDP_BACKLIGHT_ENABLE;
> -	else
> -		reg_val &=3D ~(DP_EDP_BACKLIGHT_ENABLE);
> +	struct intel_panel *panel =3D &connector->panel;
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  =20
> -	ret =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REG=
ISTER, reg_val);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to %s aux backlight: %d\n",
> -			    enable ? "enable" : "disable", ret);
> -	}
> +	drm_edp_backlight_set_level(&intel_dp->aux, &panel->backlight.edp.ves=
a.info, level);
>   }
>  =20
>   static void
> @@ -385,170 +290,46 @@ intel_dp_aux_vesa_enable_backlight(const struct =
intel_crtc_state *crtc_state,
>   				   const struct drm_connector_state *conn_state, u32 level)
>   {
>   	struct intel_connector *connector =3D to_intel_connector(conn_state-=
>connector);
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> -	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>   	struct intel_panel *panel =3D &connector->panel;
> -	int ret;
> -	u8 dpcd_buf, new_dpcd_buf;
> -	u8 pwmgen_bit_count =3D panel->backlight.edp.vesa.pwmgen_bit_count;
> -
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET_R=
EGISTER, &dpcd_buf);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read backlight mode: %d\n", ret);=

> -		return;
> -	}
> -
> -	new_dpcd_buf =3D dpcd_buf;
> -
> -	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) !=3D DP_EDP_BACKL=
IGHT_CONTROL_MODE_MASK) {
> -		new_dpcd_buf &=3D ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
> -		new_dpcd_buf |=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
> -
> -		ret =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, =
pwmgen_bit_count);
> -		if (ret !=3D 1)
> -			drm_dbg_kms(&i915->drm, "Failed to write aux pwmgen bit count: %d\n=
", ret);
> -	}
> -
> -	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {
> -		ret =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET=
,
> -					 panel->backlight.edp.vesa.pwm_freq_pre_divider);
> -		if (ret =3D=3D 1)
> -			new_dpcd_buf |=3D DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
> -		else
> -			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency: %=
d\n",
> -				    ret);
> -	}
> -
> -	if (new_dpcd_buf !=3D dpcd_buf) {
> -		ret =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_MODE_SET=
_REGISTER,
> -					 new_dpcd_buf);
> -		if (ret !=3D 1)
> -			drm_dbg_kms(&i915->drm, "Failed to write aux backlight mode: %d\n",=
 ret);
> -	}
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  =20
> -	intel_dp_aux_vesa_set_backlight(conn_state, level);
> -	set_vesa_backlight_enable(connector, true);
> +	drm_edp_backlight_enable(&intel_dp->aux, &panel->backlight.edp.vesa.i=
nfo, level);
>   }
>  =20
>   static void intel_dp_aux_vesa_disable_backlight(const struct drm_conn=
ector_state *old_conn_state,
>   						u32 level)
>   {
> -	set_vesa_backlight_enable(to_intel_connector(old_conn_state->connecto=
r), false);
> -}
> -
> -/*
> - * Compute PWM frequency divider value based off the frequency provide=
d to us by the vbt.
> - * The PWM Frequency is calculated as 27Mhz / (F x P).
> - * - Where F =3D PWM Frequency Pre-Divider value programmed by field 7=
:0 of the
> - *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
> - * - Where P =3D 2^Pn, where Pn is the value programmed by field 4:0 o=
f the
> - *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
> - */
> -static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector=
 *connector)
> -{
> -	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> -	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_connector *connector =3D to_intel_connector(old_conn_sta=
te->connector);
>   	struct intel_panel *panel =3D &connector->panel;
> -	u32 max_backlight =3D 0;
> -	int ret, freq, fxp, fxp_min, fxp_max, fxp_actual, f =3D 1;
> -	u8 pn, pn_min, pn_max;
> -
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, &p=
n);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap: %d\n",=
 ret);
> -		return 0;
> -	}
> -
> -	pn &=3D DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	max_backlight =3D (1 << pn) - 1;
> -
> -	/* Find desired value of (F x P)
> -	 * Note that, if F x P is out of supported range, the maximum value o=
r
> -	 * minimum value will applied automatically. So no need to check that=
=2E
> -	 */
> -	freq =3D i915->vbt.backlight.pwm_freq_hz;
> -	drm_dbg_kms(&i915->drm, "VBT defined backlight frequency %u Hz\n",
> -		    freq);
> -	if (!freq) {
> -		drm_dbg_kms(&i915->drm,
> -			    "Use panel default backlight frequency\n");
> -		return max_backlight;
> -	}
> -
> -	fxp =3D DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);=

> -
> -	/* Use highest possible value of Pn for more granularity of brightnes=
s
> -	 * adjustment while satifying the conditions below.
> -	 * - Pn is in the range of Pn_min and Pn_max
> -	 * - F is in the range of 1 and 255
> -	 * - FxP is within 25% of desired value.
> -	 *   Note: 25% is arbitrary value and may need some tweak.
> -	 */
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP=
_MIN, &pn_min);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap min: %d=
\n", ret);
> -		return max_backlight;
> -	}
> -	ret =3D drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT_CAP=
_MAX, &pn_max);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to read pwmgen bit count cap max: %d=
\n", ret);
> -		return max_backlight;
> -	}
> -	pn_min &=3D DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -	pn_max &=3D DP_EDP_PWMGEN_BIT_COUNT_MASK;
> -
> -	/* Ensure frequency is within 25% of desired value */
> -	fxp_min =3D DIV_ROUND_CLOSEST(fxp * 3, 4);
> -	fxp_max =3D DIV_ROUND_CLOSEST(fxp * 5, 4);
> -
> -	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
> -		drm_dbg_kms(&i915->drm,
> -			    "VBT defined backlight frequency out of range\n");
> -		return max_backlight;
> -	}
> -
> -	for (pn =3D pn_max; pn >=3D pn_min; pn--) {
> -		f =3D clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> -		fxp_actual =3D f << pn;
> -		if (fxp_min <=3D fxp_actual && fxp_actual <=3D fxp_max)
> -			break;
> -	}
> -
> -	drm_dbg_kms(&i915->drm, "Using eDP pwmgen bit count of %d\n", pn);
> -	ret =3D drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT, p=
n);
> -	if (ret !=3D 1) {
> -		drm_dbg_kms(&i915->drm, "Failed to write aux pwmgen bit count: %d\n"=
, ret);
> -		return max_backlight;
> -	}
> -
> -	panel->backlight.edp.vesa.pwmgen_bit_count =3D pn;
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
> -		panel->backlight.edp.vesa.pwm_freq_pre_divider =3D f;
> -
> -	max_backlight =3D (1 << pn) - 1;
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(connector->encoder);
>  =20
> -	return max_backlight;
> +	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.=
info);
>   }
>  =20
> -static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *c=
onnector,
> -					     enum pipe pipe)
> +static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *c=
onnector, enum pipe pipe)
>   {
>   	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>   	struct intel_panel *panel =3D &connector->panel;
> +	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> +	u16 current_level;
> +	u8 current_mode;
> +	int ret;
>  =20
> -	if (intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> -		panel->backlight.edp.vesa.aux_enable =3D true;
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> -		panel->backlight.edp.vesa.lsb_reg_used =3D true;
> -
> -	panel->backlight.max =3D intel_dp_aux_vesa_calc_max_backlight(connect=
or);
> -	if (!panel->backlight.max)
> -		return -ENODEV;
> +	ret =3D drm_edp_backlight_init(&intel_dp->aux, &panel->backlight.edp.=
vesa.info,
> +				     i915->vbt.backlight.pwm_freq_hz, intel_dp->edp_dpcd,
> +				     &current_level, &current_mode);
> +	if (ret < 0)
> +		return ret;
>  =20
> +	panel->backlight.max =3D panel->backlight.edp.vesa.info.max;
>   	panel->backlight.min =3D 0;
> -	panel->backlight.level =3D intel_dp_aux_vesa_get_backlight(connector,=
 pipe);
> -	panel->backlight.enabled =3D intel_dp_aux_vesa_backlight_dpcd_mode(co=
nnector) &&
> -				   panel->backlight.level !=3D 0;
> +	if (current_mode =3D=3D DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> +		panel->backlight.level =3D current_level;
> +		panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> +	} else {
> +		panel->backlight.level =3D panel->backlight.max;
> +		panel->backlight.enabled =3D false;
> +	}
>  =20
>   	return 0;
>   }
> @@ -559,16 +340,12 @@ intel_dp_aux_supports_vesa_backlight(struct intel=
_connector *connector)
>   	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
>   	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
>  =20
> -	/* Check the eDP Display control capabilities registers to determine =
if
> -	 * the panel can support backlight control over the aux channel.
> -	 *
> -	 * TODO: We currently only support AUX only backlight configurations,=
 not backlights which
> +	/* TODO: We currently only support AUX only backlight configurations,=
 not backlights which
>   	 * require a mix of PWM and AUX controls to work. In the mean time, =
these machines typically
>   	 * work just fine using normal PWM controls anyway.
>   	 */
> -	if (intel_dp->edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP &&
> -	    (intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> -	    (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)=
) {
> +	if ((intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> +	    drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
>   		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
>   		return true;
>   	}
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index edffd1dcca3e..1eca0b42fc45 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1790,6 +1790,24 @@ drm_dp_sink_can_do_video_without_timing_msa(cons=
t u8 dpcd[DP_RECEIVER_CAP_SIZE])
>   		DP_MSA_TIMING_PAR_IGNORED;
>   }
>  =20
> +/**
> + * drm_edp_backlight_supported() - Check an eDP DPCD for VESA backligh=
t support
> + * @edp_dpcd: The DPCD to check
> + *
> + * Note that currently this function will return %false for panels whi=
ch support various DPCD
> + * backlight features but which require the brightness be set through =
PWM, and don't support setting
> + * the brightness level via the DPCD. This is a TODO.
> + *
> + * Returns: %True if @edp_dpcd indicates that VESA backlight controls =
are supported, %false
> + * otherwise
> + */
> +static inline bool
> +drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE=
])
> +{
> +	return (edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP) &&
> +		(edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP);
> +}
> +
>   /*
>    * DisplayPort AUX channel
>    */
> @@ -2089,6 +2107,36 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc,=
 enum drm_dp_quirk quirk)
>   	return desc->quirks & BIT(quirk);
>   }
>  =20
> +/**
> + * struct drm_edp_backlight_info - Probed eDP backlight info struct
> + * @pwmgen_bit_count: The pwmgen bit count
> + * @pwm_freq_pre_divider: The PWM frequency pre-divider value being us=
ed for this backlight, if any
> + * @max: The maximum backlight level that may be set
> + * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIG=
HTNESS_LSB register?
> + * @aux_enable: Does the panel support the AUX enable cap?
> + *
> + * This structure contains various data about an eDP backlight, which =
can be populated by using
> + * drm_edp_backlight_init().
> + */
> +struct drm_edp_backlight_info {
> +	u8 pwmgen_bit_count;
> +	u8 pwm_freq_pre_divider;
> +	u16 max;
> +
> +	bool lsb_reg_used : 1;
> +	bool aux_enable : 1;
> +};
> +
> +int
> +drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backligh=
t_info *bl,
> +		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP=
_SIZE],
> +		       u16 *current_level, u8 *current_mode);
> +int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct d=
rm_edp_backlight_info *bl,
> +				u16 level);
> +int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_=
edp_backlight_info *bl,
> +			     u16 level);
> +int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct drm=
_edp_backlight_info *bl);
> +
>   #ifdef CONFIG_DRM_DP_CEC
>   void drm_dp_cec_irq(struct drm_dp_aux *aux);
>   void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--03KLH75abdG9mExSuxpYgNOxfvRYAa8LA--

--IE94HpZiONIVHINY0OjwrFETuiMonLP1F
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAg+lIFAwAAAAAACgkQlh/E3EQov+As
ORAAlVq0y0DyfSHXzbV01YgddTJl4PW96Q+FuhestPI4X0B4N1At/Fu1ivNVlJ4lMnHNUQRqjdWU
/D30XSEt84bTXXUvnorU+65zvIC5tf/D0xBlMsWN4BqMulFAY4qy5j0k8ExLuraFrGnrhuXkrRCW
zdohzepofzNu6DF4L41gM1BGP7Upkq+9wkstZrX4hL42npJUuRwez53uTdnRWpC6k4C3nLu7rn1K
MjTpfhmYhx06uzYpxiTkAzWywbFq9VvDf/DtRomX78ttx0zn+/JPEF9AyGH4jp98GFn76ygjtNDK
6hQnnfW0sH3u0hBVlremgppUEeBSLb3oFm1U18z5RDn7g3Y9xSAQ5kbAw6+AU9aPkkqhuJI1Fete
tU1BAVtQW+MHsOPhOCO9fGCOWR//akxgRB7EYsONXvfJ0xZkTofLWx24b1kR6+kjwrRSizVUsbBW
Wcp1/eqrCPcAeyW3kTGRvUsvgKFii4APzvMytFG6NfpkqyHwho2aGWHGWqMSJIhzuoHemZ0DJYsr
9lNRAfdkP28DxQ8+yuM7e2AlIVqOqzZr5BkOnsR6wGJIcpkghHHbKQRQ+4CsAuoX3W/xutpxnxE9
8ZycGB3SX8T2fpefavpQUS6a74Icppa4cXrtQVBwc6gGvdl3uRy3mZdGAvgEWDRUwB4fgRyp4O3j
dLc=
=Di9Y
-----END PGP SIGNATURE-----

--IE94HpZiONIVHINY0OjwrFETuiMonLP1F--

--===============0142710742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0142710742==--
