Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB3491A2FC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867DD10E201;
	Thu, 27 Jun 2024 09:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XmLrJUUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538DE10E200
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8894461DF9;
 Thu, 27 Jun 2024 09:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4282C2BBFC;
 Thu, 27 Jun 2024 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719481780;
 bh=RgTirmPz5PxzyKVzsw6A6uXomjybYp5odD63KoO0xpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmLrJUUUNN4Aoo10vgGrXVSKW4YYlZjh+W5OErRCNKBkTsfwi7+iPuyOJeZR/l37I
 FC7HPcPC0wXIxWULcTMmaMU4IJDQC2p5lzC2oovihdYPBi6fw6DUJiSlHREdjTyC15
 dSPnbzhP/Xm7185Lgy2cpMsCgId7RKMBlyReD6qtlNQS1oCNl1iiPOQRWmgBnIMsdd
 K9WVOdJ956wsNeQSQXsj7GAfaDnowiofBieNnJi1ndpbPtbXij6NCXivrYZJ/T/JQn
 uTT6udz9R3kBDe1aL3WS2wwEKogsuaxCxv6gw5K+kYEXo/GEh5HP7CU30WHdZGKMKF
 Oh6SWSKpI5JQQ==
Date: Thu, 27 Jun 2024 11:49:37 +0200
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
Message-ID: <20240627-meaty-bullfrog-of-refinement-cc9d85@houat>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat>
 <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
 <20240626-spiked-heavenly-kakapo-1dafce@houat>
 <pkfbp4xyg5za3vnlpryhbflb6nvp7s3bs3542wk3y5zsonoy7l@y5qcua6kfi4h>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lixt5lpk3572sq6h"
Content-Disposition: inline
In-Reply-To: <pkfbp4xyg5za3vnlpryhbflb6nvp7s3bs3542wk3y5zsonoy7l@y5qcua6kfi4h>
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


--lixt5lpk3572sq6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 07:09:34PM GMT, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 04:05:01PM GMT, Maxime Ripard wrote:
> > On Fri, Jun 21, 2024 at 02:09:04PM GMT, Dmitry Baryshkov wrote:
> > > On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > >
> > > > Hi,
> > > >
> > > > Sorry for taking some time to review this series.
> > >=20
> > > No problem, that's not long.
> > >=20
> > > >
> > > > On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrote:
> > > > > Several DRM drivers implement HDMI codec support (despite its nam=
e it
> > > > > applies to both HDMI and DisplayPort drivers). Implement generic
> > > > > framework to be used by these drivers. This removes a requirement=
 to
> > > > > implement get_eld() callback and provides default implementation =
for
> > > > > codec's plug handling.
> > > > >
> > > > > The framework is integrated with the DRM HDMI Connector framework=
, but
> > > > > can be used by DisplayPort drivers.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/Makefile                   |   1 +
> > > > >  drivers/gpu/drm/drm_connector.c            |   8 ++
> > > > >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++++++++=
++++++++++++++
> > > > >  include/drm/drm_connector.h                |  33 ++++++
> > > > >  4 files changed, 199 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > > > index 68cc9258ffc4..e113a6eade23 100644
> > > > > --- a/drivers/gpu/drm/Makefile
> > > > > +++ b/drivers/gpu/drm/Makefile
> > > > > @@ -45,6 +45,7 @@ drm-y :=3D \
> > > > >       drm_client_modeset.o \
> > > > >       drm_color_mgmt.o \
> > > > >       drm_connector.o \
> > > > > +     drm_connector_hdmi_codec.o \
> > > > >       drm_crtc.o \
> > > > >       drm_displayid.o \
> > > > >       drm_drv.o \
> > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/dr=
m_connector.c
> > > > > index 3d73a981004c..66d6e9487339 100644
> > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > @@ -279,6 +279,7 @@ static int __drm_connector_init(struct drm_de=
vice *dev,
> > > > >       mutex_init(&connector->mutex);
> > > > >       mutex_init(&connector->edid_override_mutex);
> > > > >       mutex_init(&connector->hdmi.infoframes.lock);
> > > > > +     mutex_init(&connector->hdmi_codec.lock);
> > > > >       connector->edid_blob_ptr =3D NULL;
> > > > >       connector->epoch_counter =3D 0;
> > > > >       connector->tile_blob_ptr =3D NULL;
> > > > > @@ -529,6 +530,12 @@ int drmm_connector_hdmi_init(struct drm_devi=
ce *dev,
> > > > >
> > > > >       connector->hdmi.funcs =3D hdmi_funcs;
> > > > >
> > > > > +     if (connector->hdmi_codec.i2s || connector->hdmi_codec.spdi=
f) {
> > > > > +             ret =3D drmm_connector_hdmi_codec_alloc(dev, connec=
tor, hdmi_funcs->codec_ops);
> > > > > +             if (ret)
> > > > > +                     return ret;
> > > > > +     }
> > > > > +
> > > > >       return 0;
> > > > >  }
> > > > >  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> > > > > @@ -665,6 +672,7 @@ void drm_connector_cleanup(struct drm_connect=
or *connector)
> > > > >               connector->funcs->atomic_destroy_state(connector,
> > > > >                                                      connector->s=
tate);
> > > > >
> > > > > +     mutex_destroy(&connector->hdmi_codec.lock);
> > > > >       mutex_destroy(&connector->hdmi.infoframes.lock);
> > > > >       mutex_destroy(&connector->mutex);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers=
/gpu/drm/drm_connector_hdmi_codec.c
> > > > > new file mode 100644
> > > > > index 000000000000..a3a7ad117f6f
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
> > > > > @@ -0,0 +1,157 @@
> > > > > +/*
> > > > > + * Copyright (c) 2024 Linaro Ltd
> > > > > + *
> > > > > + * Permission to use, copy, modify, distribute, and sell this so=
ftware and its
> > > > > + * documentation for any purpose is hereby granted without fee, =
provided that
> > > > > + * the above copyright notice appear in all copies and that both=
 that copyright
> > > > > + * notice and this permission notice appear in supporting docume=
ntation, and
> > > > > + * that the name of the copyright holders not be used in adverti=
sing or
> > > > > + * publicity pertaining to distribution of the software without =
specific,
> > > > > + * written prior permission.  The copyright holders make no repr=
esentations
> > > > > + * about the suitability of this software for any purpose.  It i=
s provided "as
> > > > > + * is" without express or implied warranty.
> > > > > + *
> > > > > + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO =
THIS SOFTWARE,
> > > > > + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNE=
SS, IN NO
> > > > > + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, =
INDIRECT OR
> > > > > + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FRO=
M LOSS OF USE,
> > > > > + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE=
 OR OTHER
> > > > > + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE=
 OR PERFORMANCE
> > > > > + * OF THIS SOFTWARE.
> > > > > + */
> > > > > +
> > > > > +#include <linux/mutex.h>
> > > > > +#include <linux/platform_device.h>
> > > > > +
> > > > > +#include <drm/drm_connector.h>
> > > > > +#include <drm/drm_managed.h>
> > > > > +
> > > > > +#include <sound/hdmi-codec.h>
> > > > > +
> > > > > +static int drm_connector_hdmi_codec_get_eld(struct device *dev, =
void *data,
> > > > > +                                         uint8_t *buf, size_t le=
n)
> > > > > +{
> > > > > +     struct drm_connector *connector =3D data;
> > > > > +
> > > > > +     //  FIXME: locking against drm_edid_to_eld ?
> > > > > +     memcpy(buf, connector->eld, min(sizeof(connector->eld), len=
));
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct devic=
e *dev,
> > > > > +                                                 void *data,
> > > > > +                                                 hdmi_codec_plug=
ged_cb fn,
> > > > > +                                                 struct device *=
codec_dev)
> > > > > +{
> > > > > +     struct drm_connector *connector =3D data;
> > > > > +
> > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > +
> > > > > +     connector->hdmi_codec.plugged_cb =3D fn;
> > > > > +     connector->hdmi_codec.plugged_cb_dev =3D codec_dev;
> > > > > +
> > > > > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > > > > +
> > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +void drm_connector_hdmi_codec_plugged_notify(struct drm_connecto=
r *connector,
> > > > > +                                          bool plugged)
> > > > > +{
> > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > +
> > > > > +     connector->hdmi_codec.last_state =3D plugged;
> > > > > +
> > > > > +     if (connector->hdmi_codec.plugged_cb &&
> > > > > +         connector->hdmi_codec.plugged_cb_dev)
> > > > > +             connector->hdmi_codec.plugged_cb(connector->hdmi_co=
dec.plugged_cb_dev,
> > > > > +                                              connector->hdmi_co=
dec.last_state);
> > > > > +
> > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > > >
> > > > I think we should do this the other way around, or rather, like we =
do
> > > > for drm_connector_hdmi_init. We'll need a hotplug handler for multi=
ple
> > > > things (CEC, HDMI 2.0, audio), so it would be best to have a single
> > > > function to call from drivers, that will perform whatever is needed
> > > > depending on the driver's capabilities.
> > >=20
> > > I see, this API is probably misnamed. The hdmi_codec_ops use the
> > > 'plugged' term,
> >=20
> > Is it misnamed?
> >=20
> > It's documented as:
> >=20
> >   Hook callback function to handle connector plug event. Optional.
> >=20
> > > but most of the drivers notify the ASoC / codec during atomic_enable /
> > > atomic_disable path, because usually the audio path can not work with
> > > the video path being disabled.
> >=20
> > That's not clear to me either:
> >=20
> >   - rockchip/cdn-dp, msm/dp/dp-audio, dw-hdmi, seem to call it at
> >     enable/disable
> >=20
> >   - anx7625, mtk_hdmi and mtk_dp calls it in detect
> >=20
> >   - adv7511, ite-it66121, lontium-lt9611, lontium-lt9611uxc, sii902x,
> >     exynos, tda998x, msm_hdmi, sti, tegra, vc4 don't call it at all.
> >=20
> > So it doesn't look like there's a majority we can align with, and
> > neither should we: we need to figure out what we *need* to do and when,
> > and do that.
> >=20
> > From the documentation and quickly through the code though, handling it
> > in detect looks like the right call.
>=20
> It is tempting to have it in the hotplug call. However:
>=20
> - It is used to send events to the ASoC Jack, marking the output as
>   plugged or unplugged. Once the output is plugged, userspace might
>   consider using it for the audio output. Please correct me if I'm
>   wrong, but I don't think one can output audio to the HDMI plug unless
>   there is a video stream.

That's something to check in the HDMI spec and with the ALSA
maintainers.

> - Having it in the hotplug notification chain is also troublesome. As
>   Dave pointed out in the quoted piece of code, it should come after
>   reading the EDID on the connect event. On the disconnect event it
>   should probably come before calling the notification chain, to let
>   audio code interract correctly with the fully enabled display devices.

EDIDs are fetched when hotplug is detected anyway, and we need it for
other things anyway (like CEC).

> Having both points in mind, I think it's better to have those calls in
> enable/disable paths. This way the EDID (for ELD) is definitely read
> without the need to call drm_get_edid manually. The ASoC can start
> playing audio immediately, etc.

Again, it doesn't really matter what is the most convenient. What
matters is what is the correct thing to do, both from the HDMI spec and
ALSA userspace PoV.

And if we can't make that convenient, then maybe we just shouldn't try.

> > > I'll rename this function to something like ..hdmi_codec_enable. or
> > > ... hdmi_codec_set_enabled.
> > >=20
> > > >
> > > > So something like drm_connector_hdmi_handle_hotplug, which would th=
en do
> > > > the above if there's audio support.
> > > >
> > > > > +static void drm_connector_hdmi_codec_cleanup_action(struct drm_d=
evice *dev,
> > > > > +                                                 void *ptr)
> > > > > +{
> > > > > +     struct platform_device *pdev =3D ptr;
> > > > > +
> > > > > +     platform_device_unregister(pdev);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drmm_connector_hdmi_alloc - Allocate HDMI Codec device for th=
e DRM connector
> > > > > + * @dev: DRM device
> > > > > + * @connector: A pointer to the connector to allocate codec for
> > > > > + * @ops: callbacks for this connector
> > > > > + *
> > > > > + * Create a HDMI codec device to be used with the specified conn=
ector.
> > > > > + *
> > > > > + * Cleanup is automatically handled with in a DRM-managed action.
> > > > > + *
> > > > > + * The connector structure should be allocated with drmm_kzalloc=
().
> > > > > + *
> > > > > + * Returns:
> > > > > + * Zero on success, error code on failure.
> > > > > + */
> > > > > +int drmm_connector_hdmi_codec_alloc(struct drm_device *dev,
> > > > > +                                 struct drm_connector *connector,
> > > > > +                                 const struct hdmi_codec_ops *ba=
se_ops)
> > > > > +{
> > > > > +     struct hdmi_codec_pdata codec_pdata =3D {};
> > > > > +     struct platform_device *pdev;
> > > > > +     struct hdmi_codec_ops *ops;
> > > > > +     int ret;
> > > > > +
> > > > > +     ops =3D drmm_kmalloc(dev, sizeof(*ops), GFP_KERNEL);
> > > > > +     if (!ops)
> > > > > +             return -ENOMEM;
> > > >
> > > > Do we actually need to allocate a new structure here?
> > >=20
> > > I didn't want to change the hdmi-codec's logic too much. But maybe
> > > it's really better to have generic ops implementation here that calls
> > > into the driver-specific callbacks.
> > >=20
> > > > > +     *ops =3D *base_ops;
> > > > > +
> > > > > +     ops->get_eld =3D drm_connector_hdmi_codec_get_eld;
> > > > > +     ops->hook_plugged_cb =3D drm_connector_hdmi_codec_hook_plug=
ged_cb;
> > > > > +
> > > > > +     codec_pdata.ops =3D ops;
> > > > > +     codec_pdata.i2s =3D connector->hdmi_codec.i2s,
> > > > > +     codec_pdata.spdif =3D connector->hdmi_codec.spdif,
> > > > > +     codec_pdata.max_i2s_channels =3D connector->hdmi_codec.max_=
i2s_channels,
> > > > > +     codec_pdata.data =3D connector;
> > > > > +
> > > > > +     pdev =3D platform_device_register_data(connector->hdmi_code=
c.parent_dev,
> > > > > +                                          HDMI_CODEC_DRV_NAME,
> > > > > +                                          PLATFORM_DEVID_AUTO,
> > > > > +                                          &codec_pdata, sizeof(c=
odec_pdata));
> > > >
> > > > I think parent_dev should be setup by drm_connector_hdmi_init. I gu=
ess
> > > > what I'm trying to say is that the reason HDMI support has been so
> > > > heterogenous is precisely because of the proliferation of functions=
 they
> > > > needed to call, and so most drivers were doing the bare minimum unt=
il it
> > > > worked (or they encountered a bug).
> > > >
> > > > What I was trying to do with the HDMI connector stuff was to make t=
he
> > > > easiest approach the one that works according to the spec, for
> > > > everything.
> > > >
> > > > Audio is optional, so it should be a togglable thing (either by an
> > > > additional function or parameter), but the drivers shouldn't have t=
o set
> > > > everything more than what the function requires.
> > >=20
> > > I'll see what I can do. I had more or less the same goals, being hit
> > > by the lack of the plugged_cb and get_eld support in the bridge's
> > > implementation.
> > >=20
> > > > Also, parent_dev is going to be an issue there. IIRC, ASoC will set=
 its
> > > > structure as the device data and overwrite whatever we put there.
> > >=20
> > > It registers driver_data for the created device, it doesn't touch par=
ent_dev.
> > >=20
> > > >
> > > > We worked around it in vc4 by making sure that snd_soc_card was rig=
ht at
> > > > the start of the driver structure and thus both pointers would be e=
qual,
> > > > but we have to deal with it here too.
> > >=20
> > > Hmm, maybe I'm missing something. The snd_soc_card is a different
> > > story. The bridges just provide the hdmi_codec_ops, the card itself is
> > > handled by the other driver.
> >=20
> > For bridges, sure. For full blown controllers, it might be handled by
> > the driver directly if there's no external controllers involved.
>=20
> Hmm, I see. Let me check how vc4 handles it. But anyway, snd_soc_card is
> out of scope for this patchset. The driver has to manage it anyway. And
> for the hdmi_audio_codec there is no conflict.

Out of scope, sure, but if we need to rework and retest the whole thing
when we get there, it's not great either. So we should take it into
account still. Not care about or work on it, but leave the door open.

> > > > > +     if (IS_ERR(pdev))
> > > > > +             return PTR_ERR(pdev);
> > > > > +
> > > > > +     ret =3D drmm_add_action_or_reset(dev, drm_connector_hdmi_co=
dec_cleanup_action, pdev);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     connector->hdmi_codec.codec_pdev =3D pdev;
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drmm_connector_hdmi_codec_alloc);
> > > > > +
> > > > > +/**
> > > > > + * drmm_connector_hdmi_codec_free - rollback drmm_connector_hdmi=
_codec_alloc
> > > > > + * @dev: DRM device
> > > > > + * @hdmi_codec: A pointer to the HDMI codec data
> > > > > + *
> > > > > + * Rollback the drmm_connector_hdmi_codec_alloc() and free alloc=
ated data.
> > > > > + * While this function should not be necessary for a typical dri=
ver, DRM bridge
> > > > > + * drivers have to call it from the remove callback if the bridg=
e uses
> > > > > + * Connector's HDMI Codec interface.
> > > > > + */
> > > > > +void drmm_connector_hdmi_codec_free(struct drm_device *dev,
> > > > > +                                 struct drm_connector_hdmi_codec=
 *hdmi_codec)
> > > > > +{
> > > > > +     drmm_release_action(dev, drm_connector_hdmi_codec_cleanup_a=
ction,
> > > > > +                         hdmi_codec->codec_pdev);
> > > > > +}
> > > >
> > > > What would it be useful for?
> > >=20
> > > See the last patch,
> > > https://lore.kernel.org/dri-devel/20240615-drm-bridge-hdmi-connector-=
v1-5-d59fc7865ab2@linaro.org/
> > >=20
> > > if the bridge driver gets unbound, we should also unregister the codec
> > > device. The codec infrastructure uses drmm to allocate data and a drmm
> > > action to unregister the codec device. However the bridge drivers are
> > > not bound by the drmm lifecycle. So we have to do that manually.
> >=20
> > Bridge lifetimes in general are a mess, but why do we need to involve
> > drmm if it's manual then?
> >=20
> > It's typically something that shouldn't be done by drivers anyway. Most
> > of them will get it wrong.
>=20
> Non-bridge drivers are not such mess and using drmm_ makes it simpler
> for them.

That's arguable, but it's mostly because the framework allows those
drivers to not be messy :)

It doesn't with bridges.

> Also in case of DP MST this will make like slightly easier as the
> audio codec will be torn down together with the connector being gone.
>=20
> But really, I'm open to any solution that will work. Maybe it's better
> to use devm_add_action_or_reset(codec->parent);

My point is that there's no point in registering a drmm action if
drivers are supposed to call it anyway. So we can just use neither drmm
or devm, and it'll work just the same.

But I still think we don't need to allocate the structure in the first
place and just put it into drm_connector.

> > > > > +EXPORT_SYMBOL(drmm_connector_hdmi_codec_free);
> > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connec=
tor.h
> > > > > index f750765d8fbc..0eb8d8ed9495 100644
> > > > > --- a/include/drm/drm_connector.h
> > > > > +++ b/include/drm/drm_connector.h
> > > > > @@ -46,6 +46,7 @@ struct drm_property_blob;
> > > > >  struct drm_printer;
> > > > >  struct drm_privacy_screen;
> > > > >  struct edid;
> > > > > +struct hdmi_codec_ops;
> > > > >  struct i2c_adapter;
> > > > >
> > > > >  enum drm_connector_force {
> > > > > @@ -1199,6 +1200,8 @@ struct drm_connector_hdmi_funcs {
> > > > >       int (*write_infoframe)(struct drm_connector *connector,
> > > > >                              enum hdmi_infoframe_type type,
> > > > >                              const u8 *buffer, size_t len);
> > > > > +
> > > > > +     const struct hdmi_codec_ops *codec_ops;
> > > >
> > > > I think I'd rather have the HDMI connector framework provide the AS=
oC
> > > > hooks, and make the needed pointer casts / lookups to provide a
> > > > consistent API to drivers using it.
> > > >
> > > > This will probably also solve the issue mentioned above.
> > >=20
> > > Ack.
> > >=20
> > > >
> > > > >  };
> > > > >
> > > > >  /**
> > > > > @@ -1706,6 +1709,22 @@ struct drm_connector_hdmi {
> > > > >       } infoframes;
> > > > >  };
> > > > >
> > > > > +struct drm_connector_hdmi_codec {
> > > > > +     struct device *parent_dev;
> > > > > +     struct platform_device *codec_pdev;
> > > > > +
> > > > > +     const struct drm_connector_hdmi_codec_funcs *funcs;
> > > > > +
> > > > > +     struct mutex lock; /* protects last_state and plugged_cb */
> > > > > +     void (*plugged_cb)(struct device *dev, bool plugged);
> > > > > +     struct device *plugged_cb_dev;
> > > > > +     bool last_state;
> > > > > +
> > > > > +     int max_i2s_channels;
> > > > > +     uint i2s: 1;
> > > > > +     uint spdif: 1;
> > > > > +};
> > > >
> > > > It would be great to have some documentation on what those are,
> > > > last_state and the mutex especially raise attention :)
> > >=20
> > > Yep, as I wrote in the cover letter, underdocumented.
> > >=20
> > > >
> > > >
> > > > >  /**
> > > > >   * struct drm_connector - central DRM connector control structure
> > > > >   *
> > > > > @@ -2119,6 +2138,12 @@ struct drm_connector {
> > > > >        * @hdmi: HDMI-related variable and properties.
> > > > >        */
> > > > >       struct drm_connector_hdmi hdmi;
> > > > > +
> > > > > +     /**
> > > > > +      * @hdmi_codec: HDMI codec properties and variables. Also m=
ight be used
> > > > > +      * for DisplayPort audio.
> > > > > +      */
> > > > > +     struct drm_connector_hdmi_codec hdmi_codec;
> > > >
> > > > I'd rather make this part of drm_connector_hdmi, it cannot work wit=
hout it.
> > >=20
> > > It can. DisplayPort drivers also use hdmi_codec_ops. They should be
> > > able to benefit from this implementation.
> >=20
> > That's totally doable if we create a structure (and functions) that are
> > embedded in both drm_connector_hdmi and the future drm_connector_dp
>=20
> There is no drm_connector_dp (yet), but the drivers can already benefit
> from using the generic hdmi_codec. Later on, when drm_connector_dp
> appears, we can move the codec into both hdmi and DP structures.
>=20
> I can probably convert msm/hdmi and msm/dp to use this framework if that
> helps to express the idea.

I think there's something I don't get here: why does DP gets in the way,
and why can't we just do the HDMI support now, and then reuse the same
struct and internal functions with DP later on?

I think if we want DP support, we would need to create a DP framework
like we did for HDMI, and that would be a major undertaking just for
audio support.

Maxime

--lixt5lpk3572sq6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn01sAAKCRDj7w1vZxhR
xYVSAQDyhnQtsvB0YHhD30bmOEdFfZeEkoZ29MPdIZXwPtTOpQEAsvsPIwlVCmBE
TTdq791R6OXv1LMJ4E7xKHutEN137AY=
=jXB7
-----END PGP SIGNATURE-----

--lixt5lpk3572sq6h--
