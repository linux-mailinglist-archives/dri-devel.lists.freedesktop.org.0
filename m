Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66656912081
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 11:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8081810E0A1;
	Fri, 21 Jun 2024 09:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OA+D2Brw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137C110E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:27:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B6D8ECE2BDF;
 Fri, 21 Jun 2024 09:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D042C2BBFC;
 Fri, 21 Jun 2024 09:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718962073;
 bh=pokPztFO8YwQJZMP9X00LnwL1hxHYsz6xOAslWL26tA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OA+D2BrwVB0IYZ56cVGEJwVLPIEQdI3XX+pLBQj3RzVL38dsPlhEcxTMI5k3iclp6
 wIMj/RL6j8DgeFNJvZ3FO5HEE/HkMjrJ0YWTQzMOHEcrfSYpLfQXTLwARikxayuDrM
 wu6FlFTwPXRSqMCv9AtYx9JPFG7KkmKWX2f8eqYu/eE8DBx2imaOpDebo3DiXx+HcM
 JDTkGTuKGPqh8ysoBiHTt/A2gpYDtXCDx/QZBvDKLRZ37KXE6zLz2rYkfpxALqzOw6
 50LCDC7M31I6TJhz1I9k4XpX7AS18iEZdKTsgAMxz9byKWb6R5dpNEbC1AlXf9FwdG
 j+3xYI853blmQ==
Date: Fri, 21 Jun 2024 11:27:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 3/5] drm/connector: implement generic HDMI codec
 helpers
Message-ID: <20240621-glorious-oryx-of-expression-1ad75f@houat>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gjat5kpaoljnvhfy"
Content-Disposition: inline
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
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


--gjat5kpaoljnvhfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for taking some time to review this series.

On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> Several DRM drivers implement HDMI codec support (despite its name it
> applies to both HDMI and DisplayPort drivers). Implement generic
> framework to be used by these drivers. This removes a requirement to
> implement get_eld() callback and provides default implementation for
> codec's plug handling.
>=20
> The framework is integrated with the DRM HDMI Connector framework, but
> can be used by DisplayPort drivers.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/Makefile                   |   1 +
>  drivers/gpu/drm/drm_connector.c            |   8 ++
>  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++++++++++=
++++++
>  include/drm/drm_connector.h                |  33 ++++++
>  4 files changed, 199 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..e113a6eade23 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -45,6 +45,7 @@ drm-y :=3D \
>  	drm_client_modeset.o \
>  	drm_color_mgmt.o \
>  	drm_connector.o \
> +	drm_connector_hdmi_codec.o \
>  	drm_crtc.o \
>  	drm_displayid.o \
>  	drm_drv.o \
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 3d73a981004c..66d6e9487339 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -279,6 +279,7 @@ static int __drm_connector_init(struct drm_device *de=
v,
>  	mutex_init(&connector->mutex);
>  	mutex_init(&connector->edid_override_mutex);
>  	mutex_init(&connector->hdmi.infoframes.lock);
> +	mutex_init(&connector->hdmi_codec.lock);
>  	connector->edid_blob_ptr =3D NULL;
>  	connector->epoch_counter =3D 0;
>  	connector->tile_blob_ptr =3D NULL;
> @@ -529,6 +530,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> =20
>  	connector->hdmi.funcs =3D hdmi_funcs;
> =20
> +	if (connector->hdmi_codec.i2s || connector->hdmi_codec.spdif) {
> +		ret =3D drmm_connector_hdmi_codec_alloc(dev, connector, hdmi_funcs->co=
dec_ops);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> @@ -665,6 +672,7 @@ void drm_connector_cleanup(struct drm_connector *conn=
ector)
>  		connector->funcs->atomic_destroy_state(connector,
>  						       connector->state);
> =20
> +	mutex_destroy(&connector->hdmi_codec.lock);
>  	mutex_destroy(&connector->hdmi.infoframes.lock);
>  	mutex_destroy(&connector->mutex);
> =20
> diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm=
/drm_connector_hdmi_codec.c
> new file mode 100644
> index 000000000000..a3a7ad117f6f
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> @@ -0,0 +1,157 @@
> +/*
> + * Copyright (c) 2024 Linaro Ltd
> + *
> + * Permission to use, copy, modify, distribute, and sell this software a=
nd its
> + * documentation for any purpose is hereby granted without fee, provided=
 that
> + * the above copyright notice appear in all copies and that both that co=
pyright
> + * notice and this permission notice appear in supporting documentation,=
 and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific,
> + * written prior permission.  The copyright holders make no representati=
ons
> + * about the suitability of this software for any purpose.  It is provid=
ed "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOF=
TWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT=
 OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS O=
F USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERF=
ORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_managed.h>
> +
> +#include <sound/hdmi-codec.h>
> +
> +static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *da=
ta,
> +					    uint8_t *buf, size_t len)
> +{
> +	struct drm_connector *connector =3D data;
> +
> +	//  FIXME: locking against drm_edid_to_eld ?
> +	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> +
> +	return 0;
> +}
> +
> +static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
> +						    void *data,
> +						    hdmi_codec_plugged_cb fn,
> +						    struct device *codec_dev)
> +{
> +	struct drm_connector *connector =3D data;
> +
> +	mutex_lock(&connector->hdmi_codec.lock);
> +
> +	connector->hdmi_codec.plugged_cb =3D fn;
> +	connector->hdmi_codec.plugged_cb_dev =3D codec_dev;
> +
> +	fn(codec_dev, connector->hdmi_codec.last_state);
> +
> +	mutex_unlock(&connector->hdmi_codec.lock);
> +
> +	return 0;
> +}
> +
> +void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *conne=
ctor,
> +					     bool plugged)
> +{
> +	mutex_lock(&connector->hdmi_codec.lock);
> +
> +	connector->hdmi_codec.last_state =3D plugged;
> +
> +	if (connector->hdmi_codec.plugged_cb &&
> +	    connector->hdmi_codec.plugged_cb_dev)
> +		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
> +						 connector->hdmi_codec.last_state);
> +
> +	mutex_unlock(&connector->hdmi_codec.lock);
> +}
> +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);

I think we should do this the other way around, or rather, like we do
for drm_connector_hdmi_init. We'll need a hotplug handler for multiple
things (CEC, HDMI 2.0, audio), so it would be best to have a single
function to call from drivers, that will perform whatever is needed
depending on the driver's capabilities.

So something like drm_connector_hdmi_handle_hotplug, which would then do
the above if there's audio support.

> +static void drm_connector_hdmi_codec_cleanup_action(struct drm_device *d=
ev,
> +						    void *ptr)
> +{
> +	struct platform_device *pdev =3D ptr;
> +
> +	platform_device_unregister(pdev);
> +}
> +
> +/**
> + * drmm_connector_hdmi_alloc - Allocate HDMI Codec device for the DRM co=
nnector
> + * @dev: DRM device
> + * @connector: A pointer to the connector to allocate codec for
> + * @ops: callbacks for this connector
> + *
> + * Create a HDMI codec device to be used with the specified connector.
> + *
> + * Cleanup is automatically handled with in a DRM-managed action.
> + *
> + * The connector structure should be allocated with drmm_kzalloc().
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drmm_connector_hdmi_codec_alloc(struct drm_device *dev,
> +				    struct drm_connector *connector,
> +				    const struct hdmi_codec_ops *base_ops)
> +{
> +	struct hdmi_codec_pdata codec_pdata =3D {};
> +	struct platform_device *pdev;
> +	struct hdmi_codec_ops *ops;
> +	int ret;
> +
> +	ops =3D drmm_kmalloc(dev, sizeof(*ops), GFP_KERNEL);
> +	if (!ops)
> +		return -ENOMEM;

Do we actually need to allocate a new structure here?

> +	*ops =3D *base_ops;
> +
> +	ops->get_eld =3D drm_connector_hdmi_codec_get_eld;
> +	ops->hook_plugged_cb =3D drm_connector_hdmi_codec_hook_plugged_cb;
> +
> +	codec_pdata.ops =3D ops;
> +	codec_pdata.i2s =3D connector->hdmi_codec.i2s,
> +	codec_pdata.spdif =3D connector->hdmi_codec.spdif,
> +	codec_pdata.max_i2s_channels =3D connector->hdmi_codec.max_i2s_channels,
> +	codec_pdata.data =3D connector;
> +
> +	pdev =3D platform_device_register_data(connector->hdmi_codec.parent_dev,
> +					     HDMI_CODEC_DRV_NAME,
> +					     PLATFORM_DEVID_AUTO,
> +					     &codec_pdata, sizeof(codec_pdata));

I think parent_dev should be setup by drm_connector_hdmi_init. I guess
what I'm trying to say is that the reason HDMI support has been so
heterogenous is precisely because of the proliferation of functions they
needed to call, and so most drivers were doing the bare minimum until it
worked (or they encountered a bug).

What I was trying to do with the HDMI connector stuff was to make the
easiest approach the one that works according to the spec, for
everything.

Audio is optional, so it should be a togglable thing (either by an
additional function or parameter), but the drivers shouldn't have to set
everything more than what the function requires.

Also, parent_dev is going to be an issue there. IIRC, ASoC will set its
structure as the device data and overwrite whatever we put there.

We worked around it in vc4 by making sure that snd_soc_card was right at
the start of the driver structure and thus both pointers would be equal,
but we have to deal with it here too.

> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);
> +
> +	ret =3D drmm_add_action_or_reset(dev, drm_connector_hdmi_codec_cleanup_=
action, pdev);
> +	if (ret)
> +		return ret;
> +
> +	connector->hdmi_codec.codec_pdev =3D pdev;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drmm_connector_hdmi_codec_alloc);
> +
> +/**
> + * drmm_connector_hdmi_codec_free - rollback drmm_connector_hdmi_codec_a=
lloc
> + * @dev: DRM device
> + * @hdmi_codec: A pointer to the HDMI codec data
> + *
> + * Rollback the drmm_connector_hdmi_codec_alloc() and free allocated dat=
a.
> + * While this function should not be necessary for a typical driver, DRM=
 bridge
> + * drivers have to call it from the remove callback if the bridge uses
> + * Connector's HDMI Codec interface.
> + */
> +void drmm_connector_hdmi_codec_free(struct drm_device *dev,
> +				    struct drm_connector_hdmi_codec *hdmi_codec)
> +{
> +	drmm_release_action(dev, drm_connector_hdmi_codec_cleanup_action,
> +			    hdmi_codec->codec_pdev);
> +}

What would it be useful for?

> +EXPORT_SYMBOL(drmm_connector_hdmi_codec_free);
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f750765d8fbc..0eb8d8ed9495 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -46,6 +46,7 @@ struct drm_property_blob;
>  struct drm_printer;
>  struct drm_privacy_screen;
>  struct edid;
> +struct hdmi_codec_ops;
>  struct i2c_adapter;
> =20
>  enum drm_connector_force {
> @@ -1199,6 +1200,8 @@ struct drm_connector_hdmi_funcs {
>  	int (*write_infoframe)(struct drm_connector *connector,
>  			       enum hdmi_infoframe_type type,
>  			       const u8 *buffer, size_t len);
> +
> +	const struct hdmi_codec_ops *codec_ops;

I think I'd rather have the HDMI connector framework provide the ASoC
hooks, and make the needed pointer casts / lookups to provide a
consistent API to drivers using it.

This will probably also solve the issue mentioned above.

>  };
> =20
>  /**
> @@ -1706,6 +1709,22 @@ struct drm_connector_hdmi {
>  	} infoframes;
>  };
> =20
> +struct drm_connector_hdmi_codec {
> +	struct device *parent_dev;
> +	struct platform_device *codec_pdev;
> +
> +	const struct drm_connector_hdmi_codec_funcs *funcs;
> +
> +	struct mutex lock; /* protects last_state and plugged_cb */
> +	void (*plugged_cb)(struct device *dev, bool plugged);
> +	struct device *plugged_cb_dev;
> +	bool last_state;
> +
> +	int max_i2s_channels;
> +	uint i2s: 1;
> +	uint spdif: 1;
> +};

It would be great to have some documentation on what those are,
last_state and the mutex especially raise attention :)


>  /**
>   * struct drm_connector - central DRM connector control structure
>   *
> @@ -2119,6 +2138,12 @@ struct drm_connector {
>  	 * @hdmi: HDMI-related variable and properties.
>  	 */
>  	struct drm_connector_hdmi hdmi;
> +
> +	/**
> +	 * @hdmi_codec: HDMI codec properties and variables. Also might be used
> +	 * for DisplayPort audio.
> +	 */
> +	struct drm_connector_hdmi_codec hdmi_codec;

I'd rather make this part of drm_connector_hdmi, it cannot work without it.

Maxime

--gjat5kpaoljnvhfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnVHlQAKCRDj7w1vZxhR
xWNTAQD6R0h1ls8a6OHge64dniIUKO/6yqAtc8KifbinTlziZwD/XU0cxUF5m4x/
bA9xk/l+YZkxQLqhxX4gYppzcEIbCgc=
=U9/M
-----END PGP SIGNATURE-----

--gjat5kpaoljnvhfy--
