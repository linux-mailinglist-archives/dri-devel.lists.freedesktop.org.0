Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C83B8E50
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 09:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265066E1EC;
	Thu,  1 Jul 2021 07:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8FE6E128;
 Thu,  1 Jul 2021 07:43:01 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id d25so7101293lji.7;
 Thu, 01 Jul 2021 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=86fg6Rbv0H4obf+NEmfkAFzvKVFGPFNF5jnQX0dZ9+A=;
 b=BTOe2hfqzNkT6K9j/lZYv9Kdf6MQ3/OsNjdGl2yZ7Z31LctMhYTDI/zs9fQ6OoDlUJ
 UwSgOFAMnNKseD3zitV3hFEEabnp7JUl/WymrnNiuWWL/kKg9uXGHlaEKtmiTpjPtRKb
 ZYgiZvZJxzO3v0HgnGksZ+vc7X6zbloRDuKK6ggJbGC0M4QXPkBcfoAcfQ2OUxd3vBKF
 UIfdw25sepjd5Vn2SHkHZ6/UzOSvK6V0x6q60PozSI8b4pxJO+Y50pQ89fKyt1ByrV09
 KlELsmaCL9GM5YEKHP3KCxq4jhaRLjk6mVO+H/BObKwTO/bXAB5uWS0dZwglE3VEWdPs
 7Bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=86fg6Rbv0H4obf+NEmfkAFzvKVFGPFNF5jnQX0dZ9+A=;
 b=F9g+32jw1vSDYVRZVwCjofkECp0rCfP8McEopj03HDioKvO3mucTn/Il5zw6VHNC0B
 /J99BlKqZFsMh/Z9hwZKOpSpCED2Aws9gWNZaUo/lnWk1dQZtaUnQOyJRGYZbTurxa+A
 NR19s+GwQc0MQ0pKQB2KjYAVmbPTS1Ly1HRVb+WE2yZZjlU7YrvXmgeC35MYRoKHNsjC
 87YpcU3celnN2Ez4Kzm0nyr0+JV66dBKvt14DP7zZmyq/B5XTR+9aM/ZIU1saqBGTBAE
 k8WzIKL3SJpxZ2dhAl4ip8kveg61YQMJfdB1HQElTER6qKpnF9cPsESKnoQVPim3YuEk
 nVZw==
X-Gm-Message-State: AOAM531ll05APH112uh1hxcOuZpadqO9uQxyuqhtBwfzbrTSI5Ax8Fw0
 rnUoDFb2ID3AYKMKN2Ud8LQ=
X-Google-Smtp-Source: ABdhPJyrCAB1ssNtOWMJQjeY++hYK1PzMSyxhJtJEk/tbiLr69okcSuV8LGtTxYWMw+6g1Y55/pViA==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr10989452lji.61.1625125380078; 
 Thu, 01 Jul 2021 00:43:00 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q2sm2141849lfn.177.2021.07.01.00.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 00:42:59 -0700 (PDT)
Date: Thu, 1 Jul 2021 10:42:56 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 03/17] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
Message-ID: <20210701104256.247538e1@eldfell>
In-Reply-To: <ca2827b5-9f6f-164b-6b3f-3f01898d3202@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-4-wse@tuxedocomputers.com>
 <18bbd0cf-4c37-ce9d-eb63-de4131a201e1@tuxedocomputers.com>
 <11cd3340-46a1-9a6a-88f5-95c225863509@tuxedocomputers.com>
 <20210630112141.319f67eb@eldfell>
 <ca2827b5-9f6f-164b-6b3f-3f01898d3202@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fu6jgclirlZepxXxOgXeMNK";
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Fu6jgclirlZepxXxOgXeMNK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Jun 2021 11:42:10 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 30.06.21 um 10:21 schrieb Pekka Paalanen:
> > On Tue, 29 Jun 2021 13:02:05 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> Am 28.06.21 um 19:03 schrieb Werner Sembach: =20
> >>> Am 18.06.21 um 11:11 schrieb Werner Sembach: =20
> >>>> Add a new general drm property "active bpc" which can be used by gra=
phic
> >>>> drivers to report the applied bit depth per pixel back to userspace.
> >>>>
> >>>> While "max bpc" can be used to change the color depth, there was no =
way to
> >>>> check which one actually got used. While in theory the driver choose=
s the
> >>>> best/highest color depth within the max bpc setting a user might not=
 be
> >>>> fully aware what his hardware is or isn't capable off. This is meant=
 as a
> >>>> quick way to double check the setup.
> >>>>
> >>>> In the future, automatic color calibration for screens might also de=
pend on
> >>>> this information being available.
> >>>>
> >>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >>>> ---
> >>>>   drivers/gpu/drm/drm_connector.c | 51 +++++++++++++++++++++++++++++=
++++
> >>>>   include/drm/drm_connector.h     |  8 ++++++
> >>>>   2 files changed, 59 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_c=
onnector.c
> >>>> index da39e7ff6965..943f6b61053b 100644
> >>>> --- a/drivers/gpu/drm/drm_connector.c
> >>>> +++ b/drivers/gpu/drm/drm_connector.c
> >>>> @@ -1197,6 +1197,14 @@ static const struct drm_prop_enum_list dp_col=
orspaces[] =3D {
> >>>>    *	drm_connector_attach_max_bpc_property() to create and attach the
> >>>>    *	property to the connector during initialization.
> >>>>    *
> >>>> + * active bpc:
> >>>> + *	This read-only range property tells userspace the pixel color bi=
t depth
> >>>> + *	actually used by the hardware display engine on "the cable" on a
> >>>> + *	connector. The chosen value depends on hardware capabilities, bo=
th
> >>>> + *	display engine and connected monitor, and the "max bpc" property.
> >>>> + *	Drivers shall use drm_connector_attach_active_bpc_property() to =
install
> >>>> + *	this property.
> >>>> + * =20
> >>> Regarding "on the cable" and dithering: As far as I can tell, what th=
e dithering option does, is setting a hardware
> >>> register here:
> >>>
> >>> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/=
display/intel_display.c#L4534
> >>>
> >>> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/=
display/intel_display.c#L4571
> >>>
> >>> So dithering seems to be calculated by fixed purpose hardware/firmwar=
e outside of the driver?
> >>>
> >>> The Intel driver does not seem to set a target bpc/bpp for this hardw=
are so I guess it defaults to 6 or 8 bpc? =20
> >> Never mind it does. This switch-case does affect the dithering output:
> >> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/dis=
play/intel_display.c#L4537 =20
> > Hi,
> >
> > I obviously do not know the intel driver or hardware at all, but
> > to me that just looks like translating from bits per pixel to bits per
> > channel in RGB mapping? =20
> No, if i understand the documentation correctly: Writing bit depth here=20
> with dithering enabled sets the dithering target bpc.
> > =20
> >> As found in this documentation p.548:
> >> https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-lk=
f-vol02c-commandreference-registers-part2.pdf
> >>
> >> So max bpc and active bpc are affecting/affected by the bpc after dith=
ering. =20
> > By definition, if the cable carries N bpc, then dithering does not
> > change that. The cable still carries N bpc, but due to spatial or
> > temporal dithering, the *observed* color resolution may or may not be
> > higher than the cable bpc. =20
> Yes, and max bpc and active bpc tell the cable bpc ist not the=20
> *observed* bpc.
> >
> > Of course, if the cable bpc is 8, and dithering targets 6 bpc, then 2
> > LSB on the cable are always zero, right? =20
> I would assume that in this case only 6 bpc are actually send? Isn't the=
=20
> whole thing of dithering that you can't send, for example, 8 bpc?
> >
> > Maybe one would want to do that if the monitor has a 6 bit panel and it
> > simply ignored the 2 LSB, and the cable cannot go down to 6 bpc. =20
>=20
> Is there dithering actually doing this? aka is my assumption above wrong?
>=20
> AMD code that confused me before, is hinting that you might be right:=20
> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/display=
/dc/dce/dce_transform.c#L826
>=20
> there is a set_clamp depth and a separate DCP_SPATIAL_DITHER_DEPTH_30BPP
>=20
> >
> > So, what does "max bpc" mean right now?
> >
> > It seems like dither on/off is insufficient information, one would also
> > need to control the dithering target bpc. I suppose the driver has a
> > policy on how it chooses the target bpc, but what is that policy? Is
> > the dither target bpc the cable bpc or the sink bpc?
> >
> > Needless to say, I'm quite confused. =20
>=20
> ... We need someone who knows what dithering on intel and amd gpu=20
> actually means.
>=20
> But I don't want this to become a blocker for this patchset, because if=20
> there is no dithering, which seems to be the norm, the active bpc=20
> property is already really usefull as it is. So add a note to the docs=20
> that the value might be invalid when dithering is active for now?

Hi,

not necessarily invalid. It all depends on how "max bpc" and "active
bpc" are defined.

If they are defined and implemented as "on the cable", then they are
both well-defined and always valid, regardless of what dithering or bit
clamping does, so this is the semantics I'd would prefer. It's clear,
but of course does not tell full story.

When better properties for dithering are added, those can then define
how it works on top of cable bpc, with no impact on "max bpc" or
"active bpc" properties.

So if we cannot tell what "max bpc" is, then "active bpc" should just
be defined as the same thing as "max bpc" affects, and leave the
precise definition of both for later.

If the definition was observed bpc, then we would have problems and
would need to know everything right now. But you can't really make
promises of observed bpc anyway, because you don't know what the
monitor does to the video signal I suppose. Unless you define it "as if
observed through an ideal theoretical monitor" which then gets awkward
to explain.


Thanks,
pq

--Sig_/Fu6jgclirlZepxXxOgXeMNK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDdcgAACgkQI1/ltBGq
qqeWhg/9FK/E/9LnSGoCvVBJgu/c23ik9dfaLY4Oic7sSiuSn6/aDlkR8W7mX/CH
sQ8sauzFzyGAc9luJRdBKM7KAz+omKgsHVxKyFjbQom0cTz90AHWFr58JQW9+lMg
CkXVMxJsvQAfV8aDh6sVs6JQKof52AhLQ91CGRnT31j7ENIstMF6IO8FBTfaEGi+
vXwP4JSv6Nr/6ul9SCaIgnhiTBBQm9hIz10MuQ/Mwe5/CGamK/LuX51HLiJonsVh
g+IyerSFOAf/CRMeMyQdzTjFRhMEZdFqrs7N0Awbo86sW7XLlPyIXR/F0/Sk7zSe
1aAH928HjZnm6ksQ7e9tG5fblR6pffJSa4ANaZNz/uxkxQZcsGTR8XuKZyO58sva
ADt3J1PrPLsl6+AKqkV8sV4Zz5rLx8d7IjInlBTSbmhAnzZZs61OCo7KUCwJbipn
DCxAGoTXE2qAwlTCxuIirUYzy5DvE1t/+X+byXCtzBk9wCfkBx0rVkm8uCs3iztU
yTeO2L+FDDgYjHNftu0HhnBddnR5sKyOqSvlgfImIzrgX2waNTpfKZAXpkASqZlj
QiM8ZH3o5yAyI9T67foJ+/kEJP1gL8crLeSA6e4crDnzsNwNpt81E3f4UcZzVaoe
5ksfd+ZQG/mEO8BFfhBHPdUE1G6I19Y2jI/O8GeKy9pKKhsL9G0=
=vVMn
-----END PGP SIGNATURE-----

--Sig_/Fu6jgclirlZepxXxOgXeMNK--
