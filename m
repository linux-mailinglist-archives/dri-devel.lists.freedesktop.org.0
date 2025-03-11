Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A2A5BAEC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 09:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C362610E534;
	Tue, 11 Mar 2025 08:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V0g2cdGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FDC10E530;
 Tue, 11 Mar 2025 08:36:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47C825C5839;
 Tue, 11 Mar 2025 08:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44700C4CEE9;
 Tue, 11 Mar 2025 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741682199;
 bh=wd8ltpt2jvKIx3P1Eo4xNCo3YAo3YLf9Xo9oEABs4y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V0g2cdGlte6vqNJYFOlVvjafLn16BrHSBJ7HQRtJle0CpYBQwxqBokg9ZVWHtbJBn
 +lEd1j/rj0+XAtXdZNrVRo+oZttTB0o5zqDm9KWbuZ8Hhy33BskFoyXvnYLVhvnAOa
 bzjBRfNhQetA8/kKmAyhIijcK2YFLzoHpMdvTeJ4OK4+VQkJ+zUe5CdMFopuoqCjT0
 al0vlE/EEbozSTw1p/RNBO+zMiVP/4IZxyD/rhKcz1VeQIUaaG982w8/pVMxfNg6dl
 rJ/tLng+LLfYzIc0KDwIRTXzuE5LfUM+HxSp+A8+1Cu4QDt6S6MSy2gUSVMQAa88MH
 Ywfer/494Gy9g==
Date: Tue, 11 Mar 2025 09:36:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
Message-ID: <20250311-quizzical-warthog-of-leadership-53d224@houat>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org>
 <20250310-unnatural-puffin-of-revolution-59d726@houat>
 <CALT56yPKe8+tSyChAo6ypHR8EWUpqeJDNM6mcOBUnFwFE7rg4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j3rt4tragpwiz65t"
Content-Disposition: inline
In-Reply-To: <CALT56yPKe8+tSyChAo6ypHR8EWUpqeJDNM6mcOBUnFwFE7rg4w@mail.gmail.com>
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


--j3rt4tragpwiz65t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
MIME-Version: 1.0

On Mon, Mar 10, 2025 at 08:42:29PM +0200, Dmitry Baryshkov wrote:
> On Mon, 10 Mar 2025 at 16:55, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Fri, Mar 07, 2025 at 07:55:52AM +0200, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > As pointed out by Laurent, OP bits are supposed to describe operation=
s.
> > > Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> > > overloading DRM_BRIDGE_OP_HDMI.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
> > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
> > >  drivers/gpu/drm/display/drm_bridge_connector.c | 59 ++++++++++++++++=
+---------
> > >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
> > >  include/drm/drm_bridge.h                       | 23 ++++++++--
> > >  5 files changed, 61 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/dr=
m/bridge/lontium-lt9611.c
> > > index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9=
bb74553cf21dcc39f9d 100644
> > > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > @@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *clie=
nt)
> > >       lt9611->bridge.of_node =3D client->dev.of_node;
> > >       lt9611->bridge.ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDI=
D |
> > >                            DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> > > -                          DRM_BRIDGE_OP_HDMI;
> > > +                          DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AU=
DIO;
> > >       lt9611->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> > >       lt9611->bridge.vendor =3D "Lontium";
> > >       lt9611->bridge.product =3D "LT9611";
> > > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/g=
pu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f=
1093b17a00f9425bb37 100644
> > > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > @@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platf=
orm_device *pdev,
> > >       hdmi->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
> > >                          DRM_BRIDGE_OP_EDID |
> > >                          DRM_BRIDGE_OP_HDMI |
> > > +                        DRM_BRIDGE_OP_HDMI_AUDIO |
> > >                          DRM_BRIDGE_OP_HPD;
> > >       hdmi->bridge.of_node =3D pdev->dev.of_node;
> > >       hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers=
/gpu/drm/display/drm_bridge_connector.c
> > > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a6315482=
7c65d4822d378df3b4c 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> > >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HD=
MI).
> > >        */
> > >       struct drm_bridge *bridge_hdmi;
> > > +     /**
> > > +      * @bridge_hdmi_audio:
> > > +      *
> > > +      * The bridge in the chain that implements necessary support fo=
r the
> > > +      * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_A=
UDIO).
> > > +      */
> > > +     struct drm_bridge *bridge_hdmi_audio;
> > >  };
> > >
> > >  #define to_drm_bridge_connector(x) \
> > > @@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(str=
uct drm_connector *connector)
> > >               to_drm_bridge_connector(connector);
> > >       struct drm_bridge *bridge;
> > >
> > > -     bridge =3D bridge_connector->bridge_hdmi;
> > > +     bridge =3D bridge_connector->bridge_hdmi_audio;
> > >       if (!bridge)
> > >               return -EINVAL;
> > >
> > > @@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(str=
uct drm_connector *connector,
> > >               to_drm_bridge_connector(connector);
> > >       struct drm_bridge *bridge;
> > >
> > > -     bridge =3D bridge_connector->bridge_hdmi;
> > > +     bridge =3D bridge_connector->bridge_hdmi_audio;
> > >       if (!bridge)
> > >               return -EINVAL;
> > >
> > > @@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(s=
truct drm_connector *connector)
> > >               to_drm_bridge_connector(connector);
> > >       struct drm_bridge *bridge;
> > >
> > > -     bridge =3D bridge_connector->bridge_hdmi;
> > > +     bridge =3D bridge_connector->bridge_hdmi_audio;
> > >       if (!bridge)
> > >               return;
> > >
> > > @@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream=
(struct drm_connector *connecto
> > >               to_drm_bridge_connector(connector);
> > >       struct drm_bridge *bridge;
> > >
> > > -     bridge =3D bridge_connector->bridge_hdmi;
> > > +     bridge =3D bridge_connector->bridge_hdmi_audio;
> > >       if (!bridge)
> > >               return -EINVAL;
> > >
> > > @@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(=
struct drm_device *drm,
> > >                               max_bpc =3D bridge->max_bpc;
> > >               }
> > >
> > > +             if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> > > +                     if (bridge_connector->bridge_hdmi_audio)
> > > +                             return ERR_PTR(-EBUSY);
> > > +
> > > +                     if (!bridge->hdmi_audio_max_i2s_playback_channe=
ls &&
> > > +                         !bridge->hdmi_audio_spdif_playback)
> > > +                             return ERR_PTR(-EINVAL);
> > > +
> > > +                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > +                         !bridge->funcs->hdmi_audio_shutdown)
> > > +                             return ERR_PTR(-EINVAL);
> > > +
> > > +                     bridge_connector->bridge_hdmi_audio =3D bridge;
> > > +             }
> > > +
> > >               if (!drm_bridge_get_next_bridge(bridge))
> > >                       connector_type =3D bridge->type;
> > >
> > > @@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(=
struct drm_device *drm,
> > >                                              max_bpc);
> > >               if (ret)
> > >                       return ERR_PTR(ret);
> > > -
> > > -             if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > > -                 bridge->hdmi_audio_spdif_playback) {
> > > -                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > -                         !bridge->funcs->hdmi_audio_shutdown)
> > > -                             return ERR_PTR(-EINVAL);
> > > -
> > > -                     ret =3D drm_connector_hdmi_audio_init(connector,
> > > -                                                         bridge->hdm=
i_audio_dev,
> > > -                                                         &drm_bridge=
_connector_hdmi_audio_funcs,
> > > -                                                         bridge->hdm=
i_audio_max_i2s_playback_channels,
> > > -                                                         bridge->hdm=
i_audio_spdif_playback,
> > > -                                                         bridge->hdm=
i_audio_dai_port);
> > > -                     if (ret)
> > > -                             return ERR_PTR(ret);
> > > -             }
> > >       } else {
> > >               ret =3D drmm_connector_init(drm, connector,
> > >                                         &drm_bridge_connector_funcs,
> > > @@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(=
struct drm_device *drm,
> > >                       return ERR_PTR(ret);
> > >       }
> > >
> > > +     if (bridge_connector->bridge_hdmi_audio) {
> > > +             bridge =3D bridge_connector->bridge_hdmi_audio;
> > > +
> > > +             ret =3D drm_connector_hdmi_audio_init(connector,
> > > +                                                 bridge->hdmi_audio_=
dev,
> > > +                                                 &drm_bridge_connect=
or_hdmi_audio_funcs,
> > > +                                                 bridge->hdmi_audio_=
max_i2s_playback_channels,
> > > +                                                 bridge->hdmi_audio_=
spdif_playback,
> > > +                                                 bridge->hdmi_audio_=
dai_port);
> > > +             if (ret)
> > > +                     return ERR_PTR(ret);
> > > +     }
> > > +
> > >       drm_connector_helper_add(connector, &drm_bridge_connector_helpe=
r_funcs);
> > >
> > >       if (bridge_connector->bridge_hpd)
> > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm=
/msm/hdmi/hdmi_bridge.c
> > > index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8c=
a7031f833795d1f7d94 100644
> > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > @@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> > >       bridge->ops =3D DRM_BRIDGE_OP_HPD |
> > >               DRM_BRIDGE_OP_DETECT |
> > >               DRM_BRIDGE_OP_HDMI |
> > > +             DRM_BRIDGE_OP_HDMI_AUDIO |
> > >               DRM_BRIDGE_OP_EDID;
> > >       bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
> > >       bridge->hdmi_audio_dev =3D &hdmi->pdev->dev;
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index d4c75d59fa12be1bd7375ce3ea56415235781b28..dff8cf035b30d5c7e00bf=
df5d6e12802559823ba 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -693,8 +693,10 @@ struct drm_bridge_funcs {
> > >       /**
> > >        * @hdmi_audio_prepare:
> > >        * Configures HDMI-encoder for audio stream. Can be called mult=
iple
> > > -      * times for each setup. Mandatory if HDMI audio is enabled in =
the
> > > -      * bridge's configuration.
> > > +      * times for each setup.
> > > +      *
> > > +      * This callback is optional but it must be implemented by brid=
ges that
> > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->=
ops.
> > >        *
> > >        * Returns:
> > >        * 0 on success, a negative error code otherwise
> > > @@ -707,8 +709,10 @@ struct drm_bridge_funcs {
> > >       /**
> > >        * @hdmi_audio_shutdown:
> > >        *
> > > -      * Shut down the audio stream. Mandatory if HDMI audio is enabl=
ed in
> > > -      * the bridge's configuration.
> > > +      * Shut down the audio stream.
> > > +      *
> > > +      * This callback is optional but it must be implemented by brid=
ges that
> > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->=
ops.
> > >        *
> > >        * Returns:
> > >        * 0 on success, a negative error code otherwise
> > > @@ -814,6 +818,17 @@ enum drm_bridge_ops {
> > >        * drivers.
> > >        */
> > >       DRM_BRIDGE_OP_HDMI =3D BIT(4),
> > > +     /**
> > > +      * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio op=
erations.
> > > +      * Bridges that set this flag must implement the
> > > +      * &drm_bridge_funcs->hdmi_audio_prepare and
> > > +      * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
> > > +      *
> > > +      * Note: currently there can be at most one bridge in a chain t=
hat sets
> > > +      * this bit. This is to simplify corresponding glue code in con=
nector
> > > +      * drivers.
> > > +      */
> > > +     DRM_BRIDGE_OP_HDMI_AUDIO =3D BIT(5),
> >
> > We should make this conditional on HDMI being set. It doesn't make sense
> > to have OP_HDMI_AUDIO enabled when OP_HDMI isn't.
>=20
> It totally does.

I'm sure it works properly. I meant on a conceptual level. In our
codebase, as it is today, the HDMI audio support is part of the HDMI
infrastructure, and thus implementing audio without the main part
doesn't make sense. IIRC, the spec also mandates video support, but
audio is optional.

> In the second patch I'm using OP_HDMI_AUDIO for the DisplayPort
> driver.

Let's discuss that part in your second patch.

Maxime

--j3rt4tragpwiz65t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ8/2FAAKCRDj7w1vZxhR
xUTpAQCEfqxbZhW3CzO54qNBIjlgicygCrWC8wDyj9JUiG/GUAD/bBsXsTxzvPcc
hM7XN3FOfBEkt7ERfv//N0Q+e+SmtAw=
=l9hf
-----END PGP SIGNATURE-----

--j3rt4tragpwiz65t--
