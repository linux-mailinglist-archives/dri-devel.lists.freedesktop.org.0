Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D2506CAB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 14:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BE410E7FF;
	Tue, 19 Apr 2022 12:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D9E10E7FF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 12:42:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E1765C0116;
 Tue, 19 Apr 2022 08:42:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 19 Apr 2022 08:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650372123; x=1650458523; bh=2CW91igEwe
 PZegpDjL9foZp6k13ppbUBF40Tcqf+HVQ=; b=BOiHcyv2jJej6NpzNAjMwylAoo
 ZICE9iXbu8c3L+1t1WwuFdRwupaoBuSsj2dM56aXt7etOKRmOFN04XQjodC996lG
 nGwrTZvpEM/DArKXcVIREpjLWDw9b40O3EkVeW4wBU0Yk3dUUp/9Jy9uOq/LuWt8
 Gg+/4My4WNkClh3UMEVtWv44ihQYqZLGsKW8jONCCmGsuMHjLlFSL8Chf8Q+S8NO
 zEewGCwaGw2ct8dTBMsTQeGrMtc3KhQbcwlWzFKNLaKVg3qYhdTGOrvW94swIvSo
 k7xHZuqLCovoIersC8ypsGxnm578xSHd0Ck0CQTVL338q5ZuxNJrD9H5HP0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650372123; x=
 1650458523; bh=2CW91igEwePZegpDjL9foZp6k13ppbUBF40Tcqf+HVQ=; b=O
 JAR5WklXjDWJmAoYHjaTV+6Jf0iRSd4Xu5ghdjjl/ahAh9ZSTHHhSfl/nR+fK5HZ
 SesihjpeexQ2SdDo5qlG+wB0Znmex/0RUf1A5LA4PRbAFqYnVuGW0dYC6+7VuJIS
 iDHIE9O/0mRsivsivm4/BUDWdLB4hY+L3tiaiA2xSgJIXItZ6rltMrWFKcbZTOzB
 URLEjPOUEXlJ6jnBD8f0vMTuA9C481Y25hXCWZUrhnK48ybu0m+3tQ5UjfNB2Y64
 kdbyKEeJvCW/t75UQYJ7l/+hpWpGNuvFeRfy34ovfvKonTCulufreAlOLTPFUddg
 YU94oH5GEoya5eE7AUb2g==
X-ME-Sender: <xms:G65eYm0T8jxf1CpeIZfxLXG00gR3QaPMHewDOUOxBriebLFvskQeGg>
 <xme:G65eYpFP-CYJN4OZlpGWCQBZZgZk1c1UiKjeDStgyXyzX_RfcWwINAA4NWt5FYucf
 fF5-hY75Bzr3fC6tvM>
X-ME-Received: <xmr:G65eYu5-Qr4PZmLkKNIE_8tuzYeAejKWsFnfa8fxguwf3jG0za7AD6LOMIUIM66CiTSVu-9c21VTiiojlySt2NH-OgII1omn7CtHCBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtfedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G65eYn1LpWxGBED7QHhmyp7tFREdm3Y_NqcoAXAJGLphHBRCAdLAKQ>
 <xmx:G65eYpE2s_24hYdR44fMvc1ZlUJKWjJEy5VN2b-Jm2De0a12x2_ryw>
 <xmx:G65eYg8e55RB7egfaMLsy2ihAB3gcoruDZZ5r7B8C9OQRcESK7pTyg>
 <xmx:G65eYu4tb7a0I47S3e2vGAbTo15Xm2gphMXFu9nPJ-_TyauOERyBtw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Apr 2022 08:42:02 -0400 (EDT)
Date: Tue, 19 Apr 2022 14:41:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/vc4: hdmi: Remove vc4_hdmi_encoder.hdmi_monitor
Message-ID: <20220419124159.2fjadxdornszocrk@houat>
References: <20220415154745.170597-1-jose.exposito89@gmail.com>
 <20220415154745.170597-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tlaqz3cdfyvvwz3z"
Content-Disposition: inline
In-Reply-To: <20220415154745.170597-3-jose.exposito89@gmail.com>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tlaqz3cdfyvvwz3z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 15, 2022 at 05:47:45PM +0200, Jos=E9 Exp=F3sito wrote:
> The vc4_hdmi_encoder.hdmi_monitor field was used to cache the value
> returned by drm_detect_hdmi_monitor() in order to avoid calling it
> multiple times.
>=20
> Now that drm_detect_hdmi_monitor() has been replaced with
> drm_display_info.is_hdmi, there is no need to cache it in the driver
> encoder struct.
>=20
> Remove vc4_hdmi_encoder.hdmi_monitor and use drm_display_info.is_hdmi
> instead.
>=20
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
>  2 files changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index ecdb1ffc2023..9c73a211ae80 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -107,9 +107,9 @@ static bool vc4_hdmi_mode_needs_scrambling(const stru=
ct drm_display_mode *mode)
>  static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
>  				       const struct drm_display_mode *mode)
>  {
> -	struct vc4_hdmi_encoder *vc4_encoder =3D &vc4_hdmi->encoder;
> +	struct drm_display_info *display =3D &vc4_hdmi->connector.display_info;
> =20
> -	return !vc4_encoder->hdmi_monitor ||
> +	return !display->is_hdmi ||
>  		drm_default_rgb_quant_range(mode) =3D=3D HDMI_QUANTIZATION_RANGE_FULL;
>  }
> =20
> @@ -216,7 +216,6 @@ vc4_hdmi_connector_detect(struct drm_connector *conne=
ctor, bool force)
> =20
>  			if (edid) {
>  				cec_s_phys_addr_from_edid(vc4_hdmi->cec_adap, edid);
> -				vc4_hdmi->encoder.hdmi_monitor =3D connector->display_info.is_hdmi;

I think the first patch could be squashed into this one

>  				kfree(edid);
>  			}
>  		}
> @@ -242,7 +241,6 @@ static void vc4_hdmi_connector_destroy(struct drm_con=
nector *connector)
>  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
> -	struct vc4_hdmi_encoder *vc4_encoder =3D &vc4_hdmi->encoder;
>  	int ret =3D 0;
>  	struct edid *edid;
> =20
> @@ -255,8 +253,6 @@ static int vc4_hdmi_connector_get_modes(struct drm_co=
nnector *connector)
>  		goto out;
>  	}
> =20
> -	vc4_encoder->hdmi_monitor =3D connector->display_info.is_hdmi;
> -
>  	drm_connector_update_edid_property(connector, edid);
>  	ret =3D drm_add_edid_modes(connector, edid);
>  	kfree(edid);
> @@ -578,13 +574,12 @@ static void vc4_hdmi_set_infoframes(struct drm_enco=
der *encoder)
>  static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
>  					 struct drm_display_mode *mode)
>  {
> -	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder);
>  	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  	struct drm_display_info *display =3D &vc4_hdmi->connector.display_info;
> =20
>  	lockdep_assert_held(&vc4_hdmi->mutex);
> =20
> -	if (!vc4_encoder->hdmi_monitor)
> +	if (!display->is_hdmi)
>  		return false;
> =20
>  	if (!display->hdmi.scdc.supported ||
> @@ -1147,7 +1142,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struc=
t drm_encoder *encoder,
>  {
>  	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  	struct drm_display_mode *mode =3D &vc4_hdmi->saved_adjusted_mode;
> -	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder);
> +	struct drm_display_info *display =3D &vc4_hdmi->connector.display_info;
>  	bool hsync_pos =3D mode->flags & DRM_MODE_FLAG_PHSYNC;
>  	bool vsync_pos =3D mode->flags & DRM_MODE_FLAG_PVSYNC;
>  	unsigned long flags;
> @@ -1168,7 +1163,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struc=
t drm_encoder *encoder,
>  	HDMI_WRITE(HDMI_VID_CTL,
>  		   HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_BLANKPIX);
> =20
> -	if (vc4_encoder->hdmi_monitor) {
> +	if (display->is_hdmi) {
>  		HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
>  			   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
>  			   VC4_HDMI_SCHEDULER_CONTROL_MODE_HDMI);
> @@ -1195,7 +1190,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struc=
t drm_encoder *encoder,
>  			  "!VC4_HDMI_SCHEDULER_CONTROL_HDMI_ACTIVE\n");
>  	}
> =20
> -	if (vc4_encoder->hdmi_monitor) {
> +	if (display->is_hdmi) {
>  		spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
> =20
>  		WARN_ON(!(HDMI_READ(HDMI_SCHEDULER_CONTROL) &
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdm=
i.h
> index 1076faeab616..44977002445f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -11,7 +11,6 @@
>  /* VC4 HDMI encoder KMS struct */
>  struct vc4_hdmi_encoder {
>  	struct vc4_encoder base;
> -	bool hdmi_monitor;
>  };

And vc4_hdmi_encoder doesn't hold anything anymore now, so it can be
removed as well. Doing it in a subsequent patch would probably be the
most readable.

Thanks!
Maxime

--tlaqz3cdfyvvwz3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYl6uDAAKCRDj7w1vZxhR
xb26AP4qmTCMJsoyhGfRmeNGezGrZz1LlSEaEoWXWFeq84ErQQD+LCu2JVg40UH6
fqYdsSAZzRKTG0er8f0DZNdc6f4DWw4=
=hGU/
-----END PGP SIGNATURE-----

--tlaqz3cdfyvvwz3z--
