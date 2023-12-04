Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947CF802DBD
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7AF10E2EC;
	Mon,  4 Dec 2023 09:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFE710E1E9;
 Mon,  4 Dec 2023 09:00:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 019CDCE0E54;
 Mon,  4 Dec 2023 09:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99424C433C8;
 Mon,  4 Dec 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701680422;
 bh=kTk/FMT1KfBdMsUbh6k7mndZwOboypNrqNc3z0K4YIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g6eudHG3xwv7ybQA6Yhz4IwzesZ+x398p11YdjUpW29XTnnA83IxQZTvC4sJMsFhf
 vSsSf64j485RxRIS9s+tXrSwOgqcmEm55kNpak4pDE+lYbyNfpXEAYmjy3yk/W1ov/
 pxGrPTyLoXwGQRec0xgCEzekgK0RI6j9vdw4LhMMvYQZn8PmHmHfOEes6IzY5M2u8c
 WrPQCro3pH5YFpeTbFWhHVF84jTo2ffIUumdDRpsXDXGtOn8E+dKOBqjY0qEKsO2KM
 FPJPHW7O2AGjS9hgF8/x8/b+BvQ0WnvbolsGJCh24x7PybswMQuf4BpJP7Pd6wnTi4
 uFQww8ibYAJkw==
Date: Mon, 4 Dec 2023 10:00:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND v2 1/3] drm/encoder: register per-encoder debugfs
 dir
Message-ID: <2ldbif6vidsfj65gp2v5tkoobdsnget2w6q6o4mtie4mjcoxvu@uhllchrdrjs2>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="myqmtjw23q5jirb2"
Content-Disposition: inline
In-Reply-To: <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--myqmtjw23q5jirb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 03, 2023 at 02:53:13PM +0300, Dmitry Baryshkov wrote:
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/drm_encoder.c  |  4 ++++
>  drivers/gpu/drm/drm_internal.h |  9 +++++++++
>  include/drm/drm_encoder.h      | 16 +++++++++++++++-
>  4 files changed, 53 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index f291fb4b359f..00406b4f3235 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -589,4 +589,29 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>  	crtc->debugfs_entry =3D NULL;
>  }
> =20
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +	struct drm_minor *minor =3D encoder->dev->primary;
> +	struct dentry *root;
> +	char *name;
> +
> +	name =3D kasprintf(GFP_KERNEL, "encoder-%d", encoder->index);
> +	if (!name)
> +		return;
> +
> +	root =3D debugfs_create_dir(name, minor->debugfs_root);
> +	kfree(name);
> +
> +	encoder->debugfs_entry =3D root;
> +
> +	if (encoder->funcs->debugfs_init)
> +		encoder->funcs->debugfs_init(encoder, root);
> +}
> +
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
> +{
> +	debugfs_remove_recursive(encoder->debugfs_entry);
> +	encoder->debugfs_entry =3D NULL;
> +}
> +
>  #endif /* CONFIG_DEBUG_FS */
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 1143bc7f3252..8f2bc6a28482 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_print.h>
> =20
>  #include "drm_crtc_internal.h"
> +#include "drm_internal.h"
> =20
>  /**
>   * DOC: overview
> @@ -74,6 +75,8 @@ int drm_encoder_register_all(struct drm_device *dev)
>  	int ret =3D 0;
> =20
>  	drm_for_each_encoder(encoder, dev) {
> +		drm_debugfs_encoder_add(encoder);
> +
>  		if (encoder->funcs && encoder->funcs->late_register)
>  			ret =3D encoder->funcs->late_register(encoder);
>  		if (ret)
> @@ -90,6 +93,7 @@ void drm_encoder_unregister_all(struct drm_device *dev)
>  	drm_for_each_encoder(encoder, dev) {
>  		if (encoder->funcs && encoder->funcs->early_unregister)
>  			encoder->funcs->early_unregister(encoder);
> +		drm_debugfs_encoder_remove(encoder);
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_interna=
l.h
> index b12c463bc460..7df17e4b0513 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -194,6 +194,8 @@ void drm_debugfs_connector_remove(struct drm_connecto=
r *connector);
>  void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
> +void drm_debugfs_encoder_add(struct drm_encoder *encoder);
> +void drm_debugfs_encoder_remove(struct drm_encoder *encoder);
>  #else
>  static inline void drm_debugfs_dev_fini(struct drm_device *dev)
>  {
> @@ -231,6 +233,13 @@ static inline void drm_debugfs_crtc_crc_add(struct d=
rm_crtc *crtc)
>  {
>  }
> =20
> +static inline void drm_debugfs_encoder_add(struct drm_encoder *encoder)
> +{
> +}

<- You need to insert a new line here.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--myqmtjw23q5jirb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2VIwAKCRDj7w1vZxhR
xfjoAP4xvwxFS9poLETIETd2j+ZzM2DobxAsw6WVncGDt9Q/FAEAtcBT/3gZyO3W
Gvpo3+k88LvgJeH5LIhahdySxcawZQY=
=pyU4
-----END PGP SIGNATURE-----

--myqmtjw23q5jirb2--
