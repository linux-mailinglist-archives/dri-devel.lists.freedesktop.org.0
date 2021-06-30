Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9BB3B7ED9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 10:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17F56E94A;
	Wed, 30 Jun 2021 08:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9736A6E8D0;
 Wed, 30 Jun 2021 08:21:54 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r16so2090210ljk.9;
 Wed, 30 Jun 2021 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=hZsvTLZOLa73TaoUFrO86oENQd+0mQCVdwH24gWx43k=;
 b=DgQzfN/7iPgfgzWuMdVHu/wR0geA31ByXd6YZMg/u3mN0nrZy55bUX93RrOxrVyzea
 aCCSmp2orxNAnz2QHWtc9EbF+T0aeWJT0SIWO9HE2faqYVJu2BSbe2xhokzDY2REQ2k+
 4XJROrW6yNMTwJDyr7mL/MQk8XfdmNtRz4QLe2R3eFO2gEU4oIybELseKDXeaSXxYUc3
 5nOT26bw4UtNT9WwfL8ZA7gCq2q/TLzkjSb33qTxuXMguv4Yhhm4u8E6xSDWjMPQwHfC
 0J7ZOtsUdswpt91k63RAyX5obB49HssBECKDUsNVzd7JMuQ6glpYt3bAzDnLZxM/MsSh
 dGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hZsvTLZOLa73TaoUFrO86oENQd+0mQCVdwH24gWx43k=;
 b=lPzc8y0ai4irSEwpNi5G3OYfofu3KPIyQfWmoNU+xiDyZ70hL7rNbn2T4m5Kbx4/UP
 2Ec5N7JVXU2iHdOVxoyHZsP+dHab6aZadN539Zzj34+e7mIGBinMofSD2phyDBIsDxUj
 GSrTzNsayBcij/HXJd0AYJ2uvtod053oebceJLWwKHOS6b3709mlsVRWD0VEmNJUVD0V
 fuF2XSnQTcold5A7jkTTwtu2MU1/0rPuqD/K4fOqygeQe0A6vnC+ZQ402t/wNhN1FbGH
 8CuBnDTx4mxPThcrc+SRvLKvXSwgoNGlmNG9/7xwRpkmOgDK65xo1GbqoAwjv5s/LP7Y
 029Q==
X-Gm-Message-State: AOAM531ai+x+FMvLem8KyM0oy78GpIAjNuZb/0eBWVyMYYXM4YUx+ROG
 Dx7U+c+8Kj+9l4g/eY3DH/Y=
X-Google-Smtp-Source: ABdhPJyQ2kBBBjZ329tk3iOGWtBvA7R4zWVLnLft0NfFi9Hf3QYoWO2nGq/YRNBGVkyWV4i9QaZxmQ==
X-Received: by 2002:a2e:b179:: with SMTP id a25mr7052329ljm.151.1625041312867; 
 Wed, 30 Jun 2021 01:21:52 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o15sm1483903lfu.134.2021.06.30.01.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 01:21:52 -0700 (PDT)
Date: Wed, 30 Jun 2021 11:21:41 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 03/17] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
Message-ID: <20210630112141.319f67eb@eldfell>
In-Reply-To: <11cd3340-46a1-9a6a-88f5-95c225863509@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-4-wse@tuxedocomputers.com>
 <18bbd0cf-4c37-ce9d-eb63-de4131a201e1@tuxedocomputers.com>
 <11cd3340-46a1-9a6a-88f5-95c225863509@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d+W4/r3y/cicXeDeLKMi=2J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 intel-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, rodrigo.vivi@intel.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/d+W4/r3y/cicXeDeLKMi=2J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Jun 2021 13:02:05 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 28.06.21 um 19:03 schrieb Werner Sembach:
> > Am 18.06.21 um 11:11 schrieb Werner Sembach: =20
> >> Add a new general drm property "active bpc" which can be used by graph=
ic
> >> drivers to report the applied bit depth per pixel back to userspace.
> >>
> >> While "max bpc" can be used to change the color depth, there was no wa=
y to
> >> check which one actually got used. While in theory the driver chooses =
the
> >> best/highest color depth within the max bpc setting a user might not be
> >> fully aware what his hardware is or isn't capable off. This is meant a=
s a
> >> quick way to double check the setup.
> >>
> >> In the future, automatic color calibration for screens might also depe=
nd on
> >> this information being available.
> >>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> ---
> >>  drivers/gpu/drm/drm_connector.c | 51 +++++++++++++++++++++++++++++++++
> >>  include/drm/drm_connector.h     |  8 ++++++
> >>  2 files changed, 59 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_con=
nector.c
> >> index da39e7ff6965..943f6b61053b 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -1197,6 +1197,14 @@ static const struct drm_prop_enum_list dp_color=
spaces[] =3D {
> >>   *	drm_connector_attach_max_bpc_property() to create and attach the
> >>   *	property to the connector during initialization.
> >>   *
> >> + * active bpc:
> >> + *	This read-only range property tells userspace the pixel color bit =
depth
> >> + *	actually used by the hardware display engine on "the cable" on a
> >> + *	connector. The chosen value depends on hardware capabilities, both
> >> + *	display engine and connected monitor, and the "max bpc" property.
> >> + *	Drivers shall use drm_connector_attach_active_bpc_property() to in=
stall
> >> + *	this property.
> >> + * =20
> > Regarding "on the cable" and dithering: As far as I can tell, what the =
dithering option does, is setting a hardware
> > register here:
> >
> > - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/di=
splay/intel_display.c#L4534
> >
> > - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/di=
splay/intel_display.c#L4571
> >
> > So dithering seems to be calculated by fixed purpose hardware/firmware =
outside of the driver?
> >
> > The Intel driver does not seem to set a target bpc/bpp for this hardwar=
e so I guess it defaults to 6 or 8 bpc? =20
>=20
> Never mind it does. This switch-case does affect the dithering output:
> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/displa=
y/intel_display.c#L4537

Hi,

I obviously do not know the intel driver or hardware at all, but
to me that just looks like translating from bits per pixel to bits per
channel in RGB mapping?

> As found in this documentation p.548:
> https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-lkf-v=
ol02c-commandreference-registers-part2.pdf
>=20
> So max bpc and active bpc are affecting/affected by the bpc after ditheri=
ng.

By definition, if the cable carries N bpc, then dithering does not
change that. The cable still carries N bpc, but due to spatial or
temporal dithering, the *observed* color resolution may or may not be
higher than the cable bpc.

Of course, if the cable bpc is 8, and dithering targets 6 bpc, then 2
LSB on the cable are always zero, right?

Maybe one would want to do that if the monitor has a 6 bit panel and it
simply ignored the 2 LSB, and the cable cannot go down to 6 bpc.

So, what does "max bpc" mean right now?

It seems like dither on/off is insufficient information, one would also
need to control the dithering target bpc. I suppose the driver has a
policy on how it chooses the target bpc, but what is that policy? Is
the dither target bpc the cable bpc or the sink bpc?

Needless to say, I'm quite confused.


Thanks,
pq

> >
> > Similar things happen on amd. Here the output dither depth seems to be =
written to a fixed value however:
> >
> > - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/dis=
play/dc/dce/dce_transform.c#L828
> >
> > - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/dis=
play/dc/dce/dce_transform.c#L769
> >
> > Does anyone know about a resource where I can read up on the used regis=
ters and what this hardware actually does? =20
> Searching now for a similar register reference for AMD GPUs.
> >
> > My proposal for now: "max bpc" affects what happens before dither, so I=
 would keep "active bpc" the same and add another
> > drm property "dither active: true/false". No additional property to con=
trol dither, as amdgpu does have one already
> > (which isn't always active?) and Intel driver does only seem prepared f=
or dithering at 6bpc (albeit I don't know why to
> > dither at 6bpc and what depth to dither to?).
> > =20
> >>   * Connectors also have one standardized atomic property:
> >>   *
> >>   * CRTC_ID:
> >> @@ -2152,6 +2160,49 @@ int drm_connector_attach_max_bpc_property(struc=
t drm_connector *connector,
> >>  }
> >>  EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
> >> =20
> >> +/**
> >> + * drm_connector_attach_active_bpc_property - attach "active bpc" pro=
perty
> >> + * @connector: connector to attach active bpc property on.
> >> + * @min: The minimum bit depth supported by the connector.
> >> + * @max: The maximum bit depth supported by the connector.
> >> + *
> >> + * This is used to check the applied bit depth on a connector.
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative errno on failure.
> >> + */
> >> +int drm_connector_attach_active_bpc_property(struct drm_connector *co=
nnector, int min, int max)
> >> +{
> >> +	struct drm_device *dev =3D connector->dev;
> >> +	struct drm_property *prop;
> >> +
> >> +	if (!connector->active_bpc_property) {
> >> +		prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "a=
ctive bpc",
> >> +						 min, max);
> >> +		if (!prop)
> >> +			return -ENOMEM;
> >> +
> >> +		connector->active_bpc_property =3D prop;
> >> +		drm_object_attach_property(&connector->base, prop, 0);
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
> >> +
> >> +/**
> >> + * drm_connector_set_active_bpc_property - sets the active bits per c=
olor property for a connector
> >> + * @connector: drm connector
> >> + * @active_bpc: bits per color for the connector currently active on =
"the cable"
> >> + *
> >> + * Should be used by atomic drivers to update the active bits per col=
or over a connector.
> >> + */
> >> +void drm_connector_set_active_bpc_property(struct drm_connector *conn=
ector, int active_bpc)
> >> +{
> >> +	drm_object_property_set_value(&connector->base, connector->active_bp=
c_property, active_bpc);
> >> +}
> >> +EXPORT_SYMBOL(drm_connector_set_active_bpc_property);
> >> +
> >>  /**
> >>   * drm_connector_attach_hdr_output_metadata_property - attach "HDR_OU=
TPUT_METADA" property
> >>   * @connector: connector to attach the property on.
> >> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> >> index 714d1a01c065..eee86de62a5f 100644
> >> --- a/include/drm/drm_connector.h
> >> +++ b/include/drm/drm_connector.h
> >> @@ -1380,6 +1380,12 @@ struct drm_connector {
> >>  	 */
> >>  	struct drm_property *max_bpc_property;
> >> =20
> >> +	/**
> >> +	 * @active_bpc_property: Default connector property for the active b=
pc
> >> +	 * to be driven out of the connector.
> >> +	 */
> >> +	struct drm_property *active_bpc_property;
> >> +
> >>  #define DRM_CONNECTOR_POLL_HPD (1 << 0)
> >>  #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
> >>  #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
> >> @@ -1702,6 +1708,8 @@ int drm_connector_set_panel_orientation_with_qui=
rk(
> >>  	int width, int height);
> >>  int drm_connector_attach_max_bpc_property(struct drm_connector *conne=
ctor,
> >>  					  int min, int max);
> >> +int drm_connector_attach_active_bpc_property(struct drm_connector *co=
nnector, int min, int max);
> >> +void drm_connector_set_active_bpc_property(struct drm_connector *conn=
ector, int active_bpc);
> >> =20
> >>  /**
> >>   * struct drm_tile_group - Tile group metadata =20
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx =20


--Sig_/d+W4/r3y/cicXeDeLKMi=2J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDcKZUACgkQI1/ltBGq
qqeqdg/8CF5zxg8SC07EblgJxP2vCkieAX19ZtS60gATvWdGS+YPe2s3KgxYoT/5
D9Dy00MHpCRAIsfuQzHUywPyh4ikcBfQhSShHhCx2wj39AI4bzScJqqseHweXPKB
528knact4LDNt01vtLE04ICXq+jiQWyGqaiDoEpxgVC2cVT7gYfZh5fSfWfZuVRu
Zqcetbv95nxFRA0Zsb139J5LqDuyIncewfIyzvYJ5TSWrVSyesCFsuwH5WS7XpTK
GxVvGvAMHH9M3TMnWRyGE96fWxjpmyJlkPHE6RPA08CjXvKd+NzFKs2tBkmiI7A+
L1/qwiWsQSt6lrqlXULcVV0RU4KUJChIIEYbWvKjGlUpuqiISavGJX6ulv623TpX
DZcYgAEd2GWiHV9J3nr0N9o7G3B/GZlp43helBstOgCq2pwP0XDepbUgSDi3Sjf5
t1gmFPTrvbo6LXo9iuuvLnUooS17raiGmxV9JgIY+gFul9AhlPDzUIsX7U3fM60P
UE4VNbkS9HZLFFPlNrE/bScWasiHw0TPrO76nHBNALPu7Si/IiUbsAWtKm5eOB+V
cVov1b1bDEDE5pxKW/hoWewg6HGBTsCEOsY4frDG/hE9Kvg3V58eYOCclBQYqQxw
aPqTJuyFi6jkc+Mu0sMcd3U00hKz4QLdDqMLgknnqEKAXvhZqX8=
=PU5d
-----END PGP SIGNATURE-----

--Sig_/d+W4/r3y/cicXeDeLKMi=2J--
