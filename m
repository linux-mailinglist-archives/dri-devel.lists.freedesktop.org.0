Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9352B8E6E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB80B89FAD;
	Thu, 19 Nov 2020 09:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D539A89FAD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:12:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 651B4AA4F;
 Thu, 19 Nov 2020 09:12:44 +0000 (UTC)
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-8-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 7/7] drm/vc4: kms: Don't disable the muxing of an
 active CRTC
Message-ID: <2e61b179-35f3-f4b3-9ec0-c822370da663@suse.de>
Date: Thu, 19 Nov 2020 10:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105135656.383350-8-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0605483861=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0605483861==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wUXyLnvODDduSOwUJMGIGbha6mdCCp3Cl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wUXyLnvODDduSOwUJMGIGbha6mdCCp3Cl
Content-Type: multipart/mixed; boundary="Y0tvX8j0sV8ZwJ1IfqwyAs19pfnM36AkO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-rpi-kernel@lists.infradead.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Message-ID: <2e61b179-35f3-f4b3-9ec0-c822370da663@suse.de>
Subject: Re: [PATCH v3 7/7] drm/vc4: kms: Don't disable the muxing of an
 active CRTC
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-8-maxime@cerno.tech>
In-Reply-To: <20201105135656.383350-8-maxime@cerno.tech>

--Y0tvX8j0sV8ZwJ1IfqwyAs19pfnM36AkO
Content-Type: multipart/mixed;
 boundary="------------52B80DD9E187450BC308E5C7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------52B80DD9E187450BC308E5C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.20 um 14:56 schrieb Maxime Ripard:
> The current HVS muxing code will consider the CRTCs in a given state to=

> setup their muxing in the HVS, and disable the other CRTCs muxes.
>=20
> However, it's valid to only update a single CRTC with a state, and in t=
his
> situation we would mux out a CRTC that was enabled but left untouched b=
y
> the new state.
>=20
> Fix this by setting a flag on the CRTC state when the muxing has been
> changed, and only change the muxing configuration when that flag is the=
re.
>=20
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatic=
ally")
> Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.h |  1 +
>   drivers/gpu/drm/vc4/vc4_kms.c | 82 ++++++++++++++++++++--------------=
-
>   2 files changed, 48 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index 014113823647..325b53ff11b3 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -524,6 +524,7 @@ struct vc4_crtc_state {
>   	struct drm_mm_node mm;
>   	bool feed_txp;
>   	bool txp_armed;
> +	bool needs_muxing;

Maybe rather 'update_muxing'.

More generally, I'd separate fields that contain actual CRTC state, such =

assigned_channel, from those that only contain transitional state during =

update-commit, such as needs_muxing.

>   	unsigned int assigned_channel;
>  =20
>   	struct {
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> index 0a231ae500e5..7ef164afa9e2 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -226,10 +226,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_de=
v *vc4,
>   {
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_crtc *crtc;
> -	unsigned char dsp2_mux =3D 0;
> -	unsigned char dsp3_mux =3D 3;
> -	unsigned char dsp4_mux =3D 3;
> -	unsigned char dsp5_mux =3D 3;
> +	unsigned char mux;
>   	unsigned int i;
>   	u32 reg;
>  =20
> @@ -237,50 +234,59 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_d=
ev *vc4,
>   		struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(crtc_state);=

>   		struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>  =20
> -		if (!crtc_state->active)
> +		if (!vc4_state->needs_muxing)
>   			continue;
>  =20
>   		switch (vc4_crtc->data->hvs_output) {
>   		case 2:
> -			dsp2_mux =3D (vc4_state->assigned_channel =3D=3D 2) ? 0 : 1;
> +			mux =3D (vc4_state->assigned_channel =3D=3D 2) ? 0 : 1;
> +			reg =3D HVS_READ(SCALER_DISPECTRL);
> +			HVS_WRITE(SCALER_DISPECTRL,
> +				  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPECTRL_DSP2_MUX));
>   			break;
>  =20
>   		case 3:
> -			dsp3_mux =3D vc4_state->assigned_channel;
> +			if (vc4_state->assigned_channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
> +				mux =3D 3;
> +			else
> +				mux =3D vc4_state->assigned_channel;
> +
> +			reg =3D HVS_READ(SCALER_DISPCTRL);
> +			HVS_WRITE(SCALER_DISPCTRL,
> +				  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPCTRL_DSP3_MUX));
>   			break;
>  =20
>   		case 4:
> -			dsp4_mux =3D vc4_state->assigned_channel;
> +			if (vc4_state->assigned_channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
> +				mux =3D 3;
> +			else
> +				mux =3D vc4_state->assigned_channel;
> +
> +			reg =3D HVS_READ(SCALER_DISPEOLN);
> +			HVS_WRITE(SCALER_DISPEOLN,
> +				  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPEOLN_DSP4_MUX));
> +
>   			break;
>  =20
>   		case 5:
> -			dsp5_mux =3D vc4_state->assigned_channel;
> +			if (vc4_state->assigned_channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
> +				mux =3D 3;
> +			else
> +				mux =3D vc4_state->assigned_channel;
> +
> +			reg =3D HVS_READ(SCALER_DISPDITHER);
> +			HVS_WRITE(SCALER_DISPDITHER,
> +				  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
> +				  VC4_SET_FIELD(mux, SCALER_DISPDITHER_DSP5_MUX));
>   			break;
>  =20
>   		default:
>   			break;
>   		}
>   	}
> -
> -	reg =3D HVS_READ(SCALER_DISPECTRL);
> -	HVS_WRITE(SCALER_DISPECTRL,
> -		  (reg & ~SCALER_DISPECTRL_DSP2_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp2_mux, SCALER_DISPECTRL_DSP2_MUX));
> -
> -	reg =3D HVS_READ(SCALER_DISPCTRL);
> -	HVS_WRITE(SCALER_DISPCTRL,
> -		  (reg & ~SCALER_DISPCTRL_DSP3_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp3_mux, SCALER_DISPCTRL_DSP3_MUX));
> -
> -	reg =3D HVS_READ(SCALER_DISPEOLN);
> -	HVS_WRITE(SCALER_DISPEOLN,
> -		  (reg & ~SCALER_DISPEOLN_DSP4_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp4_mux, SCALER_DISPEOLN_DSP4_MUX));
> -
> -	reg =3D HVS_READ(SCALER_DISPDITHER);
> -	HVS_WRITE(SCALER_DISPDITHER,
> -		  (reg & ~SCALER_DISPDITHER_DSP5_MUX_MASK) |
> -		  VC4_SET_FIELD(dsp5_mux, SCALER_DISPDITHER_DSP5_MUX));
>   }
>  =20
>   static void
> @@ -787,17 +793,23 @@ static int vc4_pv_muxing_atomic_check(struct drm_=
device *dev,
>   		struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>   		unsigned int matching_channels;
>  =20
> +		/* Nothing to do here, let's skip it */
> +		if ((old_crtc_state->enable && new_crtc_state->enable) ||
> +		    (!old_crtc_state->enable && !new_crtc_state->enable)) {

'if (old_crtc_state->enable =3D=3D new_crtc_state->enable)' ?

> +			new_vc4_crtc_state->needs_muxing =3D false;

Shouldn't this be cleared after duplicating the crtc state? No need to=20
clear it then.

> +			continue;
> +		}
> +
> +		/* Muxing will need to be modified, mark it as such */
> +		new_vc4_crtc_state->needs_muxing =3D true;
> +
> +		/* If we're disabling our CRTC, we put back our channel */
>   		if (old_crtc_state->enable && !new_crtc_state->enable) {

You've already checked that enable is different, so you can leave out=20
the test on old_crtc_state->enable

With my suggestions considered

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>


>   			hvs_state->unassigned_channels |=3D BIT(old_vc4_crtc_state->assign=
ed_channel);
>   			new_vc4_crtc_state->assigned_channel =3D VC4_HVS_CHANNEL_DISABLED;=

> +			continue;
>   		}
>  =20
> -		if (!new_crtc_state->enable)
> -			continue;
> -
> -		if (new_vc4_crtc_state->assigned_channel !=3D VC4_HVS_CHANNEL_DISABL=
ED)
> -			continue;
> -
>   		/*
>   		 * The problem we have to solve here is that we have
>   		 * up to 7 encoders, connected to up to 6 CRTCs.
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------52B80DD9E187450BC308E5C7
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------52B80DD9E187450BC308E5C7--

--Y0tvX8j0sV8ZwJ1IfqwyAs19pfnM36AkO--

--wUXyLnvODDduSOwUJMGIGbha6mdCCp3Cl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+2NwsFAwAAAAAACgkQlh/E3EQov+AO
3hAAzggZ5ZpyR/kurwTA4bPY8qj+VR70HGeuvvzzr4rCHy9fPhmbHAQos3yvRyZftpB4MyjxQELV
U07pWJZXRjxLrbJcT4HtKKNeU+LsvNonKiCxl+y0t+6VnfscD4jrksPOg1S8gTUGXrARXxkdi3Wq
5wNr2CqDmfAVAugfYqN/VXR4HSMw06Z+o6ksvOb7XAGAgSClGDpp4wcvVuKsQ5wxaa4SbAq0t8k/
mvV+1iUwyFKEXw/5kuOjr6QN+uRMC4gASADvCG/kxfHSgFarjWPjGnEnG0UZ7PMmlnuivXLjfadj
Et+Nwl//RkWRzPrjp68xxxzwCvjFvGg0Vn8npelAn468ezrGiikpChxoT8idMCa8KZFkvH9BmJX1
druhrLYA4gNA49axjAsaBtTWGTgvCj2YXMoM9gCJiInNJ4W452xBzPu5EAL9vUxF0OiMHrIoboUv
eb1pRx0FqQaSOnhsz5aTuk/0MLqiOTYCTy6FAizO6nz4iFHk13td8xmOLWLU7N+95rHtgWhDy7Uw
wVoh0kVKbh88Zvog8/Qo6aUZdb8+/FDfd87xfrdw6QKFseK5k3KdlJQzZG2kvDNP9m/alZP7RYcA
nHD4yuBAg0CWIPEt1PQA6aT618xPtl4cGLgW7gQgQVagbbioQTrPDJpV5AXqB0rb9Pzc3dUpzmAF
86A=
=pTI1
-----END PGP SIGNATURE-----

--wUXyLnvODDduSOwUJMGIGbha6mdCCp3Cl--

--===============0605483861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0605483861==--
