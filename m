Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005FF91A2A9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAC210E1B1;
	Thu, 27 Jun 2024 09:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZVWa0Xj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1B10EA76
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 09:31:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9D877CE2D7F;
 Thu, 27 Jun 2024 09:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63598C2BBFC;
 Thu, 27 Jun 2024 09:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719480656;
 bh=1aYmGHN9BRLdcGFAdOCKEM/FVqmcKp9bN6+LvL5V2S4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZVWa0Xj4S15C/HGiy3Av84F2x+P6tUeaFnjpNhRRDTS5knydWv6cDWp57Yjo9vbpB
 1oxhbKq1C11OyABhFa6+RaU+CH/vHVvfzoe0i6rLTMlgwluAhlyHgLYcO1md74+UvV
 hKHTA+48zidWYzzj1MsfP/jln1FbLUM0LGKnFC8RWpuMArjqhuJIfl7rm8Ehh5IJIA
 d0pvfGkrmHCttaz9ga7tYF/w/mHlCcUVuMcuO0hSYjPK4QfVvm/LF2rDsO0iUlt0jg
 Oc7tUPyOtN+CKbAnry6NV3T7S2eO9s7KVX9Sf8BGSttiGzeqtRa/W277ZsqvXHk9cw
 LHJHdnArDv+UA==
Date: Thu, 27 Jun 2024 11:30:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
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
Message-ID: <20240627-excellent-perch-of-opportunity-ceffcc@houat>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-3-d59fc7865ab2@linaro.org>
 <20240621-glorious-oryx-of-expression-1ad75f@houat>
 <CAA8EJpr=ervT-KD+tYphPeTfrFGDfSaxNaYC5hfzmtVch5v10g@mail.gmail.com>
 <20240626-spiked-heavenly-kakapo-1dafce@houat>
 <CAPY8ntAn3y5Su+SLJPv7FLq_aUhCv=vaATt4jLs4VUu4Xnd6aA@mail.gmail.com>
 <r5226a5zzbp2d7zmxbskll6ed7coy4qbxhd6aaqulqzyuom6sp@dliwhreaqmtl>
 <CAPY8ntAtxsdbOKDt3oT87iexXHPw3aHhi=3T-rVX8BfOt5hFfg@mail.gmail.com>
 <5j4orksor4gpubn6ck5bq3k7oi6atdww77zsacwv2pdwp6d6xb@x4a5dm7utnqt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="axduwaeaes4zunux"
Content-Disposition: inline
In-Reply-To: <5j4orksor4gpubn6ck5bq3k7oi6atdww77zsacwv2pdwp6d6xb@x4a5dm7utnqt>
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


--axduwaeaes4zunux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 09:55:21PM GMT, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 06:07:50PM GMT, Dave Stevenson wrote:
> > Hi Dmitry
> >=20
> > On Wed, 26 Jun 2024 at 17:11, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, Jun 26, 2024 at 04:10:05PM GMT, Dave Stevenson wrote:
> > > > Hi Maxime and Dmitry
> > > >
> > > > On Wed, 26 Jun 2024 at 15:05, Maxime Ripard <mripard@kernel.org> wr=
ote:
> > > > >
> > > > > On Fri, Jun 21, 2024 at 02:09:04PM GMT, Dmitry Baryshkov wrote:
> > > > > > On Fri, 21 Jun 2024 at 12:27, Maxime Ripard <mripard@kernel.org=
> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > Sorry for taking some time to review this series.
> > > > > >
> > > > > > No problem, that's not long.
> > > > > >
> > > > > > >
> > > > > > > On Sat, Jun 15, 2024 at 08:53:32PM GMT, Dmitry Baryshkov wrot=
e:
> > > > > > > > Several DRM drivers implement HDMI codec support (despite i=
ts name it
> > > > > > > > applies to both HDMI and DisplayPort drivers). Implement ge=
neric
> > > > > > > > framework to be used by these drivers. This removes a requi=
rement to
> > > > > > > > implement get_eld() callback and provides default implement=
ation for
> > > > > > > > codec's plug handling.
> > > > > > > >
> > > > > > > > The framework is integrated with the DRM HDMI Connector fra=
mework, but
> > > > > > > > can be used by DisplayPort drivers.
> > > > > > > >
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.or=
g>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/Makefile                   |   1 +
> > > > > > > >  drivers/gpu/drm/drm_connector.c            |   8 ++
> > > > > > > >  drivers/gpu/drm/drm_connector_hdmi_codec.c | 157 +++++++++=
++++++++++++++++++++
> > > > > > > >  include/drm/drm_connector.h                |  33 ++++++
> > > > > > > >  4 files changed, 199 insertions(+)
> > > > > > > >
> > >
> > > [...]
> > >
> > > > > > > > +
> > > > > > > > +static int drm_connector_hdmi_codec_get_eld(struct device =
*dev, void *data,
> > > > > > > > +                                         uint8_t *buf, siz=
e_t len)
> > > > > > > > +{
> > > > > > > > +     struct drm_connector *connector =3D data;
> > > > > > > > +
> > > > > > > > +     //  FIXME: locking against drm_edid_to_eld ?
> > > > > > > > +     memcpy(buf, connector->eld, min(sizeof(connector->eld=
), len));
> > > > > > > > +
> > > > > > > > +     return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static int drm_connector_hdmi_codec_hook_plugged_cb(struct=
 device *dev,
> > > > > > > > +                                                 void *dat=
a,
> > > > > > > > +                                                 hdmi_code=
c_plugged_cb fn,
> > > > > > > > +                                                 struct de=
vice *codec_dev)
> > > > > > > > +{
> > > > > > > > +     struct drm_connector *connector =3D data;
> > > > > > > > +
> > > > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > > > +
> > > > > > > > +     connector->hdmi_codec.plugged_cb =3D fn;
> > > > > > > > +     connector->hdmi_codec.plugged_cb_dev =3D codec_dev;
> > > > > > > > +
> > > > > > > > +     fn(codec_dev, connector->hdmi_codec.last_state);
> > > > > > > > +
> > > > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > > > +
> > > > > > > > +     return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +void drm_connector_hdmi_codec_plugged_notify(struct drm_co=
nnector *connector,
> > > > > > > > +                                          bool plugged)
> > > > > > > > +{
> > > > > > > > +     mutex_lock(&connector->hdmi_codec.lock);
> > > > > > > > +
> > > > > > > > +     connector->hdmi_codec.last_state =3D plugged;
> > > > > > > > +
> > > > > > > > +     if (connector->hdmi_codec.plugged_cb &&
> > > > > > > > +         connector->hdmi_codec.plugged_cb_dev)
> > > > > > > > +             connector->hdmi_codec.plugged_cb(connector->h=
dmi_codec.plugged_cb_dev,
> > > > > > > > +                                              connector->h=
dmi_codec.last_state);
> > > > > > > > +
> > > > > > > > +     mutex_unlock(&connector->hdmi_codec.lock);
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
> > > > > > >
> > > > > > > I think we should do this the other way around, or rather, li=
ke we do
> > > > > > > for drm_connector_hdmi_init. We'll need a hotplug handler for=
 multiple
> > > > > > > things (CEC, HDMI 2.0, audio), so it would be best to have a =
single
> > > > > > > function to call from drivers, that will perform whatever is =
needed
> > > > > > > depending on the driver's capabilities.
> > > > > >
> > > > > > I see, this API is probably misnamed. The hdmi_codec_ops use the
> > > > > > 'plugged' term,
> > > > >
> > > > > Is it misnamed?
> > > > >
> > > > > It's documented as:
> > > > >
> > > > >   Hook callback function to handle connector plug event. Optional.
> > > > >
> > > > > > but most of the drivers notify the ASoC / codec during atomic_e=
nable /
> > > > > > atomic_disable path, because usually the audio path can not wor=
k with
> > > > > > the video path being disabled.
> > > > >
> > > > > That's not clear to me either:
> > > > >
> > > > >   - rockchip/cdn-dp, msm/dp/dp-audio, dw-hdmi, seem to call it at
> > > > >     enable/disable
> > > > >
> > > > >   - anx7625, mtk_hdmi and mtk_dp calls it in detect
> > > > >
> > > > >   - adv7511, ite-it66121, lontium-lt9611, lontium-lt9611uxc, sii9=
02x,
> > > > >     exynos, tda998x, msm_hdmi, sti, tegra, vc4 don't call it at a=
ll.
> > > >
> > > > FWIW I have a patch in the next set that adds the call to vc4. The
> > > > downstream version of the patch is at [1].
> > >
> > > Nice!
> > >
> > > > > So it doesn't look like there's a majority we can align with, and
> > > > > neither should we: we need to figure out what we *need* to do and=
 when,
> > > > > and do that.
> > > > >
> > > > > From the documentation and quickly through the code though, handl=
ing it
> > > > > in detect looks like the right call.
> > > >
> > > > We concluded that hotplug detect appeared to be the right place as =
well.
> > >
> > > Probably you also stumbled upon hotplug vs enable/disable. Could you
> > > please comment, why you made your decision towards hotplug path?
> >=20
> > We hit it in trying to get Pipewire to do the right thing on
> > hotplugging HDMI cables, and updating the lists of available audio
> > destinations in desktop plugins.
> > My memory is a little hazy, but I seem to recall the logic was that
> > whilst changing audio destination when you unplug the currently
> > selected HDMI output is reasonable, but doing so because you changed
> > resolution or the screen saver kicked in was less user friendly.
> > mtk_hdmi was used as a basis for the patch, although it's all largely
> > boilerplate anyway.
>=20
> Hmm, I should check how this is handled on the standard desktops. With
> the DisplayPort and link training it might take a significant amount of
> time to switch the mode.
>=20
> > Yes the audio has to stop on enable/disable as HDMI video dictates all
> > the timings.
> > I've just checked with aplay playing audio and kmstest to change video
> > mode - audio pauses as it is disabled and resumes when the new mode is
> > selected.
> > One observation that I can't immediately explain is that if I use
> > kmstest to disable the HDMI display that is playing the audio, aplay
> > still completes without any errors logged. Using "time" on aplay is
> > returning the same duration for the playback whether the HDMI output
> > is enabled or not. That may be down to the vc4 hardware with the HDMI
> > FIFO accepting the data at the correct rate whether the video side is
> > enabled or not, but that is just a guess.
>=20
> I guess so. With msm/hdmi and with msm/dp we should be getting an error
> when the video is turned off. I don't remember if it is an immediate
> error or something that happens at the end of the period. Adding Srini,
> our audio expert, he should know it better.
>=20
> For external HDMI bridges I completely have no idea, but I guess we
> don't need to worry too much, as they are just taking I2S or SPDIF audio
> from the bus.
>=20
> In the worst case we conclude that the calling point is driver-dependent
> and as such it is not suitable to call the plugged callback from the
> drm_bridge_connector.

It would really surprise me here: the spec will require something, ALSA
will require something else, and we'll have to bridge the gap, but
there's nothing really device specific here, it's all software.

Maxime

--axduwaeaes4zunux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn0xTQAKCRDj7w1vZxhR
xQcWAP9Ju6LCuo81OHnZdEK3qQs6Q74gZ2y2quzGZSycj7QljQEAvAeY8dQuTngf
06fjMafGcwp9GyyqoWGHV/p6PSvQiQ8=
=RwGt
-----END PGP SIGNATURE-----

--axduwaeaes4zunux--
