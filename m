Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93435971A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0386EB8A;
	Fri,  9 Apr 2021 08:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C826EB8A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:05:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 216B0AEFE;
 Fri,  9 Apr 2021 08:05:49 +0000 (UTC)
Subject: Re: [PATCH 03/18] drm/bridge: dw-hdmi: Use helpers
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-4-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f8bf91d8-e2cb-7304-05ee-766db46c1bf4@suse.de>
Date: Fri, 9 Apr 2021 10:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-4-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============2038028191=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2038028191==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7kjc2gednRzBFv66soMmTl19X7aCfIXoN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7kjc2gednRzBFv66soMmTl19X7aCfIXoN
Content-Type: multipart/mixed; boundary="PQU1izncD7XcVjIaVJIuLSOtLKGccUzZp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Message-ID: <f8bf91d8-e2cb-7304-05ee-766db46c1bf4@suse.de>
Subject: Re: [PATCH 03/18] drm/bridge: dw-hdmi: Use helpers
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-4-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-4-maxime@cerno.tech>

--PQU1izncD7XcVjIaVJIuLSOtLKGccUzZp
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

There was some objection in patch 2, but at least this conversion patch=20
looks good.

Acked-by: Thomas Zimmremann <tzimmermann@suse.de>

Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 141 +++++----------------=
-
>   1 file changed, 28 insertions(+), 113 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi.c
> index d010c9c525d9..39b380453183 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -29,6 +29,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_hdmi.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -801,92 +802,6 @@ void dw_hdmi_audio_disable(struct dw_hdmi *hdmi)
>   }
>   EXPORT_SYMBOL_GPL(dw_hdmi_audio_disable);
>  =20
> -static bool hdmi_bus_fmt_is_rgb(unsigned int bus_format)
> -{
> -	switch (bus_format) {
> -	case MEDIA_BUS_FMT_RGB888_1X24:
> -	case MEDIA_BUS_FMT_RGB101010_1X30:
> -	case MEDIA_BUS_FMT_RGB121212_1X36:
> -	case MEDIA_BUS_FMT_RGB161616_1X48:
> -		return true;
> -
> -	default:
> -		return false;
> -	}
> -}
> -
> -static bool hdmi_bus_fmt_is_yuv444(unsigned int bus_format)
> -{
> -	switch (bus_format) {
> -	case MEDIA_BUS_FMT_YUV8_1X24:
> -	case MEDIA_BUS_FMT_YUV10_1X30:
> -	case MEDIA_BUS_FMT_YUV12_1X36:
> -	case MEDIA_BUS_FMT_YUV16_1X48:
> -		return true;
> -
> -	default:
> -		return false;
> -	}
> -}
> -
> -static bool hdmi_bus_fmt_is_yuv422(unsigned int bus_format)
> -{
> -	switch (bus_format) {
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -	case MEDIA_BUS_FMT_UYVY10_1X20:
> -	case MEDIA_BUS_FMT_UYVY12_1X24:
> -		return true;
> -
> -	default:
> -		return false;
> -	}
> -}
> -
> -static bool hdmi_bus_fmt_is_yuv420(unsigned int bus_format)
> -{
> -	switch (bus_format) {
> -	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> -	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> -	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> -	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> -		return true;
> -
> -	default:
> -		return false;
> -	}
> -}
> -
> -static int hdmi_bus_fmt_color_depth(unsigned int bus_format)
> -{
> -	switch (bus_format) {
> -	case MEDIA_BUS_FMT_RGB888_1X24:
> -	case MEDIA_BUS_FMT_YUV8_1X24:
> -	case MEDIA_BUS_FMT_UYVY8_1X16:
> -	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> -		return 8;
> -
> -	case MEDIA_BUS_FMT_RGB101010_1X30:
> -	case MEDIA_BUS_FMT_YUV10_1X30:
> -	case MEDIA_BUS_FMT_UYVY10_1X20:
> -	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> -		return 10;
> -
> -	case MEDIA_BUS_FMT_RGB121212_1X36:
> -	case MEDIA_BUS_FMT_YUV12_1X36:
> -	case MEDIA_BUS_FMT_UYVY12_1X24:
> -	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> -		return 12;
> -
> -	case MEDIA_BUS_FMT_RGB161616_1X48:
> -	case MEDIA_BUS_FMT_YUV16_1X48:
> -	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> -		return 16;
> -
> -	default:
> -		return 0;
> -	}
> -}
> -
>   /*
>    * this submodule is responsible for the video data synchronization.
>    * for example, for RGB 4:4:4 input, the data map is defined as
> @@ -967,8 +882,8 @@ static int is_color_space_conversion(struct dw_hdmi=
 *hdmi)
>   	struct hdmi_data_info *hdmi_data =3D &hdmi->hdmi_data;
>   	bool is_input_rgb, is_output_rgb;
>  =20
> -	is_input_rgb =3D hdmi_bus_fmt_is_rgb(hdmi_data->enc_in_bus_format);
> -	is_output_rgb =3D hdmi_bus_fmt_is_rgb(hdmi_data->enc_out_bus_format);=

> +	is_input_rgb =3D drm_hdmi_bus_fmt_is_rgb(hdmi_data->enc_in_bus_format=
);
> +	is_output_rgb =3D drm_hdmi_bus_fmt_is_rgb(hdmi_data->enc_out_bus_form=
at);
>  =20
>   	return (is_input_rgb !=3D is_output_rgb) ||
>   	       (is_input_rgb && is_output_rgb && hdmi_data->rgb_limited_rang=
e);
> @@ -976,11 +891,11 @@ static int is_color_space_conversion(struct dw_hd=
mi *hdmi)
>  =20
>   static int is_color_space_decimation(struct dw_hdmi *hdmi)
>   {
> -	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
> +	if (!drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
>   		return 0;
>  =20
> -	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) ||
> -	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_in_bus_format))
> +	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) ||
> +	    drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_in_bus_format))
>   		return 1;
>  =20
>   	return 0;
> @@ -988,11 +903,11 @@ static int is_color_space_decimation(struct dw_hd=
mi *hdmi)
>  =20
>   static int is_color_space_interpolation(struct dw_hdmi *hdmi)
>   {
> -	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_in_bus_format))
> +	if (!drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_in_bus_format))
>   		return 0;
>  =20
> -	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
> -	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
> +	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
> +	    drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
>   		return 1;
>  =20
>   	return 0;
> @@ -1012,8 +927,8 @@ static void dw_hdmi_update_csc_coeffs(struct dw_hd=
mi *hdmi)
>   	unsigned i;
>   	u32 csc_scale =3D 1;
>  =20
> -	is_input_rgb =3D hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_forma=
t);
> -	is_output_rgb =3D hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_for=
mat);
> +	is_input_rgb =3D drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_f=
ormat);
> +	is_output_rgb =3D drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus=
_format);
>  =20
>   	if (!is_input_rgb && is_output_rgb) {
>   		if (hdmi->hdmi_data.enc_out_encoding =3D=3D V4L2_YCBCR_ENC_601)
> @@ -1061,7 +976,7 @@ static void hdmi_video_csc(struct dw_hdmi *hdmi)
>   	else if (is_color_space_decimation(hdmi))
>   		decimation =3D HDMI_CSC_CFG_DECMODE_CHROMA_INT_FORMULA3;
>  =20
> -	switch (hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_format))=
 {
> +	switch (drm_hdmi_bus_fmt_color_depth(hdmi->hdmi_data.enc_out_bus_form=
at)) {
>   	case 8:
>   		color_depth =3D HDMI_CSC_SCALE_CSC_COLORDE_PTH_24BPP;
>   		break;
> @@ -1100,10 +1015,10 @@ static void hdmi_video_packetize(struct dw_hdmi=
 *hdmi)
>   	struct hdmi_data_info *hdmi_data =3D &hdmi->hdmi_data;
>   	u8 val, vp_conf;
>  =20
> -	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
> -	    hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||
> -	    hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
> -		switch (hdmi_bus_fmt_color_depth(
> +	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) ||
> +	    drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format) ||=

> +	    drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {=

> +		switch (drm_hdmi_bus_fmt_color_depth(
>   					hdmi->hdmi_data.enc_out_bus_format)) {
>   		case 8:
>   			color_depth =3D 4;
> @@ -1121,8 +1036,8 @@ static void hdmi_video_packetize(struct dw_hdmi *=
hdmi)
>   		default:
>   			output_select =3D HDMI_VP_CONF_OUTPUT_SELECTOR_BYPASS;
>   		}
> -	} else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)=
) {
> -		switch (hdmi_bus_fmt_color_depth(
> +	} else if (drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_for=
mat)) {
> +		switch (drm_hdmi_bus_fmt_color_depth(
>   					hdmi->hdmi_data.enc_out_bus_format)) {
>   		case 0:
>   		case 8:
> @@ -1641,7 +1556,7 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,=

>   	/* Initialise info frame from DRM mode */
>   	drm_hdmi_avi_infoframe_from_display_mode(&frame, connector, mode);
>  =20
> -	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
> +	if (drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
>   		drm_hdmi_avi_infoframe_quant_range(&frame, connector, mode,
>   						   hdmi->hdmi_data.rgb_limited_range ?
>   						   HDMI_QUANTIZATION_RANGE_LIMITED :
> @@ -1652,17 +1567,17 @@ static void hdmi_config_AVI(struct dw_hdmi *hdm=
i,
>   			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
>   	}
>  =20
> -	if (hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
> +	if (drm_hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
>   		frame.colorspace =3D HDMI_COLORSPACE_YUV444;
> -	else if (hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
> +	else if (drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_forma=
t))
>   		frame.colorspace =3D HDMI_COLORSPACE_YUV422;
> -	else if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
> +	else if (drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_forma=
t))
>   		frame.colorspace =3D HDMI_COLORSPACE_YUV420;
>   	else
>   		frame.colorspace =3D HDMI_COLORSPACE_RGB;
>  =20
>   	/* Set up colorimetry */
> -	if (!hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
> +	if (!drm_hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
>   		switch (hdmi->hdmi_data.enc_out_encoding) {
>   		case V4L2_YCBCR_ENC_601:
>   			if (hdmi->hdmi_data.enc_in_encoding =3D=3D V4L2_YCBCR_ENC_XV601)
> @@ -1864,8 +1779,8 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi=
,
>  =20
>   	vmode->mtmdsclock =3D vmode->mpixelclock;
>  =20
> -	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) {
> -		switch (hdmi_bus_fmt_color_depth(
> +	if (!drm_hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format)) =
{
> +		switch (drm_hdmi_bus_fmt_color_depth(
>   				hdmi->hdmi_data.enc_out_bus_format)) {
>   		case 16:
>   			vmode->mtmdsclock =3D vmode->mpixelclock * 2;
> @@ -1879,7 +1794,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi=
,
>   		}
>   	}
>  =20
> -	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
> +	if (drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format))
>   		vmode->mtmdsclock /=3D 2;
>  =20
>   	dev_dbg(hdmi->dev, "final tmdsclock =3D %d\n", vmode->mtmdsclock);
> @@ -1930,7 +1845,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi=
,
>   	 * When we're setting a YCbCr420 mode, we need
>   	 * to adjust the horizontal timing to suit.
>   	 */
> -	if (hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {
> +	if (drm_hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format)) {=

>   		hdisplay /=3D 2;
>   		hblank /=3D 2;
>   		h_de_hs /=3D 2;
> @@ -2766,7 +2681,7 @@ static const struct drm_bridge_funcs dw_hdmi_brid=
ge_funcs =3D {
>   	.attach =3D dw_hdmi_bridge_attach,
>   	.detach =3D dw_hdmi_bridge_detach,
>   	.atomic_check =3D dw_hdmi_bridge_atomic_check,
> -	.atomic_get_output_bus_fmts =3D dw_hdmi_bridge_atomic_get_output_bus_=
fmts,
> +	.atomic_get_output_bus_fmts =3D drm_atomic_helper_bridge_hdmi_get_out=
put_bus_fmts,
>   	.atomic_get_input_bus_fmts =3D dw_hdmi_bridge_atomic_get_input_bus_f=
mts,
>   	.atomic_enable =3D dw_hdmi_bridge_atomic_enable,
>   	.atomic_disable =3D dw_hdmi_bridge_atomic_disable,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--PQU1izncD7XcVjIaVJIuLSOtLKGccUzZp--

--7kjc2gednRzBFv66soMmTl19X7aCfIXoN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwCtwFAwAAAAAACgkQlh/E3EQov+Ba
Qw/8CxiR1YTiTS/jqKL/aJfKzTGF1Xu593iaPd5jBf1aN1L3xyDcVqIK+yaARmDjU+Ea+MmWWmLa
uT37DTbF1KOny/TQUbg+ZaTASx6Fk8Pw/OGUV0io2qRTHXt6d2+7F0TtfPpnmlEHVrEDq5lDTg4r
gHedI4hnhSpy14L3pGRjNqV9K1IEmajeArqGPwc3Zz0UOKMK51fER0oPgWW2Nd8lSZEg+ceVJ/nz
4Hs6PiywkPuEsdu+5pA45xAqzg4OEd7UxMJ10j0aHBlRlPFDpf+ftyqR6kTmN7+HM+VM5/qamNRX
3hWotOfPi588Cyy5iyzBlKnEQtoCFox/uOFvqmDR2eWcU2W1pVDuTXKcxUtetd3nPHJiDHA9keeV
LAzS2SagKA1Qft1xWAjEwRqV6UmiWui/IYc3FT9w0fsEvx46ki7M0A/lhz1RleLAksmyTV5bn7Ds
+l7rqLAR8U3gIK3yZWIkpX97B8LXxhB6dpF/pdQ8o3kazToWUZ5TuSK87xO5gqgqpE+I1RKspvEu
DALa1uEYBT5hAtY8QUuWuuNqHFxbfMbhEtREUcUpXzvYkS/VclK9zmS4DnSC8jM6d6dT2cPdfyDG
PzoAyzDXm2sznwNc0D9QnC1kuorbOBEXtCSFdMYi8+7totZ5y5ly/uzqJeaJFPMNigqKeK09qcBy
XOg=
=7rVD
-----END PGP SIGNATURE-----

--7kjc2gednRzBFv66soMmTl19X7aCfIXoN--

--===============2038028191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2038028191==--
