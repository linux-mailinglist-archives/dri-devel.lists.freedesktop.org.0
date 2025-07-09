Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A64AFE158
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911D010E753;
	Wed,  9 Jul 2025 07:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oeMyOBce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185B10E753
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0893F43AB8;
 Wed,  9 Jul 2025 07:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC79C4CEF0;
 Wed,  9 Jul 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752046350;
 bh=F/kiRIrGWQs4/5JBt8fnQyLeUlCY6ElHTRFaEDd9rpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oeMyOBce6S935WRVUIUM3aL0ZGhAF3LUUAeW/YO0nNBpYKJsqwqn1xFuFnQXZHBca
 bt+QYBu2odzlDgubNm40UccUaGPpTDiyvjRHbx7Qjf16lFQDcSR5EDIVqB9DabThk7
 FwvPMnpwCjW2M7iBeCBXK5xqnYeoDHsRkNPIeq/KAJUS8CPlkeRqmuLTxueDcgO1O2
 /MpCCxUQxbtiTwv6i/QIxZ9+s83qwYX2+b5TTmIexmKzhJSPkz9qP9kXAEcef5TAYT
 uEBiGNtNalXBQmPcMT89/Kna9u/nFR6dc4VumGsStccgC895qwDHhEEpi7I8pC8onN
 pxK9tsdNH97NQ==
Date: Wed, 9 Jul 2025 09:32:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/sti: hda: convert to devm_drm_bridge_alloc() API
Message-ID: <20250709-foamy-neon-woodpecker-eea693@houat>
References: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
 <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-2-6285de8c3759@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fsxrs37u26bgqqst"
Content-Disposition: inline
In-Reply-To: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-2-6285de8c3759@bootlin.com>
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


--fsxrs37u26bgqqst
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] drm/sti: hda: convert to devm_drm_bridge_alloc() API
MIME-Version: 1.0

Hi,

On Tue, Jul 08, 2025 at 05:24:43PM +0200, Luca Ceresoli wrote:
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
>=20
> This driver was missed during the automated conversion in commit
> 9c399719cfb9 ("drm: convert many bridge drivers from devm_kzalloc() to
> devm_drm_bridge_alloc() API") and following commits.
>=20
> The lack of conversion for this driver is a bug since commit a7748dd127ea
> ("drm/bridge: get/put the bridge reference in drm_bridge_add/remove()")
> which is the first commmit having added a drm_bridge_get/put() pair and
> thus exposing the incorrect initial refcount issue.
>=20
> Fix this by switching the driver to the new API.
>=20
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/ce9c6aa3-5372-468f-a4bf-5a261259e459@=
samsung.com/
> Fixes: a7748dd127ea ("drm/bridge: get/put the bridge reference in drm_bri=
dge_add/remove()")
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/sti/sti_hda.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index d202b6c1eb8f6032fef547c9f00ca9cd2a914520..2c015f563de96ae5895980149=
3ead870c49f70e5 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -246,6 +246,7 @@ struct sti_hda {
>  	struct device dev;
>  	struct drm_device *drm_dev;
>  	struct drm_display_mode mode;
> +	struct drm_bridge bridge;
>  	void __iomem *regs;
>  	void __iomem *video_dacs_ctrl;
>  	struct clk *clk_pix;
> @@ -262,6 +263,11 @@ struct sti_hda_connector {
>  #define to_sti_hda_connector(x) \
>  	container_of(x, struct sti_hda_connector, drm_connector)
> =20
> +static struct sti_hda *drm_bridge_to_sti_hda(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct sti_hda, bridge);
> +}
> +
>  static u32 hda_read(struct sti_hda *hda, int offset)
>  {
>  	return readl(hda->regs + offset);
> @@ -401,7 +407,7 @@ static void sti_hda_configure_awg(struct sti_hda *hda=
, u32 *awg_instr, int nb)
> =20
>  static void sti_hda_disable(struct drm_bridge *bridge)
>  {
> -	struct sti_hda *hda =3D bridge->driver_private;
> +	struct sti_hda *hda =3D drm_bridge_to_sti_hda(bridge);
>  	u32 val;
> =20
>  	if (!hda->enabled)
> @@ -426,7 +432,7 @@ static void sti_hda_disable(struct drm_bridge *bridge)
> =20
>  static void sti_hda_pre_enable(struct drm_bridge *bridge)
>  {
> -	struct sti_hda *hda =3D bridge->driver_private;
> +	struct sti_hda *hda =3D drm_bridge_to_sti_hda(bridge);
>  	u32 val, i, mode_idx;
>  	u32 src_filter_y, src_filter_c;
>  	u32 *coef_y, *coef_c;
> @@ -517,7 +523,7 @@ static void sti_hda_set_mode(struct drm_bridge *bridg=
e,
>  			     const struct drm_display_mode *mode,
>  			     const struct drm_display_mode *adjusted_mode)
>  {
> -	struct sti_hda *hda =3D bridge->driver_private;
> +	struct sti_hda *hda =3D drm_bridge_to_sti_hda(bridge);
>  	u32 mode_idx;
>  	int hddac_rate;
>  	int ret;
> @@ -677,7 +683,6 @@ static int sti_hda_bind(struct device *dev, struct de=
vice *master, void *data)
>  	struct drm_encoder *encoder;
>  	struct sti_hda_connector *connector;
>  	struct drm_connector *drm_connector;
> -	struct drm_bridge *bridge;
>  	int err;
> =20
>  	/* Set the drm device handle */
> @@ -693,13 +698,7 @@ static int sti_hda_bind(struct device *dev, struct d=
evice *master, void *data)
> =20
>  	connector->hda =3D hda;
> =20
> -	bridge =3D devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
> -	if (!bridge)
> -		return -ENOMEM;
> -
> -	bridge->driver_private =3D hda;
> -	bridge->funcs =3D &sti_hda_bridge_funcs;
> -	drm_bridge_attach(encoder, bridge, NULL, 0);
> +	drm_bridge_attach(encoder, &hda->bridge, NULL, 0);

It's not entirely related, but the connector is also allocated right
before and could be moved into the structure instead of storing a
pointer.

Either way,
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--fsxrs37u26bgqqst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG4bDAAKCRAnX84Zoj2+
dqrBAYDEyt9Y6J9ulC2nJmtIPZTjnV/XI5Cennr6erV/1J4jTOwHvFbo/20TSstb
DrwXsFQBf0AwAAPHZVh6dTN5+nrVJlNadymA8MrUcHdizDI4WG2SJYLaqBZdqp4J
GaUhxCkOTA==
=R8zb
-----END PGP SIGNATURE-----

--fsxrs37u26bgqqst--
