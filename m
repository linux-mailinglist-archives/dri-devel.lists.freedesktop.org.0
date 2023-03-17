Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EDC6BED1C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97EC10E06D;
	Fri, 17 Mar 2023 15:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EBB10E06D;
 Fri, 17 Mar 2023 15:38:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id f16so5514406ljq.10;
 Fri, 17 Mar 2023 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679067484;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PgRh/CYlgTeYbHG/1UWCcAAs0o+RRag5qbQnAzv3v/8=;
 b=EcbOOXKMhZjfO0efQDnH8OtD9cxV7eDWiWnkRDBzlgqUgllzmJwDrw8tKAYRzmhhwK
 f3pyLXlFTJDhAF04mHzvoufl1AOa8vgf2OkJfsxtqBFa/kzvJ4RQkew5xlYPUDzf23il
 1GC4m5+QgI9ieQEAgDY1bB/WBsVze6+WevhkJT0ctTCp82n04uItv5ROVmLCo8OJEPb4
 0zu5Are5BHXSIZO/tmmUHFPBN6fFt7ULlhTOWy0mtm0J4u8ZCokr3y25LSsczQp1MFy8
 A21XrN5T8YlVt7RIsEqZ9+FEoVIDI8WTJrmbfwkxwNUEBL/ChMvn7Is46y/j5udldI4j
 Ybvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679067484;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PgRh/CYlgTeYbHG/1UWCcAAs0o+RRag5qbQnAzv3v/8=;
 b=B1GFrO9N4EQBAikn7PAKkV9MDBufix1pLWgW/wIf52GxrCHkmif8nbp/AjLwtVQLX0
 lBDP0SmxhudBnI0zXy3pj1eqAe5/SfTpUbaak8CBjffEnVCpCXz6x7nUVdbc0S6xKac1
 LE68qhU74meH/b2xZrBvrIQHwrgkZVjylLQR86dJR8FdPo1kC2ziPrNx94a3SDhwM8I0
 zjvQ3Sr8JQYdJ/e8n7nV9l6VRla/JbDWGKMUW+nsoiPsFVzgOJqox7bTcx3ybwl5Gdxd
 7RWAIAs0nnu/P8+2h2Wvg0OpV6Q21AkHyBFjc4K1/nCs4eR8rd2ZwShGu92b3SWpLLYw
 XINg==
X-Gm-Message-State: AO0yUKW4wRWiFWScuY/sghMTQTIvXs/t7yvnQfkzwmCfYMlP7KuuOFTZ
 SBwsFq7Dq2TPNA/Y4iffKDc=
X-Google-Smtp-Source: AK7set8HxXWpvOFzg7VvkZgqyqIrFZQmMwxAy1iyu+dmf0S9IYRfHvwd1iUQ8S+O1HElJ9AFpj2QDQ==
X-Received: by 2002:a2e:a54a:0:b0:293:4fff:ab7d with SMTP id
 e10-20020a2ea54a000000b002934fffab7dmr5079260ljn.25.1679067484262; 
 Fri, 17 Mar 2023 08:38:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b0029a7cb17f73sm334871ljy.28.2023.03.17.08.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:38:03 -0700 (PDT)
Date: Fri, 17 Mar 2023 17:37:51 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <20230317173751.49c45929@eldfell>
In-Reply-To: <ZBR1zs4/L+9thOEe@intel.com>
References: <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
 <ZBMNEdYWsyfVq46p@intel.com>
 <CA+hFU4zWvm3-SSjtF17zjRnshEDw27gkQDLGZRk2AbnWN8+1Vg@mail.gmail.com>
 <ZBOf0m6W3ZWPy7nc@intel.com> <20230317105335.45d6a629@eldfell>
 <ZBRiIG+TEft19Kum@intel.com> <20230317153553.5b8eb460@eldfell>
 <ZBR1zs4/L+9thOEe@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mS0dO.+fJsydLLJ8anunKDN";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/mS0dO.+fJsydLLJ8anunKDN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Mar 2023 16:14:38 +0200
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Fri, Mar 17, 2023 at 03:35:53PM +0200, Pekka Paalanen wrote:
> > On Fri, 17 Mar 2023 14:50:40 +0200
> > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > On Fri, Mar 17, 2023 at 10:53:35AM +0200, Pekka Paalanen wrote: =20
> > > > On Fri, 17 Mar 2023 01:01:38 +0200
> > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:
> > > >    =20
> > > > > On Thu, Mar 16, 2023 at 10:13:54PM +0100, Sebastian Wick wrote:  =
 =20
> > > > > > On Thu, Mar 16, 2023 at 1:35=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
> > > > > > <ville.syrjala@linux.intel.com> wrote:     =20
> > > > > > >
> > > > > > > On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrot=
e:     =20
> > > > > > > > On Thu, 16 Mar 2023 12:47:51 +0200
> > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wro=
te:
> > > > > > > >     =20
> > > > > > > > > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen =
wrote:     =20
> > > > > > > > > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > > > > > > > > Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>=
 wrote:
> > > > > > > > > >     =20
> > > > > > > > > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian W=
ick wrote:     =20
> > > > > > > > > > > > On Tue, Mar 7, 2023 at 4:12=E2=80=AFPM Harry Wentla=
nd <harry.wentland@amd.com> wrote:     =20
> > > > > > > > > > > > >
> > > > > > > > > > > > > We want compositors to be able to set the output
> > > > > > > > > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > > > > > > > > caps reported from the receiver via EDID.     =20
> > > > > > > > > > > >
> > > > > > > > > > > > About that... The documentation says that user spac=
e has to check the
> > > > > > > > > > > > EDID for what the sink actually supports. So whatev=
er is in
> > > > > > > > > > > > supported_colorspaces is just what the driver/hardw=
are is able to set
> > > > > > > > > > > > but doesn't actually indicate that the sink support=
s it.
> > > > > > > > > > > >
> > > > > > > > > > > > So the only way to enable bt2020 is by checking if =
the sink supports
> > > > > > > > > > > > both RGB and YUV variants because both could be use=
d by the driver.
> > > > > > > > > > > > Not great at all. Something to remember for the new=
 property.     =20
> > > > > > > > > > >
> > > > > > > > > > > Hmm. I wonder if that's even legal... Looks like mayb=
e it
> > > > > > > > > > > is since I can't immediately spot anything in CTA-861=
 to
> > > > > > > > > > > forbid it :/     =20
> > > > > > > > > >
> > > > > > > > > > Wouldn't the driver do the same EDID check before choos=
ing whether it
> > > > > > > > > > uses RGB or YCbCr signalling?     =20
> > > > > > > > >
> > > > > > > > > I suppose it could. The modeset would then fail, which is=
 perhaps     =20
> > > > > > > >
> > > > > > > > Could? What are they missing?     =20
> > > > > > >
> > > > > > > The fact that the new property that also affects the rgb->ycb=
cr matrix
> > > > > > > doesn't even exist?     =20
> > > > > >=20
> > > > > > I think the question was about the current Colorspace property.=
   =20
> > > >=20
> > > > Yes.
> > > >=20
> > > > We need to be able to set ColourPrimaries infoframe field for the s=
ink.
> > > > Only userspace knows what ColourPrimaries it uses, and the driver h=
as
> > > > no need to care at all, other than tell the sink what we have.
> > > >=20
> > > > When a driver chooses to use YCbCr, it needs to use the
> > > > MatrixCoefficients the sink expects.
> > > >=20
> > > > If we send the infoframe to the sink telling the signal uses BT.2020
> > > > ColourPrimaries, does that same bit pattern also tell the sink we a=
re
> > > > using the BT.2020 NCL MatrixCoefficients if the driver chooses YCbC=
r?
> > > >=20
> > > > Do drivers actually use BT.2020 NCL MatrixCoefficients in that case=
?   =20
> > >=20
> > > No. I think I've repeated this same line a thousand times already:
> > > The current colorspace property *only* affects the infoframe/msa/sdp,
> > > nothing else. =20
> >=20
> > That's the problem. I don't know what that means.
> >=20
> > Does it mean that the sink expects BT.2020 NCL MatrixCoefficients to
> > have been used? =20
>=20
> Yes, assuming that is the colorspace property value you picked.
>=20
> >=20
> > And the driver will never use BT.2020 NCL MatrixCoefficients in any
> > circumstances? =20
>=20
> Correct.
>=20
> >=20
> > See the conflict? The sink will be decoding the signal incorrectly,
> > because we are encoding it with the wrong MatrixCoefficients if the
> > driver happens to silently choose YCbCr and userspace wants to send
> > BT2020 ColourPrimaries indicated in the infoframe. =20
>=20
> Yes. And hence I thought pretty much everyone already
> agreed that a new property is needed.

I think I was confused as well with the re-posting of this series,
thinking it could be salvageable somehow and tried to understand how.
Up to Harry, I think I've left enough annoying questions by now. :-)

> To make sure we actually understand what we're implementing
> I think it should start out very minimal. Eg just three values:
> - unspecified RGB + BT.601 YCbCr
> - unspecified RGB + BT.709 YCbCr
> - BT.2020 RGB + BT.2020 YCbCr NCL

ColourPrimaries + MatrixCoefficients, respectively. Sounds fine.

I recall hearing that DP spec actually has something like "unspecified"
while HDMI has only "default colorimetry" which is specified, but I'm
guessing that many monitors and TVs just don't implement it like they
should, so it's effectively unspecified.

"unspecified" in UAPI is ok as long as there will be another distinct
value for "HDMI default colorimetry" or such.

I'm not sure why anyone would want to use "unspecified" but I guess
it's necessary for UAPI backward compatibility.

>=20
> And that would control:
> - basic colorimetry metadata transmitted to the sink
> - MatrixCoefficients used for the potential RGB->YCbCr conversion
>=20
> Transfer funcs, primaries, etc. would be left out (apart from
> the potential metadata aspect).

Primaries left out? What are your "unspecified RGB" and "BT.2020 RGB"
above then?

Asking from another angle, using infoframes, is it possible to tell the
sink to use BT.2020 YCbCr NCL without *also* implying BT.2020
ColourPrimaries? Joshua seemed to be saying "no".


> > > >=20
> > > > If they don't, then YCbCr BT.2020 has never worked, which is another
> > > > nail in the coffin for "Colorspace" property.   =20
> > >=20
> > > That is the same nail we've been talking about all along I thought.
> > >  =20
> > > > But it still means that
> > > > RGB BT.2020 may have worked correctly, and then drivers would regre=
ss
> > > > if they started picking YCbCr for any reason where they previously =
used
> > > > RGB.   =20
> > >=20
> > > The policy has been to use RGB if at all possible. Only falling back
> > > to YCbCr 4:2:0 if absolutely necessary (eg. EDID says 4:2:0 must
> > > be used, or there's not enough bandwidth for 4:4:4, etc.). If the
> > > behaviour suddenly changes then it probably means the driver was
> > > doing something illegal before by using RGB 4:4:4. =20
> >=20
> > Ok.
> >  =20
> > > > > > > >
> > > > > > > > I mean, drivers are already automatically choosing between =
RGB and YCbCr
> > > > > > > > signalling based on e.g. available bandwidth. Surely they a=
lready will
> > > > > > > > not attempt to send a signal format to a monitor that does =
not say it
> > > > > > > > supports that?     =20
> > > > > >=20
> > > > > > That's exactly what they do. The drivers don't check the EDID f=
or the
> > > > > > colorimetry the sink supports and the responsibility is punted =
off to
> > > > > > user space.   =20
> > > >=20
> > > > I suspect there are two different things:
> > > >=20
> > > > - which of RGB, YCbCr 4:4:4, YCbCr 4:2:0 can the sink take
> > > > - the supported MatrixCoefficients for each of the YCbCr
> > > >=20
> > > > Surely drivers are already checking the former point?   =20
> > >=20
> > > Yes.
> > >  =20
> > > >=20
> > > > I'm not surprised if they are not checking the latter point, but th=
ey
> > > > do need to, because it is the driver making the choice between RGB =
and
> > > > some YCbCr.   =20
> > >=20
> > > This point has been irrelevant since we always select BT.709
> > > and there is no optional feature bit in EDID to check for that.
> > > Presumaly it is mandatory for sinks to support both BT.601 and
> > > BT.709 whenever they support YCbCr in general. =20
> >=20
> > Ok, so BT.601 and BT.709 MatrixCoefficients are cool. How do you tell
> > the sink which one you used, btw? =20
>=20
> Through the same infoframe/msa/sdp stuff. But that only works
> correctly if the colorspace property is left at the default value.
>=20
> >=20
> > What about BT.2020 MatrixCoefficients? =20
>=20
> It would have to work the same way, if we actually ever used
> this.

Good.


Thanks,
pq

--Sig_/mS0dO.+fJsydLLJ8anunKDN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQUiU8ACgkQI1/ltBGq
qqdZvQ/+LoBsCXDeQ++icv41wekdVKqfwFOIN+tCkyL8tdoR7VlTwb968PE7OLSp
cllAWHwDfmkj6NeMIOrh62SLkBWQgXPtXaP18kzU7oXIU5Ada2BlmdOmA4pC1NDx
CKJsC+Q/1ZBKojg5D7q4bfWADKuCb12NjRjxNzvP46Q4kPUXiig/UGV75f3/Wlj2
3C4RZtutQDpkVO4/Ok4fS5yN/gg9ruHiG4nEcAbDh3kBvOk64L5vXeO+FjsAEuOd
yk/wkT/60bPNMuuWD1A1bo99CVIt3KkXMJW8r/rW0fxwK28ixdRYByo1vx+Gvqgr
pdZLk5tZve9zC9NdQ48buNq8mEZzMTz5qxMg4YDAUkgocbcFXqms7wWhCjZtlKJ0
WqZv7HvCeqhoXxTf/6YJkW0ipdVFgTyqx4AkYRO7V7akf/FrtqBQSMmgLOdycIJx
UjI+CuOrwjFEFG64UwJhrQNUN0ZmsBbb3Vyz0lbWISFFBt774fzantNlzoNcBIAs
g6E7sjNOMQkePQZuKoTOwhZCY/GvpiHAvGljGekFLDQmbwcMyT+Dv9ni9vCOEbXf
THbCicDUNQeuNKOj5QZ5U64HJAu5UZo72tom+XSiwvUChFHfVu2UxUUFEiWvYj5K
DTJjGUZzL4VAcrmXgATKvst5S715sfk7429mCLp9RkuVTVR85So=
=quen
-----END PGP SIGNATURE-----

--Sig_/mS0dO.+fJsydLLJ8anunKDN--
