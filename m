Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1684610FC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 10:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82246E516;
	Mon, 29 Nov 2021 09:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663836E516;
 Mon, 29 Nov 2021 09:20:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id t11so33119713ljh.6;
 Mon, 29 Nov 2021 01:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=GfZLLvY/fsloH8sNenTBSqo8nA5xMoKzfEshJnDH/wk=;
 b=hYFmG0gwiJbGW8FZTx30X4xnRt57bnLUSTyWGdIMniHVCqlmcxldSbDzVUT4EMzPFe
 1B0IDgf1PAThlVyArNmo8yHd8S64WXw5htchLDRIs5LYg+moVIgNPmpWU4N2csxGpqdL
 h/vzWfC9pG6ZcINSpzIkc9Kqp1k6PPCWhUcyijcLYLXBG4vFXt6eg1yfUWrf1AlY0RtX
 tbCfM/Krs6sJef8ua2bOt6ByBpEjaNGPhS5XI+6T3GsyLe9LQXTXyWii9jVL3WHlv7vk
 2tfab7xxLB0Nh/mVRy6gGABLfboy5U526oF5s5DSXq6RCHAAbj+KAb/n+kBHyPvSJtCR
 tAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=GfZLLvY/fsloH8sNenTBSqo8nA5xMoKzfEshJnDH/wk=;
 b=TNfGaJnwkm3ClNG6G3avbYRvCCqB2/ffz1BeyeEuZWFpUUZbaKVdp2PuF2r9Hp3AAn
 U4lAUZKnS7SdIroXn6Ka0COpmGo7/BNl4pgHsjOTtIrSoK6hJhiTZ35mkq3Ydsw+H24E
 xXnjPi6CvOMPtp0WAHOk2jnaJttUgQo9SQ3DNYM7UuWZGI3e2AnQ0NeqsgFxvVXHPj6y
 l+HwS65WmF4PLVWB+17UMIVTOYOGal3nrSqPI14EsOiya/f2kuUVaaeOcEOQCxSnyxIA
 ci4bYV+UsJzIXVWcX1ZujWGsnG9bG/zhwp/S2FBbsJIkGW22unJzTioZI15f1bBYTOMl
 1/LQ==
X-Gm-Message-State: AOAM531ipbaZA6iVaV7s/XOXyRNrjc31niuW/dYWeHGkokiIIVWms/eF
 fYmuMYPpKSONd8nvYy0uEb8=
X-Google-Smtp-Source: ABdhPJyT+J3tAQm37RWqr2UZ0ZQVaSCr9P+2jQ8KQLsjz+0DAMGB8tZSFZ8EXU1SQWEmvV9b+zYBng==
X-Received: by 2002:a05:651c:1790:: with SMTP id
 bn16mr47125453ljb.475.1638177643671; 
 Mon, 29 Nov 2021 01:20:43 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i3sm1278524lfu.156.2021.11.29.01.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 01:20:43 -0800 (PST)
Date: Mon, 29 Nov 2021 11:20:33 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [i-g-t 00/14] Add IGT support for plane color management
Message-ID: <20211129112033.770d1c2a@eldfell>
In-Reply-To: <26abc3eb-c50e-8f89-ccc9-ad96f1177987@amd.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211118115002.14003184@eldfell>
 <26abc3eb-c50e-8f89-ccc9-ad96f1177987@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o2+66=m3w=UdCvT0M1ZwXYC";
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
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/o2+66=m3w=UdCvT0M1ZwXYC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Nov 2021 11:54:55 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-11-18 04:50, Pekka Paalanen wrote:
> > On Mon, 15 Nov 2021 15:17:45 +0530
> > Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
> >  =20
> >> From the Plane Color Management feature design, userspace can
> >> take the smart blending decisions based on hardware supported
> >> plane color features to obtain an accurate color profile.
> >>
> >> These IGT patches extend the existing pipe color management
> >> tests to the plane level.
> >>
> >> Kernel implementation:
> >> https://patchwork.freedesktop.org/series/90825/ =20

...

> > I also found some things that looked hardware-specific in this code
> > that to my understanding is supposed to be generic, and some concerns
> > about UAPI as well.
> >  =20
>=20
> I left some comments on intellisms in these patches.
>=20
> Do you have any specifics about your concerns about UAPI?

Yeah, the comments I left in the patches:

patch 3:

> Having to explicitly special-case index zero feels odd to me. Why does
> it need explicit special-casing?
>=20
> To me it's a hint that the definitions of .start and .end are somehow
> inconsistent.

patch 4 and 8:

> > +static bool is_hdr_plane(const igt_plane_t *plane)
> > +{
> > +	return plane->index >=3D 0 && plane->index < SDR_PLANE_BASE; =20
>=20
> How can this be right for all KMS drivers?
>=20
> What is a HDR plane?

patch 12:

> > +struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
> > +						const gamma_lut_t *gamma,
> > +						uint32_t color_depth,
> > +						int off)
> > +{
> > +	struct drm_color_lut *lut;
> > +	int i, lut_size =3D gamma->size;
> > +	/* This is the maximum value due to 16 bit precision in hardware. */ =
=20
>=20
> In whose hardware?
>=20
> Are igt tests not supposed to be generic for everything that exposes
> the particular KMS properties?
>=20
> This also hints that the UAPI design is lacking, because userspace
> needs to know hardware specific things out of thin air. Display servers
> are not going to have hardware-specific code. They specialise based on
> the existence of KMS properties instead.

...

> > +void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type=
 type)
> > +{
> > +	igt_display_t *display =3D &data->display;
> > +	gamma_lut_t *gamma_log;
> > +	drmModePropertyPtr gamma_mode =3D NULL;
> > +	segment_data_t *segment_info =3D NULL;
> > +	struct drm_color_lut *lut =3D NULL;
> > +	int lut_size =3D 0;
> > +
> > +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);=
 =20
>=20
> Is this how we are going to do cross-software DRM-master hand-over or
> switching compatibility in general?
>=20
> Add a new client cap for every new KMS property, and if the KMS client
> does not set the property, the kernel will magically reset it to ensure
> the client's expectations are met? Is that how it works?
>=20
> Or why does this exist?

...

> > +	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);=
 =20
>=20
> I've never seen this done before. I did not know client caps could be
> reset.


So, patch 12 has the biggest UAPI questions, and patch 3 may need a
UAPI change as well. The comments in patches 4 and 8 could be addressed
with just removing that code since the concept of HDR/SDR planes does
not exist in UAPI. Or, if that concept is needed then it's another UAPI
problem.


Thanks,
pq

--Sig_/o2+66=m3w=UdCvT0M1ZwXYC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGkm2EACgkQI1/ltBGq
qqeDAw/9GEJ1aNXAPO0xD4sH3t3fINxyrfWnsq+LtBlYcOof5K0oT5BRX5ccGoYd
PAC5hipSQiRflcl0tr440l2AY5rt8u9XDnQsiWTVCTwkBaxdHUb9WJrhPF7e4w79
c7av6b/zAXGN8TVsH5BaTCOH3l4Y+Mxjgx607eofR4GHyzO6cSi/EejqnxeRePne
jM2G6SY7LD40fL9zRCOtobnnWi1PEDy/IblIhuAnCeTpUkO/IIEFTeLMPSJlBCCZ
gfv8S+RDI1uqws0fhq5e6NphUF5ymzjAiQTsy9NVPpIyC5OFRTQFM4L6tWPcpDuw
mpEwrni781J5kJR/cfMPkje2JQ2C2iRhrPEbm5TLSvi62KyvsFf03DRPyX/NBhLT
m2FmqOFJar4RWOsVypp24uV9OTL4wzYETHgyaSw0dLVWMKd3ZPMibLSqm0GS8646
zB1qpq0zsRnu9G2yMIDqr2YVMSBotUqO/BWbumbejJooscjpKw4V8eKFZ8JrQMaP
LMT38WYylrrUD1IE9pmeNii2/W3lYKQkCbty+TSTD9x3NK05FkQbq6Luh9ftUDCI
m1AASI033AJz0kzpDc+kK9Q5pQpLjtg7PlbS10lHqUDS9eI3NRPbdaC7Wb4Ki40A
tx0tKEgfdTgBnqnPLw5idZP/FZz6A9tdErdrvsJjNza2DLapISo=
=fqJV
-----END PGP SIGNATURE-----

--Sig_/o2+66=m3w=UdCvT0M1ZwXYC--
